// import 'package:dartactivity/utils/enum_tags.dart';
// import 'package:dartactivity/utils/shopping_helper.dart';
// import 'package:dartactivity/ui/widgets/grocery_chip.dart';
// import 'package:dartactivity/ui/widgets/icon_text_button.dart';
// import 'package:dartactivity/ui/widgets/snackbar.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class EditDialog extends StatefulWidget {
//   String currentName;
//   String currentTag;
//   bool currentIsFavorite;
//   final void Function(String newName, String newTag, bool newIsFavorite) onSave;

//   EditDialog({
//     super.key,

//     required this.currentName,
//     required this.currentTag,
//     required this.currentIsFavorite,
//     required this.onSave,
//   });
//   @override
//   State<EditDialog> createState() => _EditDialogState();
// }

// class _EditDialogState extends State<EditDialog> {
//   GroceryCategory? selectedCategory;
//   late TextEditingController _editController;

//   @override
//   void initState() {
//     super.initState();
//     _editController = TextEditingController(text: widget.currentName);
//     selectedCategory = ShoppingHelper().stringToCategory(widget.currentTag);
//   }

//   @override
//   void dispose() {
//     _editController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Edit Item'),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: _editController,
//               decoration: InputDecoration(labelText: 'Enter new value'),
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
//                     widget.currentIsFavorite = !widget.currentIsFavorite;
//                   });
//                   showSnackBarMessage(
//                     context,
//                     widget.currentIsFavorite
//                         ? 'Added to favorites'
//                         : 'Remove from favorites',
//                   );
//                 },
//                 size: 20,
//                 label:
//                     widget.currentIsFavorite
//                         ? "Added to Favorites"
//                         : "Add to Favorites",
//                 iconColor: Colors.red,
//                 icon:
//                     widget.currentIsFavorite
//                         ? Icons.favorite
//                         : Icons.favorite_border_outlined,
//               ),
//             ),
//             GroceryChip(
//               initialCategory: selectedCategory,
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
//           child: Text('Save', style: TextStyle(color: Colors.white)),
//           onPressed: () {
//             if (_editController.text.isNotEmpty && selectedCategory != null) {
//               widget.onSave(
//                 _editController.text,
//                 ShoppingHelper().formatCategory(selectedCategory!),
//                 widget.currentIsFavorite,
//               );
//               showSnackBarMessage(context, "Updated successfully!");
//               Navigator.of(context).pop();
//             } else {
//               ScaffoldMessenger.of(
//                 context,
//               ).showSnackBar(SnackBar(content: Text('Value cannot be empty!')));
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
