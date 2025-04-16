import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/bloc/list_by_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();
  bool _hasSearchText = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _updateSearch(String searchText) {
    context.read<ListByCategoryBloc>().add(
      searchText.isEmpty
          ? GetAllListsEvent()
          : SearchItem(searchText: searchText),
    );
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _hasSearchText = false;
    });
    _updateSearch('');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFDDDCDC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF4D4848)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: IconButton(
              onPressed: _hasSearchText ? _clearSearch : null,
              icon: Icon(_hasSearchText ? Icons.close : Icons.search, size: 16),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _hasSearchText = value.isNotEmpty;
            });
            context.read<ListByCategoryBloc>().add(
              value.isEmpty
                  ? GetAllListsEvent()
                  : SearchItem(searchText: value),
            );
            _updateSearch(value);
          },
        ),
      ),
    );
  }
}
