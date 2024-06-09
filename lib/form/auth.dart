import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sunglasses/home/home_page.dart';
import 'package:http/http.dart' as http;
import 'register.dart';

class LoginData {
  String username = '';
  String password = '';
}

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  LoginData loginData = LoginData();
  final TextEditingController _userController = TextEditingController();

  void cekLogin() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      login();
    }
  }

  Future<void> login() async {
    var urlLogin = "http://10.0.2.2/sunglasses/login.php";
    print(loginData.username);
    try {
      final response = await http.post(
        Uri.parse(urlLogin),
        headers: {"Accept": "application/json"},
        body: {
          "username": loginData.username,
          "password": loginData.password,
        },
      );

      final dataLogin = json.decode(response.body);
      print(dataLogin);

      if (dataLogin.toString() == "Success") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const HomePage(),
          ),
        );
      } else {
        print('error');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _userController,
                keyboardType: TextInputType.text,
                validator: (val) =>
                    val!.isEmpty ? "Username is required" : null,
                onSaved: (val) => loginData.username = val!,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                autofillHints: const [AutofillHints.password],
                validator: (val) =>
                    val!.isEmpty ? "Password is required" : null,
                onSaved: (val) => loginData.password = val!,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  cekLogin();
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => RegisterScreen(),
                    ),
                  );
                },
                child: Text('Don\'t have an account? Register here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
