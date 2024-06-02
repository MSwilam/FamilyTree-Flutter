import 'package:family_tree/models/admin.dart';
import 'package:flutter/material.dart';
import 'package:family_tree/shared/ScreenRoutes.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/drawerHome.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      drawer: drawerHome(context),
      appBar: AppBar(
        title: Text(('home').tr(), style: const TextStyle(fontSize: 22)),
        backgroundColor: appbarColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/workflow-process-scaled.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: mainScreenList.length,
              itemBuilder: (BuildContext context, int index) {
                final adminScreen screen = mainScreenList[index];

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
                      mainRouteList(context, screen.Id);
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}
