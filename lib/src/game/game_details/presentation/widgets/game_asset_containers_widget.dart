/*
import 'dart:typed_data';

import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/bloc/game_details_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/enums/game_asset_name_enum.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/widgets/game_asset_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameAssetContainersWidget extends StatefulWidget {
  const GameAssetContainersWidget({
    required this.onBrowse,
    super.key,
  });

  final void Function(GameImageType) onBrowse;

  @override
  State<GameAssetContainersWidget> createState() =>
      _GameAssetContainersWidgetState();
}

class _GameAssetContainersWidgetState extends State<GameAssetContainersWidget> {
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameDetailsBloc, GameDetailsState>(
      listener: (context, state) {
        if (state is DownloadedGameImage) {
          imageBytes = state.gameDetailsImage.imageData;
          debugPrint(
            '-----------image type Downloaded : ${state.imageType}\n'
            'imageBytes : ${imageBytes!.isEmpty}',
          );
        }
      },
      builder: (context, state) {
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: GameImageType.values.map((type) {
            if (state is DownloadingGameImage) {
              if (state.imageType == type) {
                return CircularProgressIndicator(
                  color: Colours.primaryColour,
                );
              }
            }

            return GameAssetContainer(
              imageBytes:
                  //so only images according to its type is sent.
                  (state is DownloadedGameImage && state.imageType == type)
                      ? imageBytes
                      : null,
              type: type,
              onBrowse: () async {
                // Then call widget.onBrowse(type) if needed
                // with condition if image is picked.
                widget.onBrowse(type);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
*/

import 'dart:typed_data';

import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/bloc/game_details_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/enums/game_asset_name_enum.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/widgets/game_asset_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class GameAssetContainersWidget extends StatefulWidget {
  const GameAssetContainersWidget({
    required this.onBrowse,
    super.key,
  });

  final void Function(GameImageType, XFile) onBrowse;

  @override
  State<GameAssetContainersWidget> createState() =>
      _GameAssetContainersWidgetState();
}

class _GameAssetContainersWidgetState extends State<GameAssetContainersWidget> {
  Map<GameImageType, Uint8List?> imageData = {};
  Map<GameImageType, bool> isLoading = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameDetailsBloc, GameDetailsState>(
      listener: (context, state) {
        if (state is DownloadedGameImage) {
          imageData[state.imageType] = state.gameDetailsImage.imageData;
          isLoading[state.imageType] = false;
        } else if (state is DownloadingGameImage) {
          isLoading[state.imageType] = true;
        } else if (state is UploadingGameImage) {
          isLoading[state.imageType] = true;
        } else if (state is UploadedGameImage) {
          isLoading[state.imageType] = false;
        } else if (state is GameImageError) {
          isLoading[state.imageType] = false;
        }
      },
      builder: (context, state) {
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: GameImageType.values.map((type) {
            return GameAssetContainer(
              imageBytes: imageData[type],
              type: type,
              onBrowse: (gameImageType, imageFile) =>
                  widget.onBrowse(type, imageFile),
              isLoading: isLoading[type] ?? false,
            );
          }).toList(),
        );
      },
    );
  }
}
