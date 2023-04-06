import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppSnackBar extends StatelessWidget {
  const AppSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text('댓글 삭제가 완료되었습니다'));
  }
}