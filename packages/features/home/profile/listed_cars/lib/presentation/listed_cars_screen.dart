import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listed_cars/presentation/cubit/listed_cars_cubit.dart';
import 'package:listed_cars/presentation/widgets/listed_cars_card.dart';
import 'package:shared_ui/shared_widgets/alert_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/app_bar/base_app_bar.dart';
import 'package:shared_ui/shared_widgets/loading/loading_c.dart';
import 'package:shared_ui/shared_widgets/pop_up/loading_pop_up.dart';

class ListedCarsScreen extends StatelessWidget {
  const ListedCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<ListedCarsCubit>(),
      child: Scaffold(
        appBar: BaseAppBar(title: StringsManager.listedCars),
        body: BlocSelector<ListedCarsCubit, ListedCarsState, bool>(
          selector: (state) => state is! ListedPopUpLoading,
          builder: (context, canPop) {
            return Scaffold(
              body: PopScope(
                canPop: canPop,
                child: BlocConsumer<ListedCarsCubit, ListedCarsState>(
                  listener: (context, state) {
                    if (state is ListedCarErrorPopUp) {
                      MessageBar.show(
                        context,
                        state.failure.message,
                        MessageBarType.error,
                      );
                    }
                    if (state is ListedPopUpLoading) {
                      LoadingPopUp.show(
                        context: context,
                        type: PopupType.loading,
                      );
                    } else {
                      LoadingPopUp.hide();
                    }
                  },
                  // listenWhen: (previous, current) => current is ListedCarErrorPopUp|| current is ListedPopUpLoading,
                  buildWhen: (previous, current) {
                    if (current is ListedCarErrorPopUp ||
                        current is ListedPopUpLoading ||
                        current is ListedCarsLoading) {
                      return false;
                    } else {
                      return true;
                    }
                  },
                  builder: (context, state) {
                    if (state is ListedCarsLoaded) {
                      if (state.listedCars.isEmpty) {
                        return Center(child: Text('No listed cars found.'));
                      }
                      final cars = state.listedCars;
                      return RefreshIndicator(
                        onRefresh: () {
                          return ListedCarsCubit.get(context).getListedCars();
                        },
                        child: ListView.builder(
                          itemCount: cars.length,
                          itemBuilder: (context, index) {
                            final car = cars[index];
                            return ListedCarCard(car: car);
                          },
                        ),
                      );
                    }
                    if (state is ListedCarsError) {
                      return Center(child: Text(state.failure.message));
                    }

                    return LoadingC();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
