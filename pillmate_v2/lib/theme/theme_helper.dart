import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.grey900,
      // Customize dialog theme
      dialogTheme: DialogTheme(
        backgroundColor: appTheme.grey700, // Dialog background color
        titleTextStyle: TextStyle(
          color: appTheme.cyan500, // Title text color
          fontSize: 20.fSize,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: appTheme.whiteA700, // Content text color
          fontSize: 16.fSize,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), // Dialog shape
      ),
      // Customize ElevatedButtonThemeData
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return appTheme.grey300; // Disabled color
              }
              return appTheme.cyan500; // Regular color
            },
          ),
          foregroundColor: WidgetStateProperty.all<Color>(appTheme.whiteA700),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.h),
            ),
          ),
          // You can add shadow, elevation, textStyle, etc.
        ),
      ),
      radioTheme: RadioThemeData(
          fillColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return appTheme.cyan500;
            }
            return colorScheme.onSurface;
          }),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4)),
      dividerTheme:
          DividerThemeData(thickness: 11, space: 11, color: appTheme.grey900),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextThemes.textTheme(colorScheme).titleMedium,
        backgroundColor: Colors.transparent,
      ),
      cardColor: _supportedCustomColor[_appTheme]?.grey700,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: appTheme.cyan500,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(4), // Rounded Corners for Button
          ),
          padding: EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 16.0), // Button Padding
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.grey500),
          borderRadius: BorderRadius.circular(8.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.grey500),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.cyan500, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelStyle: TextStyle(color: appTheme.cyan500),
        hintStyle: TextStyle(color: appTheme.grey500),
      ),
      // useMaterial3: true
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        // Used for large text in dialogs or cards, like titles or important text.
        bodyLarge: TextStyle(
          color: appTheme.grey100, // Bright text for dark backgrounds
          fontSize: 20.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500, // Medium weight for importance
        ),
        // Used for regular paragraphs and content.
        bodyMedium: TextStyle(
          color: appTheme.grey500, // Standard text color
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
        ),
        // Used for less important, smaller text like captions or hints.
        bodySmall: TextStyle(
          color: appTheme.grey300, // Less prominent text
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
        ),
        // Used for titles or section headings.
        headlineLarge: TextStyle(
          color: appTheme.cyan500, // Primary accent color for visibility
          fontSize: 24.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold, // Bold for headings
        ),
        // Used for subheadings or titles in smaller widgets.
        headlineSmall: TextStyle(
          color: appTheme.cyan500, // Primary accent color for consistency
          fontSize: 20.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500, // Medium weight for subheadings
        ),
        // Used for labels on form fields or buttons.
        labelLarge: TextStyle(
          color: appTheme.teal500,
          // Accent color to highlight interactive elements
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500, // Medium weight to denote action
        ),
        // Used for secondary information related to labels.
        labelMedium: TextStyle(
          color: appTheme.teal100, // Softer accent color
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
        ),
        // Used for titles on large screens or important widgets.
        titleLarge: TextStyle(
          color: appTheme.grey100,
          // White text for contrast against primary color
          fontSize: 22.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold, // Bold for large titles
        ),
        // Used for titles within content like cards or list tiles.
        titleMedium: TextStyle(
          color: appTheme.whiteA700, // White text for readability
          fontSize: 18.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500, // Medium weight for content titles
        ),
        // Used for smaller titles within the interface or on buttons.
        titleSmall: TextStyle(
          color: appTheme.whiteA700, // White text to maintain readability
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500, // Medium weight for small titles
        ),
        // Used for large display numbers or words, like statistics or dashboard numbers.
        displayMedium: TextStyle(
          color: appTheme.whiteA700, // Bright, visible text for stats
          fontSize: 36.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold, // Bold for large display text
        ),
        labelSmall: TextStyle(
            color: appTheme.grey500,
            fontSize: 9.fSize,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light();
}

class PrimaryColors {
  Color get black900 => HSLColor.fromAHSL(1.0, 0, 0.0, 0.0).toColor(); //
  Color get black100 => HSLColor.fromAHSL(1.0, 0, 0.0, 0.05).toColor(); //

  Color get cyan900 => HSLColor.fromAHSL(1.0, 180, 0.7, 0.27).toColor(); //
  Color get cyan500 => HSLColor.fromAHSL(1.0, 180, 0.7, 0.47).toColor(); //
  Color get cyan100 => HSLColor.fromAHSL(1.0, 180, 0.7, 0.67).toColor(); //

  Color get teal900 => HSLColor.fromAHSL(1.0, 180, 0.85, 0.5).toColor(); //
  Color get teal500 => HSLColor.fromAHSL(1.0, 180, 0.85, 0.7).toColor(); //
  Color get teal100 => HSLColor.fromAHSL(1.0, 180, 0.85, 0.9).toColor(); //

  // Purple
  Color get purple900 => HSLColor.fromAHSL(1.0, 270, 0.7, 0.3).toColor(); //
  Color get purple700 => HSLColor.fromAHSL(0.3, 270, 0.7, 0.3).toColor(); //
  Color get purple500 => HSLColor.fromAHSL(1.0, 270, 0.7, 0.5).toColor(); //
  Color get purple100 => HSLColor.fromAHSL(1.0, 280, 0.7, 0.9).toColor(); //

  Color get grey900 => HSLColor.fromAHSL(1.0, 220, 0.45, 0.08).toColor(); //
  Color get grey700 => HSLColor.fromAHSL(0.5, 200, 0.45, 0.15).toColor(); //
  Color get grey500 => HSLColor.fromAHSL(1.0, 220, 0.45, 0.28).toColor(); //
  Color get grey300 => HSLColor.fromAHSL(1.0, 220, 0.45, 0.5).toColor(); //
  Color get grey100 => HSLColor.fromAHSL(1.0, 220, 0.6, 0.80).toColor(); //

  Color get whiteA700 => HSLColor.fromAHSL(1.0, 0, 0.0, 1.0).toColor(); //
}

PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();
