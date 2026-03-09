import 'package:flutter/material.dart';

class CreatePoolScreen extends StatelessWidget {

  final nameController = TextEditingController();
  final targetController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Create Pool")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Pool Name"),
            ),

            SizedBox(height: 15),

            TextField(
              controller: targetController,
              decoration: InputDecoration(labelText: "Target Amount"),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {},
              child: Text("Create Pool"),
            ),
          ],
        ),
      ),
    );
  }
}