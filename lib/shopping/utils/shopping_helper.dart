import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/utils/enum_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingHelper {
  String formatCategory(GroceryCategory category) {
    switch (category) {
      case GroceryCategory.fruitsAndVegetable:
        return 'Fruits & Vegetables';
      case GroceryCategory.dairyProducts:
        return 'Dairy Products';
      case GroceryCategory.poultry:
        return 'Poultry';
      case GroceryCategory.breadAndGrains:
        return 'Bread & Grains';
      case GroceryCategory.snacks:
        return 'Snacks';
      case GroceryCategory.cannedGoods:
        return 'Canned Goods';
      case GroceryCategory.frozenGoods:
        return 'Frozen Goods';
      case GroceryCategory.beautyProducts:
        return 'Beauty Products';
      case GroceryCategory.cleaningSupplies:
        return 'Cleaning Supplies';
    }
  }

  stringToCategory(String tag) {
    switch (tag) {
      case "Fruits & Vegetables":
        return GroceryCategory.fruitsAndVegetable;
      case "Dairy Products":
        return GroceryCategory.dairyProducts;
      case "Poultry":
        return GroceryCategory.poultry;
      case "Bread & Grains":
        return GroceryCategory.breadAndGrains;
      case "Snacks":
        return GroceryCategory.snacks;
      case "Canned Goods":
        return GroceryCategory.cannedGoods;
      case "Frozen Goods":
        return GroceryCategory.frozenGoods;
      case "Beauty Products":
        return GroceryCategory.beautyProducts;
      case "Cleaning Supplies":
        return GroceryCategory.cleaningSupplies;
    }
  }

  static Widget countIconButton({
    required int currentPageIndex,
    required VoidCallback onPressed,
    required bool showFavoritesOnly,
    required Icon icon,
  }) {
    return BlocBuilder<ShoppingBloc, ShoppingState>(
      builder: (context, state) {
        int countItem = 0;
        if (state is ShoppingListLoaded) {
          if (showFavoritesOnly) {
            countItem = state.items.where((item) => item.isFavorite).length;
          } else {
            countItem = state.items.length;
          }
        }
        return IconButton(
          enableFeedback: false,
          icon: Badge.count(count: countItem, child: icon),
          color: Colors.white,
          onPressed: onPressed,
        );
      },
    );
  }
}
