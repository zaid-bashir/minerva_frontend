// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:minerva_frontend/config/api_configuration.dart';
import 'package:minerva_frontend/datacontroller/apiresponse.dart';
import 'package:logger/logger.dart';

class ApiServices {
  var log = Logger();
  Map<String, dynamic> fetchedData;

  //?Service Function for Playlist
  //*=================================
  static Future<Map<String, dynamic>> getPlaylist() async {
    print("Entering Into Services...");
    final headers = {
      "Content-Type": "application/json",
    };
    try {
      print("Progress Services...");
      var url = Uri.parse(ApiConfig.getPlaylist);
      final response = await http.get(url, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body.toString());
        ApiServices().fetchedData = jsonDecode(response.body);
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        print(jsonData);
        return jsonData;
      } else {
        return {"error": "Error Occured"};
      }
    } on SocketException {
      print("Socket Exception");
      return {"error": "Error Occured"};
    } on FormatException {
      print("Format Exception");
      return {"error": "Error Occured"};
    } catch (e) {
      print("Error Exception");
      return {"error": "Error Occured"};
    }
  }
}
