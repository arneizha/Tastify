import 'package:flutter/material.dart';
import 'package:flutter_application/detail_chinese.dart';

class review_chinese extends StatelessWidget {
  final Chinese chinese;

  const review_chinese({Key? key, required this.chinese}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 196, 0),
        title: Text(
          chinese.name,
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
                  chinese.imageAsset,
                  width: 450,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20),
                Text(
                  chinese.name,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    chinese.address,
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
                          Text(chinese.rating),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.calendar_today),
                          Text(chinese.hari),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.access_time),
                          Text(chinese.waktu),
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
                        chinese.description,
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
                      ListReviewChinese.length,
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
                                ListReviewChinese[index].name,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                ListReviewChinese[index].description,
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

class ReviewChinese {
  String name;
  String description;

  ReviewChinese({
    required this.name,
    required this.description,
  });
}

// ignore: non_constant_identifier_names
var ListReviewChinese = [
  ReviewChinese(
    name: 'arneizha',
    description:
        '"Restoran ini menyajikan hidangan yang lezat dan pelayanan yang ramah. Suasana di dalamnya juga sangat nyaman, membuat pengalaman makan malam menjadi menyenangkan."',
  ),
  ReviewChinese(
    name: 'mutia',
    description:
        '"Saya sangat puas dengan makanan di restoran ini. Rasanya autentik dan bahan-bahannya segar. Porsinya juga cukup besar, memberikan nilai tambah untuk harga yang dibayarkan."',
  ),
  ReviewChinese(
    name: 'dena',
    description:
        '"Saya sangat puas dengan makanan di restoran ini. Rasanya autentik dan bahan-bahannya segar. Porsinya juga cukup besar, memberikan nilai tambah untuk harga yang dibayarkan."',
  ),
  ReviewChinese(
    name: 'satria',
    description:
        '"Sayangnya, saya agak kecewa dengan makanan di restoran ini. Rasanya kurang istimewa dan tidak sebanding dengan harganya. Mungkin perlu perbaikan pada kualitas hidangan."',
  ),
];
