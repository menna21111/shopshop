import 'package:flutter/material.dart';
import 'package:shopshop/costant/colors.dart';
import 'package:shopshop/features/home/data/models/searchresultmodel/datum.dart';
import 'package:shopshop/features/home/pres/view/screans/productdetails.dart';

import '../screans/productdetailss.dart';

class SearchListitem extends StatelessWidget {
  const SearchListitem({super.key, required this.book});
  final Datumsearch book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Productdetailss(productmodel: book);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(16),
        ),
        height: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(book.image ?? ''))),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      '${book.name}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        const Text(
                          'price : ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          ' \$${book.price ?? 'hhh'}',
                          style:
                              const TextStyle(fontSize: 16, color: khomecolor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
