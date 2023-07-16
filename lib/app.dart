import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/app/components/error_404.dart';

import 'package:ugodubai/generated/locales.g.dart';
import 'package:ugodubai/services/auth_service.dart';

ThemeData lightTheme(context) => FlexThemeData.light(
      scheme: FlexScheme.deepBlue,
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
    ).copyWith(
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom().copyWith(
                overlayColor: MaterialStateProperty.resolveWith((states) {
      return Colors.transparent;
    }), foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return Theme.of(context).colorScheme.secondary;
      }
      return null;
    }))));

ThemeData darkTheme(context) => FlexThemeData.dark(
      scheme: FlexScheme.deepBlue,
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
    ).copyWith(
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom().copyWith(
                overlayColor: MaterialStateProperty.resolveWith((states) {
      return Colors.transparent;
    }), foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return Theme.of(context).colorScheme.secondary;
      }
      return null;
    }))));

class AppController extends GetxController {
  get localeStorage => ''.val('locale', defVal: 'zh');
  Locale get locale => Locale(localeStorage.val);

  @override
  void onInit() {
    super.onInit();
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
    FxAppTheme.changeTheme(lightTheme(context));
    return GetMaterialApp.router(
      title: 'app_name'.tr,

      //service
      initialBinding: BindingsBuilder(
        () {
          Get.put(AuthService());
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
        SfGlobalLocalizations.delegate
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
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
