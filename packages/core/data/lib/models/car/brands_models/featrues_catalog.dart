import 'package:assets/custom_icons_icons.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/features_model.dart';
import 'package:data/models/car/sell_car_model.dart';

List<FeaturesList> featuresCatalog = [
  comfortFeatures,
  safetyFeatures,
  driverAssistance,
  visionAndCameras,
  lightingAndVisibility,
  technologyAndInfotainment,
  exteriorAndConvenience,
];

FeaturesList comfortFeatures = FeaturesList(
  title: StringsManager.comfortFeatures,
  id: StringsManager.comfortFeaturesId,
  features: [
    FeatureModel(
      name: StringsManager.acLabel,
      id: StringsManager.acId,
      icon: CustomIcons.ac,
    ),
    FeatureModel(
      name: StringsManager.electricSeatsLabel,
      id: StringsManager.electricSeatsId,
      icon: CustomIcons.electricSeat2,
    ),
    FeatureModel(
      name: StringsManager.heatedSeatsLabel,
      id: StringsManager.heatedSeatsId,
      icon: CustomIcons.heatedSeats,
    ),
    FeatureModel(
      name: StringsManager.ventilatedSeatsLabel,
      id: StringsManager.ventilatedSeatsId,
      icon: CustomIcons.heatedSeats,
    ),
    FeatureModel(
      name: StringsManager.memorySeatsLabel,
      id: StringsManager.memorySeatsId,
      icon: CustomIcons.latherSeats,
    ),
    FeatureModel(
      name: StringsManager.massageSeatsLabel,
      id: StringsManager.massageSeatsId,
      icon: CustomIcons.latherSeats,
    ),

    FeatureModel(
      name: StringsManager.startLabel,
      id: StringsManager.startId,
      icon: CustomIcons.start,
    ),
    FeatureModel(
      name: StringsManager.remoteEngineStartLabel,
      id: StringsManager.remoteEngineStartId,
      icon: CustomIcons.remote,
    ),
    FeatureModel(
      name: StringsManager.cruiseControlLabel,
      id: StringsManager.cruiseControlId,
      icon: CustomIcons.cruiseControl,
    ),
    FeatureModel(
      name: StringsManager.eHandBrakeLabel,
      id: StringsManager.eHandBrakeId,
      icon: CustomIcons.eHandBrake,
    ),
    FeatureModel(
      name: StringsManager.autoHoldLabel,
      id: StringsManager.autoHoldId,
      icon: CustomIcons.autoHold,
      iconSize: AppSize.s20,
    ),
    FeatureModel(
      name: StringsManager.powerSteeringLabel,
      id: StringsManager.powerSteeringId,
      icon: CustomIcons.steering,
    ),
    FeatureModel(
      name: StringsManager.multiSteeringLabel,
      id: StringsManager.multiSteeringId,
      icon: CustomIcons.steering3,
    ),
    FeatureModel(
      name: StringsManager.powerWindowsLabel,
      id: StringsManager.powerWindowsId,
      icon: CustomIcons.powerWindows,
    ),
    FeatureModel(
      name: StringsManager.tintLabel,
      id: StringsManager.tintId,
      icon: CustomIcons.tint,
    ),
    FeatureModel(
      name: StringsManager.electricSteeringWheelLabel,
      id: StringsManager.electricSteeringWheelId,
      icon: CustomIcons.electricSteeringWheel,
    ),
    FeatureModel(
      name: StringsManager.electricMirrorsLabel,
      id: StringsManager.electricMirrorsId,
      icon: CustomIcons.mirror,
    ),
    FeatureModel(
      name: StringsManager.heatedMirrorLabel,
      id: StringsManager.heatedMirrorId,
      icon: CustomIcons.heatedMirror,
    ),

    FeatureModel(
      name: StringsManager.coolBoxLabel,
      id: StringsManager.coolBoxId,
      icon: CustomIcons.coolBox,
    ),
  ],
);
FeaturesList safetyFeatures = FeaturesList(
  title: StringsManager.safetyFeatures,
  id: StringsManager.safetyFeaturesId,
  features: [
    FeatureModel(
      name: StringsManager.absLabel,
      id: StringsManager.absId,
      icon: CustomIcons.abs,
    ),
    FeatureModel(
      name: StringsManager.espLabel,
      id: StringsManager.espId,
      icon: CustomIcons.esp,
    ),
    FeatureModel(
      name: StringsManager.tclLabel,
      id: StringsManager.tclId,
      icon: CustomIcons.tcl,
    ),
    FeatureModel(
      name: StringsManager.epsLabel,
      id: StringsManager.epsId,
      icon: CustomIcons.eps,
    ),
    FeatureModel(
      name: StringsManager.immobilizerLabel,
      id: StringsManager.immobilizerId,
      icon: CustomIcons.immobilizer,
    ),
    FeatureModel(
      name: StringsManager.brakeAssistLabel,
      id: StringsManager.brakeAssistId,
      icon: CustomIcons.brakeAssist,
    ),

    FeatureModel(
      name: StringsManager.hillAssistLabel,
      id: StringsManager.hillAssistId,
      icon: CustomIcons.hillAssist,
    ),
    FeatureModel(
      name: StringsManager.driverDrowsinessDetectionLabel,
      id: StringsManager.driverDrowsinessDetectionId,
      icon: CustomIcons.driverDrowsinessDetection,
    ),
    FeatureModel(
      name: StringsManager.driverAttentionWarningLabel,
      id: StringsManager.driverAttentionWarningId,
      icon: CustomIcons.driverAttentionWarning,
    ),
    FeatureModel(
      name: StringsManager.driverAirbagLabel,
      id: StringsManager.driverAirbagId,
      icon: CustomIcons.airbag,
    ),
    FeatureModel(
      name: StringsManager.passengerAirbagLabel,
      id: StringsManager.passengerAirbagId,
      icon: CustomIcons.airbag,
    ),
    FeatureModel(
      name: StringsManager.sideAirbagLabel,
      id: StringsManager.sideAirbagId,
      icon: CustomIcons.sideAirbags,
    ),
    FeatureModel(
      name: StringsManager.tpmsLabel,
      id: StringsManager.tpmsId,
      icon: CustomIcons.tpms,
    ),
    FeatureModel(
      name: StringsManager.isofixLabel,
      id: StringsManager.isofixId,
      icon: CustomIcons.isofix,
    ),
    FeatureModel(
      name: StringsManager.childLockLabel,
      id: StringsManager.childLockId,
      icon: CustomIcons.childLock,
    ),
    FeatureModel(
      name: StringsManager.emergencySosLabel,
      id: StringsManager.emergencySosId,
      icon: CustomIcons.sos,
    ),
  ],
);

