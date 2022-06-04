import 'dart:convert';

List<Payment> paymentFromJson(String str) =>
    List<Payment>.from(json.decode(str).map((x) => Payment.fromJson(x)));

class Payment {
  Payment({
    required this.id,
    required this.title,
    required this.icon,
    required this.instructions,
    required this.description,
  });

  String id;
  String title;
  dynamic icon;
  String instructions;
  String description;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        instructions: json["instructions"],
        description: json["description"],
      );
}
