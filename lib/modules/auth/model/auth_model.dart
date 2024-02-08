class LoginResponseModel {
  Status? status;
  AuthResp? response;

  LoginResponseModel({
    this.status,
    this.response,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        response: json["response"] == null
            ? null
            : AuthResp.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "response": response?.toJson(),
      };
}

class AuthResp {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;
  String? scope;
  List<dynamic>? userRole;
  String? tenantName;
  String? userType;
  String? userId;
  String? userName;

  AuthResp({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.userRole,
    this.tenantName,
    this.userType,
    this.userId,
    this.userName,
  });

  factory AuthResp.fromJson(Map<String, dynamic> json) => AuthResp(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        refreshToken: json["refresh_token"],
        expiresIn: json["expires_in"],
        scope: json["scope"],
        userRole: json["user_role"] == null
            ? []
            : List<dynamic>.from(json["user_role"]!.map((x) => x)),
        tenantName: json["tenant_name"],
        userType: json["user_type"],
        userId: json["user_id"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
        "scope": scope,
        "user_role":
            userRole == null ? [] : List<dynamic>.from(userRole!.map((x) => x)),
        "tenant_name": tenantName,
        "user_type": userType,
        "user_id": userId,
        "user_name": userName,
      };
}

class Status {
  int? code;
  dynamic message;

  Status({
    this.code,
    this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
