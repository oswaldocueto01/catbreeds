import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

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
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.4),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                      width: 120.h,
                      height: 12.h,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4.r))),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.4),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                      width: 30.h,
                      height: 12.h,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4.r))),
                ),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.4),
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Container(
                width: 1.sw,
                height: 250.h,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.4),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                      width: 30.h,
                      height: 12.h,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4.r))),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.4),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                      width: 110.h,
                      height: 12.h,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4.r))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
