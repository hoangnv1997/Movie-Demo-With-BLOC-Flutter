import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviedemo/database/shared_preferences_helper.dart';
import 'package:moviedemo/model/account/account_info.dart';

abstract class AuthRepository {
  Future<void> addAccount({
    required String email,
    required String password,
  });

  Future<bool> isLoggedIn();

  Future<AccountInfo?> loginAccount({
    required String email,
    required String password,
  });
}

class AuthRepositoryImpl extends AuthRepository {
  // Create a CollectionReference called accounts that references the firestore collection
  final CollectionReference accounts =
      FirebaseFirestore.instance.collection('accounts');

  @override
  Future<bool> isLoggedIn() async {
    return SharedPreferencesHelper.getBoolType(
        SharedPreferencesHelper.keyLogged);
  }

  @override
  Future<AccountInfo?> loginAccount({
    required String email,
    required String password,
  }) async {
    AccountInfo accountInfo = AccountInfo.empty();
    var snapshot = await accounts.where('email', isEqualTo: email).get();
    if (snapshot.docs.isNotEmpty) {
      if (snapshot.docs.isNotEmpty) {
        accountInfo = AccountInfo(
          email: snapshot.docs[0]['email'],
          password: snapshot.docs[0]['password'],
        );
      } else {
        print("loginAccount  snapshot.docs.isEmpty");
        accountInfo = AccountInfo.empty();
      }
    }

    return accountInfo;
  }

  @override
  Future<void> addAccount({
    required String email,
    required String password,
  }) {
    return accounts.doc(email).set(
      {
        'email': email,
        'password': password,
      },
    ).then((value) => print("Account Added"));
  }
}
