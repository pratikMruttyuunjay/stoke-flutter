import 'package:flutter/material.dart';
import 'package:stoke/app_routes.dart';
import 'package:stoke/dto/category/category_list_dto.dart';
import 'package:stoke/dto/product/product_list.dart';
import 'package:stoke/screens/add/add_screen.dart';
import 'package:stoke/screens/batch/batch_screen.dart';
import 'package:stoke/screens/batch/batch_screen.dart';
import 'package:stoke/screens/category/category_screen.dart';
import 'package:stoke/screens/loading_screen.dart';
import 'package:stoke/screens/product/product_screen.dart';
import 'package:stoke/screens/unknown_screen.dart';


enum UpdateFrom {
  category,
  product,
  batch
  // Add more options as needed
}

class RoutesGenerator {

  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;
    final args  = settings.arguments;
    switch (route) {
      case AppRoutes.add: {
        return MaterialPageRoute(builder: (_)=> AddScreen(argument: args as AddScreenArg));
      }
      case AppRoutes.category: {
        return MaterialPageRoute(builder: (_)=> const CategoryScreen());
      }
      case AppRoutes.product: {
        return MaterialPageRoute(builder: (_)=> ProductScreen(categoryListData: args as CategoryListData));
      }
      case AppRoutes.batch: {
        return MaterialPageRoute(builder: (_)=> BatchScreen(listData: args as ProductListData));
      }
      // default:
      //   return errorRoute();
    }
  }

  static Route? errorRoute() =>
      MaterialPageRoute(builder: (_) => const UnknownScreen());
}