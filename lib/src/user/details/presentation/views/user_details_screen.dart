import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/enum/account_status_dropdown_menu.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/breadcrumb.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/data_containers.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/drop_down.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_notification.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/presentation/bloc/user_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({required this.uID, super.key});

  static const routeName = 'user-details';
  static const pageName = 'User Details';

  final String uID;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late String? userToken;

  String accountStatus = AccountStatusDropDownMenu.unrestricted.value;
  String displayPicture = '';
  ImageProvider imageProvider = const AssetImage(MediaRes.defaultUserImage);

  //to handle not loading images error.
  void _loadProfilePicture(String url) {
    imageProvider = NetworkImage(url);
    (imageProvider as NetworkImage)
        .resolve(ImageConfiguration.empty)
        .addListener(
          ImageStreamListener(
            (ImageInfo image, bool synchronousCall) {
              // Image loaded successfully
            },
            onError: (dynamic exception, StackTrace? stackTrace) {
              debugPrint('Error loading profile picture: $exception');
              debugPrint('Stack trace: $stackTrace');
              setState(() {
                imageProvider = const AssetImage(MediaRes.defaultUserImage);
              });
            },
          ),
        );
  }

  @override
  void initState() {
    super.initState();

    //fetching userToken
    userToken = context.read<UserTokenProvider>().userToken;

    //   Add UserDetailsEvent with the userID.
    context.read<UserDetailsBloc>().add(
          GetUserDetailsEvent(userToken: userToken ?? '', userID: widget.uID),
        );
  }

  //immutable data items in map.
  List<Map<String, String>> userData = [
    {
      'title': 'id',
      'data': '',
      'width': '260',
    },
    {
      'title': 'accountType',
      'data': '',
      'width': '220',
    },
    {
      'title': 'name',
      'data': '',
      'width': '250',
    },
    {
      'title': 'userName',
      'data': '',
      'width': '250',
    },
    {
      'title': 'googleId',
      'data': '',
      'width': '270',
    },
    {
      'title': 'email',
      'data': '',
      'width': '260',
    },
    {
      'title': 'emailVerified',
      'data': '',
      'width': '200',
    },
    {
      'title': 'role',
      'data': '',
      'width': '200',
    },
    {
      'title': 'locale',
      'data': '',
      'width': '200',
    },
    {
      'title': 'country',
      'data': '',
      'width': '250',
    },
    {
      'title': 'creditsAvailable',
      'data': '',
      'width': '200',
    },
    {
      'title': 'accountActive',
      'data': '',
      'width': '200',
    },
    {
      'title': 'createdAt',
      'data': '',
      'width': '270',
    },
    {
      'title': 'updatedAt',
      'data': '',
      'width': '270',
    },
    // Add more data fields as needed{'title': 'name', 'data': '', 'width' : },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) {
        if (state is GetUserDetailsError) {
          showErrorNotification(
            context,
            'Could not fetch user details! \n\n Error Details: ${state.message}',
          );
        } else if (state is UpdateUserDetailsError) {
          showErrorNotification(
            context,
            'Could not Update user details! \n\n Error Details: ${state.message}',
          );
        } else if (state is GotUserDetails) {
          debugPrint('------------- UserDetails :${state.userDetails}\n');

          // Populating with fetched data.
          accountStatus = state.userDetails.accountStatus ?? accountStatus;
          displayPicture = state.userDetails.displayPicture ?? displayPicture;
          if (state.userDetails.displayPicture != null) {
            _loadProfilePicture(state.userDetails.displayPicture!);
          }

          userData = [
            {
              'title': 'id',
              'data': state.userDetails.id ?? '',
              'width': '260',
            },
            {
              'title': 'accountType',
              'data': state.userDetails.accountType ?? '',
              'width': '220',
            },
            {
              'title': 'name',
              'data': state.userDetails.name ?? '',
              'width': '250',
            },
            {
              'title': 'userName',
              'data': state.userDetails.userName ?? '',
              'width': '250',
            },
            {
              'title': 'googleId',
              'data': state.userDetails.googleId ?? '',
              'width': '270',
            },
            {
              'title': 'email',
              'data': state.userDetails.email ?? '',
              'width': '260',
            },
            {
              'title': 'emailVerified',
              'data': state.userDetails.emailVerified != null
                  ? state.userDetails.emailVerified.toString()
                  : '',
              'width': '200',
            },
            {
              'title': 'role',
              'data': state.userDetails.role != null
                  ? state.userDetails.role.toString()
                  : '',
              'width': '200',
            },
            {
              'title': 'locale',
              'data': state.userDetails.locale ?? '',
              'width': '200',
            },
            {
              'title': 'country',
              'data': state.userDetails.country ?? '',
              'width': '250',
            },
            {
              'title': 'creditsAvailable',
              'data': state.userDetails.creditsAvailable != null
                  ? state.userDetails.creditsAvailable.toString()
                  : '',
              'width': '200',
            },
            {
              'title': 'accountActive',
              'data': state.userDetails.accountActive != null
                  ? state.userDetails.accountActive.toString()
                  : '',
              'width': '200',
            },
            {
              'title': 'createdAt',
              'data': state.userDetails.createdAt != null
                  ? DateFormat('yyyy-MM-dd HH:mm:ss')
                      .format(DateTime.parse(state.userDetails.createdAt!))
                  : '',
              'width': '270',
            },
            {
              'title': 'updatedAt',
              'data': state.userDetails.updatedAt != null
                  ? DateFormat('yyyy-MM-dd HH:mm:ss')
                      .format(DateTime.parse(state.userDetails.updatedAt!))
                  : '',
              'width': '270',
            },
            // Add more data fields as needed
            // {'title': 'name', 'data': '', 'width' : },
          ];
        } else if (state is UpdatedUserDetails) {
          // also call userData of the previous page with the same parameters
          // and of the same page number.
          debugPrint('Updated User Details.');
          showSuccessNotification(
            context,
            'Success! Updated User Details.',
          );
          // //check to refetch userSearch screen data or not.
          // isUserDetailsEdited = true;
        }
      },
      builder: (context, state) {
        return LayoutBuilder(
          builder: (_, boxConstraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 60,
                      bottom: 25,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              // border: Border.all(
                              //   color: Colours.primaryColour,
                              // ),
                              ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //route navigation path here.
                              Breadcrumb(),

                              Text(
                                'User Details',
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
                        Container(
                          width: boxConstraints.maxWidth,
                          constraints: const BoxConstraints(
                            minHeight: 500,
                          ),
                          child: (state is UserDetailsInitial ||
                                  state is GettingUserDetails)
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colours.primaryColour,
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 45,
                                      backgroundImage: imageProvider,
                                      // find displayPicture element and empty check.
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: boxConstraints.maxWidth * 0.7,
                                      alignment: Alignment.topLeft,
                                      child: Wrap(
                                        spacing: 20,
                                        runSpacing: 30,
                                        children: [
                                          ...userData.map(
                                            (data) => DataContainers(
                                              height: 35,
                                              width: double.parse(
                                                data['width']!,
                                              ),
                                              dataText: (data['data']!).isEmpty
                                                  ? '--'
                                                  : data['data']!,
                                              title: data['title']!,
                                            ),
                                          ),
                                          DropDown(
                                            title: 'Account Status',
                                            // Converting items of AccountStatus
                                            // enum to DropdownMenuItem<String>
                                            // for dropdown options.
                                            menuItemList:
                                                AccountStatusDropDownMenu.values
                                                    .map<
                                                        DropdownMenuItem<
                                                            String>>((
                                              AccountStatusDropDownMenu
                                                  accountStatus,
                                            ) {
                                              return DropdownMenuItem<String>(
                                                value: accountStatus.value,
                                                child:
                                                    Text(accountStatus.value),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              accountStatus = newValue;
                                            },
                                            initialValue: accountStatus,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: (state is UpdatingUserDetails)
                              ? const CircularProgressIndicator(
                                  color: Colours.primaryColour,
                                )
                              : ButtonWidget(
                                  onTap: () =>
                                      //update user details bloc event add.
                                      (state is GetUserDetailsError)
                                          ? ()
                                          : context.read<UserDetailsBloc>().add(
                                                UpdateUserDetailsEvent(
                                                  userToken: userToken ?? '',
                                                  userID: widget.uID,
                                                  accountStatus: accountStatus,
                                                ),
                                              ),
                                  width: 150,
                                  height: 35,
                                  buttonBackgroundColor:
                                      (state is GetUserDetailsError)
                                          ? Colours.greyBackground
                                          : Colours.primaryColour,
                                  title: 'Save Changes',
                                  textStyle: (state is GetUserDetailsError)
                                      ? TextStyle(
                                          color: Colours.greyTextColour,
                                        )
                                      : null,
                                ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 15,
                    color: Colours.backgroundColorDark,
                  ),
                  const SizedBox(
                    height: 130,
                    child: Center(
                      child: Text('Advanced Details'),
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
