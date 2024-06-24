// import 'package:flutter/material.dart';

// import '../../../theme/color/app_color.dart';

// class SearchBar extends StatelessWidget {
//   const SearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColor.toneThree.withOpacity(0.3)),
//         color: AppColor.textfield,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: AppColor.toneThree.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           const Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search what you need...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           Container(
//             height: 40,
//             width: 40,
//             decoration: BoxDecoration(
//               color: AppColor.primary,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: IconButton(
//               icon: const Icon(Icons.search, color: AppColor.background),
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
