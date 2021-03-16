import 'dart:convert';

import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/model/complaints.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var url = "localhost:8000";
  Future<Map<String, dynamic>> send(
      Map<String, dynamic> request, String controller) async {
    var response = await http.post(
      Uri.http(url, controller),
      body: jsonEncode(request),
      headers: kHeaders,
    );
    return json.decode(response.body);
  }

  Future<String> submitComplaint(Complaint complaint) async {
    var request = {
      "email": getIt.get<PreferenceService>().email,
      "title": complaint.title,
      "description": complaint.description,
      "type": complaint.type,
      "occurrence": complaint.occurrence,
      "gender": complaint.gender,
      "platforms": complaint.platforms,
      "rating": complaint.rating ?? 5,
      "status": null,
    };
    var response = await http.post(
      Uri.http(url, "/add_complaints"),
      body: jsonEncode(request),
      headers: kHeaders,
    );
    return json.decode(response.body)["status"].toString();
  }

  Future<String> editComplaint(Complaint complaint) async {
    var request = {
      "id": complaint.id,
      "status": complaint.status,
    };
    var response = await http.post(
      Uri.http(url, "/edit_complaints"),
      body: jsonEncode(request),
      headers: kHeaders,
    );
    return json.decode(response.body)["status"].toString();
  }

  Future<List<Complaint>> getComplaints() async {
    var request = {
      "email": getIt.get<PreferenceService>().email,
    };
    List<Complaint> complaints = [];
    await http
        .post(
      Uri.http(url, "/get_complaints"),
      body: jsonEncode(request),
      headers: kHeaders,
    )
        .then((value) {
      complaints = unwrapJsonToComplaints(value);
    });
    return complaints;
  }

  Future<List<Complaint>> getAllComplaints() async {
    var request = {};
    List<Complaint> complaints = [];
    await http
        .post(
      Uri.http(url, "/get_all_complaints"),
      body: jsonEncode(request),
      headers: kHeaders,
    )
        .then((value) {
      complaints = unwrapJsonToComplaints(value);
    });
    return complaints;
  }

  List<Complaint> unwrapJsonToComplaints(value) {
    List<Complaint> complaints = [];
    var response = json.decode(value.body);
    List<dynamic> list = response['response'];
    for (Map<String, dynamic> item in list) {
      Complaint complaint = new Complaint(
        title: item['title'].toString(),
        platforms: item['platforms'].toString().split(',').toList(),
        description: item['description'].toString(),
        gender: item['gender'].toString(),
        occurrence: int.parse(item['occurrence'].toString()),
        rating: int.parse(item['rating'].toString()),
        type: item['type'].toString(),
        id: int.parse(item['id'].toString()),
        status: item['status'].toString(),
      );
      complaint.platforms.removeAt(complaint.platforms.length - 1);
      complaints.add(complaint);
    }
    return complaints;
  }
}
