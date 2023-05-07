import 'package:flutter/material.dart';
import 'package:women_safty/component/components.dart';
import 'package:women_safty/screens/Contacts.dart';

class AddContact extends StatefulWidget {

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

  var numberController = TextEditingController();
  var nameController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60.0,
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
              MaterialPageRoute(builder: (context) => TrustContacts()),
            );
          },
        ),
        title: const Text(
          'Add Trusted Contact',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.pink,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0,),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/trust_icon.png'),
                  backgroundColor: Colors.pink,
                ),
              ),

              const SizedBox(height: 40.0),
              defaultFormField(
                controller: nameController,
                label: 'Name',
                type: TextInputType.text,
                colors: Colors.pink,
                prefix: Icons.person,
                validate: (String value)
                {
                  if (value.isEmpty)
                  {
                    return'name must be non empty';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20.0),
              defaultFormField(
                controller: numberController,
                label: 'Phone_Number',
                type: TextInputType.number,
                colors: Colors.pink,
                prefix: Icons.numbers,
                validate: (String value)
                {
                  if (value.isEmpty || value.length < 11)
                  {
                    return'Number must be non empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                height: 50.0,
                width: 50.0,
                child: ElevatedButton(
                  child: Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.pink),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                    onPressed: () {
                      if(formkey.currentState.validate())
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TrustContacts()),
                        );
                      }
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
