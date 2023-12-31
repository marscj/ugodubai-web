import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../middlewares/auth_guard.dart';
import '../extensions/get_page.dart';
import '../modules/backend/agent/agent_detail/bindings/agent_detail_binding.dart';
import '../modules/backend/agent/agent_list/bindings/agent_list_binding.dart';
import '../modules/backend/agent/agent_view.dart';
import '../modules/backend/auth/auth_view.dart';
import '../modules/backend/auth/menu_list/bindings/menu_list_binding.dart';
import '../modules/backend/auth/role_detail/bindings/role_detail_binding.dart';
import '../modules/backend/auth/role_list/bindings/role_list_binding.dart';
import '../modules/backend/auth/user_detail/bindings/user_detail_binding.dart';
import '../modules/backend/auth/user_list/bindings/user_list_binding.dart';
import '../modules/backend/backend_view.dart';
import '../modules/backend/console/console_view.dart';
import '../modules/backend/console/dashboard/bindings/dashboard_binding.dart';
import '../modules/backend/order/order_detail/bindings/order_detail_binding.dart';
import '../modules/backend/order/order_list/bindings/order_list_binding.dart';
import '../modules/backend/order/order_view.dart';
import '../modules/backend/product/product_attribute/bindings/product_attribute_binding.dart';
import '../modules/backend/product/product_category/bindings/product_category_binding.dart';
import '../modules/backend/product/product_detail/bindings/product_detail_binding.dart';
import '../modules/backend/product/product_list/bindings/product_list_binding.dart';
import '../modules/backend/product/product_tag/bindings/product_tag_binding.dart';
import '../modules/backend/product/product_view.dart';
import '../modules/backend/profile/bindings/profile_binding.dart';
import '../modules/backend/setting/bindings/setting_binding.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/root/root_view.dart';
import '../widgets/deferred_widget.dart';

import '../modules/home/views/home_view.dart' deferred as home_view;
import '../modules/login/views/login_view.dart' deferred as login_view;
import '../modules/register/views/register_view.dart' deferred as register_view;
import '../modules/backend/profile/views/profile_view.dart'
    deferred as profile_view;
import '../modules/backend/setting/views/setting_view.dart'
    deferred as setting_view;
import '../modules/backend/auth/user_detail/views/user_detail_view.dart'
    deferred as user_detail_view;
import '../modules/backend/auth/role_detail/views/role_detail_view.dart'
    deferred as role_detail_view;
import '../modules/backend/agent/agent_detail/views/agent_detail_view.dart'
    deferred as agent_detail_view;
import '../modules/backend/agent/agent_list/views/agent_list_view.dart'
    deferred as agent_list_view;
import '../modules/backend/product/product_detail/views/product_detail_view.dart'
    deferred as product_detail_view;
import '../modules/forgot_password/views/forgot_password_view.dart'
    deferred as forgot_password_view;
import '../modules/reset_password/views/reset_password_view.dart'
    deferred as reset_password_view;
import '../modules/backend/order/order_detail/views/order_detail_view.dart'
    deferred as order_detail_view;
import '../modules/backend/order/order_list/views/order_list_view.dart'
    deferred as order_list_view;
import '../modules/backend/product/product_attribute/views/product_attribute_view.dart'
    deferred as product_attribute_view;
import '../modules/backend/product/product_category/views/product_category_view.dart'
    deferred as product_category_view;
import '../modules/backend/product/product_list/views/product_list_view.dart'
    deferred as product_list_view;
import '../modules/backend/product/product_tag/views/product_tag_view.dart'
    deferred as product_tag_view;
import '../modules/backend/auth/role_list/views/role_list_view.dart'
    deferred as role_list_view;
import '../modules/backend/auth/user_list/views/user_list_view.dart'
    deferred as user_list_view;

import '../modules/backend/console/dashboard/views/dashboard_view.dart'
    deferred as dashboard_view;

