import 'package:cat_api/domain/entities/cat/cat_entity.dart';
import 'package:cat_api/presentation/home/widgets/cat_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final CatEntity cat;
  const CustomCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 20.h),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cat.name),
                const Text("More...")
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              width: 1.sw,
              height: 250.h,
              child: cat.referenceImageId != null ? ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CatImage(referenceImageId: cat.referenceImageId ?? '',),
              ): Image.asset('assets/images/cat.png'),
            ),
            SizedBox(
              height: 7.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 2,
                    child: Text(cat.origin)),
                Flexible(
                    flex: 2,
                    child: Text(
                      'Intelligence level: ${cat.intelligence}',
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
