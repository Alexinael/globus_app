import 'dart:convert';
import 'package:crypto/crypto.dart';

String textToMd5 (String text) {
  return md5.convert(utf8.encode(text)).toString();
}
/*
class LoginModel {
  int id;
  String login;
  bool isActive;

  LoginModel(this.login);

}
*/
String CheckLogin(String login, String password) {
  if (login.trim()=="" || password.trim()=="") {
    return "Пустой логин или пароль!";
  }
  print ("hash from ${password} is ${textToMd5(password)}");
  return "";
}