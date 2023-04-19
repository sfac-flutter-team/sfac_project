import 'package:flutter/material.dart';
import 'package:sfac_project/model/lineup.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/lineup_team_card.dart';

enum LineupType { home, away }

class LineupListView extends StatelessWidget {
  const LineupListView(
      {super.key, required this.lineup, this.lineupType = LineupType.home});

  final Lineup lineup; //라인업
  final LineupType lineupType; //라인업 타입

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 46,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: lineupType == LineupType.home
                ? AppColor.mainBlue
                : AppColor.black,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            style: AppTextStyle.bKorPreRegular10(
              color: AppColor.white,
            ),
            lineup.coach.name,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lineup.players.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: lineupType == LineupType.home
                        ? AppColor.mainBlue
                        : AppColor.black,
                    width: 36,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text(
                      style: AppTextStyle.hKorPreSemiBold14(
                        color: AppColor.white,
                      ),
                      lineup.players[index].number.toString(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      style: AppTextStyle.bKorPreRegular10(),
                      lineup.players[index].name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      style: AppTextStyle.bKorPreRegular10(),
                      lineup.players[index].pos.toString(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 64),
        LineupTeamCard(
          lineup: lineup,
          isSubstitutes: true,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lineup.substitutes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: lineupType == LineupType.home
                        ? AppColor.mainBlue
                        : AppColor.black,
                    width: 36,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text(
                      style: AppTextStyle.hKorPreSemiBold14(
                        color: AppColor.white,
                      ),
                      lineup.substitutes[index].number.toString(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                        style: AppTextStyle.bKorPreRegular10(),
                        lineup.substitutes[index].name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      style: AppTextStyle.bKorPreRegular10(),
                      lineup.substitutes[index].pos.toString(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
