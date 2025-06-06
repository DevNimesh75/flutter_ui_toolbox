# flutter_ui_toolbox

 Flutter UI Toolbox is a lightweight, powerful, and easy-to-use package that provides essential extensions to simplify UI development in Flutter. From widget styling to context utilities, animations, device checks, and date formatting, this package offers dozens of time-saving utilities to boost productivity!


## Platform Support

| Android | iOS | Web |
| :-----: | :-: | :-: |
|   ✔️    | ✔️  | ✔️  |




## Installation

Add this package to `pubspec.yaml` as follows:

```console
$ flutter pub add flutter_ui_toolbox
```

Import package

```dart
import 'package:flutter_ui_toolbox/flutter_ui_toolbox.dart';
```


Initialize flutter_ui_toolbox in main.dart file for initializing Shared Preferences and other variables.
Also you can assign your Chat GPT key here.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initialize();

  runApp(MyApp());
}
```


## Extensions Methods that makes your code more readable

### Color Extensions
A useful extensions to the `Color` class.

```dart

Color baseColor = Colors.blue;// taking a color 

Color lighterColor = baseColor.adjustBrightness(20); // Lightens by 20%

Color darkerColor = baseColor.adjustBrightness(-20); // Darkens by 20%

Color semiTransparent = Colors.red.withOpacityLevel(50); // 50% opacity

Color solidBlue = ColorExtensions.fromRGB(52, 152, 219); // Create a solid blue color

Color transparentGreen = ColorExtensions.fromRGB(46, 204, 113, 0.5); // Create a semi-transparent green color


```
### BuildContext Extensions
Supercharge your BuildContext with a collection of highly convenient getters and methods. Accessing 
ThemeData, MediaQuery, Navigator, and more has never been easier. Stop writing Theme.of(this)
and MediaQuery.of(this).size repeatedly!

### Screen & Device Info
Access properties from MediaQuery with ease.

```markdown
| Getter                 | Description                               | Example                                                |
|------------------------|-------------------------------------------|--------------------------------------------------------|
| getScreenSize          | Returns the screen Size (width & height). | Size size = context.getScreenSize;                     |
| getScreenWidth         | Returns the screen width.                 | double width = context.getScreenWidth;                 |
| getScreenHeight        | Returns the screen height.                | double height = context.getScreenHeight;               |
| getStatusBarHeight     | Returns the top status bar height.        | double topPadding = context.getStatusBarHeight;        |
| getNavigationBarHeight | Returns the bottom navigation bar height. | double bottomPadding = context.getNavigationBarHeight; |
| isKeyboardShowing      | Returns true if the keyboard is visible.  | if (context.isKeyboardShowing) ...                     |
| orientation            | Returns the device Orientation.           | Orientation current = context.orientation;             |
| isPortrait             | Returns true for portrait orientation.    | if (context.isPortrait) ...                            |
| isLandscape            | Returns true for landscape orientation.   | if (context.isLandscape) ...                           |

```

### 🎨 Theme & Colors
Directly access your app's theme data and colors.

```markdown
| Getter                  | Description                                    | Equivalent to                             |
|-------------------------|------------------------------------------------|-------------------------------------------|
| getTheme                | Returns the current ThemeData.                 | Theme.of(context)                         |
| textTheme               | Returns the TextTheme from the current theme.  | Theme.of(context).textTheme               |
| primaryColor            | Returns the theme's primary color.             | Theme.of(context).primaryColor            |
| accentColor             | Returns the theme's accent/secondary color.    | Theme.of(context).colorScheme.secondary   |
| scaffoldBackgroundColor | Returns the theme's scaffold background color. | Theme.of(context).scaffoldBackgroundColor |
| cardColor               | Returns the theme's card color.                | Theme.of(context).cardColor               |
| dividerColor            | Returns the theme's divider color.             | Theme.of(context).dividerColor            |
| iconColor               | Returns the theme's default icon color.        | Theme.of(context).iconTheme.color         |
| platformBrightness      | Returns the current Brightness (light/dark).   | MediaQuery.of(context).platformBrightness |

