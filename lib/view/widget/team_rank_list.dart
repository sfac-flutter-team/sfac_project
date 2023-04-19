import 'package:flutter/material.dart';
import 'package:sfac_project/model/standing.dart';
import 'package:sfac_project/util/app_text_style.dart';

class TeamRankList extends StatelessWidget {
  const TeamRankList(
      {super.key, required this.standing, required this.rankColor});
  final Standing standing;
  final Color rankColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  standing.rank.toString(),
                  style: AppTextStyle.hKorPreSemiBold14(color: rankColor),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            ClipRRect(
              child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.network(standing.team.logo)),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Text(standing.team.name.toString(),
                  style: AppTextStyle.hKorPreSemiBold14()),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(standing.played.toString(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.hKorPreSemiBold14()),
                    const Expanded(child: SizedBox()),
                    Text(standing.points.toString(),
                        style: AppTextStyle.hKorPreSemiBold14()),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
