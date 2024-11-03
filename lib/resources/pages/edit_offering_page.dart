// // File: lib/resources/pages/edit_offering_page.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_app/app/controllers/offering_controller.dart';
// import 'package:flutter_app/app/models/offering_model.dart';
// import 'package:nylo_framework/nylo_framework.dart';

// class EditOfferingPage extends NyStatefulWidget<OfferingsController> {
//   static const path = '/offering/edit';

//   EditOfferingPage() : super(child: _EditOfferingPageState());
// }

// class _EditOfferingPageState extends NyState<EditOfferingPage> {
//   final _formKey = GlobalKey<FormState>();
//   Offering? offering;

//   @override
//   void initState() async {
//     super.initState();
//     offering = widget.data();
//   }

//   @override
//   Widget view(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(offering == null ? 'Add Offering' : 'Edit Offering'),
//       ),
//       body: NyForm(
//         form: OfferingForm(offering: offering),
//         child: (context, form) => Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ListView(
//             children: [
//               form.create(),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   form.submit(
//                     onSuccess: (data) async {
//                       await widget.controller.saveOffering(data);
//                       pop();
//                     },
//                     onFailure: (error) {
//                       showToastNotification(
//                         context,
//                         title: "Error",
//                         description: "Failed to save offering",
//                         style: ToastNotificationStyleType.DANGER,
//                       );
//                     },
//                   );
//                 },
//                 child: const Text('Save Offering'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
