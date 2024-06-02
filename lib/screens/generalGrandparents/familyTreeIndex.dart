import 'package:common_flutter/shared/actionList.dart';
import 'package:family_tree/models/generalGrandparents.dart';
import 'package:family_tree/provider/generalGrandparentsProvider.dart';
import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:common_flutter/services/commonService.dart';
import 'package:flutter/material.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class FamilyTreeIndex extends StatelessWidget {
  const FamilyTreeIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final generalGrandparentsProvider =
        Provider.of<GeneralGrandparentsProvider>(context);
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('FamilyTrees').tr()),
          actions: [
            RowActionIndex(
                onAddFnc: (() {
                  createFamilyTreeRoute(context);
                }),
                onSearchDelegate: FamilyTreeSearchDelegate(
                    generalGrandparentsProvider: generalGrandparentsProvider))
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              homeRoute(context);
            },
          ),
          backgroundColor: appbarColor,
        ),
        body: Center(
            child: StreamBuilder(
                stream: generalGrandparentsProvider.getFamilyTrees(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text(
                      "error_msg".tr(),
                      style: errorTextStyle,
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        FamilyTree familyTree = snapshot.data[index];
                        return Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        familyTree.englishName.toString(),
                                        style: const TextStyle(fontSize: 21),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ActionList(onDetailsFnc: () {
                                familyTreedetailRoute(context, familyTree);
                              }, onUpdateFnc: () {
                                updateFamilyTreeRoute(context, familyTree);
                              }, onDeleteFnc: () {
                                CommonService.alertDelete(() {
                                  generalGrandparentsProvider
                                      .removeFamilyTrees(familyTree.id);
                                }, context);
                              }),
                            ],
                          ),
                        );
                      },
                    );
                  }
                })));
  }
}

class FamilyTreeSearchDelegate extends SearchDelegate {
  FamilyTreeSearchDelegate({required this.generalGrandparentsProvider});
  final GeneralGrandparentsProvider generalGrandparentsProvider;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  @override
  Widget buildSuggestions(BuildContext context) {
    List<FamilyTree> suggestions =
        generalGrandparentsProvider.getFamilyTreeSuggestion(query);

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion.englishName!),
          onTap: () {
            query = suggestion.englishName!;
            familyTreedetailRoute(context, suggestion);
          },
        );
      },
    );
  }
}
