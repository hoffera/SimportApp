import "package:device_frame/device_frame.dart";
import "package:flutter/material.dart";
import "package:json_app/app/enum/enum.dart";
import "package:mix/mix.dart";

class DevicePreview extends StatelessWidget {
  final Widget screen;
  const DevicePreview({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return _box(
      DeviceFrame(
        device: Devices.android.samsungGalaxyS25,
        isFrameVisible: false,
        screen: screen,
      ),
    );
  }

  Widget _box(Widget child) {
    return Box(
      style: Style(
        $box.color.white(),
        $box.borderRadius.all(10),
        $box.padding.all(5),

        $box.color.white(),
        $box.border.all(color: AppColors.primary, width: 0.5),
        $box.elevation(2),
      ),
      child: child,
    );
  }
}
