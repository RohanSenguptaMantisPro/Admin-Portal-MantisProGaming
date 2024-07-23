import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/presentation/bloc/push_notifications_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PushNotificationsScreen extends StatelessWidget {
  const PushNotificationsScreen({super.key});

  static const routeName = '/push-notifications';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PushNotificationBloc, PushNotificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LayoutBuilder(
          builder: (_, boxConstraints) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 64,
                bottom: 24,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        // border: Border.all(
                        //   color: Colours.primaryColour,
                        // ),
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Push Notification',
                          style: context.theme.textTheme.titleMedium,
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // to show form on left and preview image on right.
                        Row(
                          children: [
                            Container(
                              width: boxConstraints.maxWidth * 0.6,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colours.primaryColour,
                                ),
                              ),
                              child: Center(),
                            ),
                            Container(
                              width: boxConstraints.maxWidth * 0.35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colours.redColour,
                                ),
                              ),
                              child: Center(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
