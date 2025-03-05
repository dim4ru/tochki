import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosRow extends StatelessWidget {
  const PhotosRow({super.key, required this.imageUrls});

  final imageUrls;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length + 1,
        itemBuilder: (context, index) {
          if (index == imageUrls.length) {
            return Container(
              color: CupertinoColors.lightBackgroundGray,
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
            );
          }

          return AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: imageUrls[index],
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 4); },
      ),
    );
  }
}