FeaturesList driverAssistance = FeaturesList(
  id: StringsManager.driverAssistanceId,
  title: StringsManager.driverAssistance,
  features: [
    FeatureModel(
      name: StringsManager.adaptiveCruiseControlLabel,
      id: StringsManager.adaptiveCruiseControlId,
      icon: CustomIcons.laneChangeAssist,
    ),

    FeatureModel(
      name: StringsManager.forwardCrashWarningLabel,
      id: StringsManager.forwardCrashWarningId,
      icon: CustomIcons.forwardCrashWarning,
    ),
    FeatureModel(
      name: StringsManager.emergencyBrakingLabel,
      id: StringsManager.emergencyBrakingId,
      icon: CustomIcons.emergencyBraking,
    ),
    FeatureModel(
      name: StringsManager.blindSpotLabel,
      id: StringsManager.blindSpotId,
      icon: CustomIcons.blindSpot,
    ),
    FeatureModel(
      name: StringsManager.laneKeepAssistLabel,
      id: StringsManager.laneKeepAssistId,
      icon: CustomIcons.laneKeepAssist,
    ),
    FeatureModel(
      name: StringsManager.laneChangeAssistLabel,
      id: StringsManager.laneChangeAssistId,
      icon: CustomIcons.laneChangeAssist,
    ),
    FeatureModel(
      name: StringsManager.intersectionAssistLabel,
      id: StringsManager.intersectionAssistId,
      icon: CustomIcons.intersectionAssist,
    ),
    FeatureModel(
      name: StringsManager.personsDetectionLabel,
      id: StringsManager.personsDetectionId,
      icon: CustomIcons.personsDetection,
    ),
    FeatureModel(
      name: StringsManager.speedLimitRecogniseLabel,
      id: StringsManager.speedLimitRecogniseId,
      icon: CustomIcons.speedLimitRecognise,
    ),

    FeatureModel(
      name: StringsManager.parkingAssistLabel,
      id: StringsManager.parkingAssistId,
      icon: CustomIcons.parkingSensors,
    ),
    FeatureModel(
      name: StringsManager.autoBrakingLabel,
      id: StringsManager.autoBrakingId,
      icon: CustomIcons.warning,
    ),
    FeatureModel(
      name: StringsManager.distanseWarningLabel,
      id: StringsManager.distanseWarningId,
      icon: CustomIcons.distanseWarning,
    ),
  ],
);

