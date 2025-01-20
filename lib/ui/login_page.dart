import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/main_page.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // User list
    final List<String> users = ["Alice", "Bob", "Charlie"];

    // State for selected user
    final selectedUser = useState(users[0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownMenu<String>(
              initialSelection: users[0],
              label: const Text('User'),
              onSelected: (value) {
                if (value != null) {
                  selectedUser.value = value;
                }
              },
              dropdownMenuEntries: users.map<DropdownMenuEntry<String>>((user) {
                return DropdownMenuEntry<String>(
                  value: user,
                  label: user,
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Go to MainPage.
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
