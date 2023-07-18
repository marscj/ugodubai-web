import 'package:get/get.dart';
import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/services/auth_service.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    // you can do whatever you want here
    // but it's preferable to make this method fast
    // await Future.delayed(Duration(milliseconds: 500));

    if (!AuthService.to.isLoggedIn()) {
      final newRoute = Routes.LOGIN_THEN(route.location!);
      return GetNavConfig.fromRoute(newRoute);
    }
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (AuthService.to.isLoggedIn()) {
      return null;
    }
    return await super.redirectDelegate(route);
  }
}

class RedirectMiddleware extends GetMiddleware {
  final String path;

  RedirectMiddleware(this.path);

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (path.contains(route.location!)) {
      return GetNavConfig.fromRoute(path);
    }
    return await super.redirectDelegate(route);
  }
}
