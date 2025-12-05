import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:redacted/redacted.dart';

class VerifyWidget extends StatelessWidget {
  final bool verified;
  final String title;
  final VoidCallback onVerify;
  final bool loading;
  const VerifyWidget({
    super.key,
    this.verified = false,
    required this.title,
    required this.onVerify,
    this.loading = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p12,
          ),
          child: Container(
            padding: EdgeInsets.all(AppPadding.p12),
            height: AppSize.s65,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: loading
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          // ignore: sized_box_for_whitespace
                          Container(
                            height: AppSize.s30,
                            width: AppSize.s30,
                            // decoration: BoxDecoration(),
                            child: Icon(Icons.info_outline),
                          ).redacted(context: context, redact: loading),

                          SizedBox(width: AppSize.s15),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p10,
                            ),
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ).redacted(context: context, redact: loading),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.p10,
                        ),
                        child: Text(
                          StringsManager.verified,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ).redacted(context: context, redact: loading),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          verified
                              ? Container(
                                  height: AppSize.s25,
                                  width: AppSize.s25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    size: AppSize.s20,
                                  ),
                                )
                              : Container(
                                  height: AppSize.s25,
                                  width: AppSize.s25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Iconsax.info_circle,
                                    color: Theme.of(context).colorScheme.error,
                                    size: AppSize.s25,
                                  ),
                                ),
                          SizedBox(width: AppSize.s15),
                          Text(
                            title,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      verified
                          ? Text(
                              StringsManager.verified,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                            )
                          : TextButton(
                             
                              onPressed: onVerify,
                              style: ButtonStyle(
                                overlayColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.surfaceContainerHighest,
                                ),
                              ),
                              child: Text(
                                StringsManager.verifyNow,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