```

### 🏗️ Widget & State Access
Get the state of common ancestor widgets in the tree.

```markdown
| scaffoldState    | Returns the nearest ScaffoldState.    | Scaffold.of(context)         |
|------------------|---------------------------------------|------------------------------|
| formState        | Returns the nearest FormState.        | Form.of(context)             |
| overlayState     | Returns the nearest OverlayState.     | Overlay.of(context)          |
| defaultTextStyle | Returns the default DefaultTextStyle. | DefaultTextStyle.of(context) |

```

### 🧭 Navigation
Simplified navigation methods.

```markdown
| Method   | Description                                | Equivalent to             |
|----------|--------------------------------------------|---------------------------|
| canPop() | Returns true if the navigator can pop.     | Navigator.canPop(context) |
| pop()    | Pops the current route from the navigator. | Navigator.pop(context)    |

```

### 📱 Responsive & Platform Checks
Build adaptive UIs by checking the platform and screen size.

```markdown
| Getter    | Description                                           |
|-----------|-------------------------------------------------------|
| isPhone   | Returns true if screen width < 600.                   |
| isTablet  | Returns true if screen width is between 600 and 1200. |
| isDesktop | Returns true if screen width >= 1200.                 |
| isAndroid | Returns true if the platform is Android.              |
| isIOS     | Returns true if the platform is iOS.                  |
| isWindows | Returns true if the platform is Windows.              |
| isLinux   | Returns true if the platform is Linux.                |
| isMacOS   | Returns true if the platform is macOS.                |

```
Example
```dart
/// Show a different layout for tablets
if (context.isTablet) {
  return MyTabletLayout();
} else {
  return MyPhoneLayout();
}

/// Add a platform-specific feature
if (context.isIOS) {
  /// Show Cupertino-style widgets
}else if(context.isAndroid){
  
}
```

### String Extensions

```dart

String? myString = "hello world";
print(myString.capitalizeFirstLetterX()); // Output: "Hello world"

String? priceString = "123.45";
print(priceString.toDouble()); // Output: 123.45

String? emptyString;
print(emptyString.validate(value: "Default Name")); // Output: "Default Name"

String? status = "true";
print(status.toBool()); // Output: true

String? hexColor = "#FF0000";
print(hexColor.toColor()); // Output: Color(0xffff0000)

String? email = "test@example.com";
print(email.validateEmail()); // Output: true

```

### bool Extensions

```dart
bool? isActive = null;
print(isActive.validate(value: true)); // Output: true
print(isActive.getIntBool(value: true)); // Output: 1
```

### Int Extensions

```dart

int? count = null;
print(count.validate(defaultValue: 10)); // Output: 10

int? statusInt = 1;
print(statusInt.toBool()); // Output: true

// Duration examples
print(5.seconds); // Output: 0:00:05.000000
print(2.hours);   // Output: 2:00:00.000000

// Spacing with SizedBox
SizedBox spaceHeight = 20.height;
SizedBox spaceWidth = 10.width;

// Check HTTP status code
int? statusCode = 200;
print(statusCode.isSuccessful()); // Output: true

// Number range check
print(100.isBetween(50, 150)); // Output: true

// Date formatting
print(25.toMonthDaySuffix()); // Output: "25 th"
print(9.toMonthName(isHalfName: true)); // Output: "Sept"
print(3.toWeekDay()); // Output: "Wednesday"
```

### List Extensions

```dart 
List<String>? fruits = ["Apple", "Banana"];
/// validate() will return the empty list in case of null
print(fruits.validate()); // Output: [Apple, Banana]

List<int>? emptyList;
print(emptyList.isNotEmptyList()); // Output: false

List<String>? words = ["Flutter", "Dart", "Extensions"];
print(words.joinWith(" - ")); // Output: "Flutter - Dart - Extensions"
```

### Map Extensions
```dart

Map<String, dynamic>? userData = {"name": "Alice", "age": 30};
print(userData.validate()); // Output: {name: Alice, age: 30}

Map<String, int>? scores;
print(scores.isNotEmptyMap()); // Output: false

