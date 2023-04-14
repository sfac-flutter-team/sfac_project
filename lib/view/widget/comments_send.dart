import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/comments_controller.dart';

class CommentsSend extends GetView<CommentsController> {
  const CommentsSend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: controller.textEditingController,
                focusNode: controller.focusNode,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 15),
                  labelText: "내용을 입력하세요..",
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            RawMaterialButton(
              onPressed: controller.onPressedSendButton,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }
}