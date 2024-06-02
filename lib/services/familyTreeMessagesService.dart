import 'package:family_tree/models/familyTreeMessages.dart';
import 'package:family_tree/services/httpCommon.dart';

class FamilyTreeMessagesService {

//Get List FamilyTreeMessagess
  Future<dynamic> getFamilyTreeMessages() async {
    try {
      final body = await getHttp('FamilyTreeMessages/GetFamilyTreeMessages');
      return body.map<FamilyTreeMessages>(FamilyTreeMessages.fromJson).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }


//Save List FamilyTreeMessagess
  Future<dynamic> saveFamilyTreeMessages(var bodyHeader) async {
    try {
      final body = await postHttp('FamilyTreeMessages/CreateFamilyTreeMessages', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }


//Update List FamilyTreeMessagess
  Future<dynamic> updateFamilyTreeMessages(var bodyHeader) async {
    try {
      final body = await postHttp('FamilyTreeMessages/UpdateFamilyTreeMessages', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Delete List FamilyTreeMessagess
  Future<dynamic> removeFamilyTreeMessages(id) async {
    try {
      final body = await deleteLinkHttp('FamilyTreeMessages/DeleteFamilyTreeMessages', id);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
 
}