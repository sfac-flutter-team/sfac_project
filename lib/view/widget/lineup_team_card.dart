import 'package:flutter/material.dart';
import 'package:sfac_project/model/lineup.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class LineupTeamCard extends StatelessWidget {
  const LineupTeamCard(
      {super.key, required this.lineup, this.isSubstitutes = false});

  final Lineup lineup;
  final bool isSubstitutes;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: AppColor.mainBlue.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.network(
              width: 54,
              lineup.team.logo,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                style: AppTextStyle.hKorPreSemiBold14(),
                !isSubstitutes ? lineup.team.name : '후보',
              ),
            )
          ],
        ),
      ),
    );
  }
}
