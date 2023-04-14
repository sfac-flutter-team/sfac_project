import 'package:flutter/widgets.dart';

class AppColor {
  //앱에 많이 쓰이는 color들
  static const Color black = Color(0xFF000000); //검은색
  static const Color white = Color(0xFFFFFFFF); //흰색
  static const Color darkWhite = Color(0xFFF8F8F8); //어두운 흰색
  static const Color mainBlue = Color(0xFF124DDD); //메인블루 (사용함)
  static const Color mainDarkBlue = Color(0xFF0030AC); //어두운블루
  static const Color subDarkGrey = Color(0xFF767676); //서브컬러 어두운회색
  static const Color subLightGrey = Color(0xFFB1B1B1); //서브컬러 밝은회색 (사용함)
  static const Color subGrey = Color(0xFFB4B4B4); //서브컬러 회색 (사용함)
  static const Color lightMint = Color(0xFFB1FFFA); //서브컬러 밝은민트색?
  static const Color deepMint = Color(0xFF9EFFC5); //서브컬러 민트색
  static const Color lightskyBlue = Color(0x180538FF); //밝은 하늘색(select할때 타일 컬러)

  static const Color tempGrey = Color(0xFFEEEEF2);

  //그라데이션 위에서 아래로
  static const LinearGradient lineargradient = LinearGradient(
      colors: [Color(0xFF0538FF), Color(0xFF0030AC)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}
