import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'flutter_ui_toolbox.dart';

/// package export
export 'package:fluttertoast/fluttertoast.dart';
/// chatgpt
export 'src/chatgpt/chat_gpt.dart';
export 'src/chatgpt/chat_gpt_component.dart';
export 'src/chatgpt/chat_gpt_models.dart';
export 'src/chatgpt/chat_gpt_strings.dart';
export 'src/extension/color_extension.dart';
export 'src/extension/context_extension.dart';
export 'src/extension/data_type_extension.dart';
export 'src/extension/date_and_time_extension.dart';
export 'src/extension/device_extension.dart';
export 'src/extension/future_delay_extension.dart';
export 'src/extension/padding_extension.dart';
// Extension Exports
export 'src/extension/screen_size_extension.dart';
export 'src/extension/scroll_extension.dart';
export 'src/extension/widget_extension.dart';
// livestream export
export 'src/live_stream/livestream.dart';
export 'src/models/language_data_model.dart';
export 'src/models/package_info_model.dart';
export 'src/models/walkthrough_model.dart';
// utils exports
export 'src/utils/colors.dart';
export 'src/utils/common.dart';
export 'src/utils/confirmation_dialog.dart';
export 'src/utils/constants.dart';
export 'src/utils/debouncer.dart';
export 'src/utils/decorations.dart';
export 'src/utils/enums.dart';
export 'src/utils/get_ip_address.dart';
export 'src/utils/jwt_decoder.dart';
export 'src/utils/line_icons.dart';
export 'src/utils/network_utils.dart';
export 'src/utils/pattern.dart';
export 'src/utils/shared_pref.dart';
export 'src/utils/size_config.dart';
export 'src/utils/system_utils.dart';
export 'src/utils/text_styles.dart';
export 'src/utils/time_formatter.dart';
/// widget exports
export 'src/widgets/animatedList/animated_configurations.dart';
export 'src/widgets/animatedList/animated_list_view.dart';
export 'src/widgets/animatedList/animated_scroll_view.dart';
export 'src/widgets/animatedList/animated_wrap.dart';
export 'src/widgets/animatedText/animated_text.dart';
export 'src/widgets/animatedText/type_writer_animation.dart';
export 'src/widgets/app_button.dart';
export 'src/widgets/app_text_field.dart';
export 'src/widgets/blur_widget.dart';
export 'src/widgets/circular_progress_gradient.dart';
export 'src/widgets/dot_indicator.dart';
export 'src/widgets/dotted_border_widget.dart';
export 'src/widgets/double_press_back_widget.dart';
export 'src/widgets/gradient_border.dart';
export 'src/widgets/horizontal_list.dart';
export 'src/widgets/hover_widget.dart';
export 'src/widgets/hyper_link_widget.dart';
export 'src/widgets/language_list_widget.dart';
export 'src/widgets/loader_widget.dart';
export 'src/widgets/marquee_widget.dart';
export 'src/widgets/no_data_widget.dart';
export 'src/widgets/otp_text_field.dart';
export 'src/widgets/overlay_custom_widget.dart';
export 'src/widgets/placeholder_widget.dart';
export 'src/widgets/rating_bar_widget.dart';
export 'src/widgets/read_more_text.dart';
export 'src/widgets/responsive_widget.dart';
export 'src/widgets/restart_app_widget.dart';
export 'src/widgets/rich_text_widget.dart';
export 'src/widgets/rounded_checkbox_widget.dart';
export 'src/widgets/setting_item_widget.dart';
export 'src/widgets/setting_section.dart';
export 'src/widgets/size_listener.dart';
export 'src/widgets/snap_helper_widget.dart';
export 'src/widgets/text_icon_widget.dart';
export 'src/widgets/theme_widget.dart';
export 'src/widgets/timer_widget.dart';
export 'src/widgets/ul_widget.dart';
export 'src/widgets/version_info_widget.dart';
export 'src/widgets/widgets.dart';

//region Global variables - This variables can be changed.
Color textPrimaryColorGlobal = textPrimaryColor;
Color textSecondaryColorGlobal = textSecondaryColor;
double textBoldSizeGlobal = 16;
double textPrimarySizeGlobal = 16;
double textSecondarySizeGlobal = 14;
String? fontFamilyBoldGlobal;
String? fontFamilyPrimaryGlobal;
String? fontFamilySecondaryGlobal;
FontWeight fontWeightBoldGlobal = FontWeight.bold;
FontWeight fontWeightPrimaryGlobal = FontWeight.normal;
FontWeight fontWeightSecondaryGlobal = FontWeight.normal;

