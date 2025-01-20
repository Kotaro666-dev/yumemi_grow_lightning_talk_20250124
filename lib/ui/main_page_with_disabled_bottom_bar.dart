import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/permission.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/user.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/chat_page.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/dashboard_page.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/settings_page.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/students_page.dart';

class MainPageWithDisabledBottomBar extends HookWidget {
  const MainPageWithDisabledBottomBar({
    super.key,
    required User user,
  }) : _user = user;

  final User _user;

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = useState(0);
    final isDashboardEnabled = _user.permissions.contains(Permission.dashboard);
    final isStudentsEnabled = _user.permissions.contains(Permission.students);
    final isChatEnabled = _user.permissions.contains(Permission.chat);
    final isSettingsEnabled = _user.permissions.contains(Permission.setting);

    final pages = [
      DashboardPage(),
      StudentsPage(),
      ChatPage(),
      SettingsPage(),
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
          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            selectedIcon: Icon(Icons.list),
            label: 'Dashboard',
            enabled: isDashboardEnabled,
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups),
            label: 'Students',
            enabled: isStudentsEnabled,
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat),
            label: 'Chat',
            enabled: isChatEnabled,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
            enabled: isSettingsEnabled,
          ),
        ],
      ),
    );
  }
}
