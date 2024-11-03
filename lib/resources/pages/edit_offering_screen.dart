import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/offering_model.dart';

// Assuming Offering, ServiceType, and Category enums are defined as before

class EditOfferingScreen extends StatefulWidget {
  final Offering offering;

  EditOfferingScreen({Key? key, required this.offering}) : super(key: key);

  @override
  _EditOfferingScreenState createState() => _EditOfferingScreenState();
}

class _EditOfferingScreenState extends State<EditOfferingScreen> {
  final _formKey = GlobalKey<FormState>();
  late String practitionerName;
  late String title;
  late String description;
  late Category category;
  late Duration duration;
  late ServiceType type;
  late double price;

  @override
  void initState() {
    super.initState();
    // Initialize fields with offering data
    practitionerName = widget.offering.practitionerName;
    title = widget.offering.title;
    description = widget.offering.description;
    category = widget.offering.category;
    duration = widget.offering.duration;
    type = widget.offering.type;
    price = widget.offering.price;
  }

  void _saveOffering() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here, you would usually update the offering in your database
      // For now, just print the updated offering
      print(
          'Updated Offering: $practitionerName, $title, $description, $category, $duration, $type, $price');
      Navigator.pop(context); // Go back after saving
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Offering')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: practitionerName,
                decoration: InputDecoration(labelText: 'Practitioner Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a practitioner name' : null,
                onSaved: (value) => practitionerName = value!,
              ),
              TextFormField(
                initialValue: title,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
                onSaved: (value) => title = value!,
              ),
              TextFormField(
                initialValue: description,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
                onSaved: (value) => description = value!,
              ),
              DropdownButtonFormField<Category>(
                value: category,
                decoration: InputDecoration(labelText: 'Category'),
                items: Category.values.map((Category cat) {
                  return DropdownMenuItem<Category>(
                    value: cat,
                    child: Text(cat
                        .toString()
                        .split('.')
                        .last), // Get the string representation of the enum
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    category = value!;
                  });
                },
              ),
              TextFormField(
                initialValue:
                    duration.inMinutes.toString(), // Show duration in minutes
                decoration: InputDecoration(labelText: 'Duration (minutes)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a duration';
                  }
                  return null;
                },
                onSaved: (value) {
                  duration = Duration(minutes: int.parse(value!));
                },
              ),
              ListTile(
                title: const Text('Service Type'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RadioListTile<ServiceType>(
                        title: const Text('In-Person'),
                        value: ServiceType.InPerson,
                        groupValue: type,
                        onChanged: (ServiceType? value) {
                          setState(() {
                            type = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<ServiceType>(
                        title: const Text('Online'),
                        value: ServiceType.Online,
                        groupValue: type,
                        onChanged: (ServiceType? value) {
                          setState(() {
                            type = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                initialValue: price.toString(),
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
                onSaved: (value) {
                  price = double.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveOffering,
                child: const Text('Save Offering'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
