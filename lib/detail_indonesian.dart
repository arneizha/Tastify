import 'package:flutter/material.dart';
import 'package:flutter_application/main_screen.dart';
import 'package:flutter_application/review_indonesian.dart';

class detail_indonesian extends StatelessWidget {
  const detail_indonesian({super.key, required Kategori kategori});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 196, 0),
        title: const Text(
          'Indonesian Restaurant',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
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
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                );
              },
              itemCount: ListIndonesian.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => review_indonesian(
                          indonesian: ListIndonesian[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 15,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Color.fromARGB(255, 255, 196, 0),
                    child: Row(
                      children: [
                        Image.asset(
                          ListIndonesian[index].imageAsset,
                          width: 150,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ListIndonesian[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ListIndonesian[index].address,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}

class Indonesian {
  String name;
  String address;
  String imageAsset;
  String rating;
  String hari;
  String waktu;
  String description;

  Indonesian({
    required this.name,
    required this.address,
    required this.imageAsset,
    required this.rating,
    required this.hari,
    required this.waktu,
    required this.description,
  });
}

var ListIndonesian = [
  Indonesian(
    name: 'Bakso President',
    address: 'Jl. Batanghari No 5, Rampal Celaket, Klojen, Kota Malang',
    imageAsset: 'assets/images/Indonesian/bakso_president.jpg',
    rating: '4.8',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Kalau sedang berkunjung ke Malang, kurang lengkap rasanya kalau belum mencicipi kuliner legendarisnya. Salah satu, tempat makan legendaris di Malang yang bisa kamu kunjungi adalah Bakso President Malang. Bakso President Malang merupakan salah satu usaha bakso malang yang cukup terkenal. Salah satu daya tariknya adalah lokasinya yang berada di depan rel kereta api.',
  ),
  Indonesian(
    name: 'Soto Ayam Cak To',
    address: 'Jl. Indragiri No.114, Purwantoro, Kec. Blimbing, Kota Malang',
    imageAsset: 'assets/images/Indonesian/soto_ayam.jpg',
    rating: '4.6',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Soto Ayam Cak To di Malang adalah surga bagi pecinta kuliner Indonesia yang mencari cita rasa autentik dan lezat dari hidangan klasik Indonesia. Terletak di pusat kota, restoran ini menawarkan pengalaman makan yang hangat dan ramah, menciptakan suasana yang cocok untuk santap bersama keluarga atau teman. Dengan dekorasi yang sederhana namun bersahaja, Soto Ayam Cak To memancarkan kehangatan dan keakraban. Warna-warna hangat dan elemen dekorasi tradisional menciptakan nuansa yang mengingatkan pada keindahan budaya Indonesia.',
  ),
  Indonesian(
    name: 'Rumah Makan Kertanegara',
    address: 'Jl. Kertanegara No.1, Klojen, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Indonesian/RM_kartanegara.jpg',
    rating: '4.7',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Rumah Makan Kertanegara di Malang adalah sebuah destinasi kuliner yang mempersembahkan kelezatan autentik dari berbagai hidangan Indonesia. Menu Rumah Makan Kertanegara menjadi perjalanan kuliner yang menggugah selera. Hidangan khas Indonesia, mulai dari nasi liwet, sate, rendang, hingga gulai, disajikan dengan keahlian dan kehangatan yang mengingatkan pada masakan rumahan. Bahan-bahan segar dan rempah-rempah khas Indonesia menjadi bintang dalam setiap hidangan.',
  ),
  Indonesian(
    name: 'Rumah Makan Inggil',
    address: 'Jl. Zainul Arifin No.53 A-B, Sukoharjo, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Indonesian/RM_inggil.jpg',
    rating: '4.9',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Rumah Makan Inggil di Malang adalah persembahan istimewa dari kelezatan kuliner Indonesia dengan sentuhan khas tradisional. Menu Rumah Makan Inggil adalah perjalanan rasa yang memukau. Dari nasi rames hingga sate, rendang, dan soto, setiap hidangan disiapkan dengan keahlian dan menggunakan bahan-bahan berkualitas tinggi yang menggugah selera. Selain hidangan utama, Rumah Makan Inggil mungkin juga menawarkan hidangan penutup tradisional atau minuman khas Indonesia yang memperkaya pengalaman kuliner. Restoran ini menjadi pilihan yang cocok bagi mereka yang mencari kenikmatan rasa Indonesia yang autentik dan suasana yang hangat di tengah kota Malang.',
  ),
  Indonesian(
    name: 'Depot Rawon Nguling',
    address: 'Jl. Zainul Arifin No.62, Kiduldalem, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Indonesian/rawon.jpg',
    rating: '4.2',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Depot Rawon Nguling di Malang adalah surga bagi pencinta rawon dan hidangan Jawa Timur. Terletak dengan strategis, restoran ini menjadi tempat yang dicari untuk menikmati kelezatan rawon, sebuah masakan khas Indonesia yang kaya akan rasa. Dengan dekorasi sederhana dan atmosfer yang santai, Depot Rawon Nguling menciptakan lingkungan yang cocok untuk bersantap santai. Interior yang bersih dan meja-meja yang sederhana memperkuat fokus pada rasa otentik yang dihadirkan oleh hidangan utama, rawon.',
  ),
  Indonesian(
    name: 'Rumah Makan Pecel Kawi Hj Musilah',
    address: 'Jl. Kawi Atas No. 43B, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Indonesian/pecel_kawi.jpg',
    rating: '4.1',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Rumah Makan Pecel Kawi Hj Musilah di Malang adalah destinasi kuliner yang menghidupkan kembali cita rasa autentik pecel, salah satu hidangan khas Indonesia yang penuh kenangan dan kelezatan. Terletak di lokasi yang strategis, restoran ini menjadi tempat yang sangat dicari oleh pencinta kuliner yang menghargai masakan Indonesia.',
  ),
  Indonesian(
    name: 'Sate Klopo Ondomohen',
    address:
        'Perum pandanwangi park kavling 53, Pandanwangi, Kec. Blimbing, Kota Malang',
    imageAsset: 'assets/images/Indonesian/sate_klopo.jpg',
    rating: '4.4',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Sate Klopo Ondomohen di Malang adalah destinasi kuliner yang memanjakan lidah dengan cita rasa unik sate khas Jawa Timur, yang dihasilkan dari penggunaan kelapa parut (klopo) sebagai bumbu utama. Terletak di tempat yang strategis, restoran ini mengundang para pecinta kuliner untuk merasakan kelezatan sate yang berbeda dari yang lain. Menu utama Sate Klopo Ondomohen adalah sate klopo, yaitu sate daging yang dipanggang dengan bumbu khas yang terdiri dari kelapa parut yang telah disangrai. Keunikan rasa dari kelapa parut memberikan cita rasa yang lezat dan berbeda dari sate pada umumnya. Sate-sate ini mungkin disajikan dengan bumbu kacang yang kaya rasa dan potongan ketupat atau lontong.',
  ),
  Indonesian(
    name: 'Rempah - Warung Khas Batu',
    address: 'Jl. Sultan Agung No.29, Sisir, Kec. Batu, Kota Batu',
    imageAsset: 'assets/images/Indonesian/rempah.jpg',
    rating: '4.5',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Rempah - Warung Khas Batu di Malang adalah perwujudan cita rasa autentik Indonesia yang khas, mengajak para pengunjung untuk merasakan kelezatan hidangan tradisional Indonesia dalam suasana yang santai dan penuh warna. Terletak di daerah Batu, restoran ini menggabungkan cita rasa klasik dengan nuansa khas kota tersebut. Menu Rempah - Warung Khas Batu menawarkan beragam hidangan Indonesia yang otentik. Mungkin mulai dari nasi goreng yang gurih hingga rendang yang lezat, atau sate yang dipanggang dengan sempurna. Bumbu rempah yang digunakan dalam setiap hidangan memberikan sentuhan khas dan citarasa yang membangkitkan kenangan.',
  ),
  Indonesian(
    name: 'Javanine Resto',
    address: 'Jl. Pahlawan Trip No.5, Oro-oro Dowo, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Indonesian/javanine.jpg',
    rating: '4.0',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Menu utama di Javanine Resto adalah makanan tradisional Jawa. Meskipun ada makanan lainnya, namun rata-rata pengunjung yang hadir lebih memilih makanan lokal. Terdapat ruangan Indoor dan Outdoor yang bisa dipilih pengunjung. Hampir semua ruangan luas dengan desain interior dan eksterior masa kini. Sangat tepat mengajak keluarga besar atau kolega bisnis Anda untuk memanjakan lidah di Javanine Resto.',
  ),
  Indonesian(
    name: 'Wisata Warung Wareg',
    address: 'Jl. Raya Dieng No.9, Sidomulyo, Kec. Batu, Kota Batu',
    imageAsset: 'assets/images/Indonesian/warung_wareg.jpg',
    rating: '4.4',
    waktu: 'Everyday',
    hari: '08.00 - 23.00',
    description:
        'Wisata Warung Wareg di Malang adalah perwujudan dari pengalaman kuliner Indonesia yang autentik dan berwarna. Terletak di Malang, restoran ini memadukan cita rasa klasik Indonesia dengan nuansa tradisional yang meriah, menciptakan destinasi kuliner yang menarik dan berkesan. Menu Warung Wareg menampilkan hidangan-hidangan Indonesia yang bervariasi dan lezat. Mungkin dimulai dari nasi goreng yang harum hingga sate yang dipanggang dengan sempurna, atau mungkin hidangan spesial daerah seperti rawon atau soto. Keunikan rasa dan kelezatan bumbu-bumbu menjadi ciri khas setiap hidangan.',
  ),
];
