import 'package:flutter/services.dart';

part 'LanguageIdentifier.dart';
part 'OnDeviceTranslation.dart';



class NaturalLanguage {
  NaturalLanguage._();

  static const MethodChannel channel = MethodChannel('google_ml_kit');

  static final NaturalLanguage instance = NaturalLanguage._();

  /// Returns instance of [LanguageIdentifier].
  LanguageIdentifier languageIdentifier({double confidenceThreshold = 0.5}) {
    return LanguageIdentifier._(confidenceThreshold);
  }

  /// Returns instance of [OnDeviceTranslator].
  OnDeviceTranslator onDeviceTranslator(
      {required String sourceLanguage, required String targetLanguage}) {
    return OnDeviceTranslator._(sourceLanguage, targetLanguage);
  }

  /// Returns instance of [TranslateLanguageModelManager].
  TranslateLanguageModelManager translateLanguageModelManager() {
    return TranslateLanguageModelManager._();
  }



}
