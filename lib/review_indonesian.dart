import 'package:flutter/material.dart';
import 'package:flutter_application/detail_indonesian.dart';

class review_indonesian extends StatelessWidget {
  final Indonesian indonesian;

  const review_indonesian({Key? key, required this.indonesian})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 196, 0),
        title: Text(
          indonesian.name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset(
                  indonesian.imageAsset,
                  width: 450,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20),
                Text(
                  indonesian.name,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    indonesian.address,
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
                          Text(indonesian.rating),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.calendar_today),
                          Text(indonesian.hari),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.access_time),
                          Text(indonesian.waktu),
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
                          // Tambahkan properti lainnya seperti fontFamily, color, dll.
                        ),
                      ),
                      Text(
                        indonesian.description,
                        style: TextStyle(
                          fontSize: 16, // Atur ukuran font untuk deskripsi
                          // Tambahkan properti lainnya seperti fontFamily, color, dll.
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      ListReviewIndonesian.length,
                      (index) => Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        color: Color.fromARGB(255, 248, 234, 189),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                ListReviewIndonesian[index].name,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                ListReviewIndonesian[index].description,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Tambahkan komentar...',
                      border: OutlineInputBorder(),
                    ),
                    // Handle logic when the user submits the comment
                    // onFieldSubmitted: (value) {
                    //   // Your logic here
                    // },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle logic when the send button is pressed
                    // ...
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewIndonesian {
  String name;
  String description;

  ReviewIndonesian({
    required this.name,
    required this.description,
  });
}

// ignore: non_constant_identifier_names
var ListReviewIndonesian = [
  ReviewIndonesian(
    name: 'arneizha',
    description:
        '"Restoran ini menyajikan hidangan yang lezat dan pelayanan yang ramah. Suasana di dalamnya juga sangat nyaman, membuat pengalaman makan malam menjadi menyenangkan."',
  ),
  ReviewIndonesian(
    name: 'mutia',
    description:
        '"Saya sangat puas dengan makanan di restoran ini. Rasanya autentik dan bahan-bahannya segar. Porsinya juga cukup besar, memberikan nilai tambah untuk harga yang dibayarkan."',
  ),
  ReviewIndonesian(
    name: 'dena',
    description:
        '"Saya sangat puas dengan makanan di restoran ini. Rasanya autentik dan bahan-bahannya segar. Porsinya juga cukup besar, memberikan nilai tambah untuk harga yang dibayarkan."',
  ),
  ReviewIndonesian(
    name: 'satria',
    description:
        '"Sayangnya, saya agak kecewa dengan makanan di restoran ini. Rasanya kurang istimewa dan tidak sebanding dengan harganya. Mungkin perlu perbaikan pada kualitas hidangan."',
  ),
];
