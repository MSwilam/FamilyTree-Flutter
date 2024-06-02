import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/shared/buttons.dart';
import 'package:common_flutter/api/notificationApi.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:family_tree/provider/generalGrandparentsProvider.dart';
import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/models/generalGrandparents.dart';

class UpdateFamilyTree extends StatelessWidget {
  UpdateFamilyTree({Key? key, required this.familyTree}) : super(key: key);
  final FamilyTree familyTree;
  final GeneralGrandparentsProvider generalGrandparentsProvider =
      GeneralGrandparentsProvider();
  @override
  Widget build(BuildContext context) {
    generalGrandparentsProvider.familyTree = familyTree;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('update_familyTree').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              familyTreeRoute(context);
            },
          ),
          backgroundColor: appbarColor,
        ),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('ArabicName').tr()),
                      validator: (val) =>
                          val!.isEmpty ? ('ArabicName_null').tr() : null,
                      initialValue: familyTree.arabicName,
                      onChanged: (val) {
                        generalGrandparentsProvider.familyTree.arabicName = val;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('EnglishName').tr()),
                      validator: (val) =>
                          val!.isEmpty ? ('EnglishName_null').tr() : null,
                      initialValue: familyTree.englishName,
                      onChanged: (val) {
                        generalGrandparentsProvider.familyTree.englishName =
                            val;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('Phone').tr()),
                      initialValue: familyTree.phone,
                      onChanged: (val) {
                        generalGrandparentsProvider.familyTree.phone = val;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('Email').tr()),
                      initialValue: familyTree.email,
                      onChanged: (val) {
                        generalGrandparentsProvider.familyTree.email = val;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('FamilyNickNameId').tr()),
                      initialValue: familyTree.familyNickNameId.toString(),
                      onChanged: (val) {
                        generalGrandparentsProvider
                            .familyTree.familyNickNameId = int.parse(val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('GrandparentsNo').tr()),
                      validator: (val) =>
                          val!.isEmpty ? ('GrandparentsNo_null').tr() : null,
                      initialValue: familyTree.grandparentsNo.toString(),
                      onChanged: (val) {
                        generalGrandparentsProvider.familyTree.grandparentsNo =
                            int.parse(val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('GenerationNo').tr()),
                      validator: (val) =>
                          val!.isEmpty ? ('GenerationNo_null').tr() : null,
                      initialValue: familyTree.generationNo.toString(),
                      onChanged: (val) {
                        generalGrandparentsProvider.familyTree.generationNo =
                            int.parse(val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('ResidenceId').tr()),
                      initialValue: familyTree.residenceId.toString(),
                      onChanged: (val) {
                        generalGrandparentsProvider.familyTree.residenceId =
                            int.parse(val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('WorkId').tr()),
                      initialValue: familyTree.workId.toString(),
                      onChanged: (val) {
                        generalGrandparentsProvider.familyTree.workId =
                            int.parse(val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    UpdateBtn(onUpdateFnc: () async {
                      if (_formKey.currentState!.validate()) {
                        bool res =
                            await generalGrandparentsProvider.updateFamilyTree(
                                generalGrandparentsProvider.familyTree);
                        if (res == true) {
                          NotificationApi.showNotification(
                              title: 'Updated ',
                              body: 'Update familyTree !! ',
                              payload: 'familyTree');
                          await familyTreeRoute(context);
                        }
                      }
                    })
                  ],
                ),
              ),
            )));
  }
}
