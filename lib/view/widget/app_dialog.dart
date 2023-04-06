// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return 
      CupertinoAlertDialog(
        title:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(content, style: const TextStyle(fontWeight: FontWeight.w200)),
        ),
        actions: [
          CupertinoDialogAction(
          onPressed: (){Get.back();},
          child: const Text('닫기', style: TextStyle(color: AppColor.black, fontWeight: FontWeight.w500))),
           CupertinoDialogAction(
          onPressed: (){},
          child: const Text('확인', style: TextStyle(color:AppColor.mainDarkBlue, fontWeight: FontWeight.w500),)),
      
        ],);
      
    
  }
}
