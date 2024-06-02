import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/models/generalGrandparents.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class GeneralGrandparentsDetails extends StatelessWidget {
  const GeneralGrandparentsDetails(
      {Key? key, required this.generalGrandparents})
      : super(key: key);
  final GeneralGrandparents generalGrandparents;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('GeneralGrandparents_details').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              generalGrandparentsRoute(context);
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
              Text(generalGrandparents.arabicName!, style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("EnglishName").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(generalGrandparents.englishName!, style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("GrandparentsNo").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(generalGrandparents.grandparentsNo!.toString(),
                  style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("ParentId").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(generalGrandparents.parentId!.toString(), style: detailTextT)
            ],
          ),
        ]));
  }
}
