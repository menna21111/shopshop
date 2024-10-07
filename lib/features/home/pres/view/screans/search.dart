import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/features/home/data/models/searchresultmodel/datum.dart';
import 'package:shopshop/features/home/pres/manager/searchcubit.dart/searchcubit.dart';
import 'package:shopshop/features/home/pres/manager/searchcubit.dart/searchstate.dart';

import '../widget/customitemresult.dart';

class Search extends SearchDelegate<Datumsearch> {
  final Searchcubit searchCubit;

  Search(this.searchCubit);
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        Datumsearch result = Datumsearch();
        close(context, result);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchCubit.search(query);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<Searchcubit, Searchstate>(
        bloc: searchCubit,
        builder: (context, state) {
          if (state is Searchloading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Searchsuccess) {
            if (state.data.isEmpty) {
              return const Center(child: Text('No results found.'));
            } else {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final result = state.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchListitem(
                      book: result,
                    ),
                  );
                },
              );
            }
          } else if (state is Searcherror) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return const Center(child: Text('Start typing to search'));
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Start typing to search'));
    }

    searchCubit.search(query);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<Searchcubit, Searchstate>(
        bloc: searchCubit,
        builder: (context, state) {
          if (state is Searchloading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Searchsuccess) {
            final suggestions = state.data.where((datum) {
              return datum.name?.toLowerCase().contains(query.toLowerCase()) ??
                  false;
            }).toList();

            if (suggestions.isEmpty) {
              return const Center(child: Text('No suggestions found.'));
            }

            return ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = suggestions[index];
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: kgreycolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(suggestion.name ?? ''),
                    onTap: () {
                      query = suggestion.name ?? '';
                      showResults(context);
                    },
                  ),
                );
              },
            );
          } else if (state is Searcherror) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return const Center(child: Text('Start typing to search'));
          }
        },
      ),
    );
  }
}
