import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget detailsScreenAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    forceMaterialTransparency: true,
    
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios_sharp),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    title: Text(
      StringsManager.carDetails,
      style: Theme.of(context).textTheme.headlineSmall,
    ),
  );
}
