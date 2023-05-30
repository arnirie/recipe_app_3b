import 'package:flutter/material.dart';
import 'package:pinoyrecipies/data/category_list.dart';

import '../components/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinoy Recipies'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: ((_, index) =>
            CategoryItem(category: CATEGORYLIST[index])),
        itemCount: CATEGORYLIST.length,
      ),
      // body: GridView(
      //   padding: const EdgeInsets.all(8),
      //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent: 200,
      //     crossAxisSpacing: 8,
      //     mainAxisSpacing: 8,
      //     childAspectRatio: 3 / 2,
      //   ),
      //   children:
      //       CATEGORYLIST.map((item) => CategoryItem(category: item)).toList(),
      // ),
      // body: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: ((_, index) => CategoryItem(
      //         category: CATEGORYLIST[index],
      //       )),
      //   itemCount: CATEGORYLIST.length,
      // ),
    );
  }
}
