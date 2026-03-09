import 'package:flutter/material.dart';

class CreatePoolScreen extends StatefulWidget {
  @override
  _CreatePoolScreenState createState() => _CreatePoolScreenState();
}

class _CreatePoolScreenState extends State<CreatePoolScreen> {

  final nameController = TextEditingController();
  final targetController = TextEditingController();
  final membersController = TextEditingController();

  double sharePerPerson = 0;

  void calculateShare() {
    double target = double.tryParse(targetController.text) ?? 0;
    int members = int.tryParse(membersController.text) ?? 0;

    if (members > 0) {
      setState(() {
        sharePerPerson = target / members;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Pool"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// Pool Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Pool Name",
              ),
            ),

            SizedBox(height: 15),

            /// Target Amount
            TextField(
              controller: targetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Target Amount",
              ),
              onChanged: (value) => calculateShare(),
            ),

            SizedBox(height: 15),

            /// Total Members
            TextField(
              controller: membersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Total Members",
              ),
              onChanged: (value) => calculateShare(),
            ),

            SizedBox(height: 20),

            /// Share per person
            if (sharePerPerson > 0)
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Each member should contribute: ₹${sharePerPerson.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // API call later
                },
                child: Text("Create Pool"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}