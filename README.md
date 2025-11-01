## Table of Contents
  - [Platform Support](#platform-support)
  - [Installation](#installation)
  - [How to Use This Package](#how-to-use-this-package)
  - [Extensions Methods that makes your code more readable](#extensions-methods-that-makes-your-code-more-readable)
    - [Color Extensions](#color-extensions)
    - [BuildContext Extensions](#buildcontext-extensions)
      - [Screen & Device Info](#screen--device-info)
      - [🎨 Theme & Colors](#theme--colors)
      - [🏗️ Widget & State Access](#widget--state-access)
      - [🧭 Navigation](#navigation)
      - [📱 Responsive & Platform Checks](#responsive--platform-checks)
    - [String Extensions](#string-extensions)
    - [bool Extensions](#bool-extensions)
    - [Int Extensions](#int-extensions)
    - [List Extensions](#list-extensions)
    - [Map Extensions](#map-extensions)
    - [Num & Double Extensions](#num--double-extensions)
    - [DateTime Extensions](#datetime-extensions)
    - [Future Delay Extensions](#future-delay-extensions)
    - [Padding Extensions](#padding-extensions)
    - [ScrollController Extensions](#scrollcontroller-extensions)
    - [Widget Extensions](#widget-extensions)
  - [LiveStream Method for Easy](#livestream-method-for-easy)
  - [TextStyles](#textstyles)
  - [Shared Preference Example](#shared-preference-example)
  - [Decorations](#decorations)
  - [Widgets](#widgets)
    - [Layout & Structure Widgets](#layout--structure-widgets)
    - [Visual Enhancement & Effects Widgets](#visual-enhancement--effects-widgets)
    - [Interaction & Control Widgets](#interaction--control-widgets)
    - [Text Display & Manipulation Widgets](#text-display--manipulation-widgets)
    - [Utility & Helper Widgets](#utility--helper-widgets)
  - [⭐⭐⭐ If you like the package, a star to this repo will means a lot.](#if-you-like-the-package-a-star-to-this-repo-will-means-a-lot)
  - [Contributing](#contributing)
  - [If you want to give suggestion, please contact me via email - dev.nimesh75@gmail.com](#if-you-want-to-give-suggestion-please-contact-me-via-email---devnimesh75gmailcom)
  - [Thank you ❤❤❤](#thank-you)


# flutter_ui_toolbox

Welcome to Flutter UI Toolbox! 👋 Are you looking to supercharge your Flutter UI development? This package is your new best friend! Our core mission is to simplify and accelerate your workflow by providing a comprehensive suite of **lightweight, powerful, and easy-to-use** tools.

🚀 **Boost your productivity** and write **cleaner, more readable code** with our extensive collection of time-saving utilities. Whether you're styling widgets, managing device contexts, implementing animations, formatting dates, or needing handy helper functions, Flutter UI Toolbox has got you covered. Dive in and discover dozens of extensions, custom widgets, and practical utilities designed to make your Flutter development experience smoother and more enjoyable. Let's build beautiful UIs, faster!


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
  
  await initialize(); // Ensure SharedPreferences is initialized.
  // You can also assign your Chat GPT key here if needed for specific features.

  runApp(MyApp());
}
```

## How to Use This Package

Getting started with Flutter UI Toolbox is straightforward. Here’s a quick guide:

1.  **Import the Package:**
    Ensure you have imported the package in the Dart files where you intend to use its features:
    ```dart
    import 'package:flutter_ui_toolbox/flutter_ui_toolbox.dart';
    ```

2.  **Initialization (for specific features):**
    As mentioned in the Installation section, some features like `SharedPreference` utilities require initialization. Make sure you've called `await initialize();` in your `main.dart`:
    ```dart
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await initialize(); // Essential for SharedPreferences and other setup
      runApp(MyApp());
    }
    ```

3.  **Using Extension Methods:**
    Extension methods add new functionality to existing classes. Once the package is imported, these methods become available directly on objects of that type.
    *   **How they work:** Simply call the extension method like any other instance method. For example:
        *   `myString.capitalizeFirstLetterX()` on a `String` object.
        *   `context.getScreenWidth` on a `BuildContext` object.
        *   `10.seconds` on an `int` to get a `Duration`.
    *   **Discoverability:** The available extensions are grouped by the type they extend (e.g., `StringExtensions`, `BuildContextExtensions`, `DateTimeExtensions`, `WidgetExtensions`). Explore the relevant sections in this README to see what's available for each type.

4.  **Using Widgets:**
    The custom widgets provided by this package can be used just like any standard Flutter widget.
    *   **Instantiation:** Create an instance of the widget and provide any required or optional parameters to customize its behavior and appearance. For example:
        ```dart
        AppButton(
          text: "Submit",
          onTap: () { /* Your action here */ },
          color: Colors.blue,
        );

        Blur(
          child: MyContentWidget(),
          blur: 5.0,
        );
        ```
    *   **Customization:** Each widget has its own set of parameters. Refer to the 'Widgets' section in this README for details on each widget, its purpose, and example usage.

Explore the detailed sections below for specific extensions and widgets to make the most out of Flutter UI Toolbox!


## Extensions Methods that makes your code more readable

These extension methods provide convenient shortcuts and helpers for common data types and Flutter classes, making your code cleaner and more expressive.

### Color Extensions
Enhance the `Color` class with useful methods for adjustments and conversions.

```dart
Color baseColor = Colors.blue; // Starting color

// Lighten the color by 20%
Color lighterColor = baseColor.adjustBrightness(20);

// Darken the color by 20%
Color darkerColor = baseColor.adjustBrightness(-20);

// Set opacity to 50%
Color semiTransparent = Colors.red.withOpacityLevel(50);

// Create a solid blue color from RGB values
Color solidBlue = ColorExtensions.fromRGB(52, 152, 219);

// Create a semi-transparent green color from RGBA values
Color transparentGreen = ColorExtensions.fromRGB(46, 204, 113, 0.5);
```

### BuildContext Extensions
Supercharge your `BuildContext` with a collection of highly convenient getters and methods. Accessing `ThemeData`, `MediaQuery`, `Navigator`, and more has never been easier. Stop writing `Theme.of(this)` and `MediaQuery.of(this).size` repeatedly!

#### Screen & Device Info
Access properties from `MediaQuery` with ease.

```markdown
| Getter                 | Description                               | Example                                                |
|------------------------|-------------------------------------------|--------------------------------------------------------|
| getScreenSize          | Returns the screen Size (width & height). | `Size size = context.getScreenSize;`                   |
| getScreenWidth         | Returns the screen width.                 | `double width = context.getScreenWidth;`               |
| getScreenHeight        | Returns the screen height.                | `double height = context.getScreenHeight;`             |
| getStatusBarHeight     | Returns the top status bar height.        | `double topPadding = context.getStatusBarHeight;`      |
| getNavigationBarHeight | Returns the bottom navigation bar height. | `double bottomPadding = context.getNavigationBarHeight;`|
| isKeyboardShowing      | Returns true if the keyboard is visible.  | `if (context.isKeyboardShowing) { ... }`               |
| orientation            | Returns the device Orientation.           | `Orientation current = context.orientation;`           |
| isPortrait             | Returns true for portrait orientation.    | `if (context.isPortrait) { ... }`                      |
| isLandscape            | Returns true for landscape orientation.   | `if (context.isLandscape) { ... }`                     |
```

#### 🎨 Theme & Colors
Directly access your app's theme data and colors from the `BuildContext`.

```markdown
| Getter                  | Description                                    | Equivalent to                             |
|-------------------------|------------------------------------------------|-------------------------------------------|
| getTheme                | Returns the current ThemeData.                 | `Theme.of(context)`                         |
| textTheme               | Returns the TextTheme from the current theme.  | `Theme.of(context).textTheme`               |
| primaryColor            | Returns the theme's primary color.             | `Theme.of(context).primaryColor`            |
| accentColor             | Returns the theme's accent/secondary color.    | `Theme.of(context).colorScheme.secondary`   |
| scaffoldBackgroundColor | Returns the theme's scaffold background color. | `Theme.of(context).scaffoldBackgroundColor` |
| cardColor               | Returns the theme's card color.                | `Theme.of(context).cardColor`               |
| dividerColor            | Returns the theme's divider color.             | `Theme.of(context).dividerColor`            |
| iconColor               | Returns the theme's default icon color.        | `Theme.of(context).iconTheme.color`         |
| platformBrightness      | Returns the current Brightness (light/dark).   | `MediaQuery.of(context).platformBrightness` |
```

#### 🏗️ Widget & State Access
Get the state of common ancestor widgets in the tree directly from the `BuildContext`.

```markdown
| Getter           | Description                                    | Equivalent to                        |
|------------------|------------------------------------------------|--------------------------------------|
| scaffoldState    | Returns the nearest ScaffoldState.             | `Scaffold.of(context)`               |
| formState        | Returns the nearest FormState.                 | `Form.of(context)`                   |
| overlayState     | Returns the nearest OverlayState.              | `Overlay.of(context)`                |
| defaultTextStyle | Returns the default DefaultTextStyle.          | `DefaultTextStyle.of(context)`       |
```

#### 🧭 Navigation
Simplified navigation methods available on `BuildContext`.

```markdown
| Method   | Description                                | Equivalent to                  |
|----------|--------------------------------------------|--------------------------------|
| canPop() | Returns true if the navigator can pop.     | `Navigator.canPop(context)`    |
| pop()    | Pops the current route from the navigator. | `Navigator.pop(context)`       |
```

#### 📱 Responsive & Platform Checks
Build adaptive UIs by checking the platform and screen size using `BuildContext`.

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
Example:
```dart
/// Show a different layout for tablets vs. phones
if (context.isTablet) {
  return MyTabletLayout();
} else {
  return MyPhoneLayout();
}

/// Add a platform-specific feature
if (context.isIOS) {
  // Show Cupertino-style widgets
} else if (context.isAndroid) {
  // Apply Material Design specific features
}
```

### String Extensions
These extensions add helpful methods to the `String` class for common transformations and validations.
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
print(hexColor.toColor()); // Output: Color(0xffff0000) (or the platform equivalent)

String? email = "test@example.com";
print(email.validateEmail()); // Output: true
```

### bool Extensions
Convenience extensions for `bool` values, especially for handling nulls or converting to other types.
```dart
bool? isActive = null;
print(isActive.validate(value: true)); // Output: true

bool? serverStatus = true;
print(serverStatus.getIntBool(value: true)); // Output: 1
```

### Int Extensions
Useful extensions for `int` values, including time durations, spacing, HTTP status checks, and formatting.
```dart
int? count = null;
print(count.validate(defaultValue: 10)); // Output: 10

int? statusInt = 1;
print(statusInt.toBool()); // Output: true

// Duration examples
print(5.seconds); // Output: 0:00:05.000000
print(2.hours);   // Output: 2:00:00.000000

// Spacing with SizedBox
SizedBox spaceHeight = 20.height; // Equivalent to SizedBox(height: 20.0)
SizedBox spaceWidth = 10.width;   // Equivalent to SizedBox(width: 10.0)

// Check HTTP status code
int? statusCode = 200;
print(statusCode.isSuccessful()); // Output: true

// Number range check
print(100.isBetween(50, 150)); // Output: true

// Date formatting from int (day/month/weekday)
print(25.toMonthDaySuffix()); // Output: "25th"
print(9.toMonthName(isHalfName: true)); // Output: "Sep"
print(3.toWeekDay()); // Output: "Wednesday"
```

### List Extensions
Handy extensions for `List` manipulation and validation.
```dart 
List<String>? fruits = ["Apple", "Banana"];
// validate() returns the list itself if not null, or an empty list if null.
print(fruits.validate()); // Output: [Apple, Banana]

List<int>? emptyList = null;
print(emptyList.validate()); // Output: []
print(emptyList.isNotEmptyList()); // Output: false

List<String>? words = ["Flutter", "Dart", "Extensions"];
print(words.joinWith(" - ")); // Output: "Flutter - Dart - Extensions"
```

### Map Extensions
Extensions for `Map` objects to simplify validation and data retrieval.
```dart
Map<String, dynamic>? userData = {"name": "Alice", "age": 30};
// validate() returns the map itself if not null, or an empty map if null.
print(userData.validate()); // Output: {name: Alice, age: 30}

Map<String, int>? scores = null;
print(scores.validate()); // Output: {}
print(scores.isNotEmptyMap()); // Output: false

// Safely get values with a default if the key is missing or value is null.
print(userData.get("name", defaultValue: "Unknown")); // Output: "Alice"
print(userData.get("city", defaultValue: "N/A"));   // Output: "N/A"
```

### Num & Double Extensions
Extensions for `num` and `double` types, focusing on validation, clamping, and safe conversions.
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
A rich set of extensions for `DateTime` objects, simplifying formatting, comparisons, and calculations.
*Requires `intl` package for some formatting options: `import 'package:intl/intl.dart';`*
```dart
DateTime now = DateTime.now();
DateTime specificDate = DateTime(2023, 10, 26, 14, 30, 0); // Oct 26, 2023, 2:30 PM

// --- Formatting ---
print(now.format()); // Output: e.g., "2023-10-26 14:30:00" (depends on current time)
print(specificDate.format('dd-MM-yyyy')); // Output: "26-10-2023"
print(specificDate.format('EEEE, MMMM d, yyyy')); // Output: "Thursday, October 26, 2023"

// --- Relative Date Checks ---
print(now.isToday); // Output: true
print(now.subtract(Duration(days: 1)).isYesterday); // Output: true
print(now.add(Duration(days: 1)).isTomorrow); // Output: true

// --- Time Comparisons ---
print(specificDate.isPast); // Output: true
print(now.add(Duration(hours: 5)).isFuture); // Output: true

// --- Leap Year Detection ---
print(DateTime(2024).isLeapYear); // Output: true
print(DateTime(2023).isLeapYear); // Output: false

// --- "Time Ago" Display ---
DateTime fiveMinutesAgo = now.subtract(Duration(minutes: 5));
print(fiveMinutesAgo.timeAgo()); // Output: "5 minutes ago"

DateTime twoDaysAgo = now.subtract(Duration(days: 2));
print(twoDaysAgo.timeAgo()); // Output: "2 days ago"

// --- Period Start/End ---
print(specificDate.startOfDay); // Output: 2023-10-26 00:00:00.000
print(specificDate.endOfDay);   // Output: 2023-10-26 23:59:59.999

// ... (startOfWeek, endOfWeek, startOfMonth, endOfMonth, startOfYear, endOfYear similar)

// --- Days in Month ---
print(specificDate.daysInMonth); // Output: 31
print(DateTime(2024, 2).daysInMonth); // Output: 29
```

### Future Delay Extensions
Easily introduce delays in your asynchronous operations using `Duration` or `int` extensions.
```dart
Future<void> exampleAsyncFunction() async {
  print("Starting async operation..."); // Output: Starting async operation...

  // Delay for 500 milliseconds
  await 500.millisecondsDelay;
  print("Half a second has passed."); // Output: Half a second has passed.

  // Delay for 1 second
  await 1.secondsDelay;
  print("One more second has passed."); // Output: One more second has passed.

  // Alternatively, call `delay()` on a `Duration` object:
  // await Duration(seconds: 2).delay();
  // print("Two more seconds passed.");

  print("Async operation completed."); // Output: Async operation completed.
}

// To run:
// exampleAsyncFunction();
```

### Padding Extensions
Quickly wrap widgets with `Padding` using these convenient extensions on any `Widget`.
These methods return a new `Padding` widget with the original widget as its child.
```dart
// Applies 16 units of padding on all sides
const Text('Padded Text').paddingAll(16.0);

// Applies 10 horizontal and 5 vertical padding
const Text('Symmetric Padding').paddingSymmetric(horizontal: 10.0, vertical: 5.0);

// Applies padding only on left (8) and bottom (4)
const Text('Specific Padding').paddingOnly(left: 8.0, bottom: 4.0);

// Applies padding only at the top
const Text('Padding at Top').paddingTop(20.0);

// Applies padding only at the bottom
const Text('Padding at Bottom').paddingBottom(15.0);

// Applies padding only on the left
const Text('Padding on Left').paddingLeft(25.0);

// Applies padding only on the right
const Text('Padding on Right').paddingRight(25.0);

// Conditional visibility (not strictly padding, but often used with layout)
bool showText = true;
const Text('This text is visible').visible(showText);

// This text will be replaced by an empty SizedBox if showText is false
const Text('This text might be hidden').visible(!showText);

// This text will be replaced by a placeholder if showText is false
const Text('This text shows a placeholder if hidden').visible(!showText, defaultWidget: const Text('Placeholder'));
```

### ScrollController Extensions
Simplify common `ScrollController` tasks like scrolling to specific positions and checking scroll states.
*Requires `import 'package:flutter/material.dart';`*
```dart 
// Assume you have a ScrollController instance:
// ScrollController _myScrollController = ScrollController();

// --- Scrolling with Animation ---
// _myScrollController.scrollToBottom();
// _myScrollController.scrollToTop(duration: const Duration(seconds: 1));
// _myScrollController.scrollTo(200.0, curve: Curves.fastOutSlowIn);

// --- Instant Jumps ---
// _myScrollController.jumpToBottom();
// _myScrollController.jumpToTop();

// --- State Checks ---
// bool isAtTop = _myScrollController.isAtTop;
// print('At Top: $isAtTop');
// bool isAtBottom = _myScrollController.isAtBottom;
// print('At Bottom: $isAtBottom');

// --- Scroll Percentage ---
// double scrollPercentage = _myScrollController.scrollPercentage; // Value between 0.0 and 1.0
// print('Scroll Percentage: ${scrollPercentage.toStringAsFixed(2)}');
```
*(Examples commented out as they require a live ScrollController instance)*

### Widget Extensions
A collection of versatile extensions for any `Widget`, providing shortcuts for common transformations, styling, and interactions.
```dart 
// A base widget for demonstration
final Widget myBaseWidget = Container(
  width: 100,
  height: 100,
  color: Colors.teal,
  child: const Center(child: Text('Base', style: TextStyle(color: Colors.white))),
);

// --- Applying Corner Radius ---
// Apply custom border radius to specific corners and clip
Widget customRoundedCorners = myBaseWidget.cornerRadiusWithClipRRectOnly(
  topLeft: 20.0,
  bottomRight: 20.0,
);
// Apply a uniform corner radius to all corners and clip
Widget allRoundedCorners = myBaseWidget.cornerRadiusWithClipRRect(15.0);

// --- Transformations ---
// Rotate the widget by 45 degrees (0.785 radians)
Widget rotatedWidget = myBaseWidget.rotate(angle: 0.785);
// Apply opacity (can be animated if part of a stateful setup)
Widget fadedWidget = myBaseWidget.fade(opacity: 0.5); // duration parameter available for animations

// --- Interaction and Information ---
// Add an InkWell tap effect
Widget tappableWidget = myBaseWidget.onTap(
  () => debugPrint('Widget tapped!'), // Use debugPrint for console output in Flutter
  splashColor: Colors.pink.withAlpha(50),
);
// Wrap the widget in a tooltip
Widget tooltipWidget = myBaseWidget.withTooltip(message: 'This is a tooltip for the base widget');

// --- Layout and Styling ---
// Center the widget
Widget centeredWidget = myBaseWidget.centered; // or myBaseWidget.center();

// Wrap in a container with a background color
Widget coloredBackgroundWidget = myBaseWidget.withBackground(Colors.amber);

// Wrap in a Material widget for ink effects, elevation, etc.
Widget materialWidget = myBaseWidget.asMaterial;

// Wrap with an Expanded widget (for use in Row/Column)
Widget expandedWidget = myBaseWidget.expanded(flex: 2);

// Wrap with a Flexible widget (for use in Row/Column)
Widget flexibleWidget = myBaseWidget.flexible(flex: 1, fit: FlexFit.tight);

// Apply padding using EdgeInsets
Widget paddedWidget = myBaseWidget.withPadding(const EdgeInsets.all(8.0));

// Fit the child into the parent space (e.g., within a FittedBox)
Widget fittedWidget = myBaseWidget.fit(fit: BoxFit.scaleDown);

// Example for RefreshIndicator (widget should be scrollable like ListView)
// Widget refreshableListExample = ListView.builder(
//   itemCount: 10,
//   itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
// ).withRefreshIndicator(
//   onRefresh: () async {
//     await Future.delayed(const Duration(seconds: 1));
//     debugPrint('Content refreshed!');
//   },
// );
```

## LiveStream Method for Easy 
Provides a simple way to broadcast and listen to events across your application using a singleton `LiveStream` instance.
```dart 
// LiveStream is a singleton, so you can safely get an instance from anywhere.
final liveStream = LiveStream();

// Define a listener function
void myDataListener(dynamic data) {
  print("Received data_updated event: $data"); // Output: Received data_updated event: Hello World!
}

// Emit a value with a specific event key
liveStream.emit("data_updated", "Hello World!");

// Listen for that event key from anywhere
liveStream.on("data_updated", myDataListener);

// To stop listening:
// liveStream.off("data_updated", myDataListener); // Removes this specific listener

// Or to remove all listeners for "data_updated" (e.g., in a StatefulWidget's dispose method):
// liveStream.dispose("data_updated");
```

## TextStyles
Provides predefined `TextStyle`s for common text appearances like bold, primary, and secondary text.
```dart
// Example usage within a Text widget:
// Text("This is bold text", style: boldTextStyle()),
// Text("Primary color text", style: primaryTextStyle(color: context.primaryColor)), // Can be customized
// Text("Secondary descriptive text", style: secondaryTextStyle(size: 12)),
```
*(Actual implementation might vary, these are conceptual examples and may require `BuildContext`)*

## Shared Preference Example
Simplify interactions with `SharedPreferences` for storing and retrieving key-value data.
*Ensure you have called `await initialize();` in your `main.dart` as shown in the Installation section.*
```dart
// setValue method parameters: (String key, dynamic value)

// Add a Double in SharedPreferences
await setValue("user_score", 20.5);

// Add a bool
await setValue("is_user_logged_in", true);

// Add an int
await setValue("user_id", 12345);

// Add a String
await setValue("user_name", "Alice Wonderland");

// Add a String List
await setValue("user_tags", ['flutter_dev', 'ui_lover', 'dart_expert']);

// Retrieve values (provide a defaultValue if the key might not exist or type is nullable)
bool isLoggedIn = getBoolAsync("is_user_logged_in", defaultValue: false);
double userScore = getDoubleAsync("user_score", defaultValue: 0.0);
int userId = getIntAsync("user_id", defaultValue: 0);
String userName = getStringAsync("user_name", defaultValue: "Guest");
List<String> userTags = getStringListAsync("user_tags", defaultValue: []);

// Example for storing and retrieving a JSON string (manually handle encode/decode)
// String userProfileJson = '{"name": "Alice", "level": 10}';
// await setValue("user_profile_json", userProfileJson);
// String? retrievedProfileJson = getStringAsync("user_profile_json");
// if (retrievedProfileJson != null) {
//   Map<String, dynamic> userProfile = jsonDecode(retrievedProfileJson);
//   print(userProfile['name']); // Output: Alice
// }

// Remove a key
await removeKey("user_score");

// Get all keys that match a pattern (if supported by the implementation)
// List<String> allUserKeys = getMatchingSharedPrefKeys('user_'); // This is a conceptual example
```

## Decorations
Commonly used `BoxDecoration` and `InputDecoration` styles, along with `BorderRadius` helpers.
```dart
// BorderRadius helpers
BorderRadius defaultCircularRadius = radius(); // Default circular radius (e.g., 8.0 or 10.0)
BorderRadius customCircularRadius = radius(12.0); // Circular radius of 12.0
Radius circularRadiusObject = radiusCircular(15.0); // Radius object for specific corners
BorderRadius specificCustomCorners = radiusOnly(topLeft: 5.0, bottomRight: 10.0);

// Dialog shape (typically a RoundedRectangleBorder)
ShapeBorder? standardDialogShape = dialogShape(15.0); // Rounded rectangle border for dialogs

// Default BoxDecoration with common shadow and border radius
Container(
    padding: const EdgeInsets.all(16.0),
    decoration: boxDecorationDefault(
      // Customize properties like:
      // color: Colors.grey[200],
      // borderRadius: radius(12),
      // boxShadow: [/* custom shadows or use default ones */],
    ),
    child: const Text("Styled Container with Default Decoration"),
);

// Default InputDecoration for TextFormFields
TextFormField(
  decoration: defaultInputDecoration(
    hint: 'Enter your full name',
    label: 'Full Name',
    // textStyle: primaryTextStyle(), // Optionally pass a text style
  ),
);
```

## Widgets

This section showcases various custom widgets provided by the `flutter_ui_toolbox` package, designed to simplify common UI patterns and add advanced functionalities.

### Layout & Structure Widgets
Widgets that help you organize and structure your UI.

**Responsive**
<br>A widget that simplifies building responsive UIs by allowing you to provide different widgets for mobile, tablet, and web layouts.
```dart
Responsive(
  mobile: MyMobileWidget(), // Widget to show on mobile (e.g., screen width < 600)
  tablet: MyTabletWidget(), // Optional: Widget for tablet layout (e.g., screen width >= 600 and < 1200)
  web: MyWebWidget(),       // Optional: Widget for web/desktop layout (e.g., screen width >= 1200)
);
```

**HorizontalList**
<br>Builds a horizontal list of items without needing a specific height constraint, ideal for scrollable rows.
```dart
HorizontalList(
  itemCount: 10, // Number of items in the list
  itemBuilder: (BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 100, // Example fixed width for items
        alignment: Alignment.center,
        child: Text('Item $index'),
      ),
    );
  },
  padding: EdgeInsets.all(8.0), // Optional padding around the list
  // spacing: 8.0, // Optional spacing between items
);
```

**UL (Unordered List)**
<br>Displays a list of child widgets with bullet points or numbered symbols.
```dart
UL(
   symbolType: SymbolType.Bullet, // Or SymbolType.Numbered for 1., 2., ...
   spacing: 4.0, // Optional spacing between symbol and text
   children: [
       Text('First list item'),
       Text('Second list item with more text to see wrapping.'),
       Text('Third list item'),
   ],
);
```

**SettingSection**
<br>A layout widget to create sections in settings or profile pages, typically containing `SettingItemWidget`s.
```dart
SettingSection(
  title: Text('General Settings', style: boldTextStyle(size: 18)),
  // subTitle: Text('Customize your app experience', style: secondaryTextStyle()), // Optional
  items: [
    // SettingItemWidget examples are shown in the "Interaction & Control Widgets" section
    // Example: SettingItemWidget(title: 'Language', onTap: () {}),
    // Example: SettingItemWidget(title: 'Notifications', onTap: () {}),
  ],
);
```

**Marquee**
<br>A widget that creates a scrolling text effect, useful for displaying long text in a limited space.
```dart
Marquee(
  child: Text("Breaking News: Flutter UI Toolbox simplifies your development!"),
  direction: Axis.horizontal, // Default is horizontal
  animationDuration: Duration(seconds: 8), // Adjust for speed
  pauseDuration: Duration(seconds: 2),   // Pause before restarting scroll
  // backDuration: Duration(seconds: 8), // Optional: duration for scrolling back if bidirectional
  // directionMarguee: DirectionMarguee.TwoDirection, // Optional: for bidirectional scroll
);
```

### Visual Enhancement & Effects Widgets
Widgets that add visual flair, effects, or provide feedback.

**Blur**
<br>Applies a blur effect to its child widget, useful for creating frosted glass effects or highlighting dialogs.
```dart
Blur(
  child: Image.network('https://picsum.photos/seed/blurwidget/200/300'), // Any widget can be a child
  blur: 6.0, // Amount of blur (higher is more blur)
  colorOpacity: 0.1, // Optional overlay color opacity (0.0 to 1.0)
  borderRadius: BorderRadius.circular(12.0), // Optional: clip child with border radius
);
```

**GradientBorder**
<br>A widget that draws a border with a gradient around its child.
```dart
GradientBorder(
  gradient: LinearGradient(colors: [Colors.deepPurple, Colors.pinkAccent]),
  strokeWidth: 3.0,
  child: Container(
    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
    child: Text('Text with a Gradient Border', style: TextStyle(fontSize: 16)),
  ),
);
```

**DottedBorderWidget**
<br>Draws a dashed or dotted border around its child widget.
```dart
DottedBorderWidget(
  strokeWidth: 2.0,
  color: Colors.blueGrey,
  dashPattern: [4, 4], // Customize pattern: [dash_length, gap_length]
  radius: Radius.circular(8.0), // Optional: border radius for the dotted line
  child: Container(
    height: 100,
    width: 150,
    alignment: Alignment.center,
    child: Text('Dotted Border Area'),
  ),
);
```

**PlaceHolderWidget**
<br>A customizable placeholder widget, often used to indicate loading content or empty states.
```dart
PlaceHolderWidget(
  width: 200, // Optional: width of the placeholder
  height: 100, // Optional: height of the placeholder
  // child: CircularProgressIndicator.adaptive(), // Optional: show a loading indicator inside
  text: 'Loading data...', // Optional: display a message
  textStyle: TextStyle(color: Colors.grey), // Optional: style for the message
);
```

**DotIndicator**
<br>Displays a series of dots to indicate the current page in a `PageController`-driven view (e.g., image carousel).
```dart
// Assuming you have a PageController and a list of pages:
// PageController _pageController = PageController();
// final List<Widget> _pages = [Container(color: Colors.red), Container(color: Colors.green), Container(color: Colors.blue)];

// In your build method, typically with a PageView:
// Stack(
//   alignment: Alignment.bottomCenter,
//   children: [
//     PageView(controller: _pageController, children: _pages),
//     Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: DotIndicator(
//         pageController: _pageController,
//         pages: _pages, // Or just the count: pages.length
//         activeColor: Colors.white,
//         inactiveColor: Colors.white.withOpacity(0.5),
//         dotSize: 8.0,
//         spacing: 4.0,
//       ),
//     ),
//   ],
// )
```
*(Example commented as it requires a live PageController and widget structure)*

### Interaction & Control Widgets
Widgets designed for user input, actions, and interactive experiences.

**HoverWidget**
<br>Detects mouse hover events (primarily for web/desktop) and rebuilds its child with the current hover state.
```dart
HoverWidget(
  builder: (BuildContext context, bool isCurrentlyHovering) {
    final cardColor = isCurrentlyHovering ? Colors.lightBlue[50] : Colors.white;
    final elevation = isCurrentlyHovering ? 8.0 : 2.0;
    return Card(
      color: cardColor,
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Hover over this Card'),
      ),
    );
  },
);
```

**DoublePressBackWidget**
<br>Wraps a child widget (typically a screen Scaffold) to enable "double press back to exit" functionality.
```dart
DoublePressBackWidget(
  child: Scaffold(
    appBar: AppBar(title: Text('App Home Screen')),
    body: Center(child: Text('Content goes here')),
  ),
  message: 'Tap back again to leave', // Optional custom message for the SnackBar
  // duration: Duration(seconds: 2), // Optional duration for SnackBar
);
```

**SettingItemWidget**
<br>Represents an item within a `SettingSection`, usually for navigation or triggering actions.
```dart
SettingItemWidget(
  title: 'Account Settings',
  subTitle: 'Manage your profile, password, and more', // Optional
  leading: Icon(Icons.person_outline), // Optional leading icon
  trailing: Icon(Icons.arrow_forward_ios, size: 16.0), // Optional trailing icon
  onTap: () {
    // Action to perform on tap, e.g., navigate to account settings page
    print('Account Settings tapped');
  },
  // decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300]!))), // Optional
);
```

**AppButton**
<br>A standardized button widget for consistent styling across your app, with various customization options.
```dart
AppButton(
  text: "Confirm Purchase",
  onTap: () {
    // Logic for confirming purchase
    print('Purchase confirmed');
  },
  color: Colors.deepPurpleAccent, // Optional: custom background color
  textColor: Colors.white, // Optional: custom text color
  // width: double.infinity, // Optional: make button full width
  // height: 50.0, // Optional: custom height
  // borderRadius: 12.0, // Optional: custom border radius
  // isLoading: _isProcessingPurchase, // Optional: show loading indicator instead of text
  // icon: Icons.shopping_cart, // Optional: display an icon
);
```

**RoundedCheckBox**
<br>A checkbox widget with rounded corners and customizable text.
```dart
// bool _rememberMe = false; // Example state variable
RoundedCheckBox(
  isChecked: false, // Bind to your state variable: _rememberMe
  text: 'Remember me on this device',
  onTap: (bool? newValue) {
    // setState(() { _rememberMe = newValue ?? false; });
    print('Remember me changed to: $newValue');
  },
  activeColor: Colors.green, // Optional: color when checked
  checkColor: Colors.white, // Optional: color of the check mark
  // size: 24.0, // Optional: size of the checkbox
  // textStyle: TextStyle(fontSize: 16), // Optional: style for the text
);
```

**RatingBarWidget**
<br>Allows users to select a rating, typically using stars.
```dart
// double _currentRating = 3.0; // Example state variable
RatingBarWidget(
  rating: 3.0, // Bind to your state variable: _currentRating
  onRatingChanged: (newRating) {
    // setState(() { _currentRating = newRating; });
    print("User selected rating: $newRating");
  },
  starCount: 5, // Optional: total number of stars
  size: 35.0, // Optional: size of each star
  activeColor: Colors.amber, // Optional: color of active stars
  inactiveColor: Colors.grey[300], // Optional: color of inactive stars
  // allowHalfRating: true, // Optional
);
```

**TextIcon**
<br>A widget that displays text along with an optional prefix or suffix icon/widget.
```dart
TextIcon(
  text: 'User Profile',
  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500), // Optional text style
  prefix: Icon(Icons.account_circle, color: Colors.blue, size: 24), // Optional prefix widget
  // suffix: Icon(Icons.edit, color: Colors.grey, size: 18), // Optional suffix widget
  spacing: 12.0, // Optional spacing between text and icon(s)
  // onTap: () { print('TextIcon tapped'); }, // Optional tap action
);
```

### Text Display & Manipulation Widgets
Widgets focused on displaying and interacting with text content.

**ReadMoreText**
<br>Displays a long piece of text with a "Read more" / "Show less" toggle.
```dart
ReadMoreText(
  'Flutter UI Toolbox provides a wide array of extensions and widgets. '
  'This ReadMoreText widget, for example, helps you display lengthy descriptions '
  'concisely, allowing users to expand the text to read the full content if they are interested. '
  'It supports trimming by lines or length and offers customization for the toggle text and style.',
  trimLines: 2, // Number of lines to show initially
  trimMode: TrimMode.Line, // Can also be TrimMode.Length
  trimCollapsedText: '...Show more', // Text for the "show more" link
  trimExpandedText: ' Show less',   // Text for the "show less" link
  style: TextStyle(fontSize: 14.0, color: Colors.black87), // Style for the main text
  moreStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.blue), // Style for "Show more"
  lessStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.blue), // Style for "Show less"
);
```

### Utility & Helper Widgets
Widgets that provide specific utilities or help manage states.

**SizeListener**
<br>A widget that listens to size changes of its child and provides a callback with the new size.
```dart
SizeListener(
  child: Card( // The widget whose size changes you want to monitor
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('This card might change size.'),
    ),
  ),
  onSizeChange: (Size newSize) {
    // Callback triggered when the child's size changes
    print('The card size is now: ${newSize.width}w x ${newSize.height}h');
    // Useful for dynamic layout adjustments
  },
);
```

**SnapHelperWidget**
<br>Simplifies handling `Future` states (loading, error, success) by automatically showing corresponding widgets.
```dart
// Example Future function
Future<String> _loadUserData() async {
  await Future.delayed(Duration(seconds: 3));
  // Simulate a network error:
  // if (Random().nextBool()) throw Exception("Network connection failed!");
  return "User data loaded successfully!";
}

SnapHelperWidget<String>(
  future: _loadUserData(), // The future you want to monitor
  onSuccess: (String userData) {
    // Widget to display when the future completes successfully
    return Card(
      color: Colors.green[50],
      child: Padding(padding: EdgeInsets.all(16.0), child: Text(userData)),
    );
  },
  loadingWidget: Padding( // Optional: Custom loading widget
    padding: EdgeInsets.all(16.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator(), SizedBox(width: 8), Text('Loading...')]),
  ),
  errorWidget: (dynamic error) => Padding( // Optional: Custom error widget
    padding: EdgeInsets.all(16.0),
    child: Text('Error: $error', style: TextStyle(color: Colors.red)),
  ),
);
```

## ⭐⭐⭐ If you like the package, a star to this repo will means a lot.

## Contributing

Contributions are welcome and greatly appreciated! This project thrives on community involvement, and we're excited to see what you can bring.

There are many ways to contribute:

*   **Reporting Bugs:** If you encounter any bugs or unexpected behavior, please open an issue on the GitHub repository. Provide as much detail as possible, including steps to reproduce, Flutter version, and package version.
*   **Suggesting Enhancements:** Have an idea for a new feature, a new widget, a useful extension, or an improvement to an existing one? We'd love to hear it! Please open an issue to discuss your ideas.
*   **Submitting Pull Requests:** If you'd like to contribute code:
    *   Fork the repository.
    *   Create a new branch for your feature or bug fix.
    *   Make your changes, including adding relevant tests if applicable.
    *   Ensure your code is well-formatted and documented.
    *   Submit a pull request with a clear description of your changes.

We aim to keep the contribution process straightforward. Don't hesitate to reach out or open an issue if you have questions!

## If you want to give suggestion, please contact me via email - dev.nimesh75@gmail.com

## Thank you ❤❤❤
