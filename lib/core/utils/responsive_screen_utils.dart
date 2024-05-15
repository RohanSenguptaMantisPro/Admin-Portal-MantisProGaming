// responsive_util.dart
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';

import 'package:flutter/material.dart';

// Define your media query conditions
const double mobileWidth = 480;
const double tabletWidth = 768;
const double desktopWidth = 1024;

// Utility functions to check screen sizes
bool isMobile(BuildContext context) => context.width < mobileWidth;

bool isTablet(BuildContext context) =>
    context.width >= mobileWidth && context.width < tabletWidth;

bool isDesktop(BuildContext context) => context.width >= desktopWidth;
