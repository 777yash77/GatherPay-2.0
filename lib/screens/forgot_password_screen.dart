import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                Icons.lock_reset,
                size: 70,
                color: Colors.black,
              ),

              SizedBox(height: 15),

              Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              Text(
                "Enter your email to receive a reset link",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),

              SizedBox(height: 30),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Reset link sent to your email"),
                      ),
                    );

                  },
                  child: Text("Send Reset Link"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}