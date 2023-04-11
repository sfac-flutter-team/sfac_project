import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/comments_controller.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.teamInfo.value!.data().name)
          ],
        )
        )
    );
  }

  //  Stream<List<MessageModel>> streamMessages(){
  //   try{
  //     final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance.collection('chatrooms/YLCoRBj59XRsDdav2YV1/messages').snapshots();
  //     return snapshots.map((querySnapshot){
  //       List<MessageModel> messages = [];
  //       querySnapshot.docs.forEach((element) { 
  //          messages.add(
  //             MessageModel.fromMap(
  //                 id:element.id,
  //                 map:element.data() as Map<String, dynamic>
  //             )
  //          );
  //       });
  //       return messages; 
  //     }); 
  //   }catch(ex){
  //     log('error)',error: ex.toString(),stackTrace: StackTrace.current);
  //     return Stream.error(ex.toString());
  //   }
  // }
}