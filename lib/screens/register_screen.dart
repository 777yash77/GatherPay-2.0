import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser() {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    print("User Registered");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Icon(
                Icons.person_add,
                size: 70,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Join GatherPay and start pooling money",
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
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: registerUser,
                        child: const Text("Register"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
