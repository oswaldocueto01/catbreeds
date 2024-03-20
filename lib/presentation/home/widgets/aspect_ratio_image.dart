import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AspectRatioWidget extends StatelessWidget {
  final String? referenceImageId;

  const AspectRatioWidget({super.key, this.referenceImageId});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://cdn2.thecatapi.com/images/$referenceImageId.jpg' ?? '',
      placeholder: (context, url) => const CircularProgressIndicator(),
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
      imageBuilder: (context, imageProvider) {
        return FutureBuilder(
          future: getImageSize(imageProvider: imageProvider),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final Size size = snapshot.data!;
              final double aspectRatio = size.width / size.height;

              return AspectRatio(
                aspectRatio: aspectRatio,
                child: Image(image: imageProvider, fit: BoxFit.cover),
              );
            }
          },
        );
      },
    );
  }

  Future<Size> getImageSize({required ImageProvider imageProvider}) {
    Completer<Size> completer = Completer<Size>();
    Image image = Image(image: imageProvider);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          completer.complete(Size(
            info.image.width.toDouble(),
            info.image.height.toDouble(),
          ));
        },
      ),
    );
    return completer.future;
  }
}
