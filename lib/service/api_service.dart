import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sfac_project/util/api_routes.dart';

class ApiSerive {
  getLineup(int fixtureId) async {
    var headers = {
      'x-rapidapi-key': dotenv.env['API_KEY'].toString(),
      'x-rapidapi-host': 'v3.football.api-sports.io'
    };
    var request =
        Uri.parse('${ApiRoutes.football}fixtures/lineups?fixture=$fixtureId');

    var response = await http.get(request, headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['response'];
    } else {
      return '';
    }
  }
}
