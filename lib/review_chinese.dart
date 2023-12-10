import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/option_page.dart';
import 'package:flutter_application/detail_chinese.dart';
import 'package:flutter_application/firestore_service.dart';

class review_chinese extends StatelessWidget {
  final DocumentSnapshot chinese;

  const review_chinese({Key? key, required this.chinese}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEDEBD),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirestoreService().getchinese(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    List userList = snapshot.data!.docs;
                    return SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot = userList[index];
                          Map<String, dynamic> data =
                              documentSnapshot.data() as Map<String, dynamic>;
                          return Column(children: [
                            Image.network(
                              chinese['image'],
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 20),
                            Text(
                              chinese['name'],
                              style: TextStyle(
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: EdgeInsets.all(1.0),
                              child: Text(
                                chinese['address'],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Icon(Icons.star),
                                      Text(chinese['rating']),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Icon(Icons.calendar_today),
                                      Text(chinese['hari']),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Icon(Icons.access_time),
                                      Text(chinese['waktu']),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description : ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    chinese['description'],
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Menu : ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 120,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirestoreService().getmenu_chinese(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  } else {
                                    List userList = snapshot.data!.docs;

                                    return SizedBox(
                                      width: double.infinity,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: userList.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot documentSnapshot =
                                              userList[index];
                                          Map<String, dynamic> data =
                                              documentSnapshot.data()
                                                  as Map<String, dynamic>;

                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0,
                                              vertical: 1.0,
                                            ),
                                            child: Image.network(
                                              data['image'],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Comment : ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(1.0),
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirestoreService().getreview(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
                                    } else {
                                      List userList = snapshot.data!.docs;
                                      return SizedBox(
                                        width: double.infinity,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: userList.length,
                                          itemBuilder: (context, index) {
                                            DocumentSnapshot documentSnapshot =
                                                userList[index];
                                            Map<String, dynamic> data =
                                                documentSnapshot.data()
                                                    as Map<String, dynamic>;

                                            return InkWell(
                                              onLongPress: () {
                                                DialogUtils.showOptionsDialog(
                                                    context,
                                                    index,
                                                    documentSnapshot);
                                              },
                                              child: Card(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 15),
                                                color: Color(0xFFFAF1E4),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 7),
                                                      child: Text(
                                                        data['name'],
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFF9EB384),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 14),
                                                      child: Text(
                                                        data['description'],
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFF435334),
                                                        ),
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            ),
                          ]);
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*class Menu {
  String image;

  Menu({
    required this.image,
  });
}

// ignore: non_constant_identifier_names
var ListMenu = [
  Menu(
    image: 'assets/images/burger.jpg',
  ),
  Menu(
    image: 'assets/images/burger.jpg',
  ),
  Menu(
    image: 'assets/images/burger.jpg',
  ),
  Menu(
    image: 'assets/images/burger.jpg',
  ),
  Menu(
    image: 'assets/images/burger.jpg',
  ),
  Menu(
    image: 'assets/images/burger.jpg',
  ),
];

class Reviewchinese {
  String name;
  String description;

  Reviewchinese({
    required this.name,
    required this.description,
  });
}

// ignore: non_constant_identifier_names
var ListReviewchinese = [
  Reviewchinese(
    name: 'arneizha',
    description:
        '"Restoran ini menyajikan hidangan yang lezat dan pelayanan yang ramah. Suasana di dalamnya juga sangat nyaman, membuat pengalaman makan malam menjadi menyenangkan."',
  ),
  Reviewchinese(
    name: 'mutia',
    description:
        '"Saya sangat puas dengan makanan di restoran ini. Rasanya autentik dan bahan-bahannya segar. Porsinya juga cukup besar, memberikan nilai tambah untuk harga yang dibayarkan."',
  ),
  Reviewchinese(
    name: 'dena',
    description:
        '"Saya sangat puas dengan makanan di restoran ini. Rasanya autentik dan bahan-bahannya segar. Porsinya juga cukup besar, memberikan nilai tambah untuk harga yang dibayarkan."',
  ),
  Reviewchinese(
    name: 'satria',
    description:
        '"Sayangnya, saya agak kecewa dengan makanan di restoran ini. Rasanya kurang istimewa dan tidak sebanding dengan harganya. Mungkin perlu perbaikan pada kualitas hidangan."',
  ),
];*/
