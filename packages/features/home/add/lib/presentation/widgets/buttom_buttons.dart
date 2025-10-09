import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/controller/sell_steps_controller.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_ui/shared_widgets/animated/animated_container.dart';

class ButtomButtons extends StatelessWidget {
  final SellStepsController controller;
  const ButtomButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // var cubit = AddCubit.get(context);
    return Obx(() {
      return SizedBox(
        height: AppSize.s80,
        width: screenSize.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p10,
            horizontal: AppPadding.p20,
          ),
          child: Row(
            mainAxisAlignment: controller.alinment.value
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: controller.showPrev.value ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: IgnorePointer(
                  ignoring: !controller.showPrev.value,
                  child: controller.showPrev.value
                      ? OutlinedButton(
                          onPressed: () {
                            controller.changeIndex(
                              controller.selectedIndex.value - 1,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(
                              MediaQuery.of(context).size.width / 2.5,
                              AppSize.s50,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s8),
                            ),
                            elevation: AppSize.s10,
                            shadowColor: Theme.of(context).colorScheme.shadow,
                          ),
                          child: const Text('Prev'),
                        )
                      : const SizedBox(),
                ),
              ),
              AnimatedBar(
                isActive: controller.showPrev.value,
                inline: true,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: controller.minimize.value
                    ? screenSize.width / 2.5
                    : screenSize.width - 40,
                height: AppSize.s50,
                child: FilledButton(
                  onPressed: controller.animating.value
                      ? () {}
                      : () {
                          print('dadsadadad');
                          // if (cubit.step1Validation()) {
                          if (controller.key.currentState!.validate()) {
                            controller.changeIndex(
                              controller.selectedIndex.value + 1,
                            );
                          }
                          // }
                        },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(
                      MediaQuery.of(context).size.width - 50,
                      AppSize.s50,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                    ),
                    elevation: AppSize.s10,

                    shadowColor: Theme.of(context).colorScheme.shadow,
                  ),

                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
} 
// AnimatedSwitcher(
//             duration: const Duration(milliseconds: 500),
//             switchInCurve: Curves.easeIn,
//             switchOutCurve: Curves.easeOutSine,
//             transitionBuilder: (child, animation) => FadeTransition(
//               opacity: animation,
//               child: SlideTransition(
//                 position: Tween<Offset>(
//                   begin: const Offset(0.1, 0.0),
//                   end: Offset.zero,
//                 ).animate(animation),
//                 child: child,
//               ),
//             ),
//             child: showPrev
//                 ? Row(
//                     key: const ValueKey('with-prev'),
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       controller.selectedIndex.value > 0.1
//                           ? OutlinedButton(
//                               onPressed: () {
//                                 controller.changeIndex(
//                                   controller.selectedIndex.value - 1,
//                                 );
//                               },
//                               style: OutlinedButton.styleFrom(
//                                 minimumSize: Size(
//                                   MediaQuery.of(context).size.width / 2.5,
//                                   AppSize.s50,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(
//                                     AppSize.s8,
//                                   ),
//                                 ),
//                                 elevation: AppSize.s10,

//                                 shadowColor: Theme.of(
//                                   context,
//                                 ).colorScheme.shadow,
//                               ),
//                               child: Text('Prev'),
//                             )
//                           : SizedBox(height: 0, width: 0),
//                       Divider(),
//                       FilledButton(
//                         onPressed: () {
//                           controller.changeIndex(
//                             controller.selectedIndex.value + 1,
//                           );
//                         },
//                         style: FilledButton.styleFrom(
//                           minimumSize: Size(
//                             MediaQuery.of(context).size.width / 2.5,
//                             AppSize.s50,
//                           ),

//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(AppSize.s8),
//                           ),
//                           elevation: AppSize.s10,

//                           shadowColor: Theme.of(context).colorScheme.shadow,
//                         ),

//                         child: Text(
//                           'Next',
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                       ),
//                     ],
//                   )
//                 : Row(
//                     key: const ValueKey('without_prv'),
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       AnimatedContainer(
//                         duration: const Duration(milliseconds: 400),
//                         curve: Curves.easeInOut,
//                         width: showPrev
//                             ? screenSize.width / 2.5
//                             : screenSize.width - 50,
//                         height: AppSize.s50,
//                         child: FilledButton(
//                           onPressed: () {
//                             if (cubit.step1Validation()) {
//                               controller.changeIndex(
//                                 controller.selectedIndex.value + 1,
//                               );
//                             }
//                           },
//                           style: FilledButton.styleFrom(
//                             minimumSize: Size(
//                               MediaQuery.of(context).size.width - 50,
//                               AppSize.s50,
//                             ),

//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(AppSize.s8),
//                             ),
//                             elevation: AppSize.s10,

//                             shadowColor: Theme.of(context).colorScheme.shadow,
//                           ),

//                           child: Text(
//                             'Next',
//                             style: Theme.of(context).textTheme.titleMedium,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//           ),