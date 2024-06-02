import 'dart:typed_data';

class FamilyTreeMessages {
  int? id;
  String? code;
  String? arabicName;
  String? englishName;

  FamilyTreeMessages({this.id, this.code, this.arabicName, this.englishName});

  static FamilyTreeMessages fromJson(json) => FamilyTreeMessages(
        id: json['id'] ?? '',
        code: json['code'] ?? '',
        arabicName: json['arabicName'] ?? '',
        englishName: json['englishName'] ?? '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'arabicName': arabicName,
      'englishName': englishName,
    };
  }
}
