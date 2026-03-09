import 'package:flutter/material.dart';

class PoolDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Pool Details")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              "Goa Trip",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            LinearProgressIndicator(
              value: 0.8,
              backgroundColor: Colors.grey[300],
              color: Colors.black,
            ),

            SizedBox(height: 10),

            Text("₹16000 / ₹20000"),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: Text("Contribute Money"),
            )
          ],
        ),
      ),
    );
  }
}