// ignore_for_file: file_names, unnecessary_new, unnecessary_this

import 'package:facebook_signin/userDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'userDetails.dart';

class LoginController with ChangeNotifier {
  UserDetails? userDetails;

  allowUserToSignInWithFB() async {
    var result =
        await FacebookAuth.i.login(permissions: ['public_profile', 'email']);

    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i
          .getUserData(fields: 'email,name,picture,type(large)');

      this.userDetails = new UserDetails(
          displayName: requestData['name'],
          email: requestData['email'],
          photoURL: requestData["picture"] ?? '');

      notifyListeners();
    }
  }

  allowUserToSignOut() async {
    await FacebookAuth.i.logOut();
    userDetails = null;

    notifyListeners();
  }
}
