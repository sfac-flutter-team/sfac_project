import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/model/fixture.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class FixtureCard extends StatelessWidget {
  const FixtureCard({super.key, required this.fixture, required this.onTap});

  final Fixture fixture; //경기 결과
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
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                            color: AppColor.mainBlue,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          style: AppTextStyle.bKorPreRegular14(
                              color: AppColor.white),
                          '종료',
                        ),
                      ),
                      Text(
                        style: AppTextStyle.hKorPreBold43,
                        '${fixture.homeGoals.toString()} - ${fixture.awayGoals.toString()}',
                      ),
                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}
