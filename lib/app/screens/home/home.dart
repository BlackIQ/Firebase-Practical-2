import 'package:firebaseauth/app/models/user.dart';
import 'package:firebaseauth/app/services/auth.dart';
import 'package:firebaseauth/app/services/database.dart';
import 'package:firebaseauth/app/widgets/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
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
        title: Text(
          'Home',
          style: GoogleFonts.playfairDisplay(),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          _home(),
          _vote(),
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
            icon: FaIcon(FontAwesomeIcons.plus),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidHeart),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cogs),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _github = TextEditingController();

  Widget _home() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Name',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Amirhossein',
              labelText: 'Name',
              icon: FaIcon(
                FontAwesomeIcons.solidIdBadge,
              ),
            ),
            controller: _name,
          ),
          SizedBox(height: 20),
          Text(
            'Username',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'BlackIW',
              labelText: 'Username',
              icon: FaIcon(
                FontAwesomeIcons.github,
              ),
            ),
            controller: _github,
          ),
          SizedBox(height: 20),
          Text(
            'Age',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: '18',
              labelText: 'Age',
              icon: FaIcon(
                FontAwesomeIcons.candyCane,
              ),
            ),
            controller: _age,
          ),
          SizedBox(height: 20),
          Text(
            'Gender',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'True or False | True : Male',
              labelText: 'Gender',
              icon: FaIcon(
                FontAwesomeIcons.male,
              ),
            ),
            controller: _gender,
          ),
        ],
      ),
    );
  }

  Widget _vote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: StreamBuilder(
            stream: developers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          snapshot.data.documents[index].reference.updateData({
                            'votes':
                                snapshot.data.documents[index]['votes'] + 1,
                          });
                        },
                        onLongPress: () {
                          launch(snapshot.data.documents[index]['github']);
                        },
                        trailing: Text(
                          snapshot.data.documents[index]['votes'].toString(),
                        ),
                        leading: snapshot.data.documents[index]['gender']
                            ? FaIcon(FontAwesomeIcons.male)
                            : FaIcon(FontAwesomeIcons.female),
                        title: Text(
                          snapshot.data.documents[index]['name'],
                        ),
                        subtitle: Text(
                          snapshot.data.documents[index]['age'].toString(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.blueGrey,
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _setings(User user) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueGrey,
                backgroundImage:
                    user.profile != null ? NetworkImage(user.profile) : null,
                child: user.profile == null
                    ? FaIcon(FontAwesomeIcons.camera, size: 40)
                    : null,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            user.name != null ? '${user.name}' : 'Name is empty',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            user.email != null ? '${user.email}' : 'Email is empty',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
