import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    required this.targetAnchor,
    required this.followerAnchor,
    required this.tooltipController,
    required this.layerLink,
    required this.overlayMenuWidget,
    required this.buttonWidget,
    super.key,
  });

  final Alignment targetAnchor;
  final Alignment followerAnchor;
  final OverlayPortalController tooltipController;
  final LayerLink layerLink;
  final Widget overlayMenuWidget;
  final Widget buttonWidget;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: OverlayPortal(
        controller: tooltipController,
        overlayChildBuilder: (BuildContext context) {
          // Without using these FittedBox , the overlaywidget
          // either expands infinitely if using followerAnchor, or doesn't
          // appear if wrapped with Align.
          return FittedBox(
            fit: BoxFit.cover,
            child: CompositedTransformFollower(
              targetAnchor: targetAnchor,
              followerAnchor: followerAnchor,
              // followerAnchor makes the size of the overlay tile of no fixed
              // dimension, takes as much space needed based on content.
              link: layerLink,
              // offset: const Offset(0, 10),
              child: FittedBox(
                fit: BoxFit.none,
                child: overlayMenuWidget,
              ),
            ),
          );
        },
        child: buttonWidget,
      ),
    );
  }
}
