import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final mobileController = TextEditingController();

  void sendOTP(BuildContext context) {
    final String mobile = mobileController.text.trim();

    if (mobile.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter a valid 10-digit mobile number"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("OTP sent to $mobile"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock_reset,
                size: 70,
                color: Colors.black,
              ),
              const SizedBox(height: 15),
              const Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Enter your mobile number to receive OTP",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
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
                  children: [
                    TextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        labelText: "Mobile Number",
                        prefixIcon: Icon(Icons.phone),
                        counterText: "",
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          sendOTP(context);
                        },
                        child: const Text("Send OTP"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
