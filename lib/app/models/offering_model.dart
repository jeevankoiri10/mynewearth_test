// Define the enum for service type
enum ServiceType {
  InPerson,
  Online,
}

// Define the enum for category
enum Category {
  Spiritual,
  Mental,
  Emotional,
  Other,
}

class Offering {
  final String practitionerName; // Practitioner Name (Text field)
  final String title; // Title of the service (Text field)
  final String description; // Description of the service (Text area)
  final Category category; // Category (Dropdown)
  final Duration duration; // Duration (e.g., "30 min")
  final ServiceType type; // Type (Radio buttons for In-Person or Online)
  final double price; // Price (Numeric input)

  Offering({
    required this.practitionerName,
    required this.title,
    required this.description,
    required this.category,
    required this.duration,
    required this.type,
    required this.price,
  });

  // Factory constructor to create an Offering instance from JSON
  factory Offering.fromJson(Map<String, dynamic> json) {
    return Offering(
      practitionerName: json['practitionerName'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: Category.values.firstWhere((e) =>
          e.toString() ==
          'Category.${json['category']}'), // Convert string to enum
      duration: Duration(
          minutes: json['duration'] as int), // Expecting duration in minutes
      type: ServiceType.values.firstWhere((e) =>
          e.toString() ==
          'ServiceType.${json['type']}'), // Convert string to enum
      price: (json['price'] as num).toDouble(), // Ensuring price is a double
    );
  }

  // Method to convert an Offering instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'practitionerName': practitionerName,
      'title': title,
      'description': description,
      'category': category
          .toString()
          .split('.')
          .last, // Convert enum to string for JSON
      'duration': duration.inMinutes, // Store duration in minutes
      'type':
          type.toString().split('.').last, // Convert enum to string for JSON
      'price': price,
    };
  }
}

List<Offering> dummyOfferings = [
  Offering(
    practitionerName: 'Alice Johnson',
    title: 'Child Therapy',
    description: 'A safe space for children to express their feelings.',
    category: Category.Spiritual,
    duration: Duration(minutes: 30),
    type: ServiceType.InPerson,
    price: 50.00,
  ),
  Offering(
    practitionerName: 'Bob Smith',
    title: 'Adult Counseling',
    description: 'Guidance and support for adults facing challenges.',
    category: Category.Mental,
    duration: Duration(hours: 1),
    type: ServiceType.Online,
    price: 75.00,
  ),
  Offering(
    practitionerName: 'Charlie Brown',
    title: 'Yoga Classes',
    description: 'Join our relaxing yoga sessions for all levels.',
    category: Category.Emotional,
    duration: Duration(minutes: 45),
    type: ServiceType.InPerson,
    price: 40.00,
  ),
  // Add more dummy offerings as needed
];
