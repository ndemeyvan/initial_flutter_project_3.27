import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maliya_mobile/1_share/business_logic/language_bloc.dart';
import 'package:maliya_mobile/1_share/locator_service.dart';
import 'package:maliya_mobile/2_login/login_screen.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (context) => getIt.get<LanguageBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        designSize: MediaQuery.of(context).size,
        builder: (context, _) {
          return LoginScreen();
        },
      ),
    );
  }
}
