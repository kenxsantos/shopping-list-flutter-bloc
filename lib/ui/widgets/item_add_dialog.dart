// import 'package:dartactivity/utils/enum_tags.dart';
// import 'package:dartactivity/utils/shopping_helper.dart';
// import 'package:dartactivity/ui/widgets/grocery_chip.dart';
// import 'package:dartactivity/ui/widgets/icon_text_button.dart';
// import 'package:dartactivity/ui/widgets/snackbar.dart';
// import 'package:flutter/material.dart';

// class ItemDialog extends StatefulWidget {
//   final void Function(String item, String tag, bool isFavorite) onSubmit;

//   const ItemDialog({required this.onSubmit, super.key});

//   @override
//   State<ItemDialog> createState() => _ItemDialogState();
// }

// class _ItemDialogState extends State<ItemDialog> {
//   final String date = DateTime.now().toString();

//   GroceryCategory? selectedCategory;
//   final TextEditingController _itemController = TextEditingController();
//   bool isFavorite = false;

//   @override
//   void dispose() {
//     _itemController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Add an Item', textAlign: TextAlign.center),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(date),
//             SizedBox(height: 16),
//             TextField(
//               controller: _itemController,
//               decoration: InputDecoration(labelText: 'Enter an Item'),
//             ),
//             SizedBox(height: 16),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 border: Border.all(width: 1, color: Colors.red),
//               ),
//               child: IconTextButton(
//                 onTap: () {
//                   setState(() {
//                     isFavorite = !isFavorite;
//                   });
//                   showSnackBarMessage(
//                     context,
//                     isFavorite ? 'Added to favorites' : 'Remove from favorites',
//                   );
//                 },
//                 size: 20,
//                 label: isFavorite ? "Added to Favorites" : "Add to Favorites",
//                 iconColor: Colors.red,
//                 icon:
//                     isFavorite
//                         ? Icons.favorite
//                         : Icons.favorite_border_outlined,
//               ),
//             ),
//             GroceryChip(
//               onCategorySelected: (GroceryCategory? category) {
//                 setState(() {
//                   selectedCategory = category;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: Text('Cancel'),
//         ),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//           child: Text('Submit', style: TextStyle(color: Colors.white)),
//           onPressed: () {
//             if (_itemController.text.isNotEmpty && selectedCategory != null) {
//               widget.onSubmit(
//                 _itemController.text,
//                 ShoppingHelper().formatCategory(selectedCategory!),
//                 isFavorite,
//               );
//               Navigator.of(context).pop();
//               showSnackBarMessage(context, "Added successfully!");
//             } else {
//               showSnackBarMessage(context, "Fields cannot be empty!");
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
