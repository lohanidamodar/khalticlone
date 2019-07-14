import 'package:flutter/material.dart';
import 'package:flutter_khalti/flutter_khalti.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    amount = double.parse(val);
                  });
                },
                decoration: InputDecoration(hintText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                FlutterKhalti(
                  urlSchemeIOS: "KhaltiPayFlutterExampleScheme",
                  publicKey: "test_public_key_eacadfb91994475d8bebfa577b0bca68",
                  productId: "1233",
                  productName: "Test 2",
                  amount: amount,
                  customData: {
                    "test": "custom",
                  },
                ).initPayment(
                  onSuccess: (data) {
                    print("success");
                    print(data);
                  },
                  onError: (error) {
                    print("error");
                    print(error);
                  },
                );
              },
              child: Text('Pay',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Theme.of(context).primaryColor,
            ),
            Text(
              'Note: Make sure your device have khalti app',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
