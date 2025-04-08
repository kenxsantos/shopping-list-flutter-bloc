import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarItem extends StatefulWidget {
  const SearchBarItem({super.key});

  @override
  State<SearchBarItem> createState() => _SearchBarItemState();
}

class _SearchBarItemState extends State<SearchBarItem> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
    context.read<ShoppingBloc>().add(ShoppingSearchItem(""));
    context.read<ShoppingBloc>().add(ShoppingFetchItem());
  }

  void _onSearchChanged(String value) {
    if (_searchController.text.isEmpty) {
      context.read<ShoppingBloc>().add(ShoppingFetchItem());
    } else {
      context.read<ShoppingBloc>().add(ShoppingSearchItem(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 221, 220, 220),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 77, 72, 72),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _clearSearch();
              },
              icon: Icon(Icons.close, size: 14),
            ),
          ),
          autofocus: false,
          onChanged: _onSearchChanged,
        ),
      ),
    );
  }
}