FeaturesList visionAndCameras = FeaturesList(
  id: StringsManager.visionAndCamerasId,
  title: StringsManager.visionAndCamerasLabel,
  features: [
    FeatureModel(
      name: StringsManager.carRearViewCameraLabel,
      id: StringsManager.carRearViewCameraId,
      icon: CustomIcons.rearCamera,
    ),
    FeatureModel(
      name: StringsManager.camera360Label,
      id: StringsManager.camera360Id,
      icon: CustomIcons.camera360,
    ),
    FeatureModel(
      name: StringsManager.carFrontViewCameraLabel,
      id: StringsManager.carFrontViewCameraId,
      icon: CustomIcons.frontCamera,
    ),
    FeatureModel(
      name: StringsManager.autoParkingLabel,
      id: StringsManager.autoParkingId,
      icon: CustomIcons.autoParking,
    ),
    FeatureModel(
      name: StringsManager.frontParkingSensorsLabel,
      id: StringsManager.frontParkingSensorsId,
      icon: CustomIcons.frontParkingSensors,
    ),
    FeatureModel(
      name: StringsManager.rearParkingSensorsLabel,
      id: StringsManager.rearParkingSensorsId,
      icon: CustomIcons.rearParkingSensors,
    ),

    FeatureModel(
      name: StringsManager.hudLabel,
      id: StringsManager.hudId,
      icon: CustomIcons.hud,
    ),
    FeatureModel(
      name: StringsManager.dashCamLabel,
      id: StringsManager.dashCamId,
      icon: CustomIcons.dashCam,
    ),
  ],
);

FeaturesList lightingAndVisibility = FeaturesList(
  title: StringsManager.lightingAndVisibilityLabel,
  id: StringsManager.lightingAndVisibilityId,
  features: [
    FeatureModel(
      name: StringsManager.ledLightsLabel,
      id: StringsManager.ledLightsId,
      icon: CustomIcons.ledLights,
    ),
    FeatureModel(
      name: StringsManager.matrixLedHeadlightsLabel,
      id: StringsManager.matrixLedHeadlightsId,
      icon: CustomIcons.matrixHeadlights,
    ),
    FeatureModel(
      name: StringsManager.adaptiveLightsLabel,
      id: StringsManager.adaptiveLightsId,
      icon: CustomIcons.adaptiveLights,
    ),
    FeatureModel(
      name: StringsManager.activeHeadlightsLabel,
      id: StringsManager.activeHeadlightsId,
      icon: CustomIcons.activeHeadlights,
    ),
    FeatureModel(
      name: StringsManager.autoHeadlightsLabel,
      id: StringsManager.autoHeadlightsId,
      icon: CustomIcons.autoHeadlights,
    ),
    FeatureModel(
      name: StringsManager.autoHighBeamLabel,
      id: StringsManager.autoHighBeamId,
      icon: CustomIcons.ledLights,
    ),
    FeatureModel(
      name: StringsManager.dayLightsLabel,
      id: StringsManager.dayLightsId,
      icon: CustomIcons.dayLights,
    ),
    FeatureModel(
      name: StringsManager.fogLightsLabel,
      id: StringsManager.fogLightsId,
      icon: CustomIcons.fogLights,
    ),
    FeatureModel(
      name: StringsManager.rearFogLabel,
      id: StringsManager.rearFogId,
      icon: CustomIcons.rearFog,
    ),
    FeatureModel(
      name: StringsManager.rainSensorLabel,
      id: StringsManager.rainSensorId,
      icon: CustomIcons.rainSensor,
    ),
    FeatureModel(
      name: StringsManager.rainSensorWipersLabel,
      id: StringsManager.rainSensorWipersId,
      icon: CustomIcons.rainSensorWipers,
    ),
  ],
);

