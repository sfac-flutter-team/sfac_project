import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/comments_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class CommentsSend extends GetView<CommentsController> {
  const CommentsSend({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.textEditingController,
                focusNode: FocusNode(),
                cursorColor: AppColor.subGrey,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                minLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '댓글을 작성해 주세요',
                  hintStyle: AppTextStyle.hKorPreSemiBold16(
                    color: AppColor.subGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: controller.onPressedSendButton,
              color: AppColor.mainBlue,
              icon: const Icon(Icons.send),
            )
          ],
        ),
      ),
    );
  }
}
