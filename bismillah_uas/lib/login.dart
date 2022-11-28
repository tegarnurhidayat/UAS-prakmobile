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

  // void test(String email, password) async {
  //   try {
  //     var response = await Dio().get('http://localhost:3004/user');
  //     var panjang_data = response.data.length;
  //     if (response.statusCode == 200) {
  //       for (var i = 0; i <= panjang_data; i++) {
  //         if (email == response.data[i]['email'] &&
  //             password == response.data[i]['password']) {
  //           print("test success");
  //           Navigator.push(
  //               context, MaterialPageRoute(builder: (context) => Home()));
  //           break;
  //         }
  //       }
  //     } else {
  //       final snackBar = SnackBar(
  //         backgroundColor: Colors.redAccent,
  //         content: Text(
  //           'test failed',
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
            color: Colors.black,
            
            size: 30,
            
          ),
          
          onPressed: () => Navigator.pop(context) ,),
          elevation: 0,
            
          
          ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: 
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hello !", style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w600)),
                  // SizedBox(height: ),
                  Text(
                    "Sign in to continue",
                    style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 25,),
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
              style:
              GoogleFonts.poppins(),
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
            SizedBox(height: 100,),
            
            ElevatedButton(
              onPressed: () {
                // login(controllerEmail.text, controllerPass.text);
              },
              child: Text("Sign in !",
                  style: GoogleFonts.poppins(fontSize: 24)),
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
              
              
            )
    );
  }
}
