import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/model/message.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundColor: AppColor.subLightGrey,
                    backgroundImage: message.myInfo.photoUrl != null
                        ? NetworkImage(message.myInfo.photoUrl.toString())
                        : null),
                const SizedBox(width: 10),
                Text(
                  style: AppTextStyle.hKorPreSemiBold16(),
                  message.myInfo.name,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 27),
              child: Text(
                style: AppTextStyle.bKorPreRegular16,
                message.content,
              ),
            ),
            const Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  style: AppTextStyle.bKorPreRegular12(color: AppColor.subGrey),
                  DateFormat("yyyy.MM.dd hh시 mm분").format(message.sendDate),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
