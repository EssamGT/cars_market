import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes_manager.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:search/presentation/widgets/c_search_bar.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/brand_logo_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  EdgeInsets margin = const EdgeInsets.symmetric(
    horizontal: AppPadding.p10,
    vertical: AppPadding.p12,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<SearchScreenCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              CSearchBar(
                onChanged: getIt.get<SearchScreenCubit>().onSearchChanged,
              ),
              BlocBuilder<SearchScreenCubit, SearchScreenState>(
                buildWhen: (previous, current) => current is SearchState,
                builder: (context, state) {
                  if (state is SearchState) {
                    return Expanded(
                      child: state.searchResults.isEmpty
                          ? Center(
                              child: Text(StringsManager.startTypingToSearch),
                            )
                          : SingleChildScrollView(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    AppSize.s15,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.shadow.withAlpha(40),
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                                margin: margin,
                                padding: const EdgeInsets.only(
                                  left: AppPadding.p2,
                                  right: AppPadding.p2,
                                  top: AppPadding.p8,
                                ),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: state.searchResults.length,
                                  itemBuilder: (context, index) {
                                    final item = state.searchResults[index];

                                    return Container(
                                      decoration: BoxDecoration(
                                        border:
                                            index !=
                                                state.searchResults.length - 1
                                            ? Border(
                                                bottom: BorderSide(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onError
                                                      .withAlpha(20),
                                                  width: 1,
                                                ),
                                              )
                                            : Border(),
                                      ),
                                      child: ListTile(
                                        visualDensity:
                                            VisualDensity.comfortable,
                                        titleAlignment:
                                            ListTileTitleAlignment.center,
                                        leading: BrandLogoBuilder(
                                          url: item is CarBrand
                                              ? item.logoUrl
                                              : (item as CarModel).getLogoUrl(),
                                        ),
                                        title: Text(
                                          item is CarBrand
                                              ? item.name
                                              : (item as CarModel)
                                                    .getFullName(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                        ),
                                        onTap: () {
                                          getIt
                                              .get<SearchScreenCubit>()
                                              .onSearchSelected(index);
                                          context.push(
                                            RoutesManager.searchResults,
                                          );
                                        },
                                        splashColor: Theme.of(
                                          context,
                                        ).colorScheme.primary.withAlpha(50),

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            AppSize.s12,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                    );
                  } else {
                    return Expanded(
                      child: Center(
                        child: Text(StringsManager.startTypingToSearch),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
