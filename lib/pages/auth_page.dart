import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_management/pages/home_page.dart';
import 'package:stock_management/pages/login_or_register.dart';
import 'package:stock_management/pages/login_page.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          // user is log in
          if(snapshot.hasData){
            return HomePage() ;
          }
          else{
            return LoginOrRegister();
          }

          // user is not log in

        },
      ),
    );
  }
}
