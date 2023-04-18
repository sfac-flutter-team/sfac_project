import 'package:flutter/material.dart';
import 'package:sfac_project/model/player.dart';
import 'package:sfac_project/model/standing.dart';
import 'package:sfac_project/util/app_text_style.dart';

class PlayerRankList extends StatelessWidget {
  const PlayerRankList({
    super.key,
    required this.player,
    required this.rank,
  });
  final Player player;
  final int rank;

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
                      rank.toString(),
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
