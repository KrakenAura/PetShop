import 'dart:convert';

Facts factsFromJson(String str) => Facts.fromJson(json.decode(str));

String factsToJson(Facts data) => json.encode(data.toJson());

class Facts {
  List<String> data;

  Facts({
    required this.data,
  });

  factory Facts.fromJson(Map<String, dynamic> json) => Facts(
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
