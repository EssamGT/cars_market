import 'package:assets/custom_icons_icons.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';

final List<String> carBodyTypes = [
  "Sedan",
  "SUV",
  "Hatchback",
  "4X4",
  "Sports / Coupe",
  "Convertible",
  "Pickup",
  "Estate / Wagon",
  "Van / Bus",
  "MVP"
      "Other",
];

enum CarBodyType {
  none,
  sedan,
  suv,
  hatchback,
  fourByFour,
  sportsCoupe,
  convertible,
  pickup,
  estateWagon,
  vanBus,
  mvp,
  taxi,
  other,
}

extension CarBodyTypeExtension on CarBodyType {
  String getCarBodyTypeName([bool isForFilter = false]) {
    switch (this) {
      case CarBodyType.sedan:
        return StringsManager.sedan;
      case CarBodyType.suv:
        return StringsManager.suv;
      case CarBodyType.hatchback:
        return StringsManager.hatchback;
      case CarBodyType.fourByFour:
        return StringsManager.fourByFour;
      case CarBodyType.sportsCoupe:
        return StringsManager.sportsCoupe;
      case CarBodyType.convertible:
        return StringsManager.convertible;
      case CarBodyType.pickup:
        return StringsManager.pickup;
      case CarBodyType.estateWagon:
        return StringsManager.estateWagon;
      case CarBodyType.vanBus:
        return StringsManager.vanBus;
      case CarBodyType.mvp:
        return StringsManager.mvp;
      case CarBodyType.taxi:
        return StringsManager.taxi;
      case CarBodyType.other:
        return StringsManager.other;
      case CarBodyType.none:
        if (isForFilter) {
          return StringsManager.all;
        }
        return StringsManager.selectCarBodyType;
    }
  }

  IconData getCarBodyTypeIcon() {
    switch (this) {
      case CarBodyType.sedan:
        return CustomIcons.sedan;
      case CarBodyType.suv:
        return CustomIcons.suv;
      case CarBodyType.hatchback:
        return CustomIcons.smallHatch;
      case CarBodyType.fourByFour:
        return CustomIcons.fourByFour;
      case CarBodyType.sportsCoupe:
        return CustomIcons.sport;
      case CarBodyType.convertible:
        return CustomIcons.convertible;
      case CarBodyType.pickup:
        return CustomIcons.truck;
      case CarBodyType.estateWagon:
        return CustomIcons.wagon;
      case CarBodyType.vanBus:
        return CustomIcons.van;
      case CarBodyType.mvp:
        return CustomIcons.van;
      case CarBodyType.taxi:
        return CustomIcons.sedan;
      case CarBodyType.other:
        return CustomIcons.sedan;
      case CarBodyType.none:
        return CustomIcons.carCondition;
    }
  }
}
