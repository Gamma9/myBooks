import 'package:flutter/material.dart';
import 'package:mybooks/providers/notifications.provider.dart';
import 'package:mybooks/widgets/misc/noNotifications.dart';
import 'package:mybooks/widgets/misc/notificationsList.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationsProvider = Provider.of<NotificationsProvider>(context);
    final notifications = notificationsProvider.getAllNotifications;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: notifications.length <= 0
          ? NoNotifications()
          : NotificationsList(notifications),
    );
  }
}
