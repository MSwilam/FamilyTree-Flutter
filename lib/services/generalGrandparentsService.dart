import 'package:family_tree/models/generalGrandparents.dart';
import 'package:family_tree/services/httpCommon.dart';

class GeneralGrandparentsService {
//Get List GeneralGrandparentss
  Future<dynamic> getGeneralGrandparents() async {
    try {
      final body = await getHttp('FamilyTree/GetGeneralGrandparents');
      return body
          .map<GeneralGrandparents>(GeneralGrandparents.fromJson)
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<GeneralGrandparents>?> getGeneralGrandparentTree() async {
    List<GeneralGrandparents>? tree;
    tree = await getGeneralGrandparents() as List<GeneralGrandparents>?;
    // getGeneralGrandparents()
    //     .then((value) => tree = value as List<GeneralGrandparents>?)
    //     // ignore: void_checks
    //     .whenComplete(() {
    //   return tree;
    // });

    return tree;
  }

//Save List GeneralGrandparentss
  Future<dynamic> saveGeneralGrandparents(var bodyHeader) async {
    try {
      final body = await postHttp('FamilyTree/CreateGeneralGrandparents',
          body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Update List GeneralGrandparentss
  Future<dynamic> updateGeneralGrandparents(var bodyHeader) async {
    try {
      final body = await postHttp('FamilyTree/UpdateGeneralGrandparents',
          body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Delete List GeneralGrandparentss
  Future<dynamic> removeGeneralGrandparents(id) async {
    try {
      final body =
          await deleteLinkHttp('FamilyTree/DeleteGeneralGrandparents', id);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  //Get List FamilyTrees
  Future<dynamic> getFamilyTree() async {
    try {
      final body = await getHttp('FamilyTree/GetFamilyTree');
      return body.map<FamilyTree>(FamilyTree.fromJson).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Save List FamilyTrees
  Future<dynamic> saveFamilyTree(var bodyHeader) async {
    try {
      final body =
          await postHttp('FamilyTree/CreateFamilyTree', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Update List FamilyTrees
  Future<dynamic> updateFamilyTree(var bodyHeader) async {
    try {
      final body =
          await postHttp('FamilyTree/UpdateFamilyTree', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Delete List FamilyTrees
  Future<dynamic> removeFamilyTree(id) async {
    try {
      final body = await deleteLinkHttp('FamilyTree/DeleteFamilyTree', id);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  //Get List FamilyNickNames
  Future<dynamic> getFamilyNickName() async {
    try {
      final body = await getHttp('FamilyTree/GetFamilyNickName');
      return body.map<FamilyNickName>(FamilyNickName.fromJson).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Save List FamilyNickNames
  Future<dynamic> saveFamilyNickName(var bodyHeader) async {
    try {
      final body =
          await postHttp('FamilyTree/CreateFamilyNickName', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Update List FamilyNickNames
  Future<dynamic> updateFamilyNickName(var bodyHeader) async {
    try {
      final body =
          await postHttp('FamilyTree/UpdateFamilyNickName', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Delete List FamilyNickNames
  Future<dynamic> removeFamilyNickName(id) async {
    try {
      final body = await deleteLinkHttp('FamilyTree/DeleteFamilyNickName', id);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  //Get List Residences
  Future<dynamic> getResidence() async {
    try {
      final body = await getHttp('FamilyTree/GetResidence');
      return body.map<Residence>(Residence.fromJson).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Save List Residences
  Future<dynamic> saveResidence(var bodyHeader) async {
    try {
      final body =
          await postHttp('FamilyTree/CreateResidence', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Update List Residences
  Future<dynamic> updateResidence(var bodyHeader) async {
    try {
      final body =
          await postHttp('FamilyTree/UpdateResidence', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Delete List Residences
  Future<dynamic> removeResidence(id) async {
    try {
      final body = await deleteLinkHttp('FamilyTree/DeleteResidence', id);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  //Get List Works
  Future<dynamic> getWork() async {
    try {
      final body = await getHttp('FamilyTree/GetWork');
      return body.map<Work>(Work.fromJson).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Save List Works
  Future<dynamic> saveWork(var bodyHeader) async {
    try {
      final body = await postHttp('FamilyTree/CreateWork', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Update List Works
  Future<dynamic> updateWork(var bodyHeader) async {
    try {
      final body = await postHttp('FamilyTree/UpdateWork', body: bodyHeader);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Delete List Works
  Future<dynamic> removeWork(id) async {
    try {
      final body = await deleteLinkHttp('FamilyTree/DeleteWork', id);
      return body;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
