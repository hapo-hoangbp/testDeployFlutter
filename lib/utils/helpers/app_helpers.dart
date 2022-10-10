import 'package:flutter/cupertino.dart';
import '../../configs/languages/applocalization.dart';

class AppHelpers {
  String convertDataMultiLanguage(BuildContext context, String? data) {
    if (data == null || data == "") {
      return "";
    } else {
      return AppLocalizations.of(context).getTranslate(data);
    }
  }
}
