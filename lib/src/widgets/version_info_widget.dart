import 'package:flutter/material.dart';
import 'package:flutter_ui_toolbox/flutter_ui_toolbox.dart';

/// VersionInfoWidget
class VersionInfoWidget extends StatelessWidget {
  final String prefixText;
  final String suffixText;
  final TextStyle? textStyle;
  final bool showError;

  const VersionInfoWidget({
    this.textStyle,
    this.prefixText = '',
    this.suffixText = '',
    this.showError = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SnapHelperWidget<PackageInfoData>(
      future: getPackageInfo(),
      onSuccess: (data) {
        if (data.versionName.validate().isEmpty) return Offstage();

        return Text(
          '$prefixText${data.versionName.validate()}$suffixText',
          style: textStyle ?? primaryTextStyle(),
        );
      },
      errorWidget: showError ? null : Offstage(),
    );
  }
}
