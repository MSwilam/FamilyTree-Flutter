import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/shared/buttons.dart';
import 'package:common_flutter/api/notificationApi.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:family_tree/provider/generalGrandparentsProvider.dart';
import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/models/generalGrandparents.dart';

class UpdateResidence extends StatelessWidget {
  UpdateResidence({Key? key, required this.residence}) : super(key: key);
  final Residence residence;
  final GeneralGrandparentsProvider generalGrandparentsProvider =
      GeneralGrandparentsProvider();
  @override
  Widget build(BuildContext context) {
    generalGrandparentsProvider.residence = residence;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('update_residence').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              residenceRoute(context);
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
                      initialValue: residence.arabicName,
                      onChanged: (val) {
                        generalGrandparentsProvider.residence.arabicName = val;
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
                      initialValue: residence.englishName,
                      onChanged: (val) {
                        generalGrandparentsProvider.residence.englishName = val;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    UpdateBtn(onUpdateFnc: () async {
                      if (_formKey.currentState!.validate()) {
                        bool res =
                            await generalGrandparentsProvider.updateResidence(
                                generalGrandparentsProvider.residence);
                        if (res == true) {
                          NotificationApi.showNotification(
                              title: 'Updated ',
                              body: 'Update residence !! ',
                              payload: 'residence');
                          await residenceRoute(context);
                        }
                      }
                    })
                  ],
                ),
              ),
            )));
  }
}
