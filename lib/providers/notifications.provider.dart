import 'package:flutter/material.dart';

class NotificationsProvider with ChangeNotifier {
  List<Notification> _notifications = [];

  List<Notification> get getAllNotifications {
    return this._notifications;
  }
}
