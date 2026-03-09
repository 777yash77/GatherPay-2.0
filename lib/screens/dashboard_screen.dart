import 'package:flutter/material.dart';
import 'create_pool_screen.dart';
import 'pool_details_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("GatherPay"),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreatePoolScreen()),
          );
        },
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Welcome Text
            Text(
              "Welcome back 👋",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 5),

            Text(
              "Small contributions build big dreams.",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),

            SizedBox(height: 20),

            /// Decorative Banner
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1554224155-6726b3ff858f"
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 25),

            /// Section Title
            Text(
              "Active Pools",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            /// Pool Card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PoolDetailsScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Goa Trip Pool",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      "₹16000 / ₹20000",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),

                    SizedBox(height: 10),

                    LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Colors.grey[300],
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}