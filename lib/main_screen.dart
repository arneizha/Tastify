import 'package:flutter/material.dart';
import 'package:flutter_application/detail_cafe.dart';
import 'package:flutter_application/detail_chinese.dart';
import 'package:flutter_application/detail_european.dart';
import 'package:flutter_application/detail_indonesian.dart';
import 'package:flutter_application/detail_japanese.dart';
import 'package:flutter_application/profil_page.dart';

class main_screen extends StatelessWidget {
  const main_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 196, 0),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TASTIFY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'hi, Arneizha!!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        toolbarHeight: 100.0,
        elevation: 15,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
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
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            child: TextField(
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
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Set the number of columns you want
              crossAxisSpacing: 8.0, // Adjust as needed
              mainAxisSpacing: 10.0, // Adjust as needed
            ),
            itemCount: ListKategori.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Navigasi ke kelas detail sesuai kategori
                  if (ListKategori[index].name == 'Cafe') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detail_cafe(
                          kategori: ListKategori[index],
                        ),
                      ),
                    );
                  } else if (ListKategori[index].name == 'Chinese Restaurant') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detail_chinese(
                          kategori: ListKategori[index],
                        ),
                      ),
                    );
                  } else if (ListKategori[index].name ==
                      'European Restaurant') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detail_european(
                          kategori: ListKategori[index],
                        ),
                      ),
                    );
                  } else if (ListKategori[index].name ==
                      'Indonesian Restaurant') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detail_indonesian(
                          kategori: ListKategori[index],
                        ),
                      ),
                    );
                  } else if (ListKategori[index].name ==
                      'Japanese Restaurant') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detail_japanese(
                          kategori: ListKategori[index],
                        ),
                      ),
                    );
                  }
                },
                child: Card(
                  elevation: 15,
                  color: Color.fromARGB(255, 255, 196, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200, // Sesuaikan dengan kebutuhan Anda
                        height: 155,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Image.asset(
                            ListKategori[index].imageAsset,
                            fit: BoxFit.cover, // Adjust as needed
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          ListKategori[index].name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}

class Kategori {
  String name;
  String imageAsset;

  Kategori({
    required this.name,
    required this.imageAsset,
  });
}

var ListKategori = [
  Kategori(
    name: 'Cafe',
    imageAsset: 'assets/images/cafe.jpg',
  ),
  Kategori(
    name: 'Chinese Restaurant',
    imageAsset: 'assets/images/chinese.jpg',
  ),
  Kategori(
    name: 'European Restaurant',
    imageAsset: 'assets/images/european.jpg',
  ),
  Kategori(
    name: 'Indonesian Restaurant',
    imageAsset: 'assets/images/indonesian.jpg',
  ),
  Kategori(
    name: 'Japanese Restaurant',
    imageAsset: 'assets/images/japanese.jpg',
  ),
];
