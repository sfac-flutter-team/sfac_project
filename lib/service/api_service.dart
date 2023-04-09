import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sfac_project/util/api_routes.dart';

class ApiSerive {
  getLineup(int fixtureId) async {
    var headers = {
      'x-rapidapi-key': dotenv.env['API_KEY'].toString(),
      'x-rapidapi-host': 'v3.football.api-sports.io'
    };
    var request = http.Request('GET',
        Uri.parse('${ApiRoutes.football}fixtures/lineups?fixture=$fixtureId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return '';
    }
  }
}
