part of 'language_bloc.dart';

abstract class LanguageEvent {
  const LanguageEvent();
}

class LanguageChangedEvent extends LanguageEvent {
  final Language language;

  LanguageChangedEvent(this.language);
}
