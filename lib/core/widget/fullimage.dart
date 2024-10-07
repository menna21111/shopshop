import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String? url;

  ImageScreen({
    Key? key,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: true,
      maxScale: 3,
      minScale: .9,
      boundaryMargin: EdgeInsets.all(100),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CachedNetworkImage(
          imageUrl: '${this.url}',
          fit: BoxFit.cover,
          placeholder: (_, __) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 15,
              ),
            );
          },
        ),
      ),
    );
  }
}
