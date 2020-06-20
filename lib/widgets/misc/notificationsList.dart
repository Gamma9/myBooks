import 'package:flutter/material.dart';
import 'package:mybooks/widgets/misc/notitificationItem.dart';

class NotificationsList extends StatelessWidget {
  final List<Notification> notifications;

  NotificationsList(this.notifications);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return NotificationItem();
        // Switch case for notification type
      },
      itemCount: this.notifications.length,
    );
  }
}
