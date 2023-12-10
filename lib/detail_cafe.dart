import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/firestore_service.dart';
import 'package:flutter_application/main_screen.dart';
import 'package:flutter_application/review_cafe.dart';

class detail_cafe extends StatefulWidget {
  final DocumentSnapshot kategori; // Ganti dengan tipe data yang sesuai

  const detail_cafe({Key? key, required this.kategori}) : super(key: key);

  @override
  State<detail_cafe> createState() => Detail_cafe();
}

class Detail_cafe extends State<detail_cafe> {
  late TextEditingController _searchController;
  List<DocumentSnapshot> userList = []; // Tambahkan deklarasi userList

  List<DocumentSnapshot> searchResults = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    // Inisialisasi data userList menggunakan stream Firestore
    FirestoreService().getcafe().listen((QuerySnapshot snapshot) {
      setState(() {
        userList = snapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEDEBD),
      appBar: AppBar(
        backgroundColor: Color(0xFF435334),
        title: const Text(
          'Cafe',
          style: TextStyle(
            color: Color(0xFFFAF1E4),
            fontSize: 25.0,
          ),
        ),
        toolbarHeight: 70.0,
        elevation: 15,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  isSearching = true;
                  searchResults = userList.where((document) {
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirestoreService().getcafe(),
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
                          itemCount: isSearching
                              ? searchResults.length
                              : userList.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot = isSearching
                                ? searchResults[index]
                                : userList[index];
                            Map<String, dynamic> data =
                                documentSnapshot.data() as Map<String, dynamic>;
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => review_cafe(
                                      cafe: documentSnapshot,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 15,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                color: Color(0xFF9EB384),
                                child: Row(
                                  children: [
                                    Image.network(
                                      data['image'],
                                      width: 150,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF435334),
                                            ),
                                          ),
                                          Text(
                                            data['address'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFFFAF1E4),
                                            ),
                                          ),
                                        ],
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
                }),
          ),
        ],
      ),
    );
  }
}
