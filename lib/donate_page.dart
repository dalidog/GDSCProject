import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  Future<void> _openDonationPage() async {
    const url =
        'https://www.surfrider.org/campaigns/coastal-bluff-in-santa-barbara-saved?form=donate'; // Replace with your actual donation page URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openDonationPage,
          child: const Text('Donate Now'),
        ),
      ),
    );
  }
}