FeaturesList technologyAndInfotainment = FeaturesList(
  title: StringsManager.technologyAndInfotainmentLabel,
  id: StringsManager.technologyAndInfotainmentId,
  features: [
    FeatureModel(
      name: StringsManager.touchScreenLabel,
      id: StringsManager.touchScreenId,
      icon: CustomIcons.touchScreen,
    ),
    FeatureModel(
      name: StringsManager.radioLabel,
      id: StringsManager.radioId,
      icon: CustomIcons.radio,
    ),
    FeatureModel(
      name: StringsManager.carplayLabel,
      id: StringsManager.carplayId,
      icon: CustomIcons.carplay,
      iconSize: AppSize.s20,
    ),
    FeatureModel(
      name: StringsManager.androidAutoLabel,
      id: StringsManager.androidAutoId,
      icon: CustomIcons.androidAuto,
      iconSize: AppSize.s20,
    ),
    FeatureModel(
      name: StringsManager.navigationSystemLabel,
      id: StringsManager.navigationSystemId,
      icon: CustomIcons.navigationSystem1,
    ),
    FeatureModel(
      name: StringsManager.gpsLabel,
      id: StringsManager.gpsId,
      icon: CustomIcons.gps,
    ),
    FeatureModel(
      name: StringsManager.bluetoothLabel,
      id: StringsManager.bluetoothId,
      icon: CustomIcons.bluetooth,
    ),
    FeatureModel(
      name: StringsManager.auxLabel,
      id: StringsManager.auxId,
      icon: CustomIcons.aux,
    ),

    FeatureModel(
      name: StringsManager.usbLabel,
      id: StringsManager.usbId,
      icon: CustomIcons.usb1,
    ),
    FeatureModel(
      name: StringsManager.usbCLabel,
      id: StringsManager.usbCId,
      icon: CustomIcons.usbC1,
    ),
    FeatureModel(
      name: StringsManager.wirelessChargingLabel,
      id: StringsManager.wirelessChargingId,
      icon: CustomIcons.wirelessCharging,
    ),
    FeatureModel(
      name: StringsManager.soundSystemLabel,
      id: StringsManager.soundSystemId,
      icon: CustomIcons.soundSystem,
    ),

    FeatureModel(
      name: StringsManager.cdChangerLabel,
      id: StringsManager.cdChangerId,
      icon: CustomIcons.cdChanger,
    ),
    FeatureModel(
      name: StringsManager.cdPlayerLabel,
      id: StringsManager.cdPlayerId,
      icon: CustomIcons.cdPlayer,
    ),
    FeatureModel(
      name: StringsManager.dvdPlayerLabel,
      id: StringsManager.dvdPlayerId,
      icon: CustomIcons.dvdPlayer,
    ),
    FeatureModel(
      name: StringsManager.cassetteLabel,
      id: StringsManager.cassetteId,
      icon: CustomIcons.cassette,
    ),
  ],
);

