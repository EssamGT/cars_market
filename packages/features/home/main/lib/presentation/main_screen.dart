import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:main/presentation/cubit/main_screen_cubit.dart';
import 'package:remote/remote/auth/auth_manager.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    getIt.get<MainScreenCubit>().getMainScreenCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: BlocBuilder(
          bloc: getIt.get<MainScreenCubit>(),
          builder: (context, state) {
            if (state is MainScreenLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is MainScreenFailure) {
              return Center(child: Text('Error: ${state.failure.message}'));
            }
            if (state is MainScreenCars) {
              return RefreshIndicator(
                onRefresh: () {
                  return getIt.get<MainScreenCubit>().getMainScreenCars();
                },
                child: ListView.builder(
                  
                  itemCount: state.cars.length,
                  itemBuilder: (context, index) {
                    return CarCard(car: state.cars[index]);
                  },
                ),
              );
            }
            return Center(child: Text('Main Screen'));
          },
        ),
      ),
    );
  }
}

// SingleChildScrollView(
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               minHeight: screenSize.height,
//               minWidth: screenSize.width,
//             ),
//             child: IntrinsicHeight(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       getIt<AuthManager>().logout();
//                       context.go(RoutesManager.login);
//                     },
//                     child: Text('logout'),
//                   ),
//                   CarCard(),
//                   CarCard(),
//                   CarCard(),
//                   CarCard(),
//                   CarCard(),
//                   SizedBox(height: AppSize.s100),
//                 ],
//               ),
//             ),
//           ),
//         ),
