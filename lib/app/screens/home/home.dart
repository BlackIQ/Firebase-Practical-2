import 'package:firebaseauth/app/models/user.dart';
import 'package:firebaseauth/app/services/auth.dart';
import 'package:firebaseauth/app/widgets/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logout?'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Are you sure to logout?'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FormTextButton(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        text: 'Cencel',
                      ),
                      FormTextButton(
                        text: 'Yes. Logout',
                        onTap: () async {
                          Navigator.of(context).pop();
                          await _auth.signOut();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
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
          _setings(user),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changePage,
        backgroundColor: Colors.grey[100],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey[400],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cogs),
            label: 'Settings',
          ),
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

  Widget _setings(User user) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueGrey,
            backgroundImage: user.profile != null ? NetworkImage(user.profile) : null,
            child: user.profile == null ? FaIcon(FontAwesomeIcons.camera, size: 40) : null,
          ),
          SizedBox(height: 20),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
