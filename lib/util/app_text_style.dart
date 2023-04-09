import 'package:flutter/widgets.dart';
import 'package:sfac_project/util/app_color.dart';
//자간: letterSpacing

//영문 제목서체 Monserrat
//한글제목,본문, 영어본문 서체 pretendard

class AppTextStyle {
  //헤더영문 몬세라트 볼드폰트 36사이즈
  static const hEngMontBold36 = TextStyle(
    fontFamily: 'MontserratBold',
    fontSize: 36,
  );

  //헤더영문 몬세라트 볼드폰트 30사이즈
  static const hEngMontBold30 = TextStyle(
    fontFamily: 'MontserratBold',
    fontSize: 30,
  );

  //헤더영문 몬세라트 볼드폰트 24사이즈
  static const hEngMontBold24 = TextStyle(
    fontFamily: 'MontserratBold',
    fontSize: 24,
  );

  //헤더영문 몬세라트 세미볼드폰트 28사이즈
  static const hEngMontSemiBold28 = TextStyle(
    fontFamily: 'MontserratBold',
    fontSize: 28,
  );

  //헤더영문 몬세라트 세미볼드폰트 24사이즈
  static const hEngMontSemiBold24 = TextStyle(
    fontFamily: 'MontserratBold',
    fontSize: 24,
  );

  //헤더영문 몬세라트 세미볼드폰트 20사이즈
  static const hEngMontSemiBold20 = TextStyle(
    fontFamily: 'MontserratBold',
    fontSize: 20,
  );

  //본문(body) 영문 프리텐다드 레귤러폰트 20사이즈 -2자간
  static const bEngPretendard20 = TextStyle(
      letterSpacing: -2, fontFamily: 'PretendardRegular', fontSize: 20);

  //본문(body) 영문 프리텐다드 레귤러폰트 18사이즈 -2자간
  static const bEngPretendard18 = TextStyle(
      letterSpacing: -2, fontFamily: 'PretendardRegular', fontSize: 18);

  //본문(body) 영문 프리텐다드 레귤러폰트 16사이즈 -2자간
  static const bEngPretendard16 = TextStyle(
      letterSpacing: -2, fontFamily: 'PretendardRegular', fontSize: 16);

  //본문(body) 영문 프리텐다드 레귤러폰트 14사이즈 -2자간
  static const bEngPretendard14 = TextStyle(
      letterSpacing: -2, fontFamily: 'PretendardRegular', fontSize: 14);

  //헤더 한글 프리텐다드 볼드폰트 26사이즈
  static const hKorPreBold36 =
      TextStyle(fontFamily: 'PretendardBold', fontSize: 36);

  //헤더 한글 프리텐다드 볼드폰트 30사이즈
  static const hKorPreBold30 =
      TextStyle(fontFamily: 'PretendardBold', fontSize: 30);

  //헤더 한글 프리텐다드 볼드폰트 24사이즈
  static const hKorPreBold24 =
      TextStyle(fontFamily: 'PretendardBold', fontSize: 24);

  //헤더 한글 프리텐다드 세미볼드폰트 36사이즈
  static const hKorPreSemiBold36 =
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 36);

  //헤더 한글 프리텐다드 세미볼드폰트 28사이즈
  static const hKorPreSemiBold28 =
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 28);

  //헤더 한글 프리텐다드 세미볼드폰트 24사이즈
  static const hKorPreSemiBold24 =
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 24);

  //헤더 한글 프리텐다드 세미볼드폰트 20사이즈
  static const hKorPreSemiBold20 =
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 20);

  //헤더 한글 프리텐다드 세미볼드폰트 18사이즈 (사용함)
  static TextStyle hKorPreSemiBold18({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 18, color: color);

  //헤더 한글 프리텐다드 세미볼드폰트 16사이즈 (사용함)
  static TextStyle hKorPreSemiBold16({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 16, color: color);

  //본문(body) 한글 프리텐다드 레귤러폰트 20사이즈
  static const bKorPreRegular20 =
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 20);
  //본문(body) 한글 프리텐다드 레귤러폰트 18사이즈
  static const bKorPreRegular18 =
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 18);

  //본문(body) 한글 프리텐다드 레귤러폰트 16사이즈
  static const bKorPreRegular16 =
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 16);

  //본문(body) 한글 프리텐다드 레귤러폰트 14사이즈 (사용함)
  static TextStyle bKorPreRegular14({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 14, color: color);
}
