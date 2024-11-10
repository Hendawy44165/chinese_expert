import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:chinese_expert/providers/home_provider.dart';
import 'package:chinese_expert/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChineseExpertApp extends StatelessWidget {
  const ChineseExpertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Chinese Expert App',
        theme: ThemeData(
          primaryColor: ColorsManager.cyan,
          scaffoldBackgroundColor: ColorsManager.gray,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(provider: getHomeProvider()),
      ),
    );
  }
}
