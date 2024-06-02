import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:family_tree/models/generalGrandparents.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ResidenceDetails extends StatelessWidget {
  const ResidenceDetails({Key? key, required this.residence}) : super(key: key);
  final Residence residence;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('Residence_details').tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              residenceRoute(context);
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
              Text(residence.arabicName!, style: detailTextT)
            ],
          ),
          DetailsRow(
            children: [
              Text(("EnglishName").tr(), style: detailTextH),
              const SizedBox(
                width: 10,
              ),
              Text(residence.englishName!, style: detailTextT)
            ],
          ),
        ]));
  }
}
