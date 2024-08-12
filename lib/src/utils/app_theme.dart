import '../../app_exports.dart';

Color backgroundColorYellow = const Color(0xFFfff7e6);
Color backgroundColorGreen = const Color(0xFFecffde);
Color backgroundColorGray = const Color(0xFFf2f2f2);
Color primaryColor = const Color(0XFF038dff);

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFF151515),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      disabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.white),
      focusColor: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFF151515),
    colorScheme: const ColorScheme.dark(secondary: Color(0xff2643C4)),
    primaryColor: const Color(0xff000000),
    indicatorColor: const Color(0xff0E1D36),
    hintColor: const Color(0xff280C0B),
    highlightColor: const Color(0xff372901),
    hoverColor: const Color(0xff3A3A3B),
    dividerColor: Colors.white,
    focusColor: const Color(0xff0B2512),
    disabledColor: Colors.grey,
    unselectedWidgetColor: const Color(0xff000000),
    iconTheme: const IconThemeData(color: Colors.white),
    cardColor: const Color(0xff000000),
    brightness: Brightness.dark,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: const ColorScheme.dark(),
        ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 17),
      bodyLarge: TextStyle(
        color: Color(0xff020417),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Color(0xff020417),
      )),
      disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Color(0xff020417),
      )),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Color(0xff020417),
      )),
      border: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Color(0xff020417),
      )),
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.white),
      focusColor: Colors.white,
    ),
    colorScheme: const ColorScheme.light(secondary: Colors.blue),
    primaryColor: const Color(0xffF1F0F6),
    indicatorColor: const Color(0xffCBDCF8),
    hintColor: Colors.grey,
    dividerColor: const Color(0xff9D9AB4),
    focusColor: const Color(0xffA8DAB5),
    disabledColor: Colors.grey,
    iconTheme: const IconThemeData(color: Color(0xff9D9AB4)),
    cardColor: const Color(0xFFFFFFFF),
    brightness: Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: const ColorScheme.light(),
        ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Color(0xff020417),
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Color(0xff020417),
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Color(0xff020417),
        fontSize: 17,
      ),
      bodyLarge: TextStyle(
        color: Color(0xff020417),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
    ),
    scrollbarTheme: const ScrollbarThemeData(),
  );
}


