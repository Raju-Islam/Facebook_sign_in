// ignore_for_file: file_names
import 'package:facebook_signin/loginController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loginController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  loginPageUI() {
    // return Consumer<LoginController>(
    //   builder: (context, model, child) {
    //     if (model.userDetails != null) {
    //       return Center(
    //         child: allreadyLoggedInScreen(model),
    //       );
    //     } else {
    //       notLoggedInScreen();
    //     }

    //   },
    // );
    return Consumer<LoginController>(
      builder: (context, model, child) {
        if (model.userDetails != null) {
          return Center(
            child: allreadyLoggedInScreen(model),
          );
        } else {
          return notLoggedInScreen();
        }
      },
    );
  }

  allreadyLoggedInScreen(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50.00,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              model.userDetails!.displayName.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              model.userDetails!.email.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ActionChip(
            backgroundColor: Colors.black,
            label: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Provider.of<LoginController>(context, listen: false)
                  .allowUserToSignOut();
            })
      ],
    );
  }

  notLoggedInScreen() {
    return Center(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Image.asset('asset/image.jpg')),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.00, vertical: 10.00),
            child: GestureDetector(
                onTap: () {
                  Provider.of<LoginController>(context, listen: false)
                      .allowUserToSignInWithFB();
                },
                child: Image.asset('asset/facebook_sign.png')),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: loginPageUI(),
    );
  }
}
