import 'package:firebaseauth/app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthenticationService _auth = AuthenticationService();

  int _selectedIndex = 0;
  PageController pageController = PageController();

  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // pageController.jumpToPage(index);
    pageController.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ],
        title: Text('Firebase Home'),
      ),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          _home(),
          _search(),
          _setings(),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          onTap: changePage,
          backgroundColor: Colors.grey[200],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey[400],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.home), label: 'Home',),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.search), label: 'Search',),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.cogs), label: 'Settings',),
          ],
        ),
    );
  }

  Widget _home() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('Home'),
        ],
      ),
    );
  }

  Widget _search() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('Search'),
        ],
      ),
    );
  }

  Widget _setings() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('Account'),
        ],
      ),
    );
  }
}
