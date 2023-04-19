import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/model/message.dart';
import 'package:sfac_project/model/myInfo.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_progress_indicator.dart';
import 'package:sfac_project/view/widget/comment_card.dart';

import '../../controller/my_comments_controller.dart';

class MyCommentsPage extends GetView<MyCommentsController> {
  const MyCommentsPage({super.key});
  static const route = '/myComments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: controller.teamInfo.value != null
            ? AppColor.white
            : AppColor.mainBlue,
        centerTitle: controller.teamInfo.value != null ? true : false,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => Get.back(),
        ),
        title: controller.teamInfo.value != null
            ? Text(
                style: AppTextStyle.hKorPreSemiBold20(color: AppColor.white),
                '내 댓글',
              )
            : Image.asset(
                width: 46,
                'assets/images/app_logo.png',
              ),
      ),
      body: controller.teamInfo.value != null
          ? SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                      gradient: AppColor.lineargradient,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.network(
                        height: MediaQuery.of(context).size.height / 9,
                        controller.teamInfo.value!.data().logo,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.height / 4) * 3,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: controller.getData(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: AppProgressIndicator());
                              } else {
                                final comments = snapshot.data!.docs;
                                return Expanded(
                                  child: ListView.builder(
                                    primary: false,
                                    physics: const BouncingScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: comments.length,
                                    itemBuilder: (context, index) {
                                      final comment = comments[index];
                                      var data = Message(
                                          content: comment['content'],
                                          sendDate: DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  comment['sendDate'] as int),
                                          myInfo: MyInfo(
                                              name:
                                                  controller.user.displayName!,
                                              photoUrl:
                                                  controller.user.photoURL));
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 25),
                                        child: CommentCard(
                                          message: data,
                                          commentType: CommentType.myComment,
                                          onDeleted: () => controller
                                              .showDialog(context, comment.id),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                textAlign: TextAlign.center,
                style: AppTextStyle.bKorPreRegular20(color: AppColor.mainBlue),
                'MY 페이지에서\n응원하는 팀을 선택해 주세요',
              ),
            ),
    );
  }
}
