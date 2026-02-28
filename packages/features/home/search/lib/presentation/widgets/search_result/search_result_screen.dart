import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_card.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<SearchScreenCubit>(),
      child: Scaffold(
        body: BlocBuilder<SearchScreenCubit, SearchScreenState>(
          buildWhen: (previous, current) {
            if (current is SearchFailure ||
                current is SearchSuccess ||
                current is SearchLoading) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state is SearchSuccess) {
              return state.searchResults.isEmpty
                  ? Center(child: Text('No results found'))
                  : ListView.builder(
                      itemCount: state.searchResults.length,
                      itemBuilder: (context, index) {
                        final car = state.searchResults[index];
                        return CarCard(car: car!);
                      },
                    );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
