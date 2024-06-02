import 'package:common_flutter/shared/actionList.dart';
import 'package:common_flutter/services/commonService.dart';
import 'package:family_tree/models/familyTreeMessages.dart';
import 'package:family_tree/provider/familyTreeMessagesProvider.dart';
import 'package:family_tree/shared/screenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:family_tree/shared/constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class FamilyTreeMessagesIndex extends StatelessWidget {
  const FamilyTreeMessagesIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final familyTreeMessagesProvider =
        Provider.of<FamilyTreeMessagesProvider>(context);
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
          title: Text(('FamilyTreeMessagess').tr()),
          actions: [
            RowActionIndex(
                onAddFnc: (() {
                  createFamilyTreeMessagesRoute(context);
                }),
                onSearchDelegate: FamilyTreeMessagesSearchDelegate(
                    familyTreeMessagesProvider: familyTreeMessagesProvider))
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
                stream: familyTreeMessagesProvider.getFamilyTreeMessagess(),
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
                        FamilyTreeMessages familyTreeMessages =
                            snapshot.data[index];
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
                                        familyTreeMessages.englishName
                                            .toString(),
                                        style: const TextStyle(fontSize: 21),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ActionList(onDetailsFnc: () {
                                familyTreeMessagesdetailRoute(
                                    context, familyTreeMessages);
                              }, onUpdateFnc: () {
                                updateFamilyTreeMessagesRoute(
                                    context, familyTreeMessages);
                              }, onDeleteFnc: () {
                                CommonService.alertDelete(() {
                                  familyTreeMessagesProvider
                                      .removeFamilyTreeMessagess(
                                          familyTreeMessages.id);
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

class FamilyTreeMessagesSearchDelegate extends SearchDelegate {
  FamilyTreeMessagesSearchDelegate({required this.familyTreeMessagesProvider});
  final FamilyTreeMessagesProvider familyTreeMessagesProvider;
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
    List<FamilyTreeMessages> suggestions =
        familyTreeMessagesProvider.getFamilyTreeMessagesSuggestion(query);

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion.englishName!),
          onTap: () {
            query = suggestion.englishName!;
            familyTreeMessagesdetailRoute(context, suggestion);
          },
        );
      },
    );
  }
}
