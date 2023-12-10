import 'package:flutter/material.dart';
import 'package:flutter_application/login.dart';

class BoardingPage extends StatelessWidget {
  final List<BoardingItem> boardingItems = [
    BoardingItem(
      icon: Icons.store,
      title: 'Selamat Datang!',
      description: 'Temukan dan ulas restoran terbaik di sekitarmu',
    ),
    BoardingItem(
      icon: Icons.book,
      title: 'Jelajahi Menu',
      description: 'Lihat menu, ulasan, dan informasi lengkap tentang restoran',
    ),
    BoardingItem(
      icon: Icons.rate_review,
      title: 'Beri Ulasan',
      description: 'Bagikan pengalaman makanmu dengan memberikan ulasan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF435334),
      body: PageView.builder(
        itemCount: boardingItems.length,
        itemBuilder: (context, index) {
          return BoardingItemWidget(
            item: boardingItems[index],
            onComplete: () {
              if (index == boardingItems.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class BoardingItem {
  final IconData icon;
  final String title;
  final String description;

  BoardingItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class BoardingItemWidget extends StatelessWidget {
  final BoardingItem item;
  final VoidCallback onComplete;

  BoardingItemWidget({
    required this.item,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onComplete,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.icon,
              size: 100,
              color: Color(0xFFFAF1E4),
            ),
            SizedBox(height: 20),
            Text(
              item.title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFAF1E4)),
            ),
            SizedBox(height: 10),
            Text(
              item.description,
              style: TextStyle(fontSize: 20, color: Color(0xFFFAF1E4)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
