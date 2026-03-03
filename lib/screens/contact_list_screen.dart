import 'package:flutter/material.dart';
import 'contact_detail_screen.dart';
import 'add_contact_screen.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {

  List<Map<String, String>> contacts = [];

  void addContact(Map<String, String> newContact) {
    setState(() {
      contacts.add(newContact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos"),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {

          final contact = contacts[index];

          return ListTile(
            leading: Icon(Icons.person),
            title: Text(contact["name"]!),
            subtitle: Text(contact["phone"]!),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetailScreen(contact: contact),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactScreen(onAdd: addContact),
            ),
          );

        },
      ),
    );
  }
}