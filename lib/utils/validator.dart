class Validators {
  static final RegExp _phoneRegex = RegExp(r'(\+84|0)\d{9}$');

  static final RegExp _passRegexNumber = RegExp(r'^(?=.*?[0-9]).{8,}$');
  static final RegExp _passRegexSpecialCharacters =
      RegExp(r'^(?=.*?[!@#$&*~]).{8,}$');
  static final RegExp _passRegexLowercase = RegExp(r'^(?=.*?[a-z]).{8,}$');
  static final RegExp _passRegexCapitalization = RegExp(r'^(?=.*?[A-Z]).{8,}$');

  static final RegExp _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static final RegExp _passRegexSize =
      RegExp(r'[ａ-ｚＡ-Ｚァ-ンヴー゛゜０-９！”＃＄％＆’（）＊＋，－．／：；＜＝＞？　＠［￥］＾＿‘｛｜｝￣。「」、・]');

  static final RegExp _inviteCodeRegexFullWidth =
      RegExp(r'[ａ-ｚＡ-Ｚァ-ンヴー゛゜０-９！”＃＄％＆’（）＊＋，－．／：；＜＝＞？　＠［￥］＾＿‘｛｜｝￣。「」、・]');

  static const int _fixedNumberCharacterInviteCode = 6;

  static String checkPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return "please input phone";
    } else if (!_phoneRegex.hasMatch(phoneNumber)) {
      return "invalid phone";
    } else {
      return '';
    }
  }

  static String checkEmail(String email) {
    if (email.isEmpty) {
      return "please input email";
    } else if (!_emailRegex.hasMatch(email)) {
      return "invalid email";
    } else {
      return '';
    }
  }

  static String checkPass(String password) {
    int minLength = 8;
    int maxLength = 64;
    if (password.isEmpty) {
      return "please input pass";
    } else if (password.length < minLength ||
        password.length > maxLength ||
        password.contains(' ') ||
        _passRegexSize.hasMatch(password) ||
        checkRegexToCondition(password) == false) {
      return "invalid password";
    } else {
      return "";
    }
  }

  static bool isValidInviteCode(String inviteCode) {
    if (inviteCode.isEmpty) return true;
    if (_inviteCodeRegexFullWidth.hasMatch(inviteCode) ||
        inviteCode.length != _fixedNumberCharacterInviteCode) {
      return false;
    }
    return true;
  }

  static bool checkRegexToCondition(String password) {
    int countCondition = 0;
    if (_passRegexNumber.hasMatch(password) == true) {
      countCondition++;
    }
    if (_passRegexLowercase.hasMatch(password) == true) {
      countCondition++;
    }
    if (_passRegexCapitalization.hasMatch(password) == true) {
      countCondition++;
    }
    if (_passRegexSpecialCharacters.hasMatch(password) == true) {
      countCondition++;
    }
    if (countCondition >= 3) {
      return true;
    } else {
      return false;
    }
  }
}
