import 'package:flutter/material.dart';
import 'package:stock_management/pages/login_page.dart';
import 'package:stock_management/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({ Key? key }) : super(key: key);

  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage=true;

  void togglePage(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
    return LoginPage(
      onTap:togglePage,
    );
   }
   else{
    return RegisterPage(onTap: togglePage);
   }
  }
}