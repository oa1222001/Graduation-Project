import 'package:flutter/material.dart';
import 'package:women_safty/screens/bottomNavBar.dart';
import 'package:women_safty/screens/login.dart';
import 'package:women_safty/sideScreens/changeNumber.dart';
import 'package:women_safty/sideScreens/changePassword.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List<String> itemTitle = [
    'Change number', 'Change password', 'Log out'
  ];

  List<IconData> itemIcon = [
    Icons.person_pin, Icons.password, Icons.logout
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70.0,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 30.0,
            color: Colors.pink,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNavBar()),
            );
          },
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.pink,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20.0,),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: itemTitle.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Icon(
                  itemIcon[index],
                  color: Colors.pink,
                  size: 25.0,
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.navigate_next,
                    size: 25.0,
                    color: Colors.pink,
                  ),
                  onPressed: () {
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNumber(),
                          ),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePassword(),
                          ),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                        break;
                      default:
                        break;
                    }
                  },
                ),
                title: Text(
                  itemTitle[index],
                  style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
