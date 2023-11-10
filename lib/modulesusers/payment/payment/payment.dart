import 'package:flutter/material.dart';

import 'package:pfa_project/modulesusers/payment/facture_card/factCard.dart';
import 'package:pfa_project/modulesusers/payment/facture_cash/fact_Cash.dart';
import 'package:pfa_project/modulesusers/payment/facture_check/fact_Check.dart';

class PaymentMethod {
  String name;
  IconData icon;
  PaymentMethod({required this.name, required this.icon});
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? _selectedPaymentMethod;

  List<PaymentMethod> paymentMethods = [
    PaymentMethod(name: "Credit Card", icon: Icons.credit_card),
    PaymentMethod(name: "Check", icon: Icons.monetization_on),
    PaymentMethod(name: "Cash", icon: Icons.account_balance_wallet),
  ];

  void _selectPaymentMethod(PaymentMethod paymentMethod) {
    setState(() {
      _selectedPaymentMethod = paymentMethod;
    });
  }

  void _navigateToCashPaymentScreen(BuildContext context) {
    // Navigate to the payment confirmation screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FactCash()),
    );
  }

  void _navigateToCreditCardScreen(BuildContext context) {
    // Navigate to the credit card payment screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FactCard()),
    );
  }

  void _navigateToCheckPaymentScreen(BuildContext context) {
    // Navigate to the check payment screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FactCheck()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
            colors: [
              Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
              Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'Select payment method:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (BuildContext context, int index) {
                  PaymentMethod paymentMethod = paymentMethods[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        paymentMethod.icon,
                        color: _selectedPaymentMethod == paymentMethod
                            ? Colors.purple
                            : Colors.grey,
                      ),
                      title: Text(paymentMethod.name),
                      trailing: _selectedPaymentMethod == paymentMethod
                          ? Icon(Icons.check, color: Colors.purple)
                          : null,
                      onTap: () => _selectPaymentMethod(paymentMethod),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedPaymentMethod != null
                  ? () {
                      if (_selectedPaymentMethod != null) {
                        if (_selectedPaymentMethod!.name == 'Credit Card') {
                          _navigateToCreditCardScreen(context);
                        } else if (_selectedPaymentMethod!.name == 'Check') {
                          _navigateToCheckPaymentScreen(context);
                        } else if (_selectedPaymentMethod!.name == 'Cash') {
                          _navigateToCashPaymentScreen(context);
                        }
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
              child: Text('Continue'),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
