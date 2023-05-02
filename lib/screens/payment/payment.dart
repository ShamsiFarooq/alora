import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = 0;
  final paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];
  final paymentLabels = [
    'Credit card / Debit Card',
    'Cash on Delivery',
    'Paypal',
    'Google wallet',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color1,
        appBar: AppBar(
          backgroundColor: color5,
          title: Text('Payment'),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Radio(
                value: value,
                groupValue: value,
                onChanged: (i) => setState(
                  () {
                    value = i!;
                  },
                ),
              ),
              title: Text(
                paymentLabels[index],
                style: TextStyle(color: color5),
              ),
              trailing: Icon(
                paymentIcons[index],
                color: color5,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: paymentLabels.length,
        ),
      ),
    );
  }
}
