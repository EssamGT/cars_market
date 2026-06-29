import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/presentation/cubit/main_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/alert_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/app_bar/base_app_bar.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        print("haaaaa");
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: BaseAppBar(title: StringsManager.carsMarket, button: false),
      body: BlocConsumer(
        listener: (context, state) {
          if (state is MainScreenFailure) {
            MessageBar.show(context, state.failure.message);
          }
        },
        bloc: getIt.get<MainScreenCubit>(),
        builder: (context, state) {
          // if (state is MainScreenFailure) {
          //   return RefreshIndicator(
          //     onRefresh: () {
          //       return getIt.get<MainScreenCubit>().getMainScreenCars();
          //     },

          //     child: Center(child: Text('Error: ${state.failure.message}')),
          //   );
          // }
          if (state is MainScreenCars) {
            return RefreshIndicator(
              onRefresh: () {
                return getIt.get<MainScreenCubit>().getMainScreenCars();
              },
              child: ListView.builder(
                addAutomaticKeepAlives: true,

                controller: scrollController,
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  return CarCard(car: state.cars[index]);
                },
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: state is MainScreenLoading
                ? () async {}
                : () {
                    return getIt.get<MainScreenCubit>().getMainScreenCars();
                  },
            child: ListView.builder(
              addAutomaticKeepAlives: true,

              controller: scrollController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return LoadingCarCard();
              },
            ),
          );
        },
      ),
    );
  }
}
