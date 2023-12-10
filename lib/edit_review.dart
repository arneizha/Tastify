import 'package:flutter/material.dart';
import 'package:flutter_application/firestore_service.dart';

class EditReviewScreen extends StatefulWidget {
  final String documentId;

  EditReviewScreen({required this.documentId});

  @override
  _EditReviewScreen createState() => _EditReviewScreen();
}

class _EditReviewScreen extends State<EditReviewScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadReviewData();
  }

  void _loadReviewData() async {
    Map<String, dynamic>? reviewData =
        await FirestoreService().getReviewById(widget.documentId);

    if (reviewData != null) {
      setState(() {
        _descriptionController.text = reviewData['description'] ?? '';
        _nameController.text = reviewData['name'] ?? '';
      });
    }
  }

  void _updateReview() async {
    await FirestoreService().updatereview(
      widget.documentId,
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
        title: Text("Edit Comment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Comment'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _updateReview,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF435334),
                ),
              ),
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
