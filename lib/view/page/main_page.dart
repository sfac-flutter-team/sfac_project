import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('메인페이지')),
    );
  }
}
