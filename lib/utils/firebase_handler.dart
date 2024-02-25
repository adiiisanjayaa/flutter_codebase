class FirebaseHandler {
  // @pragma('vm:entry-point')
  // static Future<void> onBackgroundReceive(RemoteMessage event) async {
  //   try {
  //     await Get.putAsync<SharedPreferences>(
  //       () async {
  //         return await SharedPreferences.getInstance();
  //       },
  //       permanent: true,
  //     );
  //     onReceiveMessage(event);
  //   } catch (e) {
  //     log('error onBackgroundReceive: $e');
  //   }
  // }

  // static Future<void> onReceiveMessage(RemoteMessage event) async {
  //   if (event.notification != null) {
  //     log("Message ${event.notification?.title} : ${event.notification?.body}");
  //     log('Message data: ${event.data}');

  //     try {
  //       var user = await StorageMethods.find.getData(StorageNames.auth);
  //       Map<String, dynamic> payload = event.data;
  //       String? payloadEncode;
  //       try {
  //         payloadEncode = json.encode(event.data);
  //       } catch (e) {
  //         log("error encode");
  //       }
  //       NotificationResponse data = NotificationResponse(
  //         id: (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
  //         userId: user != null && user != '' ? user['uid'] : '',
  //         title: event.notification?.title,
  //         body: event.notification?.body,
  //         payload: payloadEncode,
  //         category: (payload['category'] ?? '').toLowerCase(),
  //         imageUrl: payload['imageUrl'] ?? payload['image_url'],
  //         expImageUrl: payload['expImageUrl'] ?? payload['exp_image_url'],
  //         actionType: payload['actionType'] ?? payload['action_type'],
  //         actionUID: payload['actionUID'] ?? payload['action_uid'],
  //         date: DateTime.now(),
  //         isUnread: true,
  //       );
  //       var db = await SQLiteDatabase.instance.database;
  //       await NotificationTableImpl(db).insertNotification(data);
  //     } catch (e) {
  //       log('error onReceiveMessage: $e');
  //     }
  //   }
  // }
}
