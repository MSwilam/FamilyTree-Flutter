import 'package:family_tree/models/admin.dart';
import 'package:family_tree/shared/ScreenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        title: Text(('setting').tr(), style: const TextStyle(fontSize: 22)),
        backgroundColor: appbarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            homeRoute(context);
          },
        ),
      ),
      body: SizedBox(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/Bankruptcy2.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: settingScreenList.length,
              itemBuilder: (BuildContext context, int index) {
                final adminScreen screen = settingScreenList[index];

                return Container(
                  height: 100,
                  width: 150,
                  color: homeColor,
                  child: ElevatedButton.icon(
                    label:
                        Text(screen.name, style: const TextStyle(fontSize: 18)),
                    icon: Icon(
                        IconData(screen.icon, fontFamily: 'MaterialIcons')),
                    onPressed: () {
                      settingRouteList(context, screen.Id);
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}
