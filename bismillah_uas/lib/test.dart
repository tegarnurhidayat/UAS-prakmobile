import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {

    List<String> kumpulanGambar = [
      "bust.png",
      "bald.png",
      "bust2.png",
      "bull.png",
      // "img_5.png",
      // "img_6.png"
    ];

    List<String> kumpulanGambar2 = [
      "bust.png",
      "bald.png",
      "bust2.png",
      "bull.png",
      // "img_5.png",
      // "img_6.png"
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/aumabaru.png',
          height: 80,
          width: 160,
        ),
    
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(bottom: 15)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 100,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
               color: Color.fromARGB(255, 246, 246, 246)),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Padding(
            padding: EdgeInsets.only(right: 250),
            child: Text(
              'Ongoing',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            
          ),
          Padding(padding: EdgeInsets.only(right: 265),
          child: Text(
            'Auctions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
          ),),
          Padding(padding: EdgeInsets.only(bottom: 5)),
          Container(
            height: 200,
            child: ListView.builder(
              
              scrollDirection: Axis.horizontal,
              itemCount: kumpulanGambar.length,
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                
              //     crossAxisCount: 2),
              itemBuilder: (context, i) {
                return Padding(
                  
                  padding: const EdgeInsets.all(8.0),
                  // child: ClipRRect(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Image.asset('assets/${kumpulanGambar[i]}'),
                      Text("ahunsoahusneaouu"),
                    ],
                  ),

                  
                );
              },
            
            ),

        
          ),
         
  const Padding(
            padding: EdgeInsets.only(right: 250),
            child: Text(
              'Upcoming',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            
          ),
          Padding(padding: EdgeInsets.only(right: 285),
          child: Text(
            'Auctions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
          ),),
           Padding(padding: EdgeInsets.only(bottom: 5)),
          Container(
            height: 200,
            child: ListView.builder(
               scrollDirection: Axis.horizontal,
              itemCount: kumpulanGambar2.length,
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                
              //     crossAxisCount: 2),
              itemBuilder: (context, i) {
                return Padding(
                  
                  padding: const EdgeInsets.all(8.0),
                  // child: ClipRRect(borderRadius: BorderRadius.circular(8)),
                  child: Image.asset('assets/${kumpulanGambar2[i]}'),

                  
                );
              },
            
            ),

        
          ),
          
        ],
      ),
       
      
        
    );
  }
}