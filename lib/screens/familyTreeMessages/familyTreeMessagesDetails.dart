import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/models/familyTreeMessages.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class FamilyTreeMessagesDetails extends StatelessWidget {
  const FamilyTreeMessagesDetails({Key? key, required this.familyTreeMessages}) : super(key: key);
  final FamilyTreeMessages familyTreeMessages;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('FamilyTreeMessages_details').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              familyTreeMessagesRoute(context);
            },
          ),
          backgroundColor: appbarColor,
        ),
        body: DetailsColumn(children: [
	  DetailsRow(
          children: [
            Text(("Code").tr(), style: detailTextH),
            const SizedBox(
              width: 10,
            ),
            Text(familyTreeMessages.code!, style: detailTextT)
          ],
        ),DetailsRow(
          children: [
            Text(("ArabicName").tr(), style: detailTextH),
            const SizedBox(
              width: 10,
            ),
            Text(familyTreeMessages.arabicName!, style: detailTextT)
          ],
        ),DetailsRow(
          children: [
            Text(("EnglishName").tr(), style: detailTextH),
            const SizedBox(
              width: 10,
            ),
            Text(familyTreeMessages.englishName!, style: detailTextT)
          ],
        ),
	])
    );
  }
}