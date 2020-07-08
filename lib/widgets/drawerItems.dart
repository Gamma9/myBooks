import 'package:flutter/material.dart';
import 'package:mybooks/screens/auth/loginScreen.dart';
import 'package:mybooks/screens/definitionsScreen.dart';

// Screens
import 'package:mybooks/screens/misc/notificationsScreen.dart';
import 'package:mybooks/screens/misc/settingsScreen.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void navToSettings() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return SettingsScreen();
          },
        ),
      );
    }

    void navToNotifications() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return NotificationsScreen();
          },
        ),
      );
    }

    void logout() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return LoginScreen();
          },
        ),
      );
    }

    void navToDefinitions() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return DefinitionsScreen();
          },
        ),
      );
    }

    return ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          padding: EdgeInsets.all(16),
          child: Container(
            child: Text(
              'My Books',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.text_rotate_vertical,
            color: Theme.of(context).primaryColor,
          ),
          title: Text('Definitions'),
          onTap: () => navToDefinitions(),
        ),
        ListTile(
          leading: Icon(
            Icons.notifications,
            color: Theme.of(context).primaryColor,
          ),
          title: Text('Notifications'),
          onTap: () => navToNotifications(),
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            color: Theme.of(context).primaryColor,
          ),
          title: Text('Settings'),
          onTap: () => navToSettings(),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.highlight_off,
            color: Colors.red,
          ),
          title: Text('Logout'),
          onTap: () => logout(),
        ),
      ],
    );
  }
}
