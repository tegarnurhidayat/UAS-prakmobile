import 'package:bismillah_uas/register.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final String email = "rizhaalfianita1412@gmail.com";
  // final String password = "kaito1412";
  // final String nama = "Rizha Alfianita";

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  // void login(String email, password) async {
  //   try {
  //     var response = await Dio().get('http://localhost:3004/user');
  //     var panjang_data = response.data.length;
  //     if (response.statusCode == 200) {
  //       for (var i = 0; i <= panjang_data; i++) {
  //         if (email == response.data[i]['email'] &&
  //             password == response.data[i]['password']) {
  //           print("Login success");
  //           Navigator.push(
  //               context, MaterialPageRoute(builder: (context) => Home()));
  //           break;
  //         }
  //       }
  //     } else {
  //       final snackBar = SnackBar(
  //         backgroundColor: Colors.redAccent,
  //         content: Text(
  //           'Login failed',
  //           style: TextStyle(
  //             fontFamily: 'Poppins-Regular',
  //             color: Colors.white,
  //           ),
  //         ),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //   } catch (e) {
  //    final snackBar = SnackBar(
  //       backgroundColor: Colors.redAccent,
  //       content: Text(
  //         e.toString(),
  //         style: TextStyle(
  //           fontFamily: 'Poppins-Regular',
  //           color: Colors.white,
  //         ),
  //       ),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   }
  // }

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text(
                    "Hello !",
                    style: GoogleFonts.poppins(fontSize: 25)
                  ),
                  SizedBox(height: 3),
                  Text("Sign in to continue",
                      style: GoogleFonts.poppins(fontSize: 15),),
                ],
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: controllerEmail,
              style: TextStyle(
                fontFamily: 'Poppins Light',
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Email Address",
                hintText: "Email Address",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: TextStyle(
                  fontFamily: 'Poppins Light',
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 18),
            TextField(
              controller: controllerPass,
              style: TextStyle(
                fontFamily: 'Poppins Light',
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Password",
                hintText: "Password",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: TextStyle(
                  fontFamily: 'Poppins Light',
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 15),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     "Forgot password?",
            //     style: TextStyle(
            //       color: orangeAccent,
            //       fontSize: 16,
            //       fontFamily: 'Poppins Light',
            //     ),
            //   ),
            // ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // login(controllerEmail.text, controllerPass.text);
              },
              child: Text("SIGN IN",
                  style: TextStyle(
                    fontFamily: 'Poppins SemiBold',
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 255, 255),
                  minimumSize: const Size.fromHeight(55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
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
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
