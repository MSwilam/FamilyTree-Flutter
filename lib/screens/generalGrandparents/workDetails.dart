import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/models/generalGrandparents.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class WorkDetails extends StatelessWidget {
  const WorkDetails({Key? key, required this.work}) : super(key: key);
  final Work work;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('Work_details').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              workRoute(context);
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
              Text(work.arabicName!, style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("EnglishName").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(work.englishName!, style: detailTextT)
            ],
          ),
        ]));
  }
}
