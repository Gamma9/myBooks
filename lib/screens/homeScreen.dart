import 'package:flutter/material.dart';

// Screens
import 'package:mybooks/screens/books.dart';
import 'package:mybooks/screens/mainBooks.dart';
import 'package:mybooks/screens/newBook.dart';
import 'package:mybooks/screens/userProfile.dart';
import 'package:mybooks/widgets/drawerItems.dart';

class HomeScreen extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    MainBooks(),
    Books(),
    UserProfile(),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _dropdownVal = 'One';

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

  void displayQuickSettings() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cam\'s Books'),
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
                value: "Testing",
                child: Text('Testing'),
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
            title: Text('Books'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
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
