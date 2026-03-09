import 'package:flutter/material.dart';
import 'create_pool_screen.dart';
import 'pool_details_screen.dart';

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Your Pools")),

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

      body: ListView(
        children: [

          ListTile(
            title: Text("Goa Trip Pool"),
            subtitle: Text("Collected ₹16000 / ₹20000"),
            trailing: Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PoolDetailsScreen()),
              );
            },
          ),

        ],
      ),
    );
  }
}