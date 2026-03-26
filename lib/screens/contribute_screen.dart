import 'package:flutter/material.dart';

class ContributeScreen extends StatefulWidget {
  const ContributeScreen({super.key, required this.remainingAmount});

  final int remainingAmount;

  @override
  State<ContributeScreen> createState() => _ContributeScreenState();
}

class _ContributeScreenState extends State<ContributeScreen> {
  final upiController = TextEditingController();
  final amountController = TextEditingController();

  bool paymentDone = false;
  bool paymentFailed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contribute"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter UPI ID",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: upiController,
              decoration: const InputDecoration(
                hintText: "example@upi",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter Amount",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Max Rs.${widget.remainingAmount}",
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final enteredAmount =
                      int.tryParse(amountController.text.trim()) ?? 0;
                  final hasValidUpi = upiController.text.trim().isNotEmpty;

                  if (!hasValidUpi ||
                      enteredAmount <= 0 ||
                      enteredAmount > widget.remainingAmount) {
                    setState(() {
                      paymentDone = false;
                      paymentFailed = true;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Payment failed. Check the UPI ID and amount."),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  setState(() {
                    paymentDone = true;
                    paymentFailed = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: paymentDone
                      ? Colors.green
                      : paymentFailed
                          ? Colors.red
                          : Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  paymentDone ? "Payment Successful" : "Pay",
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (paymentDone)
              const Center(
                child: Text(
                  "Contribution added to pool",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.green,
                  ),
                ),
              ),
            if (paymentFailed)
              const Center(
                child: Text(
                  "Payment failed",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
