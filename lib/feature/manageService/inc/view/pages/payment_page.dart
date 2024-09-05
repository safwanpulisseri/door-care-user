import 'package:flutter/material.dart';
import '../../data/services/remote/stripe_service.dart';

class PaymentPage extends StatefulWidget {
  final num amount;
  final String bookingId;
  final String workerId;
  const PaymentPage({
    super.key,
    required this.amount,
    required this.bookingId,
    required this.workerId,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Stripe Payment",
        ),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  StripeService.instance.makePayment();
                },
                child: const Text('Pay')),
          ],
        ),
      ),
    );
  }
}
