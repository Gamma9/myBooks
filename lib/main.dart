import 'package:flutter/material.dart';
import 'package:mybooks/providers/auth.provider.dart';
import 'package:mybooks/providers/definitions.provider.dart';
import 'package:mybooks/providers/sessions.provider.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:mybooks/providers/library.provider.dart';
import 'package:mybooks/providers/notifications.provider.dart';

// Screens
import './screens/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LibraryProvider>(
          create: (_) => LibraryProvider(),
        ),
        ChangeNotifierProvider<NotificationsProvider>(
          create: (_) => NotificationsProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<SessionsProvider>(
          create: (_) => SessionsProvider(),
        ),
        ChangeNotifierProvider<DefinitionsProvider>(
          create: (_) => DefinitionsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'My Books',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
