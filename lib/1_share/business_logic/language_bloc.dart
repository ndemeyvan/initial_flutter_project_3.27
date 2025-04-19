import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:maliya_mobile/1_share/data/config/app_config.dart' show AppConfig;
import 'package:maliya_mobile/1_share/data/model/language.dart';

part 'language_event.dart';
part 'language_state.dart';


class LanguageBloc extends HydratedBloc<LanguageEvent, LanguageState> {

  static Language? language;

  LanguageBloc() : super(LanguageState(AppConfig.defaultLanguage)){
    on<LanguageChangedEvent>((event, emit) {
      LanguageChangedEvent evt = event;
      language = evt.language;
      emit(LanguageState(evt.language));
    });
  }


  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    return LanguageState(Language.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return state.language.toJson();
  }
}