import '../modules/backend/auth/menu_list/views/menu_list_view.dart'
    deferred as menu_list_view;

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = _Paths.HOME;

  static GetPage get backend => routes.first.children
      .singleWhere((element) => element.name == Routes.BACKEND);

  static List<GetPage> flattenPage(List<GetPage> arr) {
    return arr.fold([], (result, element) {
      result.add(element);
      if (element.children.isNotEmpty) {
        result.addAll(flattenPage(element.children));
      }
      return result;
    });
  }

  static GetPage findPage(name) {
    return flattenPage(backend.children)
        .singleWhere((element) => element.name == name);
  }

  static final routes = [
    GetPage(
      name: '/',
      page: () => RootView(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      transition: Transition.noTransition,
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () =>
              DeferredWidget(home_view.loadLibrary, () => home_view.HomeView()),
          binding: HomeBinding(),
        ),
        GetPage(
          name: _Paths.LOGIN,
          page: () => DeferredWidget(
              login_view.loadLibrary, () => login_view.LoginView()),
          binding: LoginBinding(),
          middlewares: [
            EnsureNotAuthedMiddleware(),
          ],
        ),
        GetPage(
          name: _Paths.FORGOT_PASSWORD,
          page: () => DeferredWidget(forgot_password_view.loadLibrary,
              () => forgot_password_view.ForgotPasswordView()),
          binding: ForgotPasswordBinding(),
        ),
        GetPage(
          name: _Paths.REGISTER,
          page: () => DeferredWidget(
              register_view.loadLibrary, () => register_view.RegisterView()),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: _Paths.RESET_PASSWORD,
          page: () => DeferredWidget(reset_password_view.loadLibrary,
              () => reset_password_view.ResetPasswordView()),
          binding: ResetPasswordBinding(),
        ),

        //backend
        GetPage(
          name: _Paths.BACKEND,
          page: () => BackendView(),
          preventDuplicates: true,
          children: [
            GetPageMenu(
              name: _Paths.CONSOLE,
              page: () => ConsoleView(),
              icon: Icons.dashboard_outlined,
              title: 'console'.tr,
              preventDuplicates: true,
              middlewares: [
                EnsureAuthMiddleware(),
                RedirectMiddleware(Routes.DASHBOARD),
              ],
              children: [
                GetPageMenu(
                  name: _Paths.DASHBOARD,
                  title: 'dashboard'.tr,
                  icon: Icons.dashboard_outlined,
                  parameters: {},
                  page: () => DeferredWidget(dashboard_view.loadLibrary,
                      () => dashboard_view.DashboardView()),
                  binding: DashboardBinding(),
                ),
              ],
            ),

            //order
            GetPageMenu(
              name: _Paths.ORDER,
              title: 'order_management'.tr,
              icon: Icons.list_alt_outlined,
              page: () => OrderView(),
              preventDuplicates: true,
              middlewares: [
                EnsureAuthMiddleware(),
              ],
              children: [
                GetPageMenu(
                  name: _Paths.ORDER_LIST,
                  title: 'order_list'.tr,
                  page: () => DeferredWidget(order_list_view.loadLibrary,
                      () => order_list_view.OrderListView()),
                  binding: OrderListBinding(),
                ),
                GetPageMenu(
                  name: _Paths.ORDER_DETAIL,
                  title: 'order_detail'.tr,
                  hide: true,
                  page: () => DeferredWidget(order_detail_view.loadLibrary,
                      () => order_detail_view.OrderDetailView()),
                  binding: OrderDetailBinding(),
                ),
              ],
            ),

            //product
            GetPageMenu(
              name: _Paths.PRODUCT,
              title: 'product_management'.tr,
              icon: Icons.production_quantity_limits,
              page: () => ProductView(),
              preventDuplicates: true,
              middlewares: [
                EnsureAuthMiddleware(),
                RedirectMiddleware(Routes.PRODUCT_LIST),
              ],
              children: [
                GetPageMenu(
                  name: _Paths.PRODUCT_LIST,
                  title: 'product_list'.tr,
                  page: () => DeferredWidget(product_list_view.loadLibrary,
                      () => product_list_view.ProductListView()),
                  binding: ProductListBinding(),
                ),
                GetPageMenu(
                  name: _Paths.PRODUCT_DETAIL,
                  hide: true,
                  page: () => DeferredWidget(product_detail_view.loadLibrary,
                      () => product_detail_view.ProductDetailView()),
                  binding: ProductDetailBinding(),
                ),
                GetPageMenu(
                  name: _Paths.PRODUCT_CATEGORY,
                  title: 'product_category'.tr,
                  page: () => DeferredWidget(product_category_view.loadLibrary,
                      () => product_category_view.ProductCategoryView()),
                  binding: ProductCategoryBinding(),
                ),
                GetPageMenu(
                  name: _Paths.PRODUCT_TAG,
                  title: 'product_tag'.tr,
                  page: () => DeferredWidget(product_tag_view.loadLibrary,
                      () => product_tag_view.ProductTagView()),
                  binding: ProductTagBinding(),
                ),
                GetPageMenu(
                  name: _Paths.PRODUCT_ATTRIBUTE,
                  title: 'product_attribute'.tr,
                  page: () => DeferredWidget(product_attribute_view.loadLibrary,
                      () => product_attribute_view.ProductAttributeView()),
                  binding: ProductAttributeBinding(),
                ),
              ],
            ),

            //agent
            GetPageMenu(
              name: _Paths.AGENT,
              title: 'agent_management'.tr,
              icon: Icons.assignment,
              page: () => AgentView(),
              preventDuplicates: true,
              middlewares: [
                EnsureAuthMiddleware(),
              ],
              children: [
                GetPageMenu(
                  title: 'agent_list'.tr,
                  name: _Paths.AGENT_LIST,
                  page: () => DeferredWidget(agent_list_view.loadLibrary,
                      () => agent_list_view.AgentListView()),
                  binding: AgentListBinding(),
                ),
                GetPageMenu(
                  name: _Paths.AGENT_DETAIL,
                  hide: true,
                  page: () => DeferredWidget(agent_detail_view.loadLibrary,
                      () => agent_detail_view.AgentDetailView()),
                  binding: AgentDetailBinding(),
                ),
              ],
            ),

            //auth
            GetPageMenu(
              name: _Paths.AUTH,
              title: 'auth_management'.tr,
              icon: Icons.person,
              page: () => AuthView(),
              preventDuplicates: true,
              middlewares: [
                EnsureAuthMiddleware(),
              ],
              children: [
                GetPageMenu(
                  name: _Paths.USER_LIST,
                  title: 'user_list'.tr,
                  page: () => DeferredWidget(user_list_view.loadLibrary,
                      () => user_list_view.UserListView()),
                  binding: UserListBinding(),
                ),
                GetPageMenu(
                  name: _Paths.USER_DETAIL,
                  hide: true,
                  page: () => DeferredWidget(user_detail_view.loadLibrary,
                      () => user_detail_view.UserDetailView()),
                  binding: UserDetailBinding(),
                ),
                GetPageMenu(
                  name: _Paths.ROLE_LIST,
                  title: 'role_list'.tr,
                  page: () => DeferredWidget(role_list_view.loadLibrary,
                      () => role_list_view.RoleListView()),
                  binding: RoleListBinding(),
                ),
                GetPageMenu(
                  name: _Paths.ROLE_DETAIL,
                  hide: true,
                  page: () => DeferredWidget(role_detail_view.loadLibrary,
                      () => role_detail_view.RoleDetailView()),
                  binding: RoleDetailBinding(),
                ),
                GetPageMenu(
                  name: _Paths.MENU_LIST,
                  title: 'menu_list'.tr,
                  page: () => DeferredWidget(menu_list_view.loadLibrary,
                      () => menu_list_view.MenuListView()),
                  binding: MenuListBinding(),
                ),
              ],
            ),

            //setting
            GetPageMenu(
              name: _Paths.SETTING,
              title: 'setting'.tr,
              icon: Icons.settings,
              page: () => DeferredWidget(
                  setting_view.loadLibrary, () => setting_view.SettingView()),
              binding: SettingBinding(),
            ),

            //profile
            GetPageMenu(
              name: _Paths.PROFILE,
              title: 'profile'.tr,
              icon: Icons.file_copy,
              page: () => DeferredWidget(
                  profile_view.loadLibrary, () => profile_view.ProfileView()),
              binding: ProfileBinding(),
            ),
          ],
        ),
      ],
    ),
  ];
}
