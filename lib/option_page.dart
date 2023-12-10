import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/add_review.dart';
import 'package:flutter_application/edit_review.dart';
import 'package:flutter_application/firestore_service.dart';

class DialogUtils {
  void _handleAddAction(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddReviewScreen()),
    );
  }

  void _handleEditAction(
      BuildContext context, DocumentSnapshot documentSnapshot) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditReviewScreen(documentId: documentSnapshot.id),
      ),
    );
  }

  void _handleDeleteAction(DocumentSnapshot documentSnapshot) async {
    await FirestoreService().deletereview(
      documentSnapshot.id,
    );
  }

  static void showOptionsDialog(
      BuildContext context, int index, DocumentSnapshot documentSnapshot) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  DialogUtils()._handleAddAction(context);
                },
                child: Text('Add Comment'),
              ),
              TextButton(
                onPressed: () {
                  DialogUtils()._handleEditAction(context, documentSnapshot);
                },
                child: Text('Edit Comment'),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Konfirmasi'),
                        content: Text('Anda yakin ingin menghapus?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              DialogUtils()
                                  ._handleDeleteAction(documentSnapshot);
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Delete Comment'),
              ),
            ],
          ),
        );
      },
    );
  }
}
