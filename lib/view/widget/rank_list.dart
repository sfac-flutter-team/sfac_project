import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/ranking_controller.dart';
import 'package:sfac_project/model/player.dart';
import 'package:sfac_project/model/standing.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class RankList extends StatelessWidget {
  const RankList({super.key, required this.player, this.standing});
  final Player player;
  final Standing? standing;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Text(
                      standing!.rank.toString(),
                      style: AppTextStyle.hKorPreSemiBold14(),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ClipRRect(
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.network(player.photo.toString())),
                ),
                const SizedBox(width: 20),
                Text(player.name.toString(),
                    style: AppTextStyle.hKorPreSemiBold14()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(player.total.toString(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.hKorPreSemiBold14()),
                  const SizedBox(width: 50),
                  Text(player.assists.toString(),
                      style: AppTextStyle.hKorPreSemiBold14()),
                ],
              ),
            ),
          ],
        ));
  }
}
