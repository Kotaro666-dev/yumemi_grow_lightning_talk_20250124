import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/mock_users.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/user.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/main_page.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = mockUsers;
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
            DropdownMenu<User>(
              initialSelection: users[0],
              label: const Text('User'),
              onSelected: (value) {
                if (value != null) {
                  selectedUser.value = value;
                }
              },
              dropdownMenuEntries: users.map<DropdownMenuEntry<User>>((user) {
                return DropdownMenuEntry<User>(
                  value: user,
                  label: user.name,
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Go to MainPage.
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MainPage(
                      user: selectedUser.value,
                    ),
                  ),
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
