
import 'package:flutter/cupertino.dart';
import 'package:screen_type_builder/src/core/enums.dart';
import 'package:screen_type_builder/src/layout/responsive_builder.dart';

class ScreenTypeBuilder extends StatelessWidget {
  final WidgetBuilder? mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  ScreenTypeBuilder.build({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) {
    _checkIfMobileOrDesktopIsSupplied();
  }

  void _checkIfMobileOrDesktopIsSupplied() {
    final hasMobileLayout = mobile != null;
    final hasDesktopLayout = desktop != null;

    assert(
      hasMobileLayout || hasDesktopLayout,
      'You should supply either a mobile layout or a desktop layout. If you don\'t need two layouts then remove this widget and use the widget you want to use directly. ',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, deviceType) {
      if (deviceType == DeviceScreenType.desktop) {
        // If we have supplied the desktop layout then display that
        if (desktop != null) return desktop!(context);
        // If no desktop layout is supplied we want to check if we have the size below it and display that
        if (tablet != null) return tablet!(context);
      }

      if (deviceType == DeviceScreenType.tablet) {
        if (tablet != null) return tablet!(context);
      }

      if (deviceType == DeviceScreenType.mobile) {
        if (mobile != null) return mobile!(context);
      }
      // If none of the layouts above are supplied we use the prefered layout based on the flag
      final buildDesktopLayout = desktop != null;

      return buildDesktopLayout ? desktop!(context) : mobile!(context);
    });
  }
}
