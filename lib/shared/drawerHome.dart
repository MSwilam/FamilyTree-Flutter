import 'package:family_tree/shared/ScreenRoutes.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

Widget drawerHome(BuildContext context) {
  return Drawer(
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        children: [
          const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/workflow-process-scaled.webp"),
                      fit: BoxFit.cover)),
              accountName: Text(
                "Mahmoud Swilam",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                "Swilam2100@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage("assets/avatar.jpg"))),
          ListTile(
            title: Text(('tasks').tr()),
            leading: const Icon(Icons.business),
            onTap: () {
              //  allTasksRoute(context);
            },
          ),
          ListTile(
            title: Text(('admin').tr()),
            leading: const Icon(Icons.request_quote),
            onTap: () {},
          ),
          ListTile(
            title: Text(('about').tr()),
            leading: const Icon(Icons.help_center),
            onTap: () {
              // aboutRoute(context);
            },
          ),
          ListTile(
            title: Text(('setting').tr()),
            leading: const Icon(Icons.settings),
            onTap: () {
              // settingRoute(context);
            },
          ),
          ListTile(
            title: Text(('logout').tr()),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {},
          ),
        ],
      ),
      Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Text(
            ('copyright').tr(),
            style: const TextStyle(fontSize: 16.0),
          ))
    ]),
  );
}