Color appBarBackgroundColorGlobal = Colors.white;
Color appButtonBackgroundColorGlobal = Colors.white;
Color defaultAppButtonTextColorGlobal = textPrimaryColorGlobal;
double defaultAppButtonRadius = 8.0;
double defaultAppButtonElevation = 4.0;
double defaultAppButtonFocusElevation = 4.0;
double defaultAppButtonHighlightElevation = 4.0;
double defaultAppButtonHoverElevation = 4.0;
bool enableAppButtonScaleAnimationGlobal = true;
int? appButtonScaleAnimationDurationGlobal;
ShapeBorder? defaultAppButtonShapeBorder;

Color defaultLoaderBgColorGlobal = Colors.white;
Color? defaultLoaderAccentColorGlobal;

Color? defaultInkWellSplashColor;
Color? defaultInkWellHoverColor;
Color? defaultInkWellHighlightColor;
double? defaultInkWellRadius;

Color shadowColorGlobal = Colors.grey.withValues(alpha: 0.2);
int defaultElevation = 4;
double defaultRadius = 8.0;
double defaultBlurRadius = 4.0;
double defaultSpreadRadius = 1.0;
double defaultAppBarElevation = 4.0;

double? maxScreenWidth;

double tabletBreakpointGlobal = 600.0;
double desktopBreakpointGlobal = 720.0;

int passwordLengthGlobal = 6;

late SharedPreferences sharedPreferences;

ShapeBorder? defaultDialogShape;

String defaultCurrencySymbol = currencyRupee;

LanguageDataModel? selectedLanguageDataModel;
List<LanguageDataModel> localeLanguageList = [];

/// If forceEnableDebug if true, you will be able to see log in the logcat in release build also.
/// By default, your log will not seen in logcat in release mode.
bool forceEnableDebug = false;

bool isMaskingEnabledGlobal = true;

// Toast Config
Color defaultToastBackgroundColor = Colors.grey.shade200;
Color defaultToastTextColor = Colors.black;
ToastGravity defaultToastGravityGlobal = ToastGravity.CENTER;
BorderRadius defaultToastBorderRadiusGlobal = radius(30);

PageRouteAnimation? pageRouteAnimationGlobal;
Duration pageRouteTransitionDurationGlobal = 400.milliseconds;

//ChatGpt Key
String chatGPTAPIkey = '';
ChatGPTConfig chatGPTConfigGlobal = ChatGPTConfig();

//endregion

const channelName = 'flutter_ui_toolbox';
final navigatorKey = GlobalKey<NavigatorState>();

get getContext => navigatorKey.currentState?.overlay?.context;

LiveStream liveStream = LiveStream();

// Must be initialize before using shared preference
Future<void> initialize({
  double? defaultDialogBorderRadius,
  List<LanguageDataModel>? aLocaleLanguageList,
  String? defaultLanguage,
}) async {
  sharedPreferences = await SharedPreferences.getInstance();

  defaultAppButtonShapeBorder = RoundedRectangleBorder(borderRadius: radius(defaultAppButtonRadius));

  defaultDialogShape = dialogShape(defaultDialogBorderRadius);

  localeLanguageList = aLocaleLanguageList ?? [];

  selectedLanguageDataModel = getSelectedLanguageModel(defaultLanguage: defaultLanguage);
}

/// Redirect to given widget without context
Future<T?> push<T>(
  Widget widget, {
  bool isNewTask = false,
  PageRouteAnimation? pageRouteAnimation,
  Duration? duration,
}) async {
  if (isNewTask) {
    return await Navigator.of(getContext).pushAndRemoveUntil(
      buildPageRoute(widget, pageRouteAnimation ?? pageRouteAnimationGlobal, duration),
      (route) => false,
    );
  } else {
    return await Navigator.of(getContext).push(
      buildPageRoute(widget, pageRouteAnimation ?? pageRouteAnimationGlobal, duration),
    );
  }
}

/// Dispose current screen or close current dialog
void pop([Object? object]) {
  if (Navigator.canPop(getContext)) Navigator.pop(getContext, object);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    );
  }
}
