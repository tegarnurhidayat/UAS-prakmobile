import 'package:bismillah_uas/add.dart';
import 'package:bismillah_uas/body_home.dart';
import 'package:bismillah_uas/detail.dart';
import 'package:bismillah_uas/models/product.dart';
import 'package:bismillah_uas/models/user.dart';
import 'package:bismillah_uas/profile.dart';
import 'package:bismillah_uas/services/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      BodyHome(user: widget.user),
      Add(),
      Profile(
        user: widget.user,
      ),
    ];

    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Color.fromARGB(255, 59, 59, 59),
        unselectedItemColor: Color.fromARGB(255, 224, 224, 224),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }
}

class AuctionCard extends StatelessWidget {
  final title, harga, image, deskripsi;
  const AuctionCard({
    required this.title,
    required this.harga,
    required this.image,
    required this.deskripsi,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 7),
          Text(
            "IDR " + harga,
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
