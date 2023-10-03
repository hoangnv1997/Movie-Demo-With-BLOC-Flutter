import 'package:json_annotation/json_annotation.dart';

part 'account_info.g.dart';

@JsonSerializable()
class AccountInfo {
  final String? email;
  final String? password;

  const AccountInfo({this.email, this.password});

  factory AccountInfo.empty() => const AccountInfo();

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);
}
