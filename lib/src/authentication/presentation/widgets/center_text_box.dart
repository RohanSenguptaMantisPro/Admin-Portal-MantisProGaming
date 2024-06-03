import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:flutter/material.dart';

class CenterTextBox extends StatelessWidget {
  const CenterTextBox({required this.childButton, super.key});

  final Widget childButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: context.height * 0.1),
        width: 700,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              MediaRes.mantisProGamingLogo,
              width: 150,
              height: 50,
            ),
            Text(
              'Welcome to Mantis.',
              style: context.theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: Text(
                'Contact management designed for teams and individuals.',
                style: context.theme.textTheme.titleSmall!.copyWith(
                  color: Colours.lightWhiteTextColour,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            childButton,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Having issues?',
                  style: context.theme.textTheme.labelSmall,
                ),
                TextButton(
                  onPressed: () => (),
                  style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(
                      Colors.transparent,
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  child: Text(
                    'Tap Here to Submit Feedback',
                    style: context.theme.textTheme.labelSmall!.copyWith(
                      color: Colours.whiteTextColour,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colours.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 330,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By signing in, you agree to our ',
                      style: context.theme.textTheme.labelSmall,
                    ),
                    TextSpan(
                      text: 'Terms & Conditions ',
                      style: context.theme.textTheme.labelSmall!.copyWith(
                        color: Colours.primaryColour,
                      ),
                    ),
                    TextSpan(
                      text: 'and understand information will be used as '
                          'described in the',
                      style: context.theme.textTheme.labelSmall,
                    ),
                    TextSpan(
                      text: ' Notice at Collection ',
                      style: context.theme.textTheme.labelSmall!.copyWith(
                        color: Colours.primaryColour,
                      ),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: context.theme.textTheme.labelSmall,
                    ),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: context.theme.textTheme.labelSmall!.copyWith(
                        color: Colours.primaryColour,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
