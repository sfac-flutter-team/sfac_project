import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sfac_project/model/team.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:sfac_project/util/app_text_style.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Padding(
          padding:  EdgeInsets.all(16.0),
          child: Text('순위표',
          style: AppTextStyle.hKorPreBold36,
          ),
        ),
       const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 80,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('EPL 로고'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('출전권 : 챔피언스리그'),
                  Text('출전권 : 유로파리그'),
                  Text('강등권 : 챔피언쉽'),
                ],
              )
            ],
          ),
        ),
       const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){}, child: Text('전체')),
            ElevatedButton(onPressed: (){}, child: Text('득점순위')),
            const SizedBox(
              width: 120,
            ),
          ],
        ),
       const SizedBox(
          height: 16,
        ),
        SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('경기 수'),
              Text('승점')
            ],
          ),
        )
      ],
     ), 
    );
  }
}