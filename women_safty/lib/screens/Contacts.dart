import 'package:flutter/material.dart';
import 'package:women_safty/screens/bottomNavBar.dart';
import 'package:women_safty/sideScreens/addContact.dart';

class TrustContacts extends StatefulWidget {

  @override
  _TrustContactsState createState() => _TrustContactsState();
}

class _TrustContactsState extends State<TrustContacts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 65.0,
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
              MaterialPageRoute(builder: (context) => BottomNavBar()),
            );
          },
        ),
        title: const Text(
          'Trusted Contacts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.pink,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20.0,left: 20.0, right: 20.0,),
        child: ListView(
          children: [
            ElevatedButton(
              child: Text(
                'Add Trusted Contact',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(80, 55),
                primary: Colors.pink,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),

                ),

                ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddContact()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
