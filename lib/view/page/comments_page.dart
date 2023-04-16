import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/comments_controller.dart';
import 'package:sfac_project/model/message.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_progress_indicator.dart';
import 'package:sfac_project/view/widget/comment_card.dart';
import 'package:sfac_project/view/widget/comments_send.dart';

class CommentsPage extends GetView<CommentsController> {
  const CommentsPage({super.key});
  static const route = '/comment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => Get.back(),
        ),
        title: Text(
          style: AppTextStyle.hKorPreSemiBold20(color: AppColor.white),
          '응원하기',
        ),
      ),
      body: SingleChildScrollView(
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
                    StreamBuilder<List<Message>>(
                      stream: controller.streamMessages(),
                      builder: (context, asyncSnapshot) {
                        if (!asyncSnapshot.hasData) {
                          return const Center(
                            child: AppProgressIndicator(),
                          );
                        } else {
                          List<Message> messages = asyncSnapshot.data!;
                          return Expanded(
                            child: ListView.builder(
                              primary: false,
                              reverse: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 25),
                                  child: CommentCard(message: messages[index]),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                    const CommentsSend(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