print(userData.get("name", defaultValue: "Unknown")); // Output: "Alice"
print(userData.get("city", defaultValue: "N/A")); // Output: "N/A"
```

### Num & Double Extensions

```dart

num? nullableNum = null;
print(nullableNum.validate(defaultValue: 7.5)); // Output: 7.5

num? negativeValue = -25.5;
print(negativeValue.absValue()); // Output: 25.5

num? zeroValue = 0;
print(zeroValue.isNullOrZero()); // Output: true

num valueToClamp = 105;
print(valueToClamp.clampValue(0, 100)); // Output: 100

num floatValue = 12.3456;
print(floatValue.toFixed(2)); // Output: "12.35"

num intFromNum = 9.87;
print(intFromNum.toIntSafe()); // Output: 9

num doubleFromNum = 50;
print(doubleFromNum.toDoubleSafe()); // Output: 50.0

num evenNumber = 4;
print(evenNumber.isEvenNum()); // Output: true

double? price = null;
print(price.validate(value: 0.0)); // Output: 0.0

double distance = 100.0;
print(distance.isBetween(50.0, 150.0)); // Output: true

```

### DateTime Extensions

```dart
import 'package:intl/intl.dart'; // Required for DateFormat (if not part of your main export)
// import 'package:your_package_name/your_package_name.dart'; // Or your specific extensions file

DateTime now = DateTime.now();
DateTime specificDate = DateTime(2023, 10, 26, 14, 30, 0); // October 26, 2023, 2:30 PM

// --- Formatting ---
print(now.format()); // e.g., "2025-06-06 11:30:18" (default format)
print(specificDate.format('dd-MM-yyyy')); // Output: "26-10-2023"
print(specificDate.format('EEEE, MMMM d, yyyy')); // Output: "Thursday, October 26, 2023"

// --- Relative Date Checks ---
print(now.isToday); // Output: true
print(now.subtract(Duration(days: 1)).isYesterday); // Output: true
print(now.add(Duration(days: 1)).isTomorrow); // Output: true

// --- Time Comparisons ---
print(specificDate.isPast); // Output: true (if specificDate is before current time)
print(now.add(Duration(hours: 5)).isFuture); // Output: true

// --- Leap Year Detection ---
print(DateTime(2024, 1, 1).isLeapYear); // Output: true
print(DateTime(2023, 1, 1).isLeapYear); // Output: false

// --- "Time Ago" Display ---
DateTime fiveMinutesAgo = now.subtract(Duration(minutes: 5));
print(fiveMinutesAgo.timeAgo()); // Output: "5 minutes ago"

DateTime twoDaysAgo = now.subtract(Duration(days: 2));
print(twoDaysAgo.timeAgo()); // Output: "2 days ago"

// --- Period Start/End ---
print(specificDate.startOfDay); // Output: 2023-10-26 00:00:00.000
print(specificDate.endOfDay);   // Output: 2023-10-26 23:59:59.999

print(specificDate.startOfWeek); // Output: (Monday of the week containing specificDate) 00:00:00.000
print(specificDate.endOfWeek);   // Output: (Sunday of the week containing specificDate) 23:59:59.999

print(specificDate.startOfMonth); // Output: 2023-10-01 00:00:00.000
print(specificDate.endOfMonth);   // Output: 2023-10-31 23:59:59.999

print(specificDate.startOfYear); // Output: 2023-01-01 00:00:00.000
print(specificDate.endOfYear);   // Output: 2023-12-31 23:59:59.999

// --- Days in Month ---
print(specificDate.daysInMonth); // Output: 31 (for October)
print(DateTime(2024, 2, 1).daysInMonth); // Output: 29 (for Feb 2024 - leap year)
```

### Future Delay Extensions

```dart
// import 'package:your_package_name/your_package_name.dart'; // Import your package

Future<void> simulateOperation() async {
  print("Starting operation...");

  // Delay for 500 milliseconds
  await 500.millisecondsDelay;
  print("Waited 0.5 seconds.");

  // Delay for 2 seconds
  await 2.secondsDelay;
  print("Waited 2 more seconds.");

  // Delay for 1 minute
  await 1.minutesDelay;
  print("Waited 1 minute.");

  print("Operation completed.");
}

