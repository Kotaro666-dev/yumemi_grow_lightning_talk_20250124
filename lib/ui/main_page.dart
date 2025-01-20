import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/user.dart';

class MainPage extends HookWidget {
  const MainPage({
    super.key,
    required User user,
  }) : _user = user;

  final User _user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final currentPageIndex = useState(0);

    final pages = [
      Center(child: Text("Dashboard Page", style: textTheme.headlineMedium)),
      Center(child: Text('Students Page', style: textTheme.headlineMedium)),
      Center(child: Text('Chat Page', style: textTheme.headlineMedium)),
      Center(child: Text('Settings Page', style: textTheme.headlineMedium)),
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
        destinations: const [
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
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat),
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
