import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.number,
      required this.heading,
      required this.value,
      required this.url});

  final String number;
  final String heading;
  final String value;
  final String url;

  Future<void> _launchURL() async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL();
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              // bullet point, item number
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Text(
                  number,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                heading,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