void main() {
  simulateOperation();
  // Output in console will show the progression with delays:
  // Starting operation...
  // (0.5 second pause)
  // Waited 0.5 seconds.
  // (2 second pause)
  // Waited 2 more seconds.
  // (1 minute pause)
  // Waited 1 minute.
  // Operation completed.
}
```

### Padding Extensions

```dart
 // Applies 16 units of padding on all sides
const Text('Text with paddingAll(16)').paddingAll(16),

// Applies 10 horizontal and 5 vertical padding
const Text('Symmetric Padding').paddingSymmetric(horizontal: 10, vertical: 5),

// Applies padding only on left (8) and bottom (4)
const Text('Specific Padding').paddingOnly(left: 8, bottom: 4),

// Applies padding only at the top
const Text('Padding at Top').paddingTop(20),

// Applies padding only at the bottom
const Text('Padding at Bottom').paddingBottom(15),

// Applies padding only on the left
const Text('Padding on Left').paddingLeft(25),

// Applies padding only on the right
const Text('Padding on Right').paddingRight(25),

// Conditional visibility
const Text('This text is visible').visible(showText),

// This text will be replaced by an empty SizedBox if showText is false
const Text('This text might be hidden').visible(!showText),

// This text will be replaced by a placeholder if showText is false
const Text('This text shows a placeholder if hidden').visible(!showText, defaultWidget: const Text('Placeholder Text')),

```

### ScrollController Extensions

```dart 
import 'package:flutter/material.dart';

// Assume you have a ScrollController instance, e.g.:
ScrollController _myScrollController = ScrollController();

// --- Scrolling with Animation ---

// Smoothly scroll to the bottom
_myScrollController.scrollToBottom();

// Smoothly scroll to the top with a custom duration
_myScrollController.scrollToTop(duration: const Duration(seconds: 1));

// Smoothly scroll to a specific offset (e.g., 200 pixels down)
_myScrollController.scrollTo(200.0, curve: Curves.fastOutSlowIn);


// --- Instant Jumps ---

// Instantly jump to the bottom
_myScrollController.jumpToBottom();

// Instantly jump to the top
_myScrollController.jumpToTop();


// --- State Checks ---

// Check if currently at the top of the scroll area
bool atTop = _myScrollController.isAtTop;
print('At Top: $atTop');

// Check if currently at the bottom of the scroll area
bool atBottom = _myScrollController.isAtBottom;
print('At Bottom: $atBottom');


// --- Scroll Percentage ---

// Get the current scroll progress as a value between 0.0 and 1.0
double percentage = _myScrollController.scrollPercentage;
print('Scroll Percentage: ${percentage.toStringAsFixed(2)}');

```

### Widget Extensions

```dart 
// A base widget for demonstration
final Widget myWidget = Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  child: const Text('Hello', style: TextStyle(color: Colors.white)),
);

// --- Applying Corner Radius ---

// Apply custom border radius to specific corners
Widget customRoundedCorners = myWidget.cornerRadiusWithClipRRectOnly(
  topLeft: 20.0,
  bottomRight: 20.0,
);

// Apply a uniform corner radius to all corners
Widget allRoundedCorners = myWidget.cornerRadiusWithClipRRect(15.0);


// --- Transformations ---

// Rotate the widget by 45 degrees (pi/4 radians)
Widget rotatedWidget = myWidget.rotate(angle: 0.785); // 45 degrees in radians

// Apply opacity animation
Widget fadedWidget = myWidget.fade(opacity: 0.5, duration: const Duration(seconds: 1));


// --- Interaction and Information ---

// Add an InkWell tap effect with a custom splash color
Widget tappableWidget = myWidget.onTap(
  () => debugPrint('Widget tapped!'),
  splashColor: Colors.red.withAlpha(50),
);

// Wrap the widget in a tooltip
Widget tooltipWidget = myWidget.withTooltip(message: 'This is a tooltip');


