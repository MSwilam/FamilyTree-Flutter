import 'package:localize_and_translate/localize_and_translate.dart';

class adminScreen {
  final int Id;
  final String name;
  final int? groupId;
  final int icon;

  adminScreen({
    required this.Id,
    required this.name,
    required this.groupId,
    required this.icon,
  });
  static adminScreen fromJson(json) => adminScreen(
        Id: json['Id'],
        name: json['name'],
        groupId: json['groupId'],
        icon: json['icon'],
      );
}

List<adminScreen> mainScreenList = [
  adminScreen(
    Id: 1,
    name: ('generalGrandparents').tr(),
    icon: 0xe11b,
    groupId: 1,
  ),
  adminScreen(
    Id: 2,
    name: ('familyMember').tr(),
    icon: 0xe11b,
    groupId: 1,
  ),
  adminScreen(
    Id: 3,
    name: ('setting').tr(),
    icon: 0xf0244,
    groupId: 1,
  ),
  adminScreen(
    Id: 4,
    name: ('about').tr(),
    icon: 0xe30a,
    groupId: 1,
  ),
];

List<adminScreen> settingScreenList = [
  adminScreen(
    Id: 1,
    name: ('job_title').tr(),
    icon: 0xe11b,
    groupId: 1,
  ),
  adminScreen(
    Id: 2,
    name: ('department').tr(),
    icon: 0xe11b,
    groupId: 1,
  ),
  adminScreen(
    Id: 3,
    name: ('employee').tr(),
    icon: 0xe11b,
    groupId: 1,
  ),
  adminScreen(
    Id: 4,
    name: ('steps').tr(),
    icon: 0xe11b,
    groupId: 1,
  ),
  adminScreen(
    Id: 5,
    name: ('tasks').tr(),
    icon: 0xe11b,
    groupId: 1,
  ),
  adminScreen(
    Id: 6,
    name: ('tasks_type').tr(),
    icon: 0xe11b,
    groupId: 1,
  ),
  adminScreen(
    Id: 7,
    name: ('work_flow').tr(),
    icon: 0xe11b,
    groupId: 1,
  ),
];
