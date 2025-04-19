import 'dart:ui';

class Language {
  final String? languageCode;
  final String? countryCode;
  final String? name;

  Language({this.languageCode, this.countryCode, this.name});

  Locale toLocale() {
    return Locale(languageCode!, countryCode);
  }

  // Convert a Language object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode,
      'countryCode': countryCode,
      'name': name,
    };
  }

  // Create a Language object from a JSON map
  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      languageCode: json['languageCode'],
      countryCode: json['countryCode'],
      name: json['name'],
    );
  }
}

