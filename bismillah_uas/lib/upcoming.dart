import 'package:bismillah_uas/models/product.dart';
import 'package:bismillah_uas/detail.dart';
import 'package:bismillah_uas/homepage.dart';
import 'package:bismillah_uas/ongoing.dart';
import 'package:bismillah_uas/services/services.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  // Text(
                  //   'See more >',
                  //   style: TextStyle(
                  //     fontFamily: 'Poppins-Regular',
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w400,
                  //     color: Color.fromARGB(255, 75, 75, 75),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Auctions',
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              
              FutureBuilder<List<Product>>(
                future: Service.fetchProductsBasedOnType("upcoming"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.60
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail(
                                          product: Product(
                                              id: int.parse(
                                                  "${snapshot.data?[index].id}"),
                                              title:
                                                  "${snapshot.data?[index].title}",
                                              harga:
                                                  "${snapshot.data?[index].harga}",
                                              person:
                                                  "${snapshot.data?[index].person}",
                                              start_bid:
                                                  "${snapshot.data?[index].start_bid}",
                                              deskripsi:
                                                  "${snapshot.data?[index].deskripsi}",
                                              image:
                                                  "${snapshot.data?[index].image}",
                                              status:
                                                  "${snapshot.data?[index].status}"))));
                            },
                            child: AuctionGridItem(
                              title: "${snapshot.data?[index].title}",
                              harga: "${snapshot.data?[index].harga}",
                              image: "${snapshot.data?[index].image}",
                              deskripsi: "${snapshot.data?[index].deskripsi}",
                            ),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}