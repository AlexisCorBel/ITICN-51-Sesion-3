import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {

  final Function(Map<String, String>) onAdd;

  AddContactScreen({required this.onAdd});

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  String tipoNumero = "Móvil";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo contacto"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nombre",
              ),
            ),

            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Teléfono",
              ),
            ),

            DropdownButtonFormField<String>(
              value: tipoNumero,
              decoration: InputDecoration(
                labelText: "Tipo de número",
              ),
              items: ["Móvil", "Casa", "Trabajo"]
                  .map((tipo) => DropdownMenuItem(
                        value: tipo,
                        child: Text(tipo),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  tipoNumero = value!;
                });
              },
            ),

            SizedBox(height: 30),

            ElevatedButton(
              child: Text("Guardar contacto"),
              onPressed: () {

                final newContact = {
                  "name": nameController.text,
                  "phone": phoneController.text,
                  "type":  tipoNumero,
                };

                widget.onAdd(newContact);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}