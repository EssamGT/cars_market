import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_status.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final CarStatus status;
  const StatusWidget({super.key, required this.status});

  Color getStatusBackgroundColor() {
    switch (status) {
      case CarStatus.active:
        return Colors.greenAccent;
      case CarStatus.deactivated:
        return Colors.grey;
      case CarStatus.pendingReview:
        return Colors.orangeAccent;
      case CarStatus.rejected:
        return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSize.s10,
            height: AppSize.s10,
            decoration: BoxDecoration(
              color:
                  getStatusBackgroundColor(), // Green dot for "Active" status
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: AppSize.s6),
          Text(
            status.tName,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: getStatusBackgroundColor()),
          ),
        ],
      ),
    );
  }
}
