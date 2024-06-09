import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sunglasses/form/auth.dart';

import 'package:http/http.dart' as http;

class RegisterData {
  String username = '';
  String password = '';
  String name = ''; // Tambahkan atribut nama
  String address = ''; // Tambahkan atribut alamat
}

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  RegisterData registerData = RegisterData();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController _nameController = TextEditingController(); // Controller untuk atribut nama
  final TextEditingController _addressController = TextEditingController(); // Controller untuk atribut alamat

  // void addError({String? error}) {
  //   if (!errors.contains(error)) {
  //     setState(() {
  //       errors.add(error);
  //     });
  //   }
  // }

  // void removeError({String? error}) {
  //   if (errors.contains(error)) {
  //     setState(() {
  //       errors.remove(error);
  //     });
  //   }
  // }

  Future Register() async {
    var urlLogin = "http://10.0.2.2/sunglasses/register.php";
    // print(RegisterData.username);
    final response = await http.post(
      Uri.parse(urlLogin),
      headers: {"Accept": "application/json"},
      body: {
        "username": _userController.text.toString(),
        "password": pass.text.toString(),
        "name": _nameController.text.toString(),
        "address": _addressController.text.toString(),
        // "username": 'founder',
        // "password": 'niner',
      },
    );
    // print(user.text.toString());
    final dataReg = json.decode(response.body);
    print(dataReg);
    if (dataReg.toString() == "Success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      print('error');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
                onSaved: (val) => registerData.username = val!,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: pass,
                obscureText: true,
                keyboardType: TextInputType.text,
                autofillHints: const [AutofillHints.password],
                validator: (val) =>
                    val!.isEmpty ? "Password is required" : null,
                onSaved: (val) => registerData.password = val!,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                validator: (val) => val!.isEmpty ? "Name is required" : null,
                onSaved: (val) => registerData.name = val!,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _addressController,
                keyboardType: TextInputType.text,
                validator: (val) =>
                    val!.isEmpty ? "Address is required" : null,
                onSaved: (val) => registerData.address = val!,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  Register();
                },
                child: Text('Register'),
              ),
              SizedBox(height: 16.0),
              // Hapus tombol "Already have an account? Login here"
            ],
          ),
        ),
      ),
    );
  }
}