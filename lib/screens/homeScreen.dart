import 'package:flutter/material.dart';

// Screens
import 'package:mybooks/screens/libraryScreen.dart';
import 'package:mybooks/screens/readingSessionsScreen.dart';
import 'package:mybooks/screens/newBookScreen.dart';
import 'package:mybooks/screens/userProfileScreen.dart';
import 'package:mybooks/widgets/drawerItems.dart';

class HomeScreen extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    ReadingSessionsScreen(),
    LibraryScreen(),
    UserProfile(),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _dropdownVal = 'One';
  bool nfcStatus;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navToNewBook() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return NewBook();
        },
      ),
    );
  }

  String activateNFC() {
    setState(() {
      this.nfcStatus = !this.nfcStatus;
    });
    if (this.nfcStatus == false) {
      return 'OFF';
    } else if (this.nfcStatus == true) {
      return 'ON';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Books'),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              setState(() {
                this._dropdownVal = result;
                print(this._dropdownVal);
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem<String>(
                value: "ON",
                child: Text('Turn On NFC (OFF)'),
              ),
              const PopupMenuItem<String>(
                value: "Testing 2",
                child: Text('Testing 2'),
              ),
              const PopupMenuItem<String>(
                value: "Testing 3",
                child: Text('Testing 3'),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: DrawerItems(),
      ),
      body: Container(
        child: Center(
          child: this.widget._widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Library'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColorDark,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navToNewBook(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
