/// This [TABLE_OF_CONTENTS] determines the order of the posts.
/// A lot of code does tricky things in order to ensure that the easiest
/// way to change the order of the lessons is to change this map

/// Category : {
///   subCategory: [List of post names]
/// }
///
/// NB: Lists are ordered!
///
// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, List<String>>> TABLE_OF_CONTENTS = {
  "Dart": {
    // ignore:
    "Getting Started with Dart": [
      "About Dart",
      "Install Dart on your machine",
      "Dartpad",
      "Text Editors: Intellij and VSCode",
      "Resources: Documentation and Pub.dev",
      "Hello World",
      "The main function",
      "Print to the console",
    ],
    "Dart Fundamentals": [
      "Values and variables",
      "Comments",
      "const and final variables",
      "Arithmetic and Comparison Operators",
      "Assignment Operators",
      "Logical Operators",
      "Null Aware Operators",
      "Type Test Operators",
      "Bitwise and Shift Operators",
      "Control Flow: if, else, else if",
      "Switch statements and case",
      "Ternary Conditional operator",
      "Loops: for and while",
      "Anatomy of Dart Functions",
      "'Arrow' functions",
      "Function arguments: default, optional, named",
      "Lexical Scope",
      "Cascade notation",
    ],
    "Data Types": [
      "Intro to Dart's Type System",
      "Numbers",
      "Strings",
      "Booleans",
      "dynamic",
      "lists",
      "sets",
      "maps",
    ],
  },
  "Flutter": {
    "Getting started with Flutter": [
      "About Flutter",
      "IDEs and resources",
    ],
    "Widgets": [
      "Intro to Widgets",
      "Widget types: Stateful and Stateless",
      "StatefulWidget lifecycle",
      "The Widget tree",
      "BuildContext",
      "Inherited Widgets",
      "Thinking in widgets",
    ],
  },
  "Flutter UI Example Apps": {
    "Basic App": [
      "Intro and Setup",
      "Data Model and HTTP",
      "Build a Custom Widget",
      "ListView and builder pattern",
      "Gradient Backgrounds",
      "Routing: Add a detail page",
      "Routing 2: Add a form page",
      "User Input",
      "Sliders and Buttons",
      "Snackbars and Dialogs",
      "Built-in Animation: AnimatedCrossFade",
      "Built-in Animation: Hero transition",
    ],
    "Custom Animation: Progress Indicator": [
      "Intro and Overview",
      "Build the example app boiler-plate",
      "Custom Widget: Peg",
      "Tween and AnimationController classes",
      "Tween by example",
      "Using Tweens and Intervals",
      "Wrap the Pegs in AnimatedWidgets",
      "Bring it all together",
      "Complete source code",
    ]
  },
  "Flutter State Management Example Apps": {
    "BLoCs without Libraries": [
      "What are blocs?",
      "Calendar App Introduction",
      "Create bloc one",
      "Create a bloc provider",
      "Using StreamBuilders with blocs",
      "Create bloc two: Add/Edit Tasks",
      "Consume the second bloc's streams",
      "Complete Source Code",
    ],
  },
};
