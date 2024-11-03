// // File: lib/resources/pages/offerings_list_page.dart

// import 'package:flutter/material.dart';
// import 'package:nylo_framework/nylo_framework.dart';
// import '/app/controllers/offerings_controller.dart';
// import '/app/models/offering.dart';
// import '/resources/widgets/offering_card_widget.dart';

// class OfferingsListPage extends NyStatefulWidget<OfferingsController> {
//   static const path = '/offerings';

//   OfferingsListPage() : super(path, child: _OfferingsListState());
// }

// class _OfferingsListState extends NyState<OfferingsListPage> {
//   List<Offering> offerings = [];

//   @override
//   init() async {
//     // Initialize data from controller
//     offerings = await widget.controller.getOfferings();
//   }

//   @override
//   Widget view(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Holistic Offerings'),
//       ),
//       body: ListView.builder(
//         itemCount: offerings.length,
//         itemBuilder: (context, index) {
//           final offering = offerings[index];
//           return OfferingCard(
//             offering: offering,
//             onTap: () {
//               routeTo(EditOfferingPage.path, data: offering);
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => routeTo(EditOfferingPage.path),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
