import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.teamInfo.value!.data().name),
              Text(controller.myInfo.name),
              StreamBuilder<List<Message>>(
                stream: controller.streamMessages(),
                builder: (context, asyncSnapshot) {
                  if(!asyncSnapshot.hasData){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(asyncSnapshot.hasError){
                    return Center(child: CircularProgressIndicator(),);
                  }else{
                    List<Message> messages = asyncSnapshot.data!;
                    return Container(
                      height: 500,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return ListTile(title: Text(messages[index].content),
                              subtitle: Text(messages[index].sendDate.toString()));
                            },
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
               controller.getInputWidget()
            ],
          ),
        )
        )
    );
  }
}