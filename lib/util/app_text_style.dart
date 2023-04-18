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

  //헤더영문 몬세라트 세미볼드폰트 14사이즈
  static TextStyle hEngMontSemiBold14({Color color = AppColor.black}) =>
      TextStyle(
          fontFamily: 'MontserratBold',
          fontSize: 14,
          letterSpacing: -2,
          color: color);

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

  //헤더 한글 프리텐다드 볼드폰트 43사이즈
  static const hKorPreBold43 =
      TextStyle(fontFamily: 'PretendardBold', fontSize: 43);

  //헤더 한글 프리텐다드 볼드폰트 36사이즈
  static TextStyle hKorPreBold36({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardBold', fontSize: 36, color: color);

  //헤더 한글 프리텐다드 볼드폰트 30사이즈
  static const hKorPreBold30 =
      TextStyle(fontFamily: 'PretendardBold', fontSize: 30);

  //헤더 한글 프리텐다드 볼드폰트 24사이즈
  static const hKorPreBold24 =
      TextStyle(fontFamily: 'PretendardBold', fontSize: 24);

  //헤더 한글 프리텐다드 세미볼드폰트 36사이즈
  static const hKorPreSemiBold36 =
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 36);

  //헤더 한글 프리텐다드 세미볼드폰트 28사이즈 (사용함)
  static TextStyle hKorPreSemiBold28({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 28, color: color);

  //헤더 한글 프리텐다드 세미볼드폰트 24사이즈
  static TextStyle hKorPreSemiBold24({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 24, color: color);

  //헤더 한글 프리텐다드 세미볼드폰트 20사이즈 (사용함)
  static TextStyle hKorPreSemiBold20({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 20, color: color);

  //헤더 한글 프리텐다드 세미볼드폰트 18사이즈 (사용함)
  static TextStyle hKorPreSemiBold18({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 18, color: color);

  //헤더 한글 프리텐다드 세미볼드폰트 16사이즈 (사용함)
  static TextStyle hKorPreSemiBold17({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 17, color: color);

  //헤더 한글 프리텐다드 세미볼드폰트 16사이즈 (사용함)
  static TextStyle hKorPreSemiBold16({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 16, color: color);

  //헤더 한글 프리텐다드 세미볼드폰트 15사이즈 (사용함)
  static TextStyle hKorPreSemiBold15({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 15, color: color);

  //헤더 한글 프리텐다드 세미볼드폰트 14사이즈 (사용함)
  static TextStyle hKorPreSemiBold14({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 14, color: color);

  //본문(body) 한글 프리텐다드 레귤러폰트 20사이즈
  static TextStyle bKorPreRegular20({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 20, color: color);
  //본문(body) 한글 프리텐다드 레귤러폰트 18사이즈
  static const bKorPreRegular18 =
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 18);

  //본문(body) 한글 프리텐다드 레귤러폰트 16사이즈
  static const bKorPreRegular16 =
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 16);

  //본문(body) 한글 프리텐다드 레귤러폰트 15사이즈
  static const bKorPreRegular15 =
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 15);

  //본문(body) 한글 프리텐다드 레귤러폰트 14사이즈 (사용함)
  static TextStyle bKorPreRegular14({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 14, color: color);

  //본문(body) 한글 프리텐다드 레귤러폰트 12사이즈 (사용함)
  static TextStyle bKorPreRegular12({Color color = AppColor.black}) =>
      TextStyle(fontFamily: 'PretendardRegular', fontSize: 12, color: color);
}
