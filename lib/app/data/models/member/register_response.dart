class RegisterResponse {
  String? accessToken;
  String? refreshToken;
  String? memberUID;

  RegisterResponse({this.accessToken, this.refreshToken, this.memberUID});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    memberUID = json['memberUID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['memberUID'] = memberUID;
    return data;
  }
}
