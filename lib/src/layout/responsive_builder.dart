import 'package:flutter/material.dart';
import 'package:screen_type_builder/src/core/enums.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    DeviceScreenType deviceScreenType,
  ) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  DeviceScreenType getDeviceType(BoxConstraints constraints) {
    double width = constraints.maxWidth;

    if (width >= 900) {
      return DeviceScreenType.desktop;
    } else if (width >= 600) {
      return DeviceScreenType.tablet;
    } else {
      return DeviceScreenType.mobile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final deviceType = getDeviceType(constraints);
        return builder(context, deviceType);
      },
    );
  }
}
