import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/offering_model.dart';

// Assuming Offering, ServiceType, and Category are defined as before

class OfferingCard extends StatelessWidget {
  final Offering offering;
  final VoidCallback? onTap; // Optional callback for tap events

  const OfferingCard({
    Key? key,
    required this.offering,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8, // Add shadow for depth
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                offering.title,
                // style: Theme.of(context).textTheme.headline6?.copyWith(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.teal, // Accent color for title
                //     ),
              ),
              const SizedBox(height: 8), // Space between title and description
              // Practitioner Name
              Text(
                'Practitioner: ${offering.practitionerName}',
                // style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 4), // Space
              // Description
              Text(
                offering.description,
                maxLines: 3, // Limit lines for better presentation
                overflow: TextOverflow.ellipsis, // Ellipsis for overflow text
                // style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 8), // Space
              // Details Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _DetailChip(
                    label:
                        'Category: ${offering.category.toString().split('.').last}',
                    color: Colors.blueAccent,
                  ),
                  _DetailChip(
                    label: 'Duration: ${offering.duration.inMinutes} min',
                    color: Colors.orangeAccent,
                  ),
                  _DetailChip(
                    label: 'Type: ${offering.type.toString().split('.').last}',
                    color: Colors.purpleAccent,
                  ),
                ],
              ),
              const SizedBox(height: 8), // Space
              // Price
              Text(
                'Price: \$${offering.price.toStringAsFixed(2)}',
                // style: Theme.of(context).textTheme.headline6?.copyWith(
                //       color: Colors.green, // Accent color for price
                //       fontWeight: FontWeight.bold,
                //     ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Detail chip for additional information
class _DetailChip extends StatelessWidget {
  final String label;
  final Color color;

  const _DetailChip({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: color.withOpacity(0.2), // Light background
      labelStyle: TextStyle(color: color), // Text color matches chip color
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }
}
