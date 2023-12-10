import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference restaurant =
      FirebaseFirestore.instance.collection('restaurant');
  final CollectionReference cafe =
      FirebaseFirestore.instance.collection('cafe');
  final CollectionReference chinese =
      FirebaseFirestore.instance.collection('chinese');
  final CollectionReference european =
      FirebaseFirestore.instance.collection('european');
  final CollectionReference indonesian =
      FirebaseFirestore.instance.collection('indonesian');
  final CollectionReference japanese =
      FirebaseFirestore.instance.collection('japanese');
  final CollectionReference menu_cafe =
      FirebaseFirestore.instance.collection('menu_cafe');
  final CollectionReference menu_chinese =
      FirebaseFirestore.instance.collection('menu_chinese');
  final CollectionReference menu_european =
      FirebaseFirestore.instance.collection('menu_european');
  final CollectionReference menu_indonesian =
      FirebaseFirestore.instance.collection('menu_indonesian');
  final CollectionReference menu_japanese =
      FirebaseFirestore.instance.collection('menu_japanese');
  final CollectionReference review =
      FirebaseFirestore.instance.collection('review');
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  //restaurant
  Stream<QuerySnapshot> getrestaurant() {
    final restaurantStream = restaurant.snapshots();
    return restaurantStream;
  }

  Future<void> addrestaurant(String image, String name) async {
    restaurant.add({'image': image, 'name': name});
  }

  Future<void> updaterestaurant(String id, String image, String name) async {
    restaurant.doc(id).update({'image': image, 'name': name});
  }

  Future<void> deleterestaurant(String id) async {
    restaurant.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getRestaurantById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await restaurant.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting restaurant by ID: $e");
    }
    return null;
  }

  //cafe
  Stream<QuerySnapshot> getcafe() {
    final cafeStream = cafe.snapshots();
    return cafeStream;
  }

  Future<void> addcafe(String address, String description, String hari,
      String image, String name, String rating, String waktu) async {
    cafe.add({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> updatecafe(
      String id,
      String address,
      String description,
      String hari,
      String image,
      String name,
      String rating,
      String waktu) async {
    cafe.doc(id).update({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> deletecafe(String id) async {
    cafe.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getCafeById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await cafe.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting cafe by ID: $e");
    }
    return null;
  }

  //chinese
  Stream<QuerySnapshot> getchinese() {
    final chineseStream = chinese.snapshots();
    return chineseStream;
  }

  Future<void> addchinese(String address, String description, String hari,
      String image, String name, String rating, String waktu) async {
    chinese.add({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> updatechinese(
      String id,
      String address,
      String description,
      String hari,
      String image,
      String name,
      String rating,
      String waktu) async {
    chinese.doc(id).update({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> deletechinese(String id) async {
    chinese.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getChineseById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await chinese.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting chinese by ID: $e");
    }
    return null;
  }

  //european
  Stream<QuerySnapshot> geteuropean() {
    final europeanStream = european.snapshots();
    return europeanStream;
  }

  Future<void> addeuropean(String address, String description, String hari,
      String image, String name, String rating, String waktu) async {
    european.add({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> updateeuropean(
      String id,
      String address,
      String description,
      String hari,
      String image,
      String name,
      String rating,
      String waktu) async {
    european.doc(id).update({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> deleteeuropean(String id) async {
    european.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getEuropeanById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await european.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting european by ID: $e");
    }
    return null;
  }

  //indonesian
  Stream<QuerySnapshot> getindonesian() {
    final indonesianStream = indonesian.snapshots();
    return indonesianStream;
  }

  Future<void> addindonesian(String address, String description, String hari,
      String image, String name, String rating, String waktu) async {
    indonesian.add({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> updateindonesian(
      String id,
      String address,
      String description,
      String hari,
      String image,
      String name,
      String rating,
      String waktu) async {
    indonesian.doc(id).update({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> deleteindonesian(String id) async {
    indonesian.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getIndonesianById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await indonesian.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting indonesian by ID: $e");
    }
    return null;
  }

  //japanese
  Stream<QuerySnapshot> getjapanese() {
    final japaneseStream = japanese.snapshots();
    return japaneseStream;
  }

  Future<void> addjapanese(String address, String description, String hari,
      String image, String name, String rating, String waktu) async {
    japanese.add({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> updatejapanese(
      String id,
      String address,
      String description,
      String hari,
      String image,
      String name,
      String rating,
      String waktu) async {
    japanese.doc(id).update({
      'address': address,
      'description': description,
      'hari': hari,
      'image': image,
      'name': name,
      'rating': rating,
      'waktu': waktu
    });
  }

  Future<void> deletejapanese(String id) async {
    japanese.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getJapaneseById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await japanese.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting japanese by ID: $e");
    }
    return null;
  }

  //menu_cafe
  Stream<QuerySnapshot> getmenu_cafe() {
    final menu_cafeStream = menu_cafe.snapshots();
    return menu_cafeStream;
  }

  Future<void> addmenu_cafe(String image) async {
    menu_cafe.add({'image': image});
  }

  Future<void> updatemenu_cafe(String id, String image) async {
    menu_cafe.doc(id).update({'image': image});
  }

  Future<void> deletemenu_cafe(String id) async {
    menu_cafe.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getMenu_cafeById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await menu_cafe.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting menu_cafe by ID: $e");
    }
    return null;
  }

  //menu_chinese
  Stream<QuerySnapshot> getmenu_chinese() {
    final menu_chineseStream = menu_chinese.snapshots();
    return menu_chineseStream;
  }

  Future<void> addmenu_chinese(String image) async {
    menu_chinese.add({'image': image});
  }

  Future<void> updatemenu_chinese(String id, String image) async {
    menu_chinese.doc(id).update({'image': image});
  }

  Future<void> deletemenu_chinese(String id) async {
    menu_chinese.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getMenu_chineseById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await menu_chinese.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting menu_chinese by ID: $e");
    }
    return null;
  }

  //menu_european
  Stream<QuerySnapshot> getmenu_european() {
    final menu_europeanStream = menu_european.snapshots();
    return menu_europeanStream;
  }

  Future<void> addmenu_european(String image) async {
    menu_european.add({'image': image});
  }

  Future<void> updatemenu_european(String id, String image) async {
    menu_european.doc(id).update({'image': image});
  }

  Future<void> deletemenu_european(String id) async {
    menu_european.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getMenu_europeanById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await menu_european.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting menu_european by ID: $e");
    }
    return null;
  }

  //menu_indonesian
  Stream<QuerySnapshot> getmenu_indonesian() {
    final menu_indonesianStream = menu_indonesian.snapshots();
    return menu_indonesianStream;
  }

  Future<void> addmenu_indonesian(String image) async {
    menu_indonesian.add({'image': image});
  }

  Future<void> updatemenu_indonesian(String id, String image) async {
    menu_indonesian.doc(id).update({'image': image});
  }

  Future<void> deletemenu_indonesian(String id) async {
    menu_indonesian.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getMenu_indonesianById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await menu_indonesian.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting menu_indonesian by ID: $e");
    }
    return null;
  }

  //menu_japanese
  Stream<QuerySnapshot> getmenu_japanese() {
    final menu_japaneseStream = menu_japanese.snapshots();
    return menu_japaneseStream;
  }

  Future<void> addmenu_japanese(String image) async {
    menu_japanese.add({'image': image});
  }

  Future<void> updatemenu_japanese(String id, String image) async {
    menu_japanese.doc(id).update({'image': image});
  }

  Future<void> deletemenu_japanese(String id) async {
    menu_japanese.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getMenu_japaneseById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await menu_japanese.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting menu_japanese by ID: $e");
    }
    return null;
  }

  //review
  Stream<QuerySnapshot> getreview() {
    final reviewStream = review.snapshots();
    return reviewStream;
  }

  Future<void> addreview(String description, String name) async {
    review.add({'description': description, 'name': name});
  }

  Future<void> updatereview(String id, String description, String name) async {
    review.doc(id).update({'description': description, 'name': name});
  }

  Future<void> deletereview(String id) async {
    review.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getReviewById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await review.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting review by ID: $e");
    }
    return null;
  }

  //users
  Stream<QuerySnapshot> getusers() {
    final usersStream = users.snapshots();
    return usersStream;
  }

  Future<void> addusers(String email, String fullname, String username) async {
    users.add({'email': email, 'fullname': fullname, 'username': username});
  }

  Future<void> updateusers(
      String id, String email, String fullname, String username) async {
    users
        .doc(id)
        .update({'email': email, 'fullname': fullname, 'username': username});
  }

  Future<void> deleteusers(String id) async {
    users.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getUsersById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting users by ID: $e");
    }
    return null;
  }
}
