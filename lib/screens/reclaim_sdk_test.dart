import 'package:flutter/material.dart';
import 'package:reclaim_sdk/flutter_reclaim.dart';
import 'package:reclaim_sdk/types.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "";

  ProofRequest proofRequest =
      ProofRequest(applicationId: '0xC27D0eEC20eEa452023d1c58541Efd782F41bdb1');

  void startVerificationFlow() async {
    final providerIds = [
      '9ae104a3-7e44-4973-a462-31a33c11ffc7', // LinkedIn Dashboard Analytics
      'c94476a0-8a75-4563-b70a-bf6124d7c59b', // Kaggle username
      '2b22db5c-78d9-4d82-84f0-a9e0a4ed0470', // Binance KYC Level
    ];
    proofRequest.setAppCallbackUrl("app://mydeapp.com");

    await proofRequest.buildProofRequest(providerIds[0]);

    proofRequest.setSignature(proofRequest.generateSignature(
        '0xebd3046bdfade67d7d4d096be3d1e658a63034a26bca2d51f806822b4a8f6f44'));

    final verificationRequest = await proofRequest.createVerificationRequest();

    final startSessionParam = StartSessionParams(
      onSuccessCallback: (proof) => setState(() {
        data = jsonEncode(proof.claimData);
      }),
      onFailureCallback: (error) => {
        setState(() {
          data = 'Error: $error';
        })
      },
    );

    await proofRequest.startSession(startSessionParam);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Prove that you have Steam ID By clicking on Verify button:',
            ),
            Text(
              data,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startVerificationFlow,
        tooltip: 'Verify ',
        child: const Text('Verify'),
      ),
    );
  }
}