// --- Layout and Styling ---

// Make the widget refreshable (typically used around a scrollable widget)
/// Note: 'this' (myWidget) should typically be a SingleChildScrollView content.
Future<void> _handleRefresh() async {
  await Future.delayed(const Duration(seconds: 2));
  debugPrint('Content refreshed!');
}
Widget refreshableList = ListView(
  children: List.generate(5, (index) => ListTile(title: Text('Item $index'))),
).withRefreshIndicator(onRefresh: _handleRefresh);


// Center the widget
Widget centeredWidget = myWidget.centered; // Or myWidget.center();

// Wrap in a container with a background color
Widget coloredBackgroundWidget = myWidget.withBackground(Colors.red);

// Wrap in a Material widget for proper ink effects, etc.
Widget materialWidget = myWidget.asMaterial;

// Wrap with an Expanded widget (for use in Row/Column)
Widget expandedWidget = myWidget.expanded(flex: 2);

// Wrap with a Flexible widget (for use in Row/Column)
Widget flexibleWidget = myWidget.flexible(flex: 1, fit: FlexFit.tight);

// Apply padding using EdgeInsets
Widget paddedWidget = myWidget.withPadding(padding: const EdgeInsets.all(8.0));

// Fit the child into the parent space
Widget fittedWidget = myWidget.fit(fit: BoxFit.scaleDown);
```

## LiveStream Method for Easy 

```dart 
// LiveStream is a singleton, so you can safely get an instance from anywhere.
final liveStream = LiveStream();

// Emit a value from any were 
liveStream.emit("data_updated", "Hello World!");

// Listen for that value from every were 
liveStream.on("data_updated", (data) {
  print("Received update: $data"); // Output: "Received update: Hello World!"
});
```

## TextStyles
```dart
/// Apply Bold TextStyle
Text(item.title.validate(), style: boldTextStyle()),
    
/// Apply Primary TextStyle
Text(item.title.validate(), style: primaryTextStyle()),
    
/// Apply Secondary TextStyle
Text(item.title.validate(), style: secondaryTextStyle()),
```

## Shared Preference Example
```dart
/// To use SharedPreference, you must call initialize() method in main.dart file as mentioned in Installations section

/// setValue method has (String key, dynamic value) parameters

/// add a Double in SharedPref
await setValue("key", 20.0);

/// add a bool in SharedPref
await setValue("key", false);

/// add a int in SharedPref
await setValue("key", 10);

/// add a String in SharedPref
await setValue("key", "value");

/// add a String List in SharedPref
await setValue("key", ['value', 'value', 'value']);

/// Returns a Bool if exists in SharedPref
/// You can set a default value if it returns null
getBoolAsync("key");

/// Returns a Double if exists in SharedPref
getDoubleAsync("key");

/// Returns a Int if exists in SharedPref
getIntAsync("key");

/// Returns a String if exists in SharedPref
getStringAsync("key");

/// Returns a JSON if exists in SharedPref
getJSONAsync("key");

/// Remove a key from SharedPref
await removeKey("key");

/// Returns List of Keys that matches with given Key
getMatchingSharedPrefKeys('key')
```

## Decorations
```dart

BorderRadius radius([double? radius])
Radius radiusCircular([double? radius])
BorderRadius radiusOnly({double? topRight,double? topLeft,double? bottomRight,double? bottomLeft,})

ShapeBorder dialogShape([double? borderRadius])

/// Apply default BoxDecoration with default shadow and border radius
Container(
    decoration: boxDecorationDefault(), // You can modify based on your preference
),

