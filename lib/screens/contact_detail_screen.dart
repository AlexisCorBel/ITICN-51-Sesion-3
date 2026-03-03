import 'package:flutter/material.dart';

class ContactDetailScreen extends StatelessWidget {

  final Map<String, String> contact;

  ContactDetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de contacto"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              contact["name"]!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Teléfono: ${contact["phone"]}",
              style: TextStyle(fontSize: 18),
            ),
            
            SizedBox(height: 20),

            Text(
              "Tipo: ${contact["type"]}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}