import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/models/generalGrandparents.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class FamilyNickNameDetails extends StatelessWidget {
  const FamilyNickNameDetails({Key? key, required this.familyNickName})
      : super(key: key);
  final FamilyNickName familyNickName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('FamilyNickName_details').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              familyNickNameRoute(context);
            },
          ),
          backgroundColor: appbarColor,
        ),
        body: DetailsColumn(children: [
          DetailsRow(
            children: [
              Text(("ArabicName").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyNickName.arabicName!, style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("EnglishName").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyNickName.englishName!, style: detailTextT)
            ],
          ),
        ]));
  }
}
