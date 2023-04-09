import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/lineup_controller.dart';

class LineupPage extends GetView<LineupController> {
  const LineupPage({super.key});
  static const route = '/lineup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('라인업'),
      ),
      body: Obx(() => Text(controller.tempStr.value)),
    );
  }
}
