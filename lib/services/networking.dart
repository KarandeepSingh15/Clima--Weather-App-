import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.authority, this.unencodedPath, this.parameters);
  String authority;
  String unencodedPath;
  Map parameters;
  Future getData() async {
    http.Response response =
        await http.get(Uri.https(authority, unencodedPath, parameters));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
