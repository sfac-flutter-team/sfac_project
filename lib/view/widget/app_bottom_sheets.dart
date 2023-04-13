import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sfac_project/util/app_color.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({super.key, required this.listTile, this.teamImg});
  final String listTile;
  final String? teamImg;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: TextButton(onPressed: (){}, child: Text(listTile))
            ),
          ),
        ],
      );
      
    
  }
}
