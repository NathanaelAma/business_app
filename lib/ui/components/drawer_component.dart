import 'package:business_app/core/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, auth, child) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              accountName: Text(auth.currentUser?.userName ?? 'Default'),
              accountEmail: Text(auth.currentCompany!.companyName),
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Pick List'),
              onTap: () {
                Navigator.pushNamed(
                  context, '/picklist',
                );
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      );
    });
  }
}
