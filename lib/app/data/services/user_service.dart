// import 'dart:developer';

// import 'package:app/core/constant/storage_names.dart';
// import 'package:app/utils/storage_methods.dart';
// import 'package:get/get.dart';

// class UserService extends GetxService {
//   MemberModel? user;

//   bool isLoggedIn = false;

//   updateStatusLogin(bool value) {
//     isLoggedIn = value;
//   }

//   Future initializeUserDetails() async {
//     try {
//       final localData = await StorageMethods.find.getData(StorageNames.auth);
//       if (localData == null) {
//         log("Local User not Found");
//         return;
//       } else {
//         final localUser = MemberModel.fromJson(localData);
//         user = localUser;
//         updateStatusLogin(true);
//         log("Local User Found");
//       }
//     } catch (e) {
//       log("error initializeUserDetails");
//     }
//   }

//   Future<bool?> setUserDataToLocal() {
//     return StorageMethods.find.setData(
//       StorageNames.auth,
//       user,
//     );
//   }

//   Future<void> refreshUserData(MemberResponse res) async {
//     if (isLoggedIn) {
//       MemberModel updatedUser = MemberModel(
//         uid: res.uid,
//         userToken: user?.userToken,
//         refreshToken: user?.refreshToken,
//         name: res.name,
//         phone: res.phone,
//         email: res.email,
//         regency: res.regency,
//         regencyUid: res.regencyUid,
//         emailIsVerified: res.emailIsVerified,
//         referral: res.referralCode,
//         refReferralCode: res.refReferralCode,
//         isSignupWithApple: res.isSignupWithApple,
//         isSignupWithGoogle: res.isSignupWithGoogle,
//         signupMode: res.signupMode,
//         updateReferralCodeAllowed: res.updateReferralCodeAllowed,
//         updateRefReferralCodeAllowed: res.updateRefReferralCodeAllowed,
//         newsletterSubscription: (res.newsletterSubscription ?? false) ? "Aktif Berlangganan" : "Berhenti Langganan",
//       );
//       user = updatedUser;
//       setUserDataToLocal();
//     }
//   }

//   Future<void> refreshUserToken(LoginResponse res) async {
//     if (isLoggedIn) {
//       user?.userToken = res.accessToken;
//       user?.refreshToken = res.refreshToken;
//       user?.uid = res.memberUID;
//       setUserDataToLocal();
//     }
//   }

//   void logout() async {
//     try {
//       user = null;
//       updateStatusLogin(false);
//       await StorageMethods.find.remove(StorageNames.auth);
//       await StorageMethods.find.remove(StorageNames.fullName);
//     } catch (e) {
//       log('failed to logout : $e');
//     }
//   }

//   Future<void> setUserLoggedIn(MemberModel member, {bool fromAuth = false}) async {
//     user = member;
//     updateStatusLogin(true);
//     await setUserDataToLocal();
//   }

//   static UserService get find => Get.find();
// }
