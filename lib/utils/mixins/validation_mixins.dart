import '../../constants/app_constants.dart';

class ValidationMixins {
  bool checkAllowSubmitForm(List<dynamic> listValue, List<dynamic> listError) {
    int countError = 0;
    for (var el in listValue) {
      if (el != null && el == "") {
        countError++;
      }
    }
    for (var el in listError) {
      if (el != null && el != "") {
        countError++;
      }
    }
    return countError != 0 ? false : true;
  }

  String validateFieldEmail(String value) {
    RegExp regExpEmail = RegExp(AppConstants.regexValidateEmail);
    String error = "";
    if (value.trim() == "") {
      error = "validateRequired";
    } else if (regExpEmail.hasMatch(value) == false) {
      error = "validateIncorrectEmail";
    } else if (value.trim().length > 255) {
      error = "validateMaxLengthEmail";
    } else {
      error = "";
    }
    return error;
  }

  String validateFieldPhoneNumber(String value) {
    RegExp regExpPhoneNumber = RegExp(AppConstants.regexValidatePhoneNumber);
    String error = "";
    if (value.trim() == "") {
      error = "validateRequired";
    } else if (value.trim().length > 12 || value.trim().length < 8) {
      error = "validateIncorrectLengthPhoneNumber";
    } else if (regExpPhoneNumber.hasMatch(value) == false) {
      error = "validateIncorrectPhoneNumber";
    } else {
      error = "";
    }
    return error;
  }

  String validateFieldPassword(String value) {
    String error = "";
    if (value.trim() == "") {
      error = "validateRequired";
    } else if (value.trim().length > 32 || value.trim().length < 8) {
      error = "validateIncorrectLengthPassword";
    }
    // else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
    //   error = "validateFormatPassword";
    // } else if (value.trim().length > 32 || value.trim().length < 8) {
    //   error = "validateIncorrectLengthPassword";
    // } else if (!RegExp(".*[0-9].*").hasMatch(value)) {
    //   error = "validateFormatPassword";
    // } else if (!RegExp('.*[a-z].*').hasMatch(value)) {
    //   error = "validateFormatPassword";
    // } else if (!RegExp('.*[A-Z].*').hasMatch(value)) {
    //   error = "validateFormatPassword";
    // }
    else {
      error = "";
    }
    return error;
  }

  String validateFieldConfirmPassword(String value, String password) {
    String error = "";
    if (value.trim() == "") {
      error = "validateRequired";
    } else if (value != password) {
      error = "validateIncorrectConfirmPassword";
    } else {
      error = "";
    }
    return error;
  }

  String validateFieldUserName(String value) {
    String error = "";
    if (value.trim() == "") {
      error = "validateRequired";
    } else if (value.trim().length < 4) {
      error = "validateIncorrectLengthGeneral";
    } else {
      error = "";
    }
    return error;
  }

  String validateFieldGeneral(String value) {
    String error = "";
    if (value.trim() == "") {
      error = "validateRequired";
    } else if (value.trim().length < 4) {
      error = "validateIncorrectLengthGeneral";
    } else {
      error = "";
    }
    return error;
  }

  String validateNameInCard(String value) {
    RegExp regExpNameInCard = RegExp(AppConstants.regexValidateNameInCard);
    String error = "";
    if (regExpNameInCard.hasMatch(value) == false) {
      error = "validateIncorrectNameInCard";
    } else {
      error = "";
    }
    return error;
  }

  String validateEmailInCard(String value) {
    RegExp regExpNameInCard = RegExp(AppConstants.regexValidateEmailInCard);
    String error = "";
    if (regExpNameInCard.hasMatch(value) == false) {
      error = "validateIncorrectEmailInCard";
    } else {
      error = "";
    }
    return error;
  }

  String validatePhoneInCard(String value) {
    RegExp regExpNameInCard = RegExp(AppConstants.regexValidatePhoneInCard);
    String error = "";
    if (regExpNameInCard.hasMatch(value) == false) {
      error = "validateIncorrectPhoneInCard";
    } else {
      error = "";
    }
    return error;
  }
}
