import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/buttons.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:common_flutter/api/notificationApi.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:family_tree/provider/generalGrandparentsProvider.dart';
import 'package:family_tree/shared/screenRoutes.dart';

class CreateWork extends StatelessWidget {
  CreateWork({Key? key}) : super(key: key);
  final GeneralGrandparentsProvider generalGrandparentsProvider =
      GeneralGrandparentsProvider();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('create_Work').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              workRoute(context);
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
                      onChanged: (val) {
                        generalGrandparentsProvider.work.arabicName = val;
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
                      onChanged: (val) {
                        generalGrandparentsProvider.work.englishName = val;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CreateBtn(onCreateFnc: () async {
                      if (_formKey.currentState!.validate()) {
                        bool res = await generalGrandparentsProvider
                            .saveWork(generalGrandparentsProvider.work);
                        if (res == true) {
                          NotificationApi.showNotification(
                              title: 'New Added',
                              body: 'Create Work Title !!',
                              payload: 'work');
                          await workRoute(context);
                        }
                      }
                    })
                  ],
                ),
              ),
            )));
  }
}
