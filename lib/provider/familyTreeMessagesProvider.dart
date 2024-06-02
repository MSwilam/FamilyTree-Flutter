import 'package:family_tree/models/familyTreeMessages.dart';
import 'package:family_tree/models/appSettings.dart';
import 'package:family_tree/services/familyTreeMessagesService.dart';
import 'package:flutter/material.dart';

class FamilyTreeMessagesProvider with ChangeNotifier {
  FamilyTreeMessagesService service = FamilyTreeMessagesService();

  FamilyTreeMessages familyTreeMessages = FamilyTreeMessages();
  List<FamilyTreeMessages> familyTreeMessagesList = [];

  getFamilyTreeMessagess() async* {
    Future<dynamic> familyTreeMessagess = service.getFamilyTreeMessages();
    familyTreeMessagesList = await familyTreeMessagess;
    yield familyTreeMessagesList;
  }

  List<FamilyTreeMessages> getFamilyTreeMessagesSuggestion(String query) {
    if (familyTreeMessagesList == null) return [];
    List<FamilyTreeMessages> suggestions =
        familyTreeMessagesList.where((searchResult) {
      final result = searchResult.englishName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return suggestions;
  }

  saveFamilyTreeMessages(FamilyTreeMessages item) async {
    var body = <String, String>{
      "Code": item.code.toString(),
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "CreatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.saveFamilyTreeMessages(body);
    return Future.value(res);
  }

  updateFamilyTreeMessages(FamilyTreeMessages item) async {
    var body = <String, String>{
      "Code": item.code.toString(),
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "UpdatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.updateFamilyTreeMessages(body);
    return Future.value(res);
  }

  removeFamilyTreeMessagess(int? id) {
    var res = service.removeFamilyTreeMessages(id);
    notifyListeners();
  }
}
