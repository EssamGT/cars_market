import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_status.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatefulWidget {
  final CarStatus status;
  const StatusWidget({super.key, required this.status});

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  late Color backgroundColor;
  late Color textColor;

  @override
  void initState() {
    getStatusBackgroundColor();
    super.initState();
  }
  void getStatusBackgroundColor() {
    switch (widget.status) {
      case CarStatus.active:
        backgroundColor = Colors.green.withAlpha(80);
        textColor = Colors.greenAccent;
      case CarStatus.deactivated:
        backgroundColor = Colors.grey.withAlpha(80);
        textColor = Colors.grey;
      case CarStatus.pendingReview:
        backgroundColor = Colors.orange.withAlpha(80);
        textColor = Colors.orangeAccent;
      case CarStatus.rejected:
        backgroundColor = Colors.red.withAlpha(80);
        textColor = Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: AppPadding.p8,
      //   vertical: AppPadding.p4,
      // ),
      // margin: EdgeInsets.symmetric(
      //   vertical: AppMargin.m8,
      //   horizontal: AppMargin.m8,
      // ),
      decoration: BoxDecoration(
        // color: backgroundColor,
        // borderRadius: BorderRadius.circular(AppSize.s30),
        // border: Border.all(
        //   color: textColor, // Green border for better visibility
        //   width: 1,
        // ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSize.s10,
            height: AppSize.s10,
            decoration: BoxDecoration(
              color: textColor, // Green dot for "Active" status
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: AppSize.s6),
          Text(
            widget.status.tName,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
