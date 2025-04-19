import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maliya_mobile/1_share/presentation/themes/maliya_theme.dart';
import 'package:maliya_mobile/route/route.dart';
import 'package:maliya_mobile/utils/app_constant.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: MediaQuery.of(context).size,
      builder: (context, _) {
        return MaterialApp(
          initialRoute: AppRoutes.splashScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: MaliyaTheme.themeData(context),
          darkTheme: MaliyaTheme.themeData(context, isDarkTheme: true),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateTitle: (_) => 'Maliya',
        );
      },
    );
  }
}
