import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/my_comments_controller.dart';

class MyCommentsPage extends GetView<MyCommentsController> {
  const MyCommentsPage({super.key});
  static const route = '/myComments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Comments'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final comments = snapshot.data!.docs;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return ListTile(
                title: Text(comment['content'].toString()),
                subtitle: Text('${DateFormat("yyyy년 MM월 dd일 hh시 mm분").format(DateTime.fromMillisecondsSinceEpoch(comment['sendDate'] as int))}'),
                leading: CircleAvatar(backgroundImage: NetworkImage(controller.user.photoURL.toString())),
                trailing: TextButton(
                  onPressed: () {
                    controller.showDialog(context, comment.id);
                  },
                  child: Text("삭제"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}