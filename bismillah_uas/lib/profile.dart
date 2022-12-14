import 'package:bismillah_uas/models/user.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {
    controllerName.text = widget.user.name;
    controllerEmail.text = widget.user.email;
    controllerPassword.text = widget.user.password;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 23,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: controllerName,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: 'John Doe',
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                        color: Color.fromARGB(255, 62, 62, 62),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 50, 50, 50),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: controllerEmail,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: 'example@gmail.com',
                      prefixIcon: Icon(
                        Icons.mail,
                        size: 20,
                        color: Color.fromARGB(255, 62, 62, 62),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 50, 50, 50),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: controllerPassword,
                    enabled: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: 'password1234',
                      prefixIcon: Icon(
                        Icons.key,
                        size: 20,
                        color: Color.fromARGB(255, 62, 62, 62),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 50, 50, 50),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
