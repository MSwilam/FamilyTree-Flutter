import 'package:flutter/material.dart';
import 'package:family_tree/shared/colors.dart';
import 'package:family_tree/shared/screenRoutes.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        title: Text(('about').tr(), style: const TextStyle(fontSize: 22)),
        backgroundColor: appbarColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            homeRoute(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ('title').tr(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                "Version 1.0",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 10.0),
              Text(
                ('develop_by').tr(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                child: Image.asset(
                  'assets/Icons.png',
                  height: 200.0,
                  width: 300.0,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                ('TBS').tr(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10.0),
              Text(
                ('copyright').tr(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ]),
      ),
    );
  }
}
