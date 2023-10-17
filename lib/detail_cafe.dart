import 'package:flutter/material.dart';
import 'package:flutter_application/main_screen.dart';
import 'package:flutter_application/review_cafe.dart';

class detail_cafe extends StatelessWidget {
  const detail_cafe({super.key, required Kategori kategori});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 196, 0),
        title: const Text(
          'Cafe',
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
              itemCount: ListCafe.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => review_cafe(
                          cafe: ListCafe[index],
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
                          ListCafe[index].imageAsset,
                          width: 150,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ListCafe[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ListCafe[index].address,
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

class Cafe {
  String name;
  String address;
  String imageAsset;
  String rating;
  String hari;
  String waktu;
  String description;

  Cafe({
    required this.name,
    required this.address,
    required this.imageAsset,
    required this.rating,
    required this.hari,
    required this.waktu,
    required this.description,
  });
}

var ListCafe = [
  Cafe(
    name: 'Java Dancer Coffe Roaster',
    address: 'Jl. Jakarta No.59, Oro-oro Dowo, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Cafe/java_dancer.jpg',
    rating: '4.9',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        'Java Dancer adalah depot kopi lokal yang pertama kali dibuka di Malang, Jawa Timur, pada bulan Desember 2008. Lahir dari semangat murni dan rasa cinta akan kopi yang tinggi dari para pendirinya, Java Dancer menyajikan kopi Arabica yang diambil dari berbagai daerah penghasil kopi terbaik di Indonesia.',
  ),
  Cafe(
    name: 'Handall Coffee',
    address: 'Jl. Semanggi Timur No.7, Jatimulyo, Kec. Lowokwaru, Kota Malang',
    imageAsset: 'assets/images/Cafe/handall.jpg',
    rating: '4.8',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        'Handall Coffee merupakan cafe yang ada di Malang dengan membawa konsep tempat yang modern dan juga minimalist. Cafe Handall Malang berlokasi di Jatimulyo, Lowokwaru. Tempat ini sangat cocok untuk Anda yang ingin mengerjakan tugas, mengadakan event, atau tempat nongkrong bersama teman. Di sini menyediakan berbagai menu spesial mulai dari western food hingga Indonesian food yang tentunya enak.',
  ),
  Cafe(
    name: '8 Oz Coffe Studio',
    address: 'Jl. Citandui No.74, Purwantoro, Kec. Blimbing, Kota Malang',
    imageAsset: 'assets/images/Cafe/8_oz.jpg',
    rating: '3.8',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        '8 Oz Coffee Studio merupakan tempat yang dihormati bagi para pecinta kopi dan pencari kenikmatan kuliner. Terletak di jantung kota Malang, mereka menawarkan pengalaman kopi yang unik, menggabungkan seni dan ilmu kopi untuk menciptakan suasana yang istimewa.',
  ),
  Cafe(
    name: 'Vosco Coffee',
    address: 'Jl. Borobudur No.27A, Mojolangu, Kec. Lowokwaru, Kota Malang',
    imageAsset: 'assets/images/Cafe/vosco.jpg',
    rating: '4.5',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        ' Vosco Coffee merupakan tempat di mana aroma kopi yang menggoda dan rasa yang kaya bergabung untuk menciptakan pengalaman kopi yang tak terlupakan. Sebagai pionir dalam seni meracik kopi, Vosco Coffee mempersembahkan keharmonisan antara biji kopi pilihan dan keterampilan barista yang handal.',
  ),
  Cafe(
    name: 'Bataputi Coffe House',
    address: 'Jl. Araya Megah No.9, Pandanwangi, Kec. Blimbing, Kota Malang',
    imageAsset: 'assets/images/Cafe/bataputi.jpg',
    rating: '4.2',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        'Perpaduan sempurna antara pemandangan hijau di dataran tinggi yang indah serta berbagai menu masakan dan minuman dari harga yang murah hingga mahal semua bisa ditemukan di kafe romantis Malang ini yaitu Bataputi Coffee House Malang. Tak hanya itu saja, terdapat juga berbagai spot foto instagenic sehingga cocok bagi teman-teman yang hobi berburu spot foto kece.',
  ),
  Cafe(
    name: 'Golden Heritage Koffie',
    address: 'Jl. Raya Tidar No.36, Karangbesuki, Kec. Sukun, Kota Malang',
    imageAsset: 'assets/images/Cafe/golden.jpg',
    rating: '4.6',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        'Ngopi dengan situasi tempo pernah di Kota Malang rasanya sungguh mengasyikkan. Kamu mampu merasakan perihal itu jikalau singgah ke Golden Heritage Koffie. Kafe yang udah beroperasi sejak tahun 2011 ini mengusung desain interior yang benar-benar Instagramable. Nongkrong di sini, anda dapat mendapatkan banyak inspirasi untuk berfoto pakai seluruh spot yang disediakan.',
  ),
  Cafe(
    name: 'Malbourne Coffee Co',
    address: 'Jl. Candi Panggung No.2C, Mojolangu, Kec. Lowokwaru, Kota Malang',
    imageAsset: 'assets/images/Cafe/malbourne.jpg',
    rating: '4.2',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        'Malbourne Coffee Co menyediakan kopi seduh manual dengan biji kopi yang berganti-ganti, kopi berbasis espreso, dan non-kopi. Cappucino dan Coffee Creme Brulee adalah dua kopi yang patut dijajal di Malbourne Coffee Co. Harganya sekitar Rp 25.000. Menu sarapan yang dapat kamu pesan adalah pancake dan roti panggang. Kalau memilih makanan berat bisa memesan OG Cheese Burger atau Butter Milk Rice Chicken. Harga makanan di Malbourbe mulai dari Rp 20.000-an.',
  ),
  Cafe(
    name: 'Mmmm Coffee',
    address:
        'Jl. Jenderal Basuki Rahmat No.17, Kauman, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Cafe/mmmm.jpg',
    rating: '4.1',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        'Kedai kopi yang berlokasi di Jl. Jenderal Basuki Rahmat, No.17, Kauman, Kecamatan Klojen, Kota Malang ini menawarkan sensasi nongkrong dengan situasi minimalis tetapi modern. Jadi, sensasi ngopi di tengah kota masih bisa anda dapatkan di sini.',
  ),
  Cafe(
    name: 'Ladang Coffee',
    address: 'Jl. Guntur No.31, Oro-oro Dowo, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Cafe/ladang.jpg',
    rating: '4.4',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        'Salah satu keunggulan Ladang Coffee dibanding tempat ngopi yang lain adalah lokasi. Dengan lokasi yang tidak pas di tepi jalan utama, tepatnya di Jalan Guntur No 31, Oro-oro Dowo, Klojen, Malang, kafe ini cenderung sepi. Tidak cuma sepi dari lalu lalang kendaraan bermotor, tetapi juga relatif sepi pengunjung. ',
  ),
  Cafe(
    name: 'Coffee & Chef',
    address: 'Jl. Bromo No.16c, Kauman, Kec. Klojen, Kota Malang',
    imageAsset: 'assets/images/Cafe/coffee.jpg',
    rating: '4.7',
    hari: 'Everyday',
    waktu: '09.00 - 23.00',
    description:
        'Di jantung Malang, tersembunyi di antara gemerlapnya kota, terdapat tempat yang menggabungkan seni kopi yang memukau dengan cita rasa kuliner yang luar biasa — selamat datang di Coffee & Chef. Tempat ini bukan sekadar kafe; ini adalah perpaduan harmonis antara kehangatan tempat berkumpul dan kelezatan yang memanjakan lidah.',
  ),
];