InputDecoration defaultInputDecoration({String? hint, String? label, TextStyle? textStyle})
```

## Widgets
```dart
/// Give Blur effect to any widget
/// Use Blur widget to know more properies
Blur(
  child: AnyWidget(),
)
```

```dart
/// Making an app for Web? You must have to perform something on mouse hover event.
/// Use HoverWidget to get your widget is being hovering or not
HoverWidget(
  builder: (_, isHovering) {
    return AnyWidget();
  },
),
```

```dart
DoublePressBackWidget(
  child: AnyWidget(),
  message: 'Your message' // Optional
),
```


```dart
SettingSection(
  title: Text('Account Management', style: boldTextStyle(size: 24)),
  subTitle: Text('Control your account', style: primaryTextStyle()), // Optional
  items: [
    SettingItemWidget(
      title: 'Hibernate account',
      subTitle: 'Temporary deactivate your account',
      decoration: BoxDecoration(borderRadius: radius()),
      trailing: Icon(Icons.keyboard_arrow_right_rounded, color: context.dividerColor),
      onTap: () {
        //
      }
    ),
    SettingItemWidget(
      title: 'Close account',
      subTitle: 'Learn about your options, and close your account if you wish',
      decoration: BoxDecoration(borderRadius: radius()),
      trailing: Icon(Icons.keyboard_arrow_right_rounded, color: context.dividerColor),
      onTap: () {
        //
      },
    )
  ],
),
```

```dart
/// Default AppButton
/// Use AppButton on your app to try more properties
AppButton(
  text: "Submit",
  color: Colors.green, // Optional
  onTap: () {
      //Your logic
  },
),
```


```dart
/// Use PlaceHolderWidget while your network image is loading
PlaceHolderWidget(),
```

```dart
/// Use GradientBorder while your network image is loading
GradientBorder(
  gradient: LinearGradient(
    colors: [
      Colors.orange,
      Colors.yellow,
      Colors.pink,
    ],
  ),
  strokeWidth: 4.0,
  child: AnyWidget(),
)
```

```dart
/// Use RoundedCheckBox widget to get nicely rounded check box
/// It has many optional parameters to get personalized check box widget
RoundedCheckBox(
  isChecked: true,
  text: 'Remember me',
  onTap: (val) {
    //
  },
),
```

```dart
/// Use SizeListener widget to get callback when its child widget size changes
SizeListener(
  child: AnyWidget(),
  onSizeChange: (size) {
    log(size.width.toString());
  },
),
```

```dart
UL(
   symbolType: SymbolType.Numbered,
   children: [
       Text('Hi', style: primaryTextStyle()),
       Text('Hello', style: primaryTextStyle()),
       Text('How are you?', style: primaryTextStyle()),
   ],
),
```

```dart
/// Add read more button to a long text
ReadMoreText(
  'Long Text',
),
```

```dart
/// Build Horizontal List widget without giving specific height to it.
HorizontalList(
  itemBuilder: (BuildContext context, int index) {
      return AnyWidget();
  },
  itemCount: 25,
),
```


```dart
RatingBarWidget(
  rating: initialRating,
  onRatingChanged: (aRating) {
      rating = aRating;
  },
),
```

```dart
/// Make your Flutter App Responsive in any device out there with Responsive widget
Responsive(
  mobile: MobileWidget(),
  tablet: TabletWidget(), // Optional
  web: WebWidget(), // Optional
),
```

```dart
TextIcon(
  text: 'Your text',
  prefix: AnyWidget(), // Optional
  suffix: AnyWidget(), // Optional
),
```

```dart
DotIndicator(
  pageController: pageController,
  pages: list,
),
```

```dart
/// Use SnapHelperWidget to handle loading and error widget automatically
/// Still you can specify custom Loader Widget and Error Widget
SnapHelperWidget<T>(
  future: future,
  onSuccess: (data) {
      return AnyWidget();
  },
),
```

```dart
DottedBorderWidget(
  child: Container(
      height: 100,
      width: 100,
  ),
),
```

```dart
Marquee(
  direction: Axis.horizontal,
  animationDuration: Duration(milliseconds: 100),
  pauseDuration: Duration(milliseconds: 100),
  child: Text("Please enter a long text to see the effect of the marquee widget"),
),
```

## ⭐⭐⭐ If you like the package, a star to this repo will means a lot.

## You can also contribute by adding new widgets or helpful methods.

## If you want to give suggestion, please contact me via email - dev.nimesh75@gmail.com

## Thank you ❤❤❤





