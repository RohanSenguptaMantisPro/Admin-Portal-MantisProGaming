import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
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
  final notificationTitleController = TextEditingController();
  final notificationBodyController = TextEditingController();

  XFile? pickedImage;
  String _validationMessage = '';
  bool _isValidImage = false;

  int _titleWordCount = 0;
  int _bodyWordCount = 0;
  int titleWordLimit = 50;
  int bodyWordLimit = 200;
  bool isExceededWordLimit = false;

  void _updateWordCount(String text, {required bool isTitle}) {
    final wordCount =
        text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
    setState(() {
      if (isTitle) {
        _titleWordCount = wordCount;
      } else {
        _bodyWordCount = wordCount;
      }
      if (_titleWordCount > titleWordLimit || _bodyWordCount > bodyWordLimit) {
        isExceededWordLimit = true;
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
      });
    }
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
    if (fileSize > 2 * 1024 * 1024) {
      // 2MB in bytes
      setState(() => _validationMessage = 'File size exceeds 2MB limit.');
      return false;
    }

    // Check image dimensions
    if (!kIsWeb) {
      final bytes = await file.readAsBytes();
      final decodedImage = await decodeImageFromList(bytes);
      if (decodedImage.width != 720 || decodedImage.height != 240) {
        setState(
          () => _validationMessage = 'Image dimensions should be 720x240.',
        );
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    notificationTitleController.dispose();
    notificationBodyController.dispose();

    super.dispose();
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  //to handle overflow horizontally. for now
                  // [SingleChildScrollView] has been used.
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 700,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colours.primaryColour,
                            ),
                          ),
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
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  MediaRes.defaultPickedImage,
                                                  fit: BoxFit.cover,
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
                                              backgroundColor: Colors.grey[800],
                                            ),
                                            label: const Text('Browse'),
                                          ),
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
                                                  '2MB,'
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
                                      updateWordCount: _updateWordCount,
                                      titleWordCount: _titleWordCount,
                                      bodyWordCount: _bodyWordCount,
                                      titleWordLimit: titleWordLimit,
                                      bodyWordLimit: bodyWordLimit,
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
                                      return ButtonWidget(
                                        onTap: () => (),
                                        width: 100,
                                        height: 30,
                                        buttonBackgroundColor:
                                            isExceededWordLimit
                                                ? Colours.greyBackground
                                                : Colours.primaryColour,
                                        child: const Center(
                                          child: Text('Send'),
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
                        Container(
                          width: 500,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colours.redColour,
                            ),
                          ),
                          child: Center(),
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
