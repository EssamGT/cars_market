import 'package:flutter/material.dart';
import 'package:main/presentation/widgets/grid_view_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenSize.height,
            minWidth: screenSize.width,
            ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  
                  GridViewCard(),
                  GridViewCard(),
                    ],
                  ),
                ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
