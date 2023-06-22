part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;

  //login
  static const LOGIN = _Paths.LOGIN;
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const REGISTER = _Paths.REGISTER;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;

  //console
  static const CONSOLE = _Paths.CONSOLE;
  static const DASHBOARD = _Paths.CONSOLE + _Paths.DASHBOARD;

  //product
  static const PRODUCT = _Paths.PRODUCT;
  static const PRODUCT_LIST = _Paths.PRODUCT + _Paths.PRODUCT_LIST;
  static const PRODUCT_CATEGORY = _Paths.PRODUCT + _Paths.PRODUCT_CATEGORY;
  static const PRODUCT_ATTRIBUTE = _Paths.PRODUCT + _Paths.PRODUCT_ATTRIBUTE;
  static const PRODUCT_TAG = _Paths.PRODUCT + _Paths.PRODUCT_TAG;
  static const PRODUCT_EDIT = _Paths.PRODUCT + _Paths.PRODUCT_EDIT;

  //order
  static const ORDER = _Paths.ORDER;
  static const ORDER_LIST = _Paths.ORDER + _Paths.ORDER_LIST;
  static const ORDER_DETAIL = _Paths.ORDER + _Paths.ORDER_DETAIL;

  //auth
  static const AUTH = _Paths.AUTH;
  static const USER_LIST = _Paths.AUTH + _Paths.USER_LIST;
  static const USER_EDIT = _Paths.AUTH + _Paths.USER_EDIT;

  //settings
  static const SETTING = _Paths.SETTING;

  static const PROFILE = _Paths.PROFILE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';

  //login
  static const LOGIN = '/login';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const REGISTER = '/register';
  static const RESET_PASSWORD = '/reset-password';

  //console
  static const CONSOLE = '/console';
  static const DASHBOARD = '/dashboard';

  //product
  static const PRODUCT = '/console/product';
  static const PRODUCT_LIST = '/list';
  static const PRODUCT_EDIT = '/edit';
  static const PRODUCT_CATEGORY = '/category';
  static const PRODUCT_ATTRIBUTE = '/attribute';
  static const PRODUCT_TAG = '/tag';

  //order
  static const ORDER = '/console/order';
  static const ORDER_LIST = '/list';
  static const ORDER_DETAIL = '/detail';

  //auth
  static const AUTH = '/console/auth';
  static const USER_LIST = '/user_list';
  static const USER_EDIT = '/user_edit';

  //settings
  static const SETTING = '/console/setting';
  static const ROLE_LIST = '/role-list';
  static const PROFILE = '/profile';
}
