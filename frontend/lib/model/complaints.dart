import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';

class Complaint {
  String title;
  String description;
  String type;
  String gender;
  String status;
  int occurrence;
  int rating;
  int id;
  String email;
  List<String> platforms;
  Complaint({
    this.title,
    this.description,
    this.gender,
    this.id,
    this.occurrence,
    this.platforms,
    this.rating,
    this.type,
    this.status = "pending resolution",
    this.email,
  });
}
