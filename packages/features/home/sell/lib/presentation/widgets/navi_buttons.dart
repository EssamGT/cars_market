import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell/presentation/widgets/controller/sell_steps_controller.dart';
import 'package:shared_ui/shared_widgets/animated/animated_container.dart';

class NaviButtons extends StatelessWidget {
  final SellStepsController controller;
  const NaviButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // var cubit = AddCubit.get(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: AppSize.s80,
        minHeight: AppSize.s80,
        maxWidth: screenSize.width,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p10,
          horizontal: AppPadding.p20,
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: controller.animationDuration,
                switchInCurve: controller.animationCurve,
                switchOutCurve: controller.animationCurve,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final curved = CurvedAnimation(
                    parent: animation,
                    curve: controller.animationCurve,
                  );
                  return FadeTransition(opacity: curved, child: child);
                },
                child: controller.showPrev.value
                    ? AnimatedContainer(
                        key: const ValueKey('backButton'),
                        duration: controller.animationDuration,
                        curve: controller.animationCurve,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.shadow,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 6),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(AppSize.s8),
                        ),
                        width: controller.showPrevMin.value
                            ? screenSize.width / 3.5
                            : screenSize.width / 2.5,
                        height: AppSize.s50,
                        child: FilledButton(
                          onPressed: controller.animating.value
                              ? () {}
                              : () {
                                  controller.changeIndex(
                                    controller.selectedIndex.value - 1,
                                  );
                                },
                          style: FilledButton.styleFrom(
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s8),
                            ),
                            elevation: AppSize.s10,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.surface,
                            shadowColor: Theme.of(context).colorScheme.shadow,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                          ),
                          child: Text(
                            StringsManager.back,
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.onError,
                                ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(key: ValueKey('empty')),
              ),
              AnimatedOpacity(
                opacity: controller.showPrev.value ? 1.0 : 0.0,
                duration: controller.opacityDuration,
                curve: controller.animationCurve,
                child: IgnorePointer(
                  ignoring: !controller.showPrev.value,

                  child: controller.showPrev.value
                      ? AnimatedBar(
                          isActive: controller.showPrev.value,
                          inline: true,
                        )
                      : SizedBox(),
                ),
              ),

              AnimatedContainer(
                duration: controller.animationDuration,
                curve: controller.animationCurve,
                width: controller.minimize.value
                    ? controller.nextMax.value
                          ? screenSize.width / 1.8
                          : screenSize.width / 2.5
                    : screenSize.width - 40,
                height: controller.nextMax.value ? AppSize.s55 : AppSize.s50,
                child: FilledButton(
                  onPressed: controller.animating.value
                      ? () {}
                      : () {
                          // if (controller.key.currentState!.validate()) {
                            controller.changeIndex(
                              controller.selectedIndex.value + 1,
                            );
                          // }
                        },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                    ),
                    elevation: AppSize.s10,
                    foregroundColor: Theme.of(context).colorScheme.surface,

                    shadowColor: Theme.of(context).colorScheme.shadow,
                  ),

                  child: AnimatedSwitcher(
                    duration: controller.animationDuration,
                    reverseDuration: controller.animationDuration,
                    switchInCurve: controller.animationCurve,
                    switchOutCurve: controller.animationCurve,
                    layoutBuilder: (currentChild, previousChildren) {
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          ...previousChildren,
                          if (currentChild != null) currentChild,
                        ],
                      );
                    },
                    transitionBuilder: (child, animation) {
                      final curved = CurvedAnimation(
                        parent: animation,
                        curve: controller.animationCurve,
                      );
                      return FadeTransition(opacity: curved, child: child);
                    },
                    child: controller.nextMaxWord.value
                        ? Text(
                            key: ValueKey('list-my-car'),
                            StringsManager.listMyCar,

                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        : Text(
                            key: ValueKey('next'),
                            StringsManager.next,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 






// 
//
// AnimatedOpacity(
//                 opacity: controller.showPrev.value ? 1.0 : 0.0,
//                 duration: const Duration(milliseconds: 400),
//                 curve: Curves.easeInOut,
//                 child: IgnorePointer(
//                   ignoring: !controller.showPrev.value,
//                   child: controller.showPrev.value
//                       ? Container(
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Theme.of(context).colorScheme.shadow,
//                                 blurRadius: 10,
//                                 spreadRadius: 2,
//                                 offset: const Offset(
//                                   0,
//                                   6,
//                                 ), // position of shadow
//                               ),
//                             ],
//                             borderRadius: BorderRadius.circular(AppSize.s8),
//                           ),
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 200),
//                             curve: Curves.easeInOut,
//                             width: controller.nextMax.value
//                                 ? screenSize.width / 3.5
//                                 : screenSize.width / 2.5,
//                             height: AppSize.s50,
//                             child: FilledButton(
//                               onPressed: () {
//                                 controller.changeIndex(
//                                   controller.selectedIndex.value - 1,
//                                 );
//                               },
//                               style: FilledButton.styleFrom(
//                                 alignment: Alignment.center,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(
//                                     AppSize.s8,
//                                   ),
//                                 ),
//                                 elevation: AppSize.s10,
//                                 backgroundColor: Theme.of(
//                                   context,
//                                 ).colorScheme.surface,
//                                 shadowColor: Theme.of(
//                                   context,
//                                 ).colorScheme.shadow,
//                               ),
//                               child: Text(
//                                 StringsManager.prev,
//                                 style: Theme.of(context).textTheme.titleMedium!
//                                     .copyWith(
//                                       color: Theme.of(
//                                         context,
//                                       ).colorScheme.onError,
//                                       fontSize: controller.showPrevMin.value? AppSize.s14:AppSize.s15,
//                                     ),
//                               ),
//                             ),
//                           ),
//                         )
//                       : const SizedBox(),
//                 ),
//               ),
//               AnimatedOpacity(
//                 opacity: controller.showPrev.value ? 1.0 : 0.0,
//                 duration: const Duration(milliseconds: 400),
//                 curve: Curves.easeInOut,
//                 child: IgnorePointer(
//                   ignoring: !controller.showPrev.value,
          
//                   child: controller.showPrev.value
//                       ? AnimatedBar(
//                           isActive: controller.showPrev.value,
//                           inline: true,
//                         )
//                       : SizedBox(),
//                 ),
//               ),
//               AnimatedContainer(
                
//                 duration: const Duration(milliseconds: 150),
//                 curve: Curves.easeInOut,
//                 width: controller.minimize.value
//                     ? controller.nextMax.value
//                           ? screenSize.width / 1.8
//                           : screenSize.width / 2.5
//                     : screenSize.width - 40,
//                 height: controller.nextMax.value ? AppSize.s55 : AppSize.s50,
//                 child: FilledButton(
//                   onPressed: controller.animating.value
//                       ? () {}
//                       : () {
//                           print('dadsadadad');
                      
//                           // if (controller.key.currentState!.validate()&&
//                           //       cubit.validateImage()) {
//                           controller.changeIndex(
//                             controller.selectedIndex.value + 1,
//                           );
//                           // }
                          
//                         },
//                   style: FilledButton.styleFrom(
//                     minimumSize: Size(
//                       MediaQuery.of(context).size.width - 50,
//                       AppSize.s50,
//                     ),
          
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(AppSize.s8),
//                     ),
//                     elevation: AppSize.s10,
          
//                     shadowColor: Theme.of(context).colorScheme.shadow,
//                   ),
          
//                   child: Text(
//                     controller.nextMaxWord.value
//                         ? StringsManager.listMyCar
//                         : StringsManager.next,
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                 ),
//               ), */
//*** 
// */











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