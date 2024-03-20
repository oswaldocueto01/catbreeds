import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_api/domain/entities/cat/cat_entity.dart';
import 'package:cat_api/presentation/home/widgets/aspect_ratio_image.dart';
import 'package:cat_api/presentation/home/widgets/cat_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final CatEntity cat;

  const DetailPage({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AspectRatioWidget(
              referenceImageId: cat.referenceImageId,
            ),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cat.description,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Country: ${cat.origin}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Intelligence level Level: ${cat.intelligence.toString()}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
