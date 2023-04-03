import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});
  final title = SheetTitle();

  @override
  State<BottomSheet> createState() => _BottomSheetState();
  
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        Get.bottomSheet(Container(
        height: 200,
        color: Colors.white,
        child: ListTile(
          title: ,
          leading: ,
        )
        
      )),
      )
    );
  }
}