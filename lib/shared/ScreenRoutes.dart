import 'package:family_tree/models/familyTreeMessages.dart';
import 'package:family_tree/models/generalGrandparents.dart';
import 'package:family_tree/provider/familyTreeMessagesProvider.dart';
import 'package:family_tree/provider/generalGrandparentsProvider.dart';
import 'package:family_tree/screens/familyTreeMessages/createFamilyTreeMessages.dart';
import 'package:family_tree/screens/familyTreeMessages/familyTreeMessagesDetails.dart';
import 'package:family_tree/screens/familyTreeMessages/familyTreeMessagesIndex.dart';
import 'package:family_tree/screens/familyTreeMessages/updateFamilyTreeMessages.dart';
import 'package:family_tree/screens/generalGrandparents/createFamilyNickName.dart';
import 'package:family_tree/screens/generalGrandparents/createFamilyTree.dart';
import 'package:family_tree/screens/generalGrandparents/createGeneralGrandparents.dart';
import 'package:family_tree/screens/generalGrandparents/createResidence.dart';
import 'package:family_tree/screens/generalGrandparents/createWork.dart';
import 'package:family_tree/screens/generalGrandparents/familyNickNameDetails.dart';
import 'package:family_tree/screens/generalGrandparents/familyNickNameIndex.dart';
import 'package:family_tree/screens/generalGrandparents/familyTreeDetails.dart';
import 'package:family_tree/screens/generalGrandparents/familyTreeIndex.dart';
import 'package:family_tree/screens/generalGrandparents/generalGrandparentsDetails.dart';
import 'package:family_tree/screens/generalGrandparents/generalGrandparentsIndex.dart';
import 'package:family_tree/screens/generalGrandparents/residenceDetails.dart';
import 'package:family_tree/screens/generalGrandparents/residenceIndex.dart';
import 'package:family_tree/screens/generalGrandparents/updateFamilyNickName.dart';
import 'package:family_tree/screens/generalGrandparents/updateFamilyTree.dart';
import 'package:family_tree/screens/generalGrandparents/updateGeneralGrandparents.dart';
import 'package:family_tree/screens/generalGrandparents/updateResidence.dart';
import 'package:family_tree/screens/generalGrandparents/updateWork.dart';
import 'package:family_tree/screens/generalGrandparents/workDetails.dart';
import 'package:family_tree/screens/generalGrandparents/workIndex.dart';
import 'package:family_tree/screens/home/about.dart';
import 'package:family_tree/screens/home/home.dart';
import 'package:family_tree/screens/home/setting.dart';
import 'package:family_tree/screens/treeFamily.dart';
import 'package:family_tree/screens/tree_graphview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future mainRouteList(BuildContext context, int Id) {
  if (Id == 1) {
    return generalGrandparentsRoute(context);
  }
  if (Id == 2) {
    return familyTreeRoute(context);
  }
  if (Id == 3) {
    return settingRoute(context);
  }
  if (Id == 4) {
    return aboutRoute(context);
  } else {
    return homeRoute(context);
  }
}

Future settingRouteList(BuildContext context, int Id) {
  if (Id == 1) {
    return familyTreeMessagesRoute(context);
  }
  if (Id == 2) {
    return workRoute(context);
  }
  if (Id == 3) {
    return residenceRoute(context);
  }
  if (Id == 4) {
    return familyNickNameRoute(context);
  } else {
    return homeRoute(context);
  }
}

Future aboutRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const About()),
  );
}

Future generalGrandparentsTreeRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => TreeViewPage()),
  );
}

Future settingRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const SettingScreen()),
  );
}

Future homeRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const Home()),
  );
}

Future familyTreeMessagesRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
              create: (context) {
                return FamilyTreeMessagesProvider();
              },
              child: const FamilyTreeMessagesIndex(),
            )),
  );
}

Future createFamilyTreeMessagesRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => CreateFamilyTreeMessages()),
  );
}

Future updateFamilyTreeMessagesRoute(
    BuildContext context, FamilyTreeMessages familyTreeMessages) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) =>
            UpdateFamilyTreeMessages(familyTreeMessages: familyTreeMessages)),
  );
}

Future familyTreeMessagesdetailRoute(
    BuildContext context, FamilyTreeMessages familyTreeMessages) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) =>
            FamilyTreeMessagesDetails(familyTreeMessages: familyTreeMessages)),
  );
}

Future generalGrandparentsRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
              create: (context) {
                return GeneralGrandparentsProvider();
              },
              child: const GeneralGrandparentsIndex(),
            )),
  );
}

Future createGeneralGrandparentsRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => CreateGeneralGrandparents()),
  );
}

Future updateGeneralGrandparentsRoute(
    BuildContext context, GeneralGrandparents generalGrandparents) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => UpdateGeneralGrandparents(
            generalGrandparents: generalGrandparents)),
  );
}

Future generalGrandparentsdetailRoute(
    BuildContext context, GeneralGrandparents generalGrandparents) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => GeneralGrandparentsDetails(
            generalGrandparents: generalGrandparents)),
  );
}

Future familyTreeRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
              create: (context) {
                return GeneralGrandparentsProvider();
              },
              child: const FamilyTreeIndex(),
            )),
  );
}

Future createFamilyTreeRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => CreateFamilyTree()),
  );
}

Future updateFamilyTreeRoute(BuildContext context, FamilyTree familyTree) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => UpdateFamilyTree(familyTree: familyTree)),
  );
}

Future familyTreedetailRoute(BuildContext context, FamilyTree familyTree) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => FamilyTreeDetails(familyTree: familyTree)),
  );
}

Future familyNickNameRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
              create: (context) {
                return GeneralGrandparentsProvider();
              },
              child: const FamilyNickNameIndex(),
            )),
  );
}

Future createFamilyNickNameRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => CreateFamilyNickName()),
  );
}

Future updateFamilyNickNameRoute(
    BuildContext context, FamilyNickName familyNickName) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) =>
            UpdateFamilyNickName(familyNickName: familyNickName)),
  );
}

Future familyNickNamedetailRoute(
    BuildContext context, FamilyNickName familyNickName) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) =>
            FamilyNickNameDetails(familyNickName: familyNickName)),
  );
}

Future residenceRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
              create: (context) {
                return GeneralGrandparentsProvider();
              },
              child: const ResidenceIndex(),
            )),
  );
}

Future createResidenceRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => CreateResidence()),
  );
}

Future updateResidenceRoute(BuildContext context, Residence residence) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => UpdateResidence(residence: residence)),
  );
}

Future residencedetailRoute(BuildContext context, Residence residence) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => ResidenceDetails(residence: residence)),
  );
}

Future workRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
              create: (context) {
                return GeneralGrandparentsProvider();
              },
              child: const WorkIndex(),
            )),
  );
}

Future createWorkRoute(BuildContext context) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => CreateWork()),
  );
}

Future updateWorkRoute(BuildContext context, Work work) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => UpdateWork(work: work)),
  );
}

Future workdetailRoute(BuildContext context, Work work) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => WorkDetails(work: work)),
  );
}

//NewClassRouter