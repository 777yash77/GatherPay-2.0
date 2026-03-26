import 'package:flutter/material.dart';
import 'contribute_screen.dart';

class PoolDetailsScreen extends StatefulWidget {
  const PoolDetailsScreen({super.key, required this.pool});

  final Map<String, dynamic> pool;

  @override
  State<PoolDetailsScreen> createState() => _PoolDetailsScreenState();
}

class _PoolDetailsScreenState extends State<PoolDetailsScreen> {
  late String poolName;
  late int targetAmount;
  late int collected;

  final String admin = "Rahul";

  final List<Map<String, dynamic>> members = [
    {"name": "Rahul", "amount": 200},
    {"name": "Arun", "amount": 5000},
    {"name": "Vikram", "amount": 1000},
    {"name": "Karthik", "amount": 0},
  ];

  @override
  void initState() {
    super.initState();
    poolName = widget.pool["name"];
    targetAmount = widget.pool["target"];
    collected = widget.pool["collected"];
  }

  @override
  Widget build(BuildContext context) {
    final double progress = collected / targetAmount;
    final int perPersonAmount = targetAmount ~/ members.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pool Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              poolName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(
                minHeight: 12,
                value: progress,
                color: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Rs.$collected / Rs.$targetAmount",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ContributeScreen(
                        remainingAmount: targetAmount - collected,
                      ),
                    ),
                  );
                },
                child: const Text("Contribute Money"),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Admin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  admin[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(admin),
              subtitle: const Text("Pool Creator"),
            ),
            const SizedBox(height: 25),
            const Text(
              "Members Contributions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: members.map((member) {
                final int paid = member["amount"];
                final bool isPaid = paid >= perPersonAmount;

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text(
                        member["name"][0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(member["name"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rs.$paid / Rs.$perPersonAmount"),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: LinearProgressIndicator(
                            minHeight: 8,
                            value: paid / perPersonAmount,
                            backgroundColor: Colors.white,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      isPaid ? Icons.check_circle : Icons.circle_outlined,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
