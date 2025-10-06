class LoggedUserModel {
  bool? success;
  UUser? user;
  Session? session;

  LoggedUserModel({this.success, this.user, this.session});

  LoggedUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new UUser.fromJson(json['user']) : null;
    session =
    json['session'] != null ? new Session.fromJson(json['session']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.session != null) {
      data['session'] = this.session!.toJson();
    }
    return data;
  }
}

class UUser {
  String? id;
  String? aud;
  String? role;
  String? email;
  String? emailConfirmedAt;
  String? phone;
  String? confirmedAt;
  String? lastSignInAt;
  AppMetadata? appMetadata;
  UserMetadata? userMetadata;
  Null? identities;
  String? createdAt;
  String? updatedAt;
  bool? isAnonymous;

  UUser(
      {this.id,
        this.aud,
        this.role,
        this.email,
        this.emailConfirmedAt,
        this.phone,
        this.confirmedAt,
        this.lastSignInAt,
        this.appMetadata,
        this.userMetadata,
        this.identities,
        this.createdAt,
        this.updatedAt,
        this.isAnonymous});

  UUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aud = json['aud'];
    role = json['role'];
    email = json['email'];
    emailConfirmedAt = json['email_confirmed_at'];
    phone = json['phone'];
    confirmedAt = json['confirmed_at'];
    lastSignInAt = json['last_sign_in_at'];
    appMetadata = json['app_metadata'] != null
        ? new AppMetadata.fromJson(json['app_metadata'])
        : null;
    userMetadata = json['user_metadata'] != null
        ? new UserMetadata.fromJson(json['user_metadata'])
        : null;
    identities = json['identities'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isAnonymous = json['is_anonymous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['aud'] = this.aud;
    data['role'] = this.role;
    data['email'] = this.email;
    data['email_confirmed_at'] = this.emailConfirmedAt;
    data['phone'] = this.phone;
    data['confirmed_at'] = this.confirmedAt;
    data['last_sign_in_at'] = this.lastSignInAt;
    if (this.appMetadata != null) {
      data['app_metadata'] = this.appMetadata!.toJson();
    }
    if (this.userMetadata != null) {
      data['user_metadata'] = this.userMetadata!.toJson();
    }
    data['identities'] = this.identities;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_anonymous'] = this.isAnonymous;
    return data;
  }
}

class AppMetadata {
  String? provider;
  List<String>? providers;

  AppMetadata({this.provider, this.providers});

  AppMetadata.fromJson(Map<String, dynamic> json) {
    provider = json['provider'];
    providers = json['providers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider'] = this.provider;
    data['providers'] = this.providers;
    return data;
  }
}

class UserMetadata {
  String? avatarUrl;
  String? email;
  bool? emailVerified;
  String? fullName;
  String? iss;
  String? name;
  bool? phoneVerified;
  String? picture;
  String? providerId;
  String? sub;

  UserMetadata(
      {this.avatarUrl,
        this.email,
        this.emailVerified,
        this.fullName,
        this.iss,
        this.name,
        this.phoneVerified,
        this.picture,
        this.providerId,
        this.sub});

  UserMetadata.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    email = json['email'];
    emailVerified = json['email_verified'];
    fullName = json['full_name'];
    iss = json['iss'];
    name = json['name'];
    phoneVerified = json['phone_verified'];
    picture = json['picture'];
    providerId = json['provider_id'];
    sub = json['sub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatarUrl;
    data['email'] = this.email;
    data['email_verified'] = this.emailVerified;
    data['full_name'] = this.fullName;
    data['iss'] = this.iss;
    data['name'] = this.name;
    data['phone_verified'] = this.phoneVerified;
    data['picture'] = this.picture;
    data['provider_id'] = this.providerId;
    data['sub'] = this.sub;
    return data;
  }
}

class Session {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  int? expiresAt;
  String? refreshToken;
  User? user;
  Null? weakPassword;

  Session(
      {this.accessToken,
        this.tokenType,
        this.expiresIn,
        this.expiresAt,
        this.refreshToken,
        this.user,
        this.weakPassword});

