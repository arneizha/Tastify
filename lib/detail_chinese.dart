import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/firestore_service.dart';
import 'package:flutter_application/main_screen.dart';
import 'package:flutter_application/review_chinese.dart';

class detail_chinese extends StatefulWidget {
  final DocumentSnapshot kategori;

  const detail_chinese({Key? key, required this.kategori}) : super(key: key);

  @override
  State<detail_chinese> createState() => Detail_chinese();
}

class Detail_chinese extends State<detail_chinese> {
  late TextEditingController _searchController;
  List<DocumentSnapshot> userList = [];

  List<DocumentSnapshot> searchResults = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    FirestoreService().getchinese().listen((QuerySnapshot snapshot) {
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
          'Chinese Restaurant',
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
                                    builder: (context) => review_chinese(
                                      chinese: documentSnapshot,
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

/*class Chinese {
  String name;
  String address;
  String imageAsset;
  String rating;
  String hari;
  String waktu;
  String description;

  Chinese({
    required this.name,
    required this.address,
    required this.imageAsset,
    required this.rating,
    required this.hari,
    required this.waktu,
    required this.description,
  });
}

var ListChinese = [
  Chinese(
    name: 'Melati Restaurant',
    address:
        'Hotel Tugu Malang Jalan Tugu. 3, Jl. Kahuripan No.3, Klojen, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Chinese/melati.jpg',
    rating: '4.1',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description:
        'Satu-satunya restoran di Malang yang menyajikan suasana Malang Tempo Doeloe (Masa Nostalgia Malang) yang klasik dan romantis, Restoran Melati terkenal dengan resep-resep lama masakan rumahan asli Indonesia, menu Peranakan Cina, serta menu steak yang empuk dan juicy. , mulai dari resep steak goreng adonan Kolonial Belanda hingga steak panggang ala Prancis yang lezat.',
  ),
  Chinese(
    name: 'AhYat Abalone Forum Restaurant',
    address:
        'Jl. A. Yani Jl. Riverside No.1, Polowijen, Kec. Blimbing, Kota Malang',
    imageAsset: 'assets/images/Chinese/ahyat.jpg',
    rating: '4.5',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description:
        'Ah Yat Abalone Forum Restaurant Malang berlokasikan di Jl. A. Yani Blok C-1 Riverside Malang East Java. Rata-rata biaya yang diperlukan berkisaran Rp 400.000 / Orang, jam buka pada 10:00 - 15:00,17:30 - 21:30 dan merupakan Chinese di area Malang. Restoran ini memang adalah destinasi wisata kuliner di area Malang. Di sini tersedia berbagai makanan enak dan memang layak dikunjungi.',
  ),
  Chinese(
    name: 'Depot Hok Lay',
    address: 'Jl. KH Ahmad Dahlan No.10, Sukoharjo, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Chinese/hok_lay.jpg',
    rating: '4.2',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description:
        'Hok Lay Malang berlokasi di Jalan KH Achmad Dahlan No.10, Malang atau lebih tepatnya berada di sekitaran area Malang Plaza. Meskipun terletak di pusat kota, depot ini masih berdiri di bangunan lawas atau kuno yang tidak pernah di rubah sejak awal mula berdiri. Kesan kuno dan jadul tersebut  membuat depot ini berbeda dari  yang lain. Ditambah lagi ada beberapa foto-foto jadul yang di gantung di tembok yang menambah kesan klasik pada Depot Hok Lay Malang.',
  ),
  Chinese(
    name: 'Rumah Makan Gloria',
    address: 'Jl. Agus Salim No.23, Kiduldalem, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Chinese/gloria.jpg',
    rating: '4.9',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description:
        'Suasana di Rumah Makan Gloria dirancang untuk menciptakan ruang yang nyaman dan santai. Dekorasi yang klasik dan sentuhan hangat menciptakan lingkungan yang cocok untuk acara keluarga, pertemuan bisnis, atau bahkan perayaan spesial.',
  ),
  Chinese(
    name: 'Depot Gang Djangkrik',
    address: 'Jl. Letjen Sutoyo No.136, Purwantoro, Kec. Blimbing, Kota Malang',
    imageAsset: 'assets/images/Chinese/djangkrik.jpg',
    rating: '4.2',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description:
        'Depot Gang Djangkrik marupakan salah satu restoran di kawasan Kota Malang yang menyajikan aneka hidangan Chinese Food. Salah satu cabang Depot Gang Djangkrik di Kota Malang berlokasi di Jl. Letjen Sutoyo No.136, Malang (seberang kiri Hotel Santika Premiere).',
  ),
  Chinese(
    name: 'Depot Kee Tjie',
    address: 'Jl. Zainul Arifin No.64, Sukoharjo, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Chinese/kee_tjie.jpg',
    rating: '4,6',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description:
        'Depot Kee Tjie menghadirkan suasana yang ramah dan nyaman. Dekorasi yang sederhana namun menyenangkan, menciptakan ruang yang cocok untuk berkumpul bersama keluarga atau teman-teman. Setiap sudut ruangan memberikan kesan hangat dan ramah.',
  ),
  Chinese(
    name: 'New Hongkong',
    address: 'Jl. Arif Rahman Hakim, Kauman, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Chinese/hongkong.jpg',
    rating: '3,9',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description: '',
  ),
  Chinese(
    name: 'Depot Sari Rasa',
    address:
        'Jl. Jaksa Agung Suprapto No.81, Rampal Celaket, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Chinese/sari_rasa.jpg',
    rating: '4.4',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description: '',
  ),
  Chinese(
    name: 'GL8 Frozen Food',
    address: 'Jl. Kawi Atas No.16, Gading Kasri, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Chinese/gl8.jpg',
    rating: '4.1',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description: '',
  ),
  Chinese(
    name: 'KDS Cantonese Restaurant',
    address: 'Jl. Araya Megah No.01, Kota Araya, Kec. Blimbing, Kota Malang',
    imageAsset: 'assets/images/Chinese/kds.jpg',
    rating: '4.6',
    hari: 'Everyday',
    waktu: '10.00 - 24.00',
    description: '',
  ),
];*/
