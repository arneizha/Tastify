import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/firestore_service.dart';
import 'package:flutter_application/login.dart';
import 'package:flutter_application/profil_page.dart';
import 'package:flutter_application/detail_cafe.dart';
import 'package:flutter_application/detail_chinese.dart';
import 'package:flutter_application/detail_european.dart';
import 'package:flutter_application/detail_indonesian.dart';
import 'package:flutter_application/detail_japanese.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => Main_screen();
}

class Main_screen extends State<main_screen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late TextEditingController _searchController;
  List<DocumentSnapshot> restaurantList = [];
  List<DocumentSnapshot> cafeList = [];
  List<DocumentSnapshot> indonesianList = [];
  List<DocumentSnapshot> chineseList = [];
  List<DocumentSnapshot> europeanList = [];
  List<DocumentSnapshot> japaneseList = [];
  List<DocumentSnapshot> searchResults = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    FirestoreService().getrestaurant().listen((QuerySnapshot snapshot) {
      setState(() {
        restaurantList = snapshot.docs;
      });
    });

    FirestoreService().getcafe().listen((QuerySnapshot snapshot) {
      setState(() {
        cafeList = snapshot.docs;
      });
    });

    FirestoreService().getindonesian().listen((QuerySnapshot snapshot) {
      setState(() {
        indonesianList = snapshot.docs;
      });
    });

    FirestoreService().getchinese().listen((QuerySnapshot snapshot) {
      setState(() {
        chineseList = snapshot.docs;
      });
    });

    FirestoreService().geteuropean().listen((QuerySnapshot snapshot) {
      setState(() {
        europeanList = snapshot.docs;
      });
    });

    FirestoreService().getjapanese().listen((QuerySnapshot snapshot) {
      setState(() {
        japaneseList = snapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEDEBD),
      appBar: AppBar(
        backgroundColor: Color(0xFF435334),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'hi!! Welcome to',
              style: TextStyle(
                color: Color(0xFFFAF1E4),
                fontSize: 18.0,
              ),
            ),
            Text(
              'TASTIFY',
              style: TextStyle(
                color: Color(0xFFFAF1E4),
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        toolbarHeight: 120.0,
        elevation: 15,
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              color: Color(0xFFFAF1E4),
            ),
            iconSize: 40.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          InkWell(
              onTap: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (contet) => const LoginPage()));
              },
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(
                    Icons.logout,
                    color: Color(0xFFFAF1E4),
                  )))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    isSearching = true;
                    searchResults = [
                      ...restaurantList,
                      ...cafeList,
                      ...indonesianList,
                      ...chineseList,
                      ...europeanList,
                      ...japaneseList,
                    ].where((document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return data['name']
                          .toLowerCase()
                          .contains(value.toLowerCase());
                    }).toList();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 30.0),
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 20.0),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommended :',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF435334),
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 15),
                height: 200,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirestoreService().getrestaurant(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        List<DocumentSnapshot> categoryList =
                            snapshot.data!.docs;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            String category = categoryList[index]['name'];
                            List<DocumentSnapshot> restaurantList = [];
                            switch (category) {
                              case 'Cafe':
                                restaurantList = cafeList;
                                break;
                              case 'Chinese Restaurant':
                                restaurantList = chineseList;
                                break;
                              case 'European Restaurant':
                                restaurantList = europeanList;
                                break;
                              case 'Indonesian Restaurant':
                                restaurantList = indonesianList;
                                break;
                              case 'Japanese Restaurant':
                                restaurantList = japaneseList;
                                break;
                              default:
                                break;
                            }
                            if (restaurantList.isNotEmpty) {
                              int randomIndex =
                                  Random().nextInt(restaurantList.length);
                              DocumentSnapshot restaurant =
                                  restaurantList[randomIndex];

                              return GestureDetector(
                                onTap: () {},
                                child: Card(
                                  color: Color(0xFF9EB384),
                                  child: SizedBox(
                                    width: 180,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 160,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 1.0),
                                            child: CircleAvatar(
                                              radius: 150.0,
                                              backgroundImage: NetworkImage(
                                                  restaurant['image']),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          restaurant['name'],
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFAF1E4),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Text('No data available');
                            }
                          },
                        );
                      }
                    }
                  },
                )),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories :',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF435334),
                  ),
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirestoreService().getrestaurant(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    List userList = snapshot.data!.docs;

                    return Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: isSearching
                            ? searchResults.length
                            : userList.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot documentSnapshot = isSearching
                              ? searchResults[index]
                              : userList[index];
                          Map<String, dynamic> data =
                              documentSnapshot.data() as Map<String, dynamic>;
                          return GestureDetector(
                            onTap: () {
                              if (data['name'] == 'Cafe') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detail_cafe(
                                      kategori: documentSnapshot,
                                    ),
                                  ),
                                );
                              } else if (data['name'] == 'Chinese Restaurant') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detail_chinese(
                                      kategori: documentSnapshot,
                                    ),
                                  ),
                                );
                              } else if (data['name'] ==
                                  'European Restaurant') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detail_european(
                                      kategori: documentSnapshot,
                                    ),
                                  ),
                                );
                              } else if (data['name'] ==
                                  'Indonesian Restaurant') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detail_indonesian(
                                      kategori: documentSnapshot,
                                    ),
                                  ),
                                );
                              } else if (data['name'] ==
                                  'Japanese Restaurant') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detail_japanese(
                                      kategori: documentSnapshot,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Card(
                              elevation: 15,
                              color: Color(0xFF9EB384),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Expanded(
                                    child: Image.network(
                                      data['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    data['name'],
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFAF1E4),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}
