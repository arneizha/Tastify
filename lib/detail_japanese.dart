import 'package:flutter/material.dart';
import 'package:flutter_application/main_screen.dart';
import 'package:flutter_application/review_japanese.dart';

class detail_japanese extends StatelessWidget {
  const detail_japanese({super.key, required Kategori kategori});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 196, 0),
        title: const Text(
          'Japanese Restaurant',
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
              itemCount: ListJapanese.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => review_japanese(
                          japanese: ListJapanese[index],
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
                          ListJapanese[index].imageAsset,
                          width: 150,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ListJapanese[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ListJapanese[index].address,
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

class Japanese {
  String name;
  String address;
  String imageAsset;
  String rating;
  String hari;
  String waktu;
  String description;

  Japanese({
    required this.name,
    required this.address,
    required this.imageAsset,
    required this.rating,
    required this.hari,
    required this.waktu,
    required this.description,
  });
}

var ListJapanese = [
  Japanese(
    name: 'Saboten Shokudo',
    address: 'Jl. Dieng No.18, Gading Kasri, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Japanese/saboten.jpg',
    rating: '4.3',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        ' Saboten Shokudo merupakan salah satu resto masakan khas Jepang yang berlokasi di 2 cabang yang tersebar di Kota Malang tepatnya di Jl. Raya Dieng No.18 Malang dan di Jl. Danau Kerinci Raya C2A9, Malang. Resto Saboten menyajikan beragam menu khas Jepang yang pas dengan mulut orang Indonesia, antara lain seperti Bulgogi, Tori Katsu, Hambagu, Tempura, Chicken Katsu,  Gyudon, Sushi dsb.',
  ),
  Japanese(
    name: 'Yoshinoya',
    address:
        'Ruko Taman Niaga, Jl. Soekarno Hatta, Jatimulyo, Kec. Lowokwaru, Kota Malang',
    imageAsset: 'assets/images/Japanese/yoshinoya.jpg',
    rating: '4.9',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        'Yoshinoya merupakan Restoran yang menyajikan masakan Jepang. Bagi Anda penggemar masakan Jepang wajib tentunya untuk mencoba rasa menu-menu baru dari Yoshinoya. Beberapa pengamat kuliner mengatakan Yoshinoya memiliki ciri khas yang tidak ada di masakan Jepang lainnya dan pasti itu enak sekali.',
  ),
  Japanese(
    name: 'Sugoi Tei',
    address: 'Jl. Bandulan Gg. 8 No.25, Bandulan, Kec. Sukun, Kota Malang',
    imageAsset: 'assets/images/Japanese/sugoi_tei.jpg',
    rating: '4.6',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        'Sugoi Tei di Malang adalah destinasi kuliner Jepang yang menggabungkan elegansi tradisional Jepang dengan inovasi modern dalam hidangan mereka. Terletak di pusat kota Malang, restoran ini mengundang para pengunjung untuk merasakan kelezatan autentik Jepang dalam suasana yang nyaman dan memikat. Menu Sugoi Tei mencakup beragam hidangan Jepang yang memanjakan selera. Mulai dari sushi dan sashimi yang segar hingga ramen yang lezat, setiap hidangan disiapkan dengan keahlian oleh koki berbakat yang memahami seni kuliner Jepang. Mungkin juga menyajikan hidangan khas seperti tempura, teriyaki, atau donburi dengan rasa autentik yang memukau.',
  ),
  Japanese(
    name: 'Skipjack Resto Malang',
    address: 'Karangploso, Girimoyo, Kec. Karang Ploso, Kabupaten Malang',
    imageAsset: 'assets/images/Japanese/skipjack.jpg',
    rating: '4.7',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        'Skipjack Resto Malang adalah destinasi kuliner Jepang yang memukau dengan kombinasi cita rasa autentik dan suasana yang modern. Terletak di kota Malang, restoran ini mengajak para pecinta kuliner untuk merasakan kelezatan masakan Jepang yang kreatif dan penuh inovasi. Menu di Skipjack Resto Malang mencakup beragam hidangan Jepang yang lezat dan memikat selera. Mulai dari sushi dan sashimi yang segar hingga ramen yang gurih, setiap hidangan disiapkan dengan keahlian oleh koki berbakat. Mungkin juga menyajikan hidangan khas seperti teriyaki, tempura, atau donburi dengan sentuhan modern yang inovatif.',
  ),
  Japanese(
    name: 'Iki Japanese Teriyaki House',
    address:
        'Jl. Pahlawan Trip No.8 - 9, Oro-oro Dowo, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Japanese/iki_japanese.jpg',
    rating: '4.1',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        'Iki Japanese Teriyaki House di Malang adalah persembahan eksklusif cita rasa Jepang yang dipersembahkan dengan sentuhan modern dan inovatif. Terletak di pusat kota, restoran ini menjadi oase bagi para pecinta kuliner Jepang yang menghargai keaslian rasa dalam suasana yang nyaman dan mewah. Dengan desain interior yang elegan dan minimalis, Iki Japanese Teriyaki House menciptakan atmosfer yang penuh keanggunan. Nuansa kayu alami dan elemen desain Jepang yang halus menciptakan suasana yang tenang dan menawan, menciptakan lingkungan yang sempurna untuk pengalaman bersantap yang eksklusif.',
  ),
  Japanese(
    name: 'LaBaDa Ramen Cafe',
    address: 'Jl. Terusan Sulfat No.70, Pandanwangi, Blimbing, Kota Malng',
    imageAsset: 'assets/images/Japanese/labada.jpg',
    rating: '4.5',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        'LaBaDa Ramen Cafe berlokasikan di Jl. Terusan Sulfat No.70 Malang East Java. Rata-rata biaya yang diperlukan berkisaran Rp 100.000 / Orang, jam buka pada 16.00 - 22.0 dan merupakan Sushi di area Malang. Restoran ini memang adalah destinasi wisata kuliner di area Malang. Di sini tersedia berbagai makanan enak and memang layak dikunjungi.',
  ),
  Japanese(
    name: 'Rumah Jagal Bapa',
    address: 'Jalan Esberg V-1 No.5, Karangbesuki, Kec. Sukun, Kota Malang',
    imageAsset: 'assets/images/Japanese/rumah_jagal.jpg',
    rating: '4.7',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        'Rumah Jagal Bapa menyediakan berbagai olahan daging asap beku sebagai lauk pauk, yang tentunya bebas dari pengawet dan hanya menggunakan bahan natural. Produk kami dikemas dalam kemasan vacuum pack, sehingga membuat produk kami tahan selama ± 2 hari (Suhu ruangan) hingga ± 6 bulan jika disimpan di freezer. Produk kami pun cocok untuk diberikan sebagai oleh-oleh karena dapat bertahan dalam pengiriman ke luar kota maupun ke luar pulau.',
  ),
  Japanese(
    name: 'Yagami Ramen House',
    address: 'Jl. Panderman No.03, Gading Kasri, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Japanese/yagami.jpg',
    rating: '4.8',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        'Di tengah dinginnya hawa Malang, menyantap ramen hangat adalah ide bagus. Tak perlu bingung soal tempat, lantaran Kota Bunga punya banyak resto ramen nikmat yang layak dicoba. Salah satunya adalah Yagami Ramen House, tak hanya nikmat namun juga murah. Sesuai namanya, ramen merupakan menu kebanggaan di restoran ini. Menariknya, kuah di sini dibagi menjadi dua kategori, sayur dan kaldu ayam. Teman Traveler bisa pilih sesuai selera.',
  ),
  Japanese(
    name: 'Ichiban Sushi',
    address:
        'Malang town square, Jl. Veteran No.2, Penanggungan, Klojen, Kota Malang',
    imageAsset: 'assets/images/Japanese/ichiban.jpg',
    rating: '4.2',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        'Ichiban Sushi adalah jaringan restoran sushi lokal yang berdiri pada tahun 1995 dan sekarang telah memiliki lebih dari 100 gerai di berbagai daerah, dan akan terus bertambah. Kami dikenal akan pilihan menu sushi, ramen dan makanan Jepang lainnya, dibuat dari bahan-bahan berkualitas dan segar untuk menghadirkan kelezatan dan kebahagiaan di setiap gigitannya. Dengan telah mengantongi sertifikat halal grade A, Ichiban Sushi semakin memantapkan diri sebagai restoran Jepang yang menjamin kehalalan di setiap sajiannya.',
  ),
  Japanese(
    name: 'Kedaishi',
    address: 'Jl. Pulosari, Gading Kasri, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Japanese/kedaishi.jpg',
    rating: '4.4',
    waktu: 'Everyday',
    hari: '08.00 - 24.00',
    description:
        'Berdiri semenjak 2015, Kedaishi tak pernah sepi pengunjung sampai hari ini. Salah satu alasan kenapa kedai ini banyak diminati karena cita rasanya yang lezat untuk lidah masyarakat lokal, melainkan konsisten tidak meninggalkan cita rasa Jepangnya. Mereka mengaplikasikan bahan-bahan yang diimpor seketika dari Jepang agar rasa yang disajikan tetap membuat penikmatnya serasa berada di Negeri Sakura langsung, kemudian mengolahnya agar layak dengan selera Indonesia.',
  ),
];
