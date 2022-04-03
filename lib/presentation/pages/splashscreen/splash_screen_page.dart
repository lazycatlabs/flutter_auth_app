import 'package:flutter/material.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

///*********************************************
/// Created by ukietux on 24/08/20 with ♥
/// (>’_’)> email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _initData();
    });
  }

  void _initData() {
    /// Check if user already login or not
    if (sl<PrefManager>().isLogin) {
      /// Direct to main screen
      context.goToReplace(AppRoute.mainScreen);
    } else {
      /// Direct to login page
      context.goToReplace(AppRoute.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Container(
        color: Palette.white,
        child: Center(
          child: SvgPicture.asset(
            Images.icLogo,
            width: context.widthInPercent(60),
          ),
        ),
      ),
    );
  }
}
