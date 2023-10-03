import 'dart:convert';

import 'package:crypto/crypto.dart';

class EncodeHelperService {
  static String hashStringValueWithSHA256({required value}) {
    var bytesToHash = utf8.encode(value);
    return sha256.convert(bytesToHash).toString();
  }

  static String hashStringValueWithMD5({required value}) {
    return md5.convert(utf8.encode(value)).toString();
  }
}
