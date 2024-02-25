abstract class ApiClient {
  Future get(
    String url, {
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? query,
    bool isMap = true,
  });

  Future post(
    String url, {
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isMap = true,
    bool needCheckLogin = true,
    bool errorNeedReLogin = false,
    bool? isKTP,
  });

  Future put(
    String url, {
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isMap = true,
    bool needCheckLogin = true,
    bool errorNeedReLogin = false,
  });

  Future delete(
    String url, {
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isMap = true,
    bool needCheckLogin = true,
    bool errorNeedReLogin = false,
  });
}
