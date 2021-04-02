import 'package:http/http.dart' as http;
import 'dart:convert';

String applicationId = '567926d5';
String applicationKey = '5c63c233f29e31332045a6c19381d1d6';

class GetApi {
  Future getIngredients(String query) async {
    var url =
        'https://api.edamam.com/search?q=$query&app_id=$applicationId&app_key=$applicationKey&from=0&to=50';

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map ingredientModel = jsonDecode(response.body);

      return ingredientModel;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load data from Edamam');
    }
  }
}
