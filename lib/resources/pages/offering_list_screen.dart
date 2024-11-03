import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/offering_model.dart';
import 'package:flutter_app/resources/pages/edit_offering_screen.dart';
import 'package:flutter_app/resources/widgets/offering_card_widget.dart';

// Assuming Offering, OfferingCard, ServiceType, and Category are defined as before

class OfferingsListScreen extends StatelessWidget {
  final List<Offering> offerings;

  // Constructor to receive the list of offerings
  OfferingsListScreen({Key? key, required this.offerings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Holistic Offerings')),
      body: ListView.builder(
        itemCount: offerings.length,
        itemBuilder: (context, index) {
          final offering = offerings[index];
          return OfferingCard(
            offering: offering,
            onTap: () {
              // Handle tap event, e.g., navigate to a detail screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditOfferingScreen(
                      offering: offering), // Example edit screen
                ),
              );
            },
          );
        },
      ),
    );
  }
}
