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
  static const PRODUCT_DETAIL = _Paths.PRODUCT + _Paths.PRODUCT_DETAIL;

  //order
  static const ORDER = _Paths.ORDER;
  static const ORDER_LIST = _Paths.ORDER + _Paths.ORDER_LIST;
  static const ORDER_DETAIL = _Paths.ORDER + _Paths.ORDER_DETAIL;

  //auth
  static const AUTH = _Paths.AUTH;
  static const USER_LIST = _Paths.AUTH + _Paths.USER_LIST;
  static const USER_DETAIL = _Paths.AUTH + _Paths.USER_DETAIL;
  static const ROLE_LIST = _Paths.AUTH + _Paths.ROLE_LIST;
  static const ROLE_DETAIL = _Paths.AUTH + _Paths.ROLE_DETAIL;

  //agent
  static const AGENT = _Paths.AGENT;
  static const AGENT_LIST = _Paths.AUTH + _Paths.AGENT_LIST;
  static const AGENT_DETAIL = _Paths.AUTH + _Paths.AGENT_DETAIL;

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
  static const PRODUCT_DETAIL = '/detail';
  static const PRODUCT_CATEGORY = '/category';
  static const PRODUCT_ATTRIBUTE = '/attribute';
  static const PRODUCT_TAG = '/tag';

  //order
  static const ORDER = '/console/order';
  static const ORDER_LIST = '/list';
  static const ORDER_DETAIL = '/detail';

  //auth
  static const AUTH = '/console/auth';
  static const USER_LIST = '/user/list';
  static const USER_DETAIL = '/user/detail';
  static const ROLE_LIST = '/role/list';
  static const ROLE_DETAIL = '/role/detail';

  //agent
  static const AGENT = '/console/auth';
  static const AGENT_LIST = '/agent/list';
  static const AGENT_DETAIL = '/agent/detail';

  //settings
  static const SETTING = '/console/setting';
  static const PROFILE = '/console/profile';
}
