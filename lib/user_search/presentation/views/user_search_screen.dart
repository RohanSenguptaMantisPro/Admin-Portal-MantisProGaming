import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/user_search/presentation/widgets/account_type_dropdown_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/user_search/presentation/widgets/search_user_form.dart';
import 'package:flutter/material.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final textEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colours.primaryColour,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Search',
                    style: context.theme.textTheme.titleMedium,
                  ),
                  const Divider(
                    thickness: 0.2,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AccountTypeDropdown(),
                          const SizedBox(width: 5),
                          SearchUserForm(
                            textEditingController: textEditingController,
                            formKey: formKey,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.yellow,
              ),
            ),
            child: Row(),
          ),
        ),
        Expanded(
          flex: 12,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
              ),
            ),
            child: Column(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
            ),
            child: Row(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
