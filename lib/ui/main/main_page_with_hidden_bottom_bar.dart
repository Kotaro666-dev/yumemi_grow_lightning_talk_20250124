import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/permission.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/user.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/chat/chat_page.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/dashboard/dashboard_page.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/settings/settings_page.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/students/students_page.dart';

class MainPageWithHiddenBottomBar extends HookWidget {
  const MainPageWithHiddenBottomBar({
    super.key,
    required User user,
  }) : _user = user;

  final User _user;

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = useState(0);

    final pages = [
      if (_user.permissions.contains(Permission.dashboard)) DashboardPage(),
      if (_user.permissions.contains(Permission.students)) StudentsPage(),
      if (_user.permissions.contains(Permission.chat)) ChatPage(),
      if (_user.permissions.contains(Permission.setting)) SettingsPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: pages[currentPageIndex.value],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          currentPageIndex.value = index;
        },
        selectedIndex: currentPageIndex.value,
        destinations: [
          if (_user.permissions.contains(Permission.dashboard))
            NavigationDestination(
              icon: Icon(Icons.list_outlined),
              selectedIcon: Icon(Icons.list),
              label: 'Dashboard',
            ),
          if (_user.permissions.contains(Permission.students))
            NavigationDestination(
              icon: Icon(Icons.groups_outlined),
              selectedIcon: Icon(Icons.groups),
              label: 'Students',
            ),
          if (_user.permissions.contains(Permission.chat))
            NavigationDestination(
              icon: Icon(Icons.chat_outlined),
              selectedIcon: Icon(Icons.chat),
              label: 'Chat',
            ),
          if (_user.permissions.contains(Permission.setting))
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'Settings',
            ),
        ],
      ),
    );
  }
}
