import 'package:bismillah_uas/services/services.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  TextEditingController controllerPerson = TextEditingController();
  TextEditingController controllerStartBid = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController controllerImage = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Product",
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 23,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  TextFormField(
                    controller: controllerTitle,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: 'Product name',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: controllerHarga,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: '10.000.000',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: controllerPerson,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: 'John Doe',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controllerStartBid,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: 'December 29th, 2022',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controllerStatus,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: 'ongoing / upcoming',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controllerImage,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: 'http://image.jpg',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controllerDesc,
                    minLines: 3,
                    maxLines: 5,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 62, 62, 62),
                              width: 1)),
                      hintText: 'Give a brief description',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      hintStyle: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          color: Color.fromARGB(255, 156, 156, 156),
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(52),
                      backgroundColor: Color.fromARGB(255, 36, 36, 36),
                    ),
                    onPressed: () {
                      setState(() {
                        Service.addProduct(
                            controllerTitle.text,
                            controllerHarga.text,
                            controllerPerson.text,
                            controllerStartBid.text,
                            controllerStatus.text,
                            controllerImage.text,
                            controllerDesc.text);
                      });
                    },
                    child: Text(
                      "Add product",
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
