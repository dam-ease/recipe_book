import 'package:http/http.dart' as http;
import 'dart:convert';

String applicationId = '567926d5';
String applicationKey = '5c63c233f29e31332045a6c19381d1d6';

class GetApi {
  Future<dynamic> getIngredients(String query) async {
    var url =
        'https://api.edamam.com/search?q=$query&app_id=$applicationId&app_key=$applicationKey';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      print(decodedData);
      return decodedData;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load data from Edamam');
    }
  }
}
