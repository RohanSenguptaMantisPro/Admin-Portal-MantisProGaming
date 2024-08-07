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
  Map<GameImageType, String?> imagePaths = {};
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
