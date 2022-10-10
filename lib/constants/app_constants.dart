class AppConstants {
  /// Regex
  static const regexValidateEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const regexValidatePhoneNumber =
      r'(^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,32}$)';
  static const regexValidateNameInCard = r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}";
  static const regexValidateEmailInCard = r"[a-z0-9\.\-+_]+@[a-z0-9\.\-+_]+\.[a-z]+";
  static const regexValidatePhoneInCard = r"[\+\(]?[1-9][0-9 .\-\(\)]{8,}[0-9]";
}
