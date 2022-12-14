import 'package:bismillah_uas/models/user.dart';
import 'package:bismillah_uas/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:bismillah_uas/homepage.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  void login(String email, password) async {
    try {
      var response = await Dio().get(
          'http://192.168.0.120:3000/users?email=' +
              email +
              "&password=" +
              password);
      var panjang_data = response.data.length;
      if (response.data.length > 0) {
        int id = response.data?[0]['id'];
        String name = response.data?[0]['name'];
        String email = response.data?[0]['email'];
        String password = response.data?[0]['password'];

        print("Login success");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      user: User(
                          id: id, name: name, email: email, password: password),
                    )));
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Login failed',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          // e.toString(),
          e.toString(),
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
            color: Colors.white,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // ThemeData themeData = ThemeData.light();

  // void setTheme(bool isDarkmode) {
  //   setState(() {
  //     themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
  //     SharedPref.pref?.setBool('isDarkmode', isDarkmode);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Hello !",
                  style: GoogleFonts.poppins(
                      fontSize: 40, fontWeight: FontWeight.w600)),
              // SizedBox(height: ),
              Text(
                "Sign in to continue",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: controllerEmail,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  labelText: "email address",
                  hintText: "email address",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  // hintStyle: TextStyle(
                  //   fontFamily: 'Poppins Light',
                  //   fontSize: 16,
                  // ),
                ),
              ),
              SizedBox(height: 18),
              TextField(
                controller: controllerPass,
                style: GoogleFonts.poppins(),
                // fontFamily: 'Poppins Light',
                // fontSize: 16,

                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  labelText: "password",
                  hintText: "password",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  // hintStyle: TextStyle(
                  //   fontFamily: 'Poppins Light',
                  //   fontSize: 16,
                  // ),
                ),
              ),
              SizedBox(
                height: 100,
              ),

              ElevatedButton(
                onPressed: () {
                  login(controllerEmail.text, controllerPass.text);
                },
                child:
                    Text("Sign in !", style: GoogleFonts.poppins(fontSize: 24)),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 0, 0),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New user?",
                      style: TextStyle(
                        fontFamily: 'Poppins Light',
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Register(),
                      ));
                    },
                    child: Text("Sign up",
                        style: TextStyle(
                          fontFamily: 'Poppins Light',
                          fontSize: 16,
                          color: Color.fromARGB(255, 51, 155, 252),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
