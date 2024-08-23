import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widget/categories_item.dart';

class CategoriesScrean extends StatelessWidget {
  const CategoriesScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: Categories_data.map((categoriesdata) => CategoriesItem(
            categoriesdata.id,
            categoriesdata.titel,
            categoriesdata.imageurl,
          )).toList(),
    );
  }
}
