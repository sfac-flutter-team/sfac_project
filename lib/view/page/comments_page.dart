import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/view/widget/comments_send.dart';

import '../../controller/comments_controller.dart';
import '../../model/message.dart';
import '../../model/team.dart';

class CommentsPage extends GetView<CommentsController> {
  const CommentsPage({super.key});
  static const route = '/comment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: SafeArea(child: SingleChildScrollView(
          child: Obx(() {
            if (controller.teamInfo.value?.data().name == null) {
              return Text("내 정보 페이지에서 팀을 선택해주세요");
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(controller.teamInfo.value!.data().name),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(controller.teamInfo.value!.data().logo),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  StreamBuilder<List<Message>>(
                    stream: controller.streamMessages(),
                    builder: (context, asyncSnapshot) {
                      if (!asyncSnapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (asyncSnapshot.hasError) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<Message> messages = asyncSnapshot.data!;
                        return Container(
                          height: 500,
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  reverse: true,
                                  shrinkWrap: true,
                                  itemCount: messages.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(messages[index].content),
                                      leading: CircleAvatar(
                                        backgroundImage: messages[index].myInfo.photoUrl != null ?
                                        NetworkImage(controller.myInfo.photoUrl.toString()):null
                                      ),
                                      subtitle: Text(
                                          '${messages[index].myInfo.name}  ${DateFormat("yyyy년 MM월 dd일 hh시 mm분").format(messages[index].sendDate)}'),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  CommentsSend()
                ],
              );
            }
          }),
        )));
  }
}
