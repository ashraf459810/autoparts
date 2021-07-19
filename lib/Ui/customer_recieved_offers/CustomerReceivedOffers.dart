// import 'package:autopart/core/style/base_color.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class NotificationScreen extends StatefulWidget {
//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//    ScrollController controller = ScrollController();
//   int listsize = 10;
//   int pages = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100.0),
//         child: AppBar(
//           backgroundColor: bgColor,
//           elevation: 0,
//           flexibleSpace: Column(
//             children: [
//               SizedBox(
//                 height: 70,
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16, right: 16),
//                     child: Text(
//                       'Notifications',
//                       style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: heavyBlue),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           centerTitle: false,
//           title: Padding(
//             padding: const EdgeInsets.all(3.0),
//             child: Text(
//               '',
//               style: TextStyle(
//                   fontSize: 30, fontWeight: FontWeight.bold, color: heavyBlue),
//             ),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SvgPicture.asset(
//                 'assets/images/close.svg',
//                 width: 24,
//                 height: 24,
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: bgColor,
//       body: ListView.builder(
//         itemCount: 9,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: EdgeInsets.all(0.0),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: red,
//                       borderRadius: BorderRadius.circular(150),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         'NEW\nOffer',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: size.width * 0.55,
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 8, right: 8, top: 16, bottom: 3),
//                     child: Text(
//                       ' A new Vendor add a new price offer to your order #1982984',
//                       style: TextStyle(fontSize: 15, color: heavyBlue),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       width: size.width * 0.2,
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             left: 8, right: 8, top: 16, bottom: 3),
//                         child: Text(
//                           '9:20 AM',
//                           style: TextStyle(fontSize: 14, color: heavyBlue),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Container(
//                         height: 8,
//                         width: 8,
//                         decoration: BoxDecoration(
//                           color: lightOrange,
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
