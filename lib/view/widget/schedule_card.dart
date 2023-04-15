import 'package:flutter/material.dart';
import 'package:sfac_project/model/fixture.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key, required this.fixture, required this.onTap});

  final Fixture fixture; //경기 일정
  final VoidCallback onTap; //onTap 이벤트

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shadowColor: AppColor.mainBlue.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.network(
                      width: 56,
                      height: 56,
                      fixture.home.logo.toString(),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      style: AppTextStyle.bKorPreRegular14(
                        color: AppColor.subDarkGrey,
                      ),
                      fixture.home.name.toString(),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                    color: AppColor.mainBlue,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  style: AppTextStyle.hKorPreSemiBold14(color: AppColor.white),
                  '경기 전',
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.network(
                      width: 56,
                      height: 56,
                      fixture.away.logo.toString(),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      style: AppTextStyle.bKorPreRegular14(
                        color: AppColor.subDarkGrey,
                      ),
                      fixture.away.name.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
