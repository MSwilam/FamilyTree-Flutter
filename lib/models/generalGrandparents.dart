import 'dart:typed_data';

class GeneralGrandparents {
  int? id;
  String? arabicName;
  String? englishName;
  int? grandparentsNo;
  int? parentId;

  GeneralGrandparents(
      {this.id,
      this.arabicName,
      this.englishName,
      this.grandparentsNo,
      this.parentId});

  static GeneralGrandparents fromJson(json) => GeneralGrandparents(
        id: json['id'] ?? 0,
        arabicName: json['arabicName'] ?? '',
        englishName: json['englishName'] ?? '',
        grandparentsNo: json['grandparentsNo'] ?? 0,
        parentId: json['parentId'] ?? 0,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arabicName': arabicName,
      'englishName': englishName,
      'grandparentsNo': grandparentsNo,
      'parentId': parentId,
    };
  }
}

class FamilyTree {
  int? id;
  String? arabicName;
  String? englishName;
  String? phone;
  String? email;
  int? familyNickNameId;
  int? grandparentsNo;
  int? generationNo;
  int? residenceId;
  int? workId;

  FamilyTree(
      {this.id,
      this.arabicName,
      this.englishName,
      this.phone,
      this.email,
      this.familyNickNameId,
      this.grandparentsNo,
      this.generationNo,
      this.residenceId,
      this.workId});

  static FamilyTree fromJson(json) => FamilyTree(
        id: json['id'] ?? 0,
        arabicName: json['arabicName'] ?? '',
        englishName: json['englishName'] ?? '',
        phone: json['phone'] ?? '',
        email: json['email'] ?? '',
        familyNickNameId: json['familyNickNameId'] ?? 0,
        grandparentsNo: json['grandparentsNo'] ?? 0,
        generationNo: json['generationNo'] ?? 0,
        residenceId: json['residenceId'] ?? 0,
        workId: json['workId'] ?? 0,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arabicName': arabicName,
      'englishName': englishName,
      'phone': phone,
      'email': email,
      'familyNickNameId': familyNickNameId,
      'grandparentsNo': grandparentsNo,
      'generationNo': generationNo,
      'residenceId': residenceId,
      'workId': workId,
    };
  }
}

class FamilyNickName {
  int? id;
  String? arabicName;
  String? englishName;

  FamilyNickName({this.id, this.arabicName, this.englishName});

  static FamilyNickName fromJson(json) => FamilyNickName(
        id: json['id'] ?? 0,
        arabicName: json['arabicName'] ?? '',
        englishName: json['englishName'] ?? '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arabicName': arabicName,
      'englishName': englishName,
    };
  }
}

class Residence {
  int? id;
  String? arabicName;
  String? englishName;

  Residence({this.id, this.arabicName, this.englishName});

  static Residence fromJson(json) => Residence(
        id: json['id'] ?? 0,
        arabicName: json['arabicName'] ?? '',
        englishName: json['englishName'] ?? '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arabicName': arabicName,
      'englishName': englishName,
    };
  }
}

class Work {
  int? id;
  String? arabicName;
  String? englishName;

  Work({this.id, this.arabicName, this.englishName});

  static Work fromJson(json) => Work(
        id: json['id'] ?? 0,
        arabicName: json['arabicName'] ?? '',
        englishName: json['englishName'] ?? '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arabicName': arabicName,
      'englishName': englishName,
    };
  }
}
