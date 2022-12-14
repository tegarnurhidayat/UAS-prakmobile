import 'package:bismillah_uas/detail.dart';
import 'package:bismillah_uas/homepage.dart';
import 'package:bismillah_uas/models/product.dart';
import 'package:bismillah_uas/models/user.dart';
import 'package:bismillah_uas/services/services.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatefulWidget {
  final User user;
  const BodyHome({super.key, required this.user});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/aumabaru.png',
                height: 80,
                width: 160,
              ),
            ),
            SizedBox(height: 10),
            Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              height: 60,
                            )
                          ],
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.user.name,
                              style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Your Wallet',
                              style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'IDR 2.500.000',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 32, 32, 32),
                                  ),
                                ),
                                SizedBox(width: 35),
                                Text(
                                  'Withdrawn | ',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 93, 92, 92),
                                  ),
                                ),
                                Text(
                                  'Top up',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 93, 92, 92),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ongoing',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  'See more >',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 75, 75, 75),
                  ),
                ),
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
            SizedBox(height: 17),
            Container(
              height: 270,
              child: FutureBuilder<List<Product>>(
                future: Service.fetchProductsBasedOnType("ongoing"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
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
                                                    "${snapshot.data?[index].status}"),
                                          )));
                            },
                            child: AuctionCard(
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
            ),
            SizedBox(
              height: 10,
            ),
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
                Text(
                  'See more >',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 75, 75, 75),
                  ),
                ),
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
            SizedBox(height: 17),
            Container(
              height: 270,
              child: FutureBuilder<List<Product>>(
                future: Service.fetchProductsBasedOnType("upcoming"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        scrollDirection: Axis.horizontal,
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
                            child: AuctionCard(
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
            ),
          ],
        ),
      ),
    );
  }
}
