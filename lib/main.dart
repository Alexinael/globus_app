import 'package:flutter/material.dart';
import 'api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String _title = 'Globus/Rebus application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: MyStatefullWidget(),
      ),
    );
  }
}

class MyStatefullWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyStatefullWidget();
}

class _MyStatefullWidget extends State<MyStatefullWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _toggleShowPassword = false;
  String TextAlert = "";
  bool _toggleShowAlert = true;

  void _togglePasswordStatus() {
    setState(() {
      _toggleShowPassword = !_toggleShowPassword;
    });
  }

  void CheckLoginPassword() {
    setState(() {
      TextAlert  = GotoLogin(nameController.text, passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "GLOBUS",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text("Sign in", style: TextStyle(fontSize: 30)),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.login),
                border: OutlineInputBorder(),
                labelText: "User name",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.password),
                suffixIcon: IconButton(
                  icon: Icon(_toggleShowPassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: _togglePasswordStatus,
                ),
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
              obscureText: _toggleShowPassword,
              validator: (value) {
                print("Enter to validator");
                if (value != null) {
                  if (value.isEmpty) {
                    return 'Password empty';
                  }
                  if (value.length < 6) {
                    return 'To short';
                  }
                }
                return '';
              },
              onSaved: (val) {
                print("on saved:");
              },
            ),
          ),
          TextButton(onPressed: () {}, child: Text("Forgot password")),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: Text("login"),
              onPressed: () {
                CheckLoginPassword();
              },
            ),
          ),
          InfoAlert(TextAlert),
        ],
      ),
    );
  }

  Widget InfoAlert(String info) {
    if (info.length == 0) return SizedBox.shrink();
    return Center(
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Text(
          TextAlert,
          style: TextStyle(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }

  String GotoLogin(String login, String password) {
    // print("login : ${login.trim()} , password : ${password.trim()}");

    return CheckLogin(login, password);
  }
}
