import 'package:flutter/material.dart';
import 'package:search/presentation/widgets/c_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Column(children: [CSearchBar()])),
    );
  }
}
