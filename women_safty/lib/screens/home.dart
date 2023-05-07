import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 90.0,
        elevation: 0.0,
        leading: Container(
          margin: const EdgeInsets.only(top: 5.0),
         child: Column(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.file_copy,
                size: 30.0,
                color: Colors.pink,
              ),
              onPressed: (){},
            ),
            const Text(
              'Claim',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        ),
        actions: <Widget>[
          Column(
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.policy,
                  size: 30.0,
                  color: Colors.pink,
                ),
                onPressed: () {},
              ),
              const Text(
                'Police',
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
        ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 90.0, left: 10.0),
            child: Text(
              'You can do whatever you want..',
              style: TextStyle(
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.pink,
                height: 1
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0, left: 20.0),
            child: ElevatedButton.icon(
              icon: const Icon(
                Icons.warning,
                size: 40,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                onPrimary: Colors.white,
                shape: (const CircleBorder()),
                minimumSize: const Size(240, 240),
              ),
              label: const Text(
                'Danger',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ), //
        ],
      ),
    );
  }
  /*void _launchEmailApp() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'rhma.eid.eldeeb@gmail.com',
      query: 'subject=Subject Line&body=Body Text',
    );
    Uri _url = params.toString() as Uri;
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }*/
}
