import 'package:flutter/material.dart';
import 'create_pool_screen.dart';
import 'pool_details_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = true;

  final List<Map<String, dynamic>> pools = [
    {
      "name": "Goa Trip Pool",
      "collected": 16000,
      "target": 20000,
    }
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    });
  }

  void addPool(Map<String, dynamic> newPool) {
    setState(() {
      pools.add(newPool);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final newPool = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreatePoolScreen(),
            ),
          );

          if (newPool != null) {
            addPool(newPool);
          }
        },
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Small contributions build big dreams.",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 190,
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Collect together.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Track every pool in one place with a strict black-and-white interface.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Active Pools",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pools.length,
                  itemBuilder: (context, index) {
                    final pool = pools[index];
                    final double progress = pool["collected"] / pool["target"];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PoolDetailsScreen(pool: pool),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.black, width: 1.5),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 0,
                              offset: Offset(6, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pool["name"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text("Rs.${pool["collected"]} / Rs.${pool["target"]}"),
                            const SizedBox(height: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: LinearProgressIndicator(
                                minHeight: 10,
                                value: progress,
                                backgroundColor: Colors.white,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.white,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      size: 80,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "GatherPay",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    CircularProgressIndicator(
                      color: Colors.black,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Loading your pools...",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
