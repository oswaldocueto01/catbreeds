import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CatImage extends StatelessWidget {
  final String? referenceImageId;

  const CatImage({super.key, this.referenceImageId});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://cdn2.thecatapi.com/images/$referenceImageId.jpg",
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return CachedNetworkImage(
          imageUrl: "https://cdn2.thecatapi.com/images/$referenceImageId.png",
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.4),
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Container(
                width: 1.sw,
                height: 250.h,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            );
          },
        );
      },
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.4),
          highlightColor: Colors.grey.withOpacity(0.2),
          child: Container(
            width: 1.sw,
            height: 250.h,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(8.r)),
          ),
        );
      },
    );
  }
}
