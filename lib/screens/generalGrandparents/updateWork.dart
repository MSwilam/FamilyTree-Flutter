import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/shared/buttons.dart';
import 'package:common_flutter/api/notificationApi.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:family_tree/provider/generalGrandparentsProvider.dart';
import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/models/generalGrandparents.dart';

class UpdateWork extends StatelessWidget {
  UpdateWork({Key? key, required this.work}) : super(key: key);
  final Work work;
  final GeneralGrandparentsProvider generalGrandparentsProvider =
      GeneralGrandparentsProvider();
  @override
  Widget build(BuildContext context) {
    generalGrandparentsProvider.work = work;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('update_work').tr()),
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
                      initialValue: work.arabicName,
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
                      initialValue: work.englishName,
                      onChanged: (val) {
                        generalGrandparentsProvider.work.englishName = val;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    UpdateBtn(onUpdateFnc: () async {
                      if (_formKey.currentState!.validate()) {
                        bool res = await generalGrandparentsProvider
                            .updateWork(generalGrandparentsProvider.work);
                        if (res == true) {
                          NotificationApi.showNotification(
                              title: 'Updated ',
                              body: 'Update work !! ',
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
