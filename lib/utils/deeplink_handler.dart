import 'dart:async';
import 'dart:developer';
import 'package:app/core/constant/deeplink_constant.dart';
import 'package:app/core/constant/storage_names.dart';
import 'package:app/utils/storage_methods.dart';
import 'package:uni_links/uni_links.dart';

class DeeplinkHandler {
  DeeplinkHandler._privateConstructor();

  static final DeeplinkHandler instance = DeeplinkHandler._privateConstructor();

  StreamSubscription? subUniLinks;

  Future<void> initDeeplink() async {
    if (subUniLinks != null) {
      await subUniLinks?.cancel();
    }
    try {
      String? initialURI = await getInitialLink();
      log("Deeplink init $initialURI");
      var link = await StorageMethods.find.getData(
        StorageNames.deepLink,
      );
      log("Deeplink link $link");
      if (link == null) {
        _listenLink(initialURI);
      }
    } catch (e) {
      log("Error getInitialLink deep link : $e");
    }

    subUniLinks = uriLinkStream.listen((Uri? uri) {
      log('Deeplink listen ${uri ?? 'null'}');
      if (uri != null) {
        _listenLink(uri.toString());
      }
    }, onError: (Object err) {
      log("Error listen deep link : $err");
    });
  }

  Future<void> processLink({
    required String? link,
    required bool isLogin,
    bool isHome = false,
  }) async {
    log('Deeplink processLink: ${link.toString()}, $isLogin, $isHome ');
    if (link == null) {
      return;
    }
    String route = link
        .replaceAll(DeeplinkConstant.hostNameWithHttp, '')
        .replaceAll(DeeplinkConstant.hostNameWithHttps, '')
        .replaceAll(DeeplinkConstant.hostNameWithWwwHttp, '')
        .replaceAll(DeeplinkConstant.hostNameWithWwwHttps, '');

    _deeplinkGeneral(link, route, isLogin);
    if (isLogin && isHome) {
      _deeplinkUserLogin(route);
      removeDeeplink();
    } else if (!isLogin) {
      _deeplinkUserNotLogin(route);
    }
  }

  Future<void> removeDeeplink() async {
    await StorageMethods.find.remove(StorageNames.deepLink);
  }

  /// Deeplink for general purpose, user login or not, handle in this function.
  /// Need add removeDeeplink() in every deeplink
  void _deeplinkGeneral(String link, String route, bool isLogin) async {
    StorageMethods.find.setBool("showNudges", false);
    StorageMethods.find.setBool("haveDeeplink", true);

    log('Deeplink processLink route: $route');
    // if (route.contains(DeeplinkConstant.takeoverNudges)) {
    //   saveNudgesLink(DeeplinkConstant.takeoverNudges);
    // }

    removeDeeplink();
  }
}

/// Deeplink for specified not login user.
void _deeplinkUserNotLogin(String route) async {
  // if (route.contains(DeeplinkConstant.referral)) {
  //   String referral = route.replaceAll(DeeplinkConstant.referralCode, '');
  //   _saveReferralCode(referral);
  // }
}

/// Deeplink for already login user
void _deeplinkUserLogin(String route) async {
  // if (route == DeeplinkConstant.primaryKpr) {
  //   Get.toNamed(Routes.HOME_PRIMARY_KPR);
  // }
}

Future<void> _listenLink(link) async {
  await StorageMethods.find.setData(
    StorageNames.deepLink,
    link,
  );
}
