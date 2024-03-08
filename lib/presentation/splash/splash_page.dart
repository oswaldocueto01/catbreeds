import 'package:cat_api/core/routes/routes.dart';
import 'package:cat_api/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.pushReplacementNamed(CatRoutesNames.homePage.name);
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: 400.w,
              height: 400.h,
              child: const RiveAnimation.asset(
                fit: BoxFit.cover,
                'assets/rive/cat_ani.riv',
              ),
            ),
            Positioned(
                top: 80.h,
                child: Text("Catbreeds",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                    ))),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
