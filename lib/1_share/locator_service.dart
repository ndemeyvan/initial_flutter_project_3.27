import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maliya_mobile/1_share/business_logic/language_bloc.dart';

final getIt = GetIt.instance;

Future setupLocator() async {
  _registerAppRouter();

  _registerServices();
  _registerRepositories();
  _registerBlocs();

}

void _registerAppRouter() {
}

void _registerServices() {

}

void _registerRepositories() {

}

void _registerBlocs() {
  getIt.registerSingleton<LanguageBloc>(LanguageBloc());


}
