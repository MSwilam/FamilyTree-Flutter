import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/models/generalGrandparents.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class FamilyTreeDetails extends StatelessWidget {
  const FamilyTreeDetails({Key? key, required this.familyTree})
      : super(key: key);
  final FamilyTree familyTree;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('FamilyTree_details').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              familyTreeRoute(context);
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
              Text(familyTree.arabicName!, style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("EnglishName").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyTree.englishName!, style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("Phone").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyTree.phone!, style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("Email").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyTree.email!, style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("FamilyNickNameId").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyTree.familyNickNameId!.toString(), style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("GrandparentsNo").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyTree.grandparentsNo!.toString(), style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("GenerationNo").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyTree.generationNo!.toString(), style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("ResidenceId").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyTree.residenceId!.toString(), style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("WorkId").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(familyTree.workId!.toString(), style: detailTextT)
            ],
          ),
        ]));
  }
}
