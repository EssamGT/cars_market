import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width / 2.2,
      height: screenSize.width / 2,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(AppSize.s15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(30),
            blurRadius: AppSize.s20,
            spreadRadius: AppSize.s5,
          ),
        ],
      ),
      padding: EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(AppSize.s7),
                  ),
                  width: screenSize.width / 2.5,
                  height: screenSize.width / 3.6,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(AppSize.s7),
                    child: Transform.scale(
                      scale: 1.4,
                      child: Image.network(
                        'https://www.cnet.com/a/img/resize/7411f2fbb73e8a8f323cdb227ca198d4d3d2a3cf/hub/2021/10/13/b8024a0e-b1a4-400c-96d5-1d68ee22e498/2022-bmw-m5-cs-011.jpg?auto=webp&width=1920',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -8,
                  right: -8,
                  child: IconButton(onPressed: (){}, icon: Icon(Iconsax.heart_copy) )),
              ],
            ),
          ),
          SizedBox(height: AppSize.s10),
          Text('BMW M5 CS', style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: AppSize.s5),
          Text(
            "\$140,000",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).primaryColor,
              
            ),
            // textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