FeaturesList exteriorAndConvenience = FeaturesList(
  title: StringsManager.exteriorAndConvenienceLabel,
  id: StringsManager.exteriorAndConvenienceId,
  features: [
    FeatureModel(
      name: StringsManager.premiumWheelsLabel,
      id: StringsManager.premiumWheelsId,
      icon: CustomIcons.rims,
    ),
    FeatureModel(
      name: StringsManager.foldingMirrorsLabel,
      id: StringsManager.foldingMirrorsId,
      icon: CustomIcons.mirror,
    ),
    FeatureModel(
      name: StringsManager.keylessLabel,
      id: StringsManager.keylessId,
      icon: CustomIcons.keyless,
    ),
    FeatureModel(
      name: StringsManager.remoteLabel,
      id: StringsManager.remoteId,
      icon: CustomIcons.remote2,
    ),
    FeatureModel(
      name: StringsManager.smartRemoteLabel,
      id: StringsManager.smartRemoteId,
      icon: CustomIcons.remote,
    ),
    FeatureModel(
      name: StringsManager.alarmLabel,
      id: StringsManager.alarmId,
      icon: CustomIcons.alarm,
    ),
    FeatureModel(
      name: StringsManager.lockLabel,
      id: StringsManager.lockId,
      icon: CustomIcons.lock,
    ),
    FeatureModel(
      name: StringsManager.comfortWindowsLabel,
      id: StringsManager.comfortWindowsId,
      icon: CustomIcons.windowSwitch,
    ),
    FeatureModel(
      name: StringsManager.powerTailGateLabel,
      id: StringsManager.powerTailGateId,
      icon: CustomIcons.powertTrunk,
    ),
    FeatureModel(
      name: StringsManager.sunroofLabel,
      id: StringsManager.sunroofId,
      icon: CustomIcons.sunroof,
    ),

    FeatureModel(
      name: StringsManager.airSuspensionLabel,
      id: StringsManager.airSuspensionId,
      icon: CustomIcons.airSuspension,
    ),
    FeatureModel(
      name: StringsManager.spoilerLabel,
      id: StringsManager.spoilerId,
      icon: CustomIcons.spoiler,
    ),
  ],
);

String _normalizeFeatureId(String id) => id.trim();

final Map<String, FeatureModel> _featureById = {
  for (final list in featuresCatalog)
    for (final feature in list.features)
      _normalizeFeatureId(feature.id): feature,
};

final Map<String, FeaturesList> _featuresListById = {
  for (final list in featuresCatalog) _normalizeFeatureId(list.id): list,
};

FeatureModel? featureById(String id) {
  return _featureById[_normalizeFeatureId(id)];
}

FeaturesList? featuresListById(String id) {
  return _featuresListById[_normalizeFeatureId(id)];
}

FeaturesList? buildFeaturesListFromIds({
  required String listId,
  required List<String> featureIds,
}) {
  final catalogList = featuresListById(listId);
  if (catalogList == null) {
    return null;
  }

  final resolvedFeatures = featureIds
      .map(featureById)
      .whereType<FeatureModel>()
      .toList();

  return FeaturesList(
    title: catalogList.title,
    id: catalogList.id,
    features: resolvedFeatures,
  );
}

List<FeaturesList> resolveFeaturesFromJson(dynamic json) {
  if (json is! List) {
    return const [];
  }

  final resolved = <FeaturesList>[];
  for (final entry in json) {
    if (entry is! Map<String, dynamic>) {
      continue;
    }

    final rawList = entry[CarsTableKeys.featuresList];
    if (rawList is List && entry.containsKey(CarsTableKeys.featuresId)) {
      final listId = entry[CarsTableKeys.featuresId]?.toString() ?? '';
      final featureIds = rawList.map((e) => e.toString()).toList();
      final built = buildFeaturesListFromIds(
        listId: listId,
        featureIds: featureIds,
      );
      if (built != null) {
        resolved.add(built);
      }
    }
  }

  return resolved;
}
