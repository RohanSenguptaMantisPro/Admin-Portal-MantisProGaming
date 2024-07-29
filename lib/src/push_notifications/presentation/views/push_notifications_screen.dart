import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/confirmation_dialog.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_notification.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/presentation/bloc/push_notifications_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/presentation/widgets/notification_text_edit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PushNotificationsScreen extends StatefulWidget {
  const PushNotificationsScreen({super.key});

  static const routeName = '/push-notifications';

  @override
  State<PushNotificationsScreen> createState() =>
      _PushNotificationsScreenState();
}

class _PushNotificationsScreenState extends State<PushNotificationsScreen> {
  Uint8List? previewImageDataBytes;
  bool previewImageDimensionFlexible = false;

  final notificationTitleController = TextEditingController();
  final notificationBodyController = TextEditingController();

  XFile? pickedImage;
  String _validationMessage = '';
  bool _isValidImage = false;

  int _titleLetterCount = 0;
  int _bodyLetterCount = 0;
  int titleLetterLimit = 50;
  int bodyLetterLimit = 200;
  bool isExceededLetterLimit = false;

  void _updateLetterCount(String text, {required bool isTitle}) {
    final letterCount = text.length;
    setState(() {
      if (isTitle) {
        _titleLetterCount = letterCount;
      } else {
        _bodyLetterCount = letterCount;
      }
      if (_titleLetterCount > titleLetterLimit ||
          _bodyLetterCount > bodyLetterLimit) {
        isExceededLetterLimit = true;
      } else {
        isExceededLetterLimit = false;
      }
    });
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      bool isValid = await _validateImage(image);
      setState(() {
        pickedImage = image;
        _isValidImage = isValid;
      });
    } else {
      setState(() {
        _validationMessage = 'No image selected';
        _isValidImage = false;
        pickedImage = null;
      });
    }
  }

  String imageFileName() {
    return pickedImage!.name.split('.').first;
  }

  Future<bool> _validateImage(XFile file) async {
    // Check file type
    String fileName = file.name;
    String extension = '.${fileName.split('.').last.toLowerCase()}';
    // debugPrint('-----------filename : ${extension}');
    // debugPrint('-----------mimeType: ${file.mimeType}');

    if (!['.png', '.jpg', '.jpeg'].contains(extension)) {
      setState(
        () => _validationMessage =
            'Invalid file type. Only .PNG and .JPEG are allowed.',
      );
      return false;
    }

    // Check file size
    int fileSize = await file.length();
    if (fileSize > 1 * 1024 * 1024) {
      // 2MB in bytes
      setState(() => _validationMessage = 'File size exceeds 1MB limit.');
      return false;
    }

    // Check image dimensions
    if (!kIsWeb) {
      final bytes = await file.readAsBytes();
      final decodedImage = await decodeImageFromList(bytes);
      if (decodedImage.width != 1024 || decodedImage.height != 512) {
        setState(
          () => _validationMessage =
              'Image dimensions should not exceed  1024x512.',
        );
        return false;
      }
    }
    return true;
  }

  void _sendNotification() {
    context.read<PushNotificationBloc>().add(
          SendNotificationEvent(
            userToken: context.read<UserTokenProvider>().userToken ?? '',
            title: notificationTitleController.text,
            body: notificationBodyController.text,
            fileName: imageFileName(),
          ),
        );
  }

  bool get titleInserted => notificationTitleController.text.isNotEmpty;

  bool get bodyInserted => notificationBodyController.text.isNotEmpty;

  bool get imageInserted => pickedImage != null;

  bool get dataNotInserted => !titleInserted || !bodyInserted || !imageInserted;

  @override
  void dispose() {
    notificationTitleController.dispose();
    notificationBodyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PushNotificationBloc, PushNotificationState>(
      listener: (context, state) {
        debugPrint('-------push notification state: $state');
        //
        if (state is PushNotificationError) {
          showErrorNotification(
            context,
            'Sorry! Something went wrong! \n\n'
            'Details : \n ${state.errorMessage}',
          );
        } else if (state is UploadedNotificationImage) {
          debugPrint(
              '-----UPLOADED NOTIFICATION STATE : filename : ${pickedImage!.name.split('.').first}');
          context.read<PushNotificationBloc>().add(
                DownloadNotificationImageEvent(
                  userToken: context.read<UserTokenProvider>().userToken ?? '',
                  fileName: imageFileName(),
                ),
              );
        } else if (state is DownloadedNotificationImage) {
          previewImageDimensionFlexible = true;

          showSuccessNotification(
            context,
            'Image Uploaded to the server successfully!',
          );
        } else if (state is NotificationResponseState) {
          showSuccessNotification(
            context,
            'Notification is sent to the users successfully!',
          );

          ConfirmationDialog.show(
            context: context,
            title: 'Details of the sent notifications',
            content: 'Successful delivery of notifications : '
                '${state.notificationResponse.success}'
                '\nFailed delivery of notifications: '
                '${state.notificationResponse.failure}',
            confirmText: 'Okay!',
          );
        }
      },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        //
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
                  //to handle overflow horizontally. for now
                  // [SingleChildScrollView] has been used.
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 700,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StatefulBuilder(
                                      builder: (_, refresh) {
                                        return Container(
                                          width: 120,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: _isValidImage
                                              ? Image.network(
                                                  pickedImage!.path,
                                                  fit: BoxFit.contain,
                                                )
                                              : Image.asset(
                                                  MediaRes.defaultPickedImage,
                                                  fit: BoxFit.contain,
                                                ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Banner Image',
                                          style:
                                              context.theme.textTheme.bodySmall,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              child: ElevatedButton.icon(
                                                icon: const Icon(
                                                  Icons.file_upload_outlined,
                                                ),
                                                onPressed: pickImage,
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      12,
                                                    ),
                                                  ),
                                                  foregroundColor: Colors.white,
                                                  backgroundColor:
                                                      Colors.grey[800],
                                                ),
                                                label: const Text('Browse'),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            StatefulBuilder(
                                              builder: (_, setState) {
                                                return (state
                                                            is UploadingNotificationImage) ||
                                                        (state
                                                            is UploadedNotificationImage) ||
                                                        (state
                                                            is DownloadingNotificationImage)
                                                    ? const SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child: Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Colours
                                                                .primaryColour,
                                                          ),
                                                        ),
                                                      )
                                                    : ButtonWidget(
                                                        onTap: () {
                                                          if (!imageInserted) {
                                                            return;
                                                          }

                                                          final userToken = context
                                                              .read<
                                                                  UserTokenProvider>()
                                                              .userToken;

                                                          context
                                                              .read<
                                                                  PushNotificationBloc>()
                                                              .add(
                                                                UploadNotificationImageEvent(
                                                                  userToken:
                                                                      userToken ??
                                                                          '',
                                                                  imageFile:
                                                                      pickedImage!,
                                                                ),
                                                              );
                                                        },
                                                        width: 100,
                                                        height: 33,
                                                        buttonBackgroundColor:
                                                            !imageInserted
                                                                ? Colours
                                                                    .greyBackground
                                                                : Colours
                                                                    .primaryColour,
                                                        child: Center(
                                                          child: Text(
                                                            'Upload',
                                                            style: TextStyle(
                                                              color: !imageInserted
                                                                  ? Colours
                                                                      .greyTextColour
                                                                  : null,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                              },
                                            ),
                                          ],
                                        ),
                                        StatefulBuilder(
                                          builder: (_, refresh) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (_isValidImage)
                                                  Text(
                                                    pickedImage!.name,
                                                    softWrap: true,
                                                  )
                                                else
                                                  Text(
                                                    _validationMessage,
                                                    style: context.theme
                                                        .textTheme.labelSmall
                                                        ?.copyWith(
                                                      color: Colours.redColour,
                                                    ),
                                                  ),
                                                Text(
                                                  '*.png, *.jpeg files, Max: '
                                                  '1MB,'
                                                  ' Recommended'
                                                  ' Size: 720x240',
                                                  style: context.theme.textTheme
                                                      .labelSmall,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                StatefulBuilder(
                                  builder: (_, setState) {
                                    return NotificationTextEdit(
                                      titleController:
                                          notificationTitleController,
                                      bodyController:
                                          notificationBodyController,
                                      updateLetterCount: _updateLetterCount,
                                      titleLetterCount: _titleLetterCount,
                                      bodyLetterCount: _bodyLetterCount,
                                      titleLetterLimit: titleLetterLimit,
                                      bodyLetterLimit: bodyLetterLimit,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: StatefulBuilder(
                                    builder: (_, setState) {
                                      return (state is SendingNotification)
                                          ? const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colours.primaryColour,
                                                ),
                                              ),
                                            )
                                          : ButtonWidget(
                                              onTap: () async {
                                                if (dataNotInserted) {
                                                  return;
                                                } else if (state
                                                    is! DownloadedNotificationImage) {
                                                  return;
                                                }

                                                bool confirmed =
                                                    await ConfirmationDialog
                                                        .show(
                                                  context: context,
                                                  title: 'Confirmation',
                                                  content:
                                                      'Are you sure you want to send this notification?',
                                                  confirmText: 'Sure',
                                                  cancelText: 'Cancel',
                                                );

                                                if (confirmed) {
                                                  _sendNotification();
                                                }
                                              },
                                              width: 100,
                                              height: 33,
                                              buttonBackgroundColor:
                                                  isExceededLetterLimit ||
                                                          dataNotInserted ||
                                                          (state
                                                              is! DownloadedNotificationImage)
                                                      ? Colours.greyBackground
                                                      : Colours.primaryColour,
                                              child: Center(
                                                child: Text(
                                                  'Send',
                                                  style: TextStyle(
                                                    color: dataNotInserted ||
                                                            (state
                                                                is! DownloadedNotificationImage)
                                                        ? Colours.greyTextColour
                                                        : null,
                                                  ),
                                                ),
                                              ),
                                            );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        //to preview downloaded image.
                        SizedBox(
                          height: previewImageDimensionFlexible ? null : 400,
                          width: previewImageDimensionFlexible ? null : 500,
                          child: Builder(
                            builder: (context) {
                              if (state is DownloadedNotificationImage &&
                                  state.serverImage.imageData != null) {
                                previewImageDataBytes =
                                    state.serverImage.imageData;
                                return Image.memory(
                                  state.serverImage.imageData!,
                                  fit: BoxFit.contain,
                                );
                              }

                              if (previewImageDataBytes != null) {
                                return Image.memory(
                                  previewImageDataBytes!,
                                  fit: BoxFit.contain,
                                );
                              } else {
                                return const Center(
                                  child: Text('Preview'),
                                );
                              }
                              // Default case
                            },
                          ),
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
