import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/permission.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/user.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/chat/chat_page.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/dashboard/dashboard_page.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/settings/settings_page.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/students/students_page.dart';

class MainPageWithNoPermission extends HookWidget {
  const MainPageWithNoPermission({
    super.key,
    required User user,
  }) : _user = user;

  final User _user;

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = useState(0);
    final canAccessDashboard = _user.permissions.contains(Permission.dashboard);
    final canAccessStudents = _user.permissions.contains(Permission.students);
    final canAccessChat = _user.permissions.contains(Permission.chat);
    final canAccessSettings = _user.permissions.contains(Permission.setting);

    final pages = [
      DashboardPage(canAccess: canAccessDashboard),
      StudentsPage(canAccess: canAccessStudents),
      ChatPage(canAccess: canAccessChat),
      SettingsPage(canAccess: canAccessSettings),
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
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups),
            label: 'Students',
          ),
          NavigationDestination(
            icon: Badge.count(
              count: 3,
              child: Icon(Icons.chat_outlined),
            ),
            selectedIcon: Badge.count(
              count: 3,
              child: Icon(Icons.chat),
            ),
            label: 'Chat',
          ),
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
