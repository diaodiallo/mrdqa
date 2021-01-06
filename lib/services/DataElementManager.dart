import 'package:mrdqa_tool/models/Config.dart';

import 'DhisAuthenticationManager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataElementManager {
  String _endPoint = '/api/dataElements.json';
  final DhisAuthenticationManager _dhisAuthenticationManager = new DhisAuthenticationManager();
  Config _config;

  DataElementManager(this._config);

  Future<String> getData() async {
    String credentials = "${_config.getUsername()}:${_config.getPassword()}";
    String encoded = base64Url.encode(utf8.encode(credentials));
    var response = await http.get(
        Uri.encodeFull("${this._config.getBaseUrl()}${this._endPoint}"), headers: {"Accept": "application/json", "Authorization":"BASIC ${encoded}"}
    );
    int statusCode = response.statusCode;
    print('^^^^^^^^^^^');
    print(statusCode);
    print(response.body);
    print('<-*****------***->');
    return response.body;
  }
}