import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/enums/game_asset_name_enum.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/widgets/dotted_border_painter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GameAssetContainer extends StatefulWidget {
  const GameAssetContainer({
    required this.type,
    required this.onBrowse,
    required this.imageBytes,
    super.key,
  });

  final GameImageType type;
  final VoidCallback onBrowse;
  final Uint8List? imageBytes;

  @override
  State<GameAssetContainer> createState() => _GameAssetContainerState();
}

class _GameAssetContainerState extends State<GameAssetContainer> {
  XFile? pickedImage;
  String _validationMessage = '';
  bool _isValidImage = false;

  Future<void> pickImage(GameImageType type) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      bool isValid = await _validateImage(image);
      setState(() {
        pickedImage = isValid ? image : null;
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

  void _showFullScreenImage() {
    if (!_isValidImage && widget.imageBytes == null) return;

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Stack(
            children: [
              if (_isValidImage)
                Image.network(
                  pickedImage!.path,
                  fit: BoxFit.contain,
                )
              else if (widget.imageBytes != null)
                Image.memory(
                  widget.imageBytes!,
                  fit: BoxFit.contain,
                ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(),
      //ClipRRect clips the children of the direct child of the ClipRRect
      // meaning, Container's child will be clipped so that its children will
      // remain inside the Container's dimensions also respecting the border
      // radius.
      child: ClipRRect(
        child: Container(
          width: 200,
          height: 170,
          decoration: BoxDecoration(
            color: Colours.greyBackground.withOpacity(0.6),
            borderRadius: BorderRadius.circular(16),
            image: pickedImage != null
                ? DecorationImage(
                    image: NetworkImage(pickedImage!.path),
                    fit: BoxFit.cover,
                  )
                //else show if there is already fetched image
                // else show null.
                : widget.imageBytes != null
                    ? DecorationImage(
                        image: MemoryImage(widget.imageBytes!),
                        fit: BoxFit.cover,
                      )
                    : null,
          ),
          child: Stack(
            children: [
              //if container has no child it will take the whole dimensions of
              // the parent widget.  in this case which is the parent container.
              Container(
                decoration: BoxDecoration(
                  color: !_isValidImage && widget.imageBytes == null
                      ? Colors.transparent
                      : Colours.backgroundColourLightDark.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(
                    text: 'Browse Images',
                    onPressed: () async {
                      await pickImage(widget.type);
                      widget.onBrowse();
                    },
                    iconData: Icons.cloud_upload_outlined,
                  ),
                  Center(
                    child: Text(
                      widget.type.value,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _buildButton(
                      text: 'View Image',
                      onPressed: _showFullScreenImage,
                      iconData: Icons.remove_red_eye_outlined),
                  if (!_isValidImage)
                    Text(
                      _validationMessage,
                      textAlign: TextAlign.center,
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        color: Colours.redColour,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      {required String text,
      required VoidCallback onPressed,
      required IconData iconData}) {
    return TextButton.icon(
      icon: Icon(
        iconData,
      ),
      label: Text(text),
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colours.primaryColour),
        iconColor: WidgetStatePropertyAll(Colours.primaryColour),
        iconSize: WidgetStatePropertyAll(14),
        overlayColor: WidgetStatePropertyAll(Colours.primaryColourLight),
      ),
    );
  }
}