  Session.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    expiresAt = json['expires_at'];
    refreshToken = json['refresh_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    weakPassword = json['weak_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['expires_at'] = this.expiresAt;
    data['refresh_token'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['weak_password'] = this.weakPassword;
    return data;
  }
}

class User {
  String? id;
  String? aud;
  String? role;
  String? email;
  String? emailConfirmedAt;
  String? phone;
  String? confirmedAt;
  String? lastSignInAt;
  AppMetadata? appMetadata;
  UserMetadata? userMetadata;
  List<Identities>? identities;
  String? createdAt;
  String? updatedAt;
  bool? isAnonymous;

  User(
      {this.id,
        this.aud,
        this.role,
        this.email,
        this.emailConfirmedAt,
        this.phone,
        this.confirmedAt,
        this.lastSignInAt,
        this.appMetadata,
        this.userMetadata,
        this.identities,
        this.createdAt,
        this.updatedAt,
        this.isAnonymous});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aud = json['aud'];
    role = json['role'];
    email = json['email'];
    emailConfirmedAt = json['email_confirmed_at'];
    phone = json['phone'];
    confirmedAt = json['confirmed_at'];
    lastSignInAt = json['last_sign_in_at'];
    appMetadata = json['app_metadata'] != null
        ? new AppMetadata.fromJson(json['app_metadata'])
        : null;
    userMetadata = json['user_metadata'] != null
        ? new UserMetadata.fromJson(json['user_metadata'])
        : null;
    if (json['identities'] != null) {
      identities = <Identities>[];
      json['identities'].forEach((v) {
        identities!.add(new Identities.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isAnonymous = json['is_anonymous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['aud'] = this.aud;
    data['role'] = this.role;
    data['email'] = this.email;
    data['email_confirmed_at'] = this.emailConfirmedAt;
    data['phone'] = this.phone;
    data['confirmed_at'] = this.confirmedAt;
    data['last_sign_in_at'] = this.lastSignInAt;
    if (this.appMetadata != null) {
      data['app_metadata'] = this.appMetadata!.toJson();
    }
    if (this.userMetadata != null) {
      data['user_metadata'] = this.userMetadata!.toJson();
    }
    if (this.identities != null) {
      data['identities'] = this.identities!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_anonymous'] = this.isAnonymous;
    return data;
  }
}

class Identities {
  String? identityId;
  String? id;
  String? userId;
  IdentityData? identityData;
  String? provider;
  String? lastSignInAt;
  String? createdAt;
  String? updatedAt;
  String? email;

  Identities(
      {this.identityId,
        this.id,
        this.userId,
        this.identityData,
        this.provider,
        this.lastSignInAt,
        this.createdAt,
        this.updatedAt,
        this.email});

  Identities.fromJson(Map<String, dynamic> json) {
    identityId = json['identity_id'];
    id = json['id'];
    userId = json['user_id'];
    identityData = json['identity_data'] != null
        ? new IdentityData.fromJson(json['identity_data'])
        : null;
    provider = json['provider'];
    lastSignInAt = json['last_sign_in_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identity_id'] = this.identityId;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    if (this.identityData != null) {
      data['identity_data'] = this.identityData!.toJson();
    }
    data['provider'] = this.provider;
    data['last_sign_in_at'] = this.lastSignInAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['email'] = this.email;
    return data;
  }
}

class IdentityData {
  String? email;
  bool? emailVerified;
  bool? phoneVerified;
  String? sub;
  String? avatarUrl;
  String? fullName;
  String? iss;
  String? name;
  String? picture;
  String? providerId;
  String? phone;

  IdentityData(
      {this.email,
        this.emailVerified,
        this.phoneVerified,
        this.sub,
        this.avatarUrl,
        this.fullName,
        this.iss,
        this.name,
        this.picture,
        this.providerId,
        this.phone});

  IdentityData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    emailVerified = json['email_verified'];
    phoneVerified = json['phone_verified'];
    sub = json['sub'];
    avatarUrl = json['avatar_url'];
    fullName = json['full_name'];
    iss = json['iss'];
    name = json['name'];
    picture = json['picture'];
    providerId = json['provider_id'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['email_verified'] = this.emailVerified;
    data['phone_verified'] = this.phoneVerified;
    data['sub'] = this.sub;
    data['avatar_url'] = this.avatarUrl;
    data['full_name'] = this.fullName;
    data['iss'] = this.iss;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['provider_id'] = this.providerId;
    data['phone'] = this.phone;
    return data;
  }
}
