// To parse this JSON data, do
//
//     final addonsListResponse = addonsListResponseFromJson(jsonString);

import 'dart:convert';

// Function to parse JSON string into a list of AddonsListResponse objects
List<AddonsListResponse> addonsListResponseFromJson(String str) =>
    List<AddonsListResponse>.from(
        json.decode(str).map((x) => AddonsListResponse.fromJson(x)));

// Function to convert a list of AddonsListResponse objects into JSON string
String addonsListResponseToJson(List<AddonsListResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddonsListResponse {
  AddonsListResponse({
    required this.id,
    required this.name,
    required this.uniqueIdentifier,
    required this.activated,
  });

  final int id;
  final String name;
  final String uniqueIdentifier;
  final bool activated;

  // Factory constructor to create an instance from JSON
  factory AddonsListResponse.fromJson(Map<String, dynamic> json) =>
      AddonsListResponse(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        uniqueIdentifier: json["unique_identifier"] ?? '',
        activated: json["activated"] == "1" || json["activated"] == true,
      );

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "unique_identifier": uniqueIdentifier,
    "activated": activated ? "1" : "0",
  };
}