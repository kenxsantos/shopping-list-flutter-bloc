import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:dartactivity/shopping/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';

void showPrintDialog(
  BuildContext context,
  List<ShoppingModel> items,
  String type,
) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Choose Format'),
        content: const Text('Select the format to print the shopping list.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<ShoppingBloc>().add(
                ShoppingPrintFormat('txt', items, type),
              );
              showSnackBarMessage(context, "Printed $type successfully!");
            },
            child: const Text('Text File'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<ShoppingBloc>().add(
                ShoppingPrintFormat('csv', items, type),
              );
              showSnackBarMessage(context, "Printed $type successfully!");
            },
            child: const Text('CSV File'),
          ),
        ],
      );
    },
  );
}
