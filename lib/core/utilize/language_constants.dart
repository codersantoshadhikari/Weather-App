// import 'dart:developer';
//
// import 'package:flutter/material.dart';
//
// const String languageCode = 'languageCode';
// final prefs = Get.find<SharedPreferencesService>();
//
// //languages code
// const String english = 'en';
// const String hindi = 'hi';
// const String tamil = 'ta';
// const String gujrati = 'gu';
//
// Future<Locale> setLocale(String languageCode) async {
//   await prefs.setData(
//       key: SharedPreferencesKeys.keyNameLanguage, data: languageCode);
//   return _locale(languageCode);
// }
//
// Future<Locale> getLocale() async {
//   String code = english;
//   try {
//     code = prefs.getData(key: SharedPreferencesKeys.keyNameLanguage) ?? english;
//   } catch (e) {
//     code = english;
//     log('error getting the language from shared pref : $e');
//   }
//   return _locale(code);
// }
//
// Locale _locale(String languageCode) {
//   switch (languageCode) {
//     case english:
//       return const Locale(english, '');
//     case tamil:
//       return const Locale(tamil, "");
//     case gujrati:
//       return const Locale(gujrati, "");
//     case hindi:
//       return const Locale(hindi, "");
//     default:
//       return const Locale(english, '');
//   }
// }
//
// AppLocalizations translation() {
//   return AppLocalizations.of(Get.context as BuildContext)!;
// }
