import 'dart:convert';

import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/model/complaints.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var url = "http://127.0.0.1:8000/";
  Future<Map<String, dynamic>> send(
      Map<String, dynamic> request, String controller) async {
    var response = await http.post(
      Uri.http(url, controller),
      body: request,
      headers: kHeaders,
    );
    return json.decode(response.body);
  }

  Future<String> submitComplaint(Complaint complaint) async {
    var request = {
      "email": GetIt.I.get<PreferenceService>().email,
      "title": complaint.title,
      "description": complaint.description,
      "type": complaint.type,
      "occurrence": complaint.occurrence,
      "gender": complaint.gender,
      "platforms": complaint.platforms,
      "rating": complaint.rating
    };
    var response = await http.post(
      Uri.http(url, "add_complaints"),
      body: request,
      headers: kHeaders,
    );
    return json.decode(response.body);
  }
}
