import 'package:bismillah_uas/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bismillah_uas/register.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: 
        Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0,188.50,0,0))
            ,Image.asset('assets/aumabaru.png'),
            SizedBox(height: 12,),
            Text("   Whether you sell or buy,\n   the auction is all yours", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500 )),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Login(),
                ));
              },
              child: Text("   Log in",
            style: GoogleFonts.poppins(fontSize: 22),),
            ),
            SizedBox(height: 20,),
             GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Register(),
                ));
              },
              child: Text("   Sign up",
            style: GoogleFonts.poppins(fontSize: 22),),
            ),
              ],
            ),
            // Stack(
            //   children: <Widget>[
            //     Positioned(bottom: 0, right: 0,
            //     child: Image.asset('assets/camera.png'),)
            //   ],
            // ),
            Align(alignment: Alignment.topRight,
            child: Container(margin: EdgeInsets.only(),
            child: (Image.asset('assets/camera.png')),))

            // Align(alignment: Alignment.centerLeft,
            // child: Column(children: <Widget>[
            //   Text("data")
            // ]),)
            // Align(alignment: Alignment.centerLeft,
            // child: Column(children: <Widget>[ Text("Whether you sell or buy,\n the auction is all yours", style: GoogleFonts.poppins(fontSize: 22))]),)
           
            ],
          
        ),
        ),
        
      ),
    );
  }
}
