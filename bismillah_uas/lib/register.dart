import 'package:bismillah_uas/register.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:bismillah_uas/homepage.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  void register(String name, email, password) async {
    try {
      var response = await Dio().post('http://192.168.0.120:3000/users',
          data: {"name": name, "email": email, "password": password});
      if (response.statusCode == 201) {
        print("Account created successfully");
      } else {
        print("Failed");
        // dah bang, co
      }
    } catch (e) {
      print(e);
    }
  }

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
              Text("Sign up",
                  style: GoogleFonts.poppins(
                      fontSize: 40, fontWeight: FontWeight.w600)),
              // SizedBox(height: ),
              // Text(
              //   "Sign in to continue",
              //   style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
              // ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: controllerNama,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  // labelText: "Email Address",
                  hintText: "full name",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  // hintStyle: TextStyle(
                  //   fontFamily: 'Poppins Light',
                  //   fontSize: 16,
                  // ),
                ),
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
                  // labelText: "Email Address",
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
                  // labelText: "Password",
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
                  register(controllerNama.text, controllerEmail.text,
                      controllerPass.text);
                },
                child:
                    Text("Sign up !", style: GoogleFonts.poppins(fontSize: 24)),
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
                  Text("Already have an account?",
                      style: TextStyle(
                        fontFamily: 'Poppins Light',
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                    },
                    child: Text("Sign in",
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
