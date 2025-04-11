// import 'package:dartactivity/repository/models/shopping_model.dart';
// import 'package:dartactivity/ui/widgets/snackbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_bloc.dart';
// import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_event.dart';

// void showPrintDialog(
//   BuildContext context,
//   List<ShoppingModel> items,
//   String type,
// ) {
//   showDialog(
//     context: context,
//     builder: (BuildContext dialogContext) {
//       return AlertDialog(
//         title: const Text('Choose Format'),
//         content: const Text('Select the format to print the shopping list.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(dialogContext);
//               context.read<ShoppingBloc>().add(
//                 ShoppingPrintFormat('txt', items, type),
//               );
//               showSnackBarMessage(context, "Printed $type successfully!");
//             },
//             child: const Text('Text File'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(dialogContext);
//               context.read<ShoppingBloc>().add(
//                 ShoppingPrintFormat('csv', items, type),
//               );
//               showSnackBarMessage(context, "Printed $type successfully!");
//             },
//             child: const Text('CSV File'),
//           ),
//         ],
//       );
//     },
//   );
// }
