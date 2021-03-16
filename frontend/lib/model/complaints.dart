class Complaint {
  String title;
  String description;
  String type;
  String gender;
  String status;
  int occurrence;
  int rating;
  int id;
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
  });
}
