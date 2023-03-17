import 'package:flutter/material.dart';
import 'menu_utama.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, title: "App", home: LoginPage()));
}

class LoginPage extends StatelessWidget {
  //Deklarasi variabel untuk login
  String username = 'talitha';
  String password = 'nindya';

  TextEditingController cUser = TextEditingController(); // ambil nilai fill username
  TextEditingController cPass = TextEditingController(); // ambil nilai fill password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 205, 240, 255),
              Color.fromARGB(255, 165, 229, 255)
            ],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 150, 10, 0),
                    width: 20.0,
                    height: 20.0,
                  ),
                  Image.asset("assets/upn.png"),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),
        TextFormField(
          controller: cUser,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 3.0,
              ),
            ),
            hintText: "Username",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.black),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        TextFormField(
          controller: cPass,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 3.0,
              ),
            ),
            hintText: "Password",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.black),
          obscureText: true,
          autofocus: false,
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 90.0),
        ),
        ElevatedButton(
            //aksi yang akan dijalankan saat tombol diklik/ditekan
            onPressed: () {
              checkLogic(context);
            },
            child: Text("Login")),
      ],
    );
  }

  void checkLogic(BuildContext context) {
    if (cUser.text == username && cPass.text == password) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(),
          ));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Berhasil!'),
          backgroundColor: Colors.blue,
        ),
      );
    } else if (cUser.text.isEmpty || cPass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username atau Password Harus Diisi!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username dan Password Anda Salah!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

class ColorPalette {
  static const primaryColor = Color(0xff5364e8);
  static const primaryDarkColor = Color(0xff607Cbf);
  static const underlineTextField = Color(0xff8b97ff);
  static const hintColor = Colors.black;
}
