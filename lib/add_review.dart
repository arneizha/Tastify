import 'package:flutter/material.dart';
import 'package:flutter_application/firestore_service.dart';

class AddReviewScreen extends StatefulWidget {
  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void _addReview() async {
    await FirestoreService().addreview(
      _descriptionController.text,
      _nameController.text,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEDEBD),
      appBar: AppBar(
        backgroundColor: Color(0xFF435334),
        title: const Text(
          'Add Comment',
          style: TextStyle(
            color: Color(0xFFFAF1E4),
            fontSize: 25.0,
          ),
        ),
        toolbarHeight: 70.0,
        elevation: 15,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Comment'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _addReview,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF435334),
                ),
              ),
              child: Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}
