import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ugodubai/app/extensions/widgets.dart';
import 'package:ugodubai/app/modules/console/controllers/console_controller.dart';

import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/app/components/error_404.dart';
import 'package:ugodubai/color_palettes.dart';
import 'package:ugodubai/generated/locales.g.dart';
import 'package:ugodubai/services/auth_service.dart';

ThemeData get lightTheme => FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xff00296b),
        primaryContainer: Color(0xffa0c2ed),
        secondary: Color(0xffd26900),
        secondaryContainer: Color(0xffffd270),
        tertiary: Color(0xff5c5c95),
        tertiaryContainer: Color(0xffc8dbf8),
        appBarColor: Color(0xffc8dcf8),
        error: null,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        defaultRadius: 8.0,
        textButtonRadius: 8.0,
        filledButtonRadius: 8.0,
        elevatedButtonRadius: 8.0,
        outlinedButtonRadius: 9.0,
        inputDecoratorIsFilled: false,
        inputDecoratorBorderSchemeColor: SchemeColor.primary,
        inputDecoratorUnfocusedBorderIsColored: false,
        inputDecoratorFocusedBorderWidth: 1.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );

ThemeData get darkTheme => FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xffb1cff5),
        primaryContainer: Color(0xff3873ba),
        secondary: Color(0xffffd270),
        secondaryContainer: Color(0xffd26900),
        tertiary: Color(0xffc9cbfc),
        tertiaryContainer: Color(0xff535393),
        appBarColor: Color(0xff00102b),
        error: null,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        defaultRadius: 8.0,
        textButtonRadius: 8.0,
        filledButtonRadius: 8.0,
        elevatedButtonRadius: 8.0,
        outlinedButtonRadius: 9.0,
        inputDecoratorIsFilled: false,
        inputDecoratorUnfocusedBorderIsColored: false,
        inputDecoratorFocusedBorderWidth: 1.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );

class AppController extends GetxController {
  get localeStorage => ''.val('locale', defVal: 'zh');
  Locale get locale => Locale(localeStorage.val);

  @override
  void onInit() {
    super.onInit();
    FxAppTheme.changeTheme(lightTheme);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTheme() {}

  void chageLanguage(Locale l) {
    localeStorage.val = l.languageCode;
    Get.updateLocale(l);
  }
}

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'app_name'.tr,

      //service
      initialBinding: BindingsBuilder(
        () {
          Get.put(AuthService());
          Get.put(ConsoleController());
        },
      ),

      //language
      translationsKeys: AppTranslation.translations,
      locale: controller.locale,
      fallbackLocale: Locale('en', 'US'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('zh'), Locale('en')],

      //router
      getPages: AppPages.routes,
      // initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.noTransition,
      unknownRoute: GetPage(name: '/404', page: () => NotFoundScreen()),

      // builder: (context, child) => [
      //   Scaffold(
      //     persistentFooterAlignment: AlignmentDirectional.bottomStart,
      //     floatingActionButton: FloatingActionButton(
      //       onPressed: () {
      //         Get.to(
      //           ColorPalettesScreen(),
      //           fullscreenDialog: true,
      //           transition: Transition.downToUp,
      //         );
      //       },
      //       child: Icon(Icons.arrow_right_alt),
      //     ),
      //     body: child ?? Container(color: Colors.red),
      //   )
      // ].stack(),

      // theme
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
