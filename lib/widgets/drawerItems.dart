import 'package:flutter/material.dart';
import 'package:mybooks/screens/bookDefinitionsScreen.dart';

// Screens
import 'package:mybooks/screens/misc/notifications.dart';
import 'package:mybooks/screens/misc/settings.dart';

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

    void navToDefinitions() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return BookDefinitionsScreen();
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
          leading: Icon(Icons.notifications),
          title: Text('Definitions'),
          onTap: () => navToDefinitions(),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
          onTap: () => navToNotifications(),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Settings'),
          onTap: () => navToSettings(),
        ),
      ],
    );
  }
}
