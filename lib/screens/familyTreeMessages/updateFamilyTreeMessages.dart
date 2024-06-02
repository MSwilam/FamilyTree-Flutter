import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/shared/buttons.dart';
import 'package:common_flutter/api/notificationApi.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:family_tree/provider/familyTreeMessagesProvider.dart';
import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/models/familyTreeMessages.dart';

class UpdateFamilyTreeMessages extends StatelessWidget {
  UpdateFamilyTreeMessages({Key? key, required this.familyTreeMessages})
      : super(key: key);
  final FamilyTreeMessages familyTreeMessages;
  final FamilyTreeMessagesProvider familyTreeMessagesProvider =
      FamilyTreeMessagesProvider();
  @override
  Widget build(BuildContext context) {
    familyTreeMessagesProvider.familyTreeMessages = familyTreeMessages;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('update_familyTreeMessages').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              familyTreeMessagesRoute(context);
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
                      decoration:
                          textInputDecoration.copyWith(hintText: ('Code').tr()),
                      validator: (val) =>
                          val!.isEmpty ? ('Code_null').tr() : null,
                      initialValue: familyTreeMessages.code,
                      onChanged: (val) {
                        familyTreeMessagesProvider.familyTreeMessages.code =
                            val;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: ('ArabicName').tr()),
                      validator: (val) =>
                          val!.isEmpty ? ('ArabicName_null').tr() : null,
                      initialValue: familyTreeMessages.arabicName,
                      onChanged: (val) {
                        familyTreeMessagesProvider
                            .familyTreeMessages.arabicName = val;
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
                      initialValue: familyTreeMessages.englishName,
                      onChanged: (val) {
                        familyTreeMessagesProvider
                            .familyTreeMessages.englishName = val;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    UpdateBtn(onUpdateFnc: () async {
                      if (_formKey.currentState!.validate()) {
                        bool res = await familyTreeMessagesProvider
                            .updateFamilyTreeMessages(
                                familyTreeMessagesProvider.familyTreeMessages);
                        if (res == true) {
                          NotificationApi.showNotification(
                              title: 'Updated ',
                              body: 'Update familyTreeMessages !! ',
                              payload: 'familyTreeMessages');
                          await familyTreeMessagesRoute(context);
                        }
                      }
                    })
                  ],
                ),
              ),
            )));
  }
}
