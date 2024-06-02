import 'package:family_tree/models/generalGrandparents.dart';
import 'package:family_tree/models/appSettings.dart';
import 'package:family_tree/services/generalGrandparentsService.dart';
import 'package:flutter/material.dart';

class GeneralGrandparentsProvider with ChangeNotifier {
  GeneralGrandparentsService service = GeneralGrandparentsService();

  GeneralGrandparents generalGrandparents = GeneralGrandparents();
  List<GeneralGrandparents> generalGrandparentsList = [];

  FamilyTree familyTree = FamilyTree();
  List<FamilyTree> familyTreeList = [];

  FamilyNickName familyNickName = FamilyNickName();
  List<FamilyNickName> familyNickNameList = [];

  Residence residence = Residence();
  List<Residence> residenceList = [];

  Work work = Work();
  List<Work> workList = [];

  getGeneralGrandparentss() async* {
    Future<dynamic> generalGrandparentss = service.getGeneralGrandparents();
    generalGrandparentsList = await generalGrandparentss;
    yield generalGrandparentsList;
  }

  List<GeneralGrandparents> getGeneralGrandparentsSuggestion(String query) {
    if (generalGrandparentsList == null) return [];
    List<GeneralGrandparents> suggestions =
        generalGrandparentsList.where((searchResult) {
      final result = searchResult.englishName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return suggestions;
  }

  saveGeneralGrandparents(GeneralGrandparents item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "GrandparentsNo": item.grandparentsNo.toString(),
      "ParentId": item.parentId.toString(),
      "CreatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.saveGeneralGrandparents(body);
    return Future.value(res);
  }

  updateGeneralGrandparents(GeneralGrandparents item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "GrandparentsNo": item.grandparentsNo.toString(),
      "ParentId": item.parentId.toString(),
      "UpdatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.updateGeneralGrandparents(body);
    return Future.value(res);
  }

  removeGeneralGrandparentss(int? id) {
    var res = service.removeGeneralGrandparents(id);
    notifyListeners();
  }

  getFamilyTrees() async* {
    Future<dynamic> familyTrees = service.getFamilyTree();
    familyTreeList = await familyTrees;
    yield familyTreeList;
  }

  List<FamilyTree> getFamilyTreeSuggestion(String query) {
    if (familyTreeList == null) return [];
    List<FamilyTree> suggestions = familyTreeList.where((searchResult) {
      final result = searchResult.englishName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return suggestions;
  }

  saveFamilyTree(FamilyTree item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "Phone": item.phone.toString(),
      "Email": item.email.toString(),
      "FamilyNickNameId": item.familyNickNameId.toString(),
      "GrandparentsNo": item.grandparentsNo.toString(),
      "GenerationNo": item.generationNo.toString(),
      "ResidenceId": item.residenceId.toString(),
      "WorkId": item.workId.toString(),
      "CreatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.saveFamilyTree(body);
    return Future.value(res);
  }

  updateFamilyTree(FamilyTree item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "Phone": item.phone.toString(),
      "Email": item.email.toString(),
      "FamilyNickNameId": item.familyNickNameId.toString(),
      "GrandparentsNo": item.grandparentsNo.toString(),
      "GenerationNo": item.generationNo.toString(),
      "ResidenceId": item.residenceId.toString(),
      "WorkId": item.workId.toString(),
      "UpdatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.updateFamilyTree(body);
    return Future.value(res);
  }

  removeFamilyTrees(int? id) {
    var res = service.removeFamilyTree(id);
    notifyListeners();
  }

  getFamilyNickNames() async* {
    Future<dynamic> familyNickNames = service.getFamilyNickName();
    familyNickNameList = await familyNickNames;
    yield familyNickNameList;
  }

  List<FamilyNickName> getFamilyNickNameSuggestion(String query) {
    if (familyNickNameList == null) return [];
    List<FamilyNickName> suggestions = familyNickNameList.where((searchResult) {
      final result = searchResult.englishName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return suggestions;
  }

  saveFamilyNickName(FamilyNickName item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "CreatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.saveFamilyNickName(body);
    return Future.value(res);
  }

  updateFamilyNickName(FamilyNickName item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "UpdatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.updateFamilyNickName(body);
    return Future.value(res);
  }

  removeFamilyNickNames(int? id) {
    var res = service.removeFamilyNickName(id);
    notifyListeners();
  }

  getResidences() async* {
    Future<dynamic> residences = service.getResidence();
    residenceList = await residences;
    yield residenceList;
  }

  List<Residence> getResidenceSuggestion(String query) {
    if (residenceList == null) return [];
    List<Residence> suggestions = residenceList.where((searchResult) {
      final result = searchResult.englishName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return suggestions;
  }

  saveResidence(Residence item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "CreatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.saveResidence(body);
    return Future.value(res);
  }

  updateResidence(Residence item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "UpdatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.updateResidence(body);
    return Future.value(res);
  }

  removeResidences(int? id) {
    var res = service.removeResidence(id);
    notifyListeners();
  }

  getWorks() async* {
    Future<dynamic> works = service.getWork();
    workList = await works;
    yield workList;
  }

  List<Work> getWorkSuggestion(String query) {
    if (workList == null) return [];
    List<Work> suggestions = workList.where((searchResult) {
      final result = searchResult.englishName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return suggestions;
  }

  saveWork(Work item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "CreatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.saveWork(body);
    return Future.value(res);
  }

  updateWork(Work item) async {
    var body = <String, String>{
      "ArabicName": item.arabicName.toString(),
      "EnglishName": item.englishName.toString(),
      "UpdatedBy": AppSettings.current.userId.toString(),
    };

    var res = service.updateWork(body);
    return Future.value(res);
  }

  removeWorks(int? id) {
    service.removeWork(id);
    notifyListeners();
  }
}
