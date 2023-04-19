import 'package:flutter/material.dart';
import 'package:sfac_project/model/player.dart';
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
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.network(player.photo.toString())),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Text(player.name.toString(),
                  style: AppTextStyle.hKorPreSemiBold14()),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(player.total.toString(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.hKorPreSemiBold14()),
                    const Expanded(child: SizedBox()),
                    Text(player.assists.toString(),
                        style: AppTextStyle.hKorPreSemiBold14()),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
