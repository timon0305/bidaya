import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/models/logged_user_model.dart';

void main() {
  group('LoggedUserModel', () {
    test('should create from JSON', () {
      final json = {
        'success': true,
        'user': {
          'id': '123',
          'email': 'test@example.com',
          'phone': '+201234567890',
        },
        'session': {
          'access_token': 'token123',
          'token_type': 'bearer',
        },
      };

      final model = LoggedUserModel.fromJson(json);

      expect(model.success, true);
      expect(model.user?.id, '123');
      expect(model.user?.email, 'test@example.com');
      expect(model.session?.accessToken, 'token123');
    });

    test('should convert to JSON', () {
      final model = LoggedUserModel(
        success: true,
        user: UUser(id: '123', email: 'test@example.com'),
        session: Session(accessToken: 'token123'),
      );

      final json = model.toJson();

      expect(json['success'], true);
      expect(json['user']['id'], '123');
      expect(json['user']['email'], 'test@example.com');
      expect(json['session']['access_token'], 'token123');
    });

    test('should handle null user and session', () {
      final model = LoggedUserModel(success: false);
      final json = model.toJson();

      expect(json['success'], false);
      expect(json['user'], isNull);
      expect(json['session'], isNull);
    });
  });

  group('UUser', () {
    test('should create from JSON with all fields', () {
      final json = {
        'id': '123',
        'aud': 'authenticated',
        'role': 'admin',
        'email': 'test@example.com',
        'phone': '+201234567890',
        'is_anonymous': false,
        'created_at': '2024-01-01',
      };

      final user = UUser.fromJson(json);

      expect(user.id, '123');
      expect(user.aud, 'authenticated');
      expect(user.role, 'admin');
      expect(user.email, 'test@example.com');
      expect(user.phone, '+201234567890');
      expect(user.isAnonymous, false);
    });

    test('should convert to JSON', () {
      final user = UUser(
        id: '123',
        email: 'test@example.com',
        phone: '+201234567890',
        role: 'user',
      );

      final json = user.toJson();

      expect(json['id'], '123');
      expect(json['email'], 'test@example.com');
      expect(json['phone'], '+201234567890');
      expect(json['role'], 'user');
    });

    test('should handle nested app metadata', () {
      final json = {
        'id': '123',
        'app_metadata': {
          'provider': 'email',
          'providers': ['email', 'phone'],
        },
      };

      final user = UUser.fromJson(json);

      expect(user.appMetadata?.provider, 'email');
      expect(user.appMetadata?.providers, contains('email'));
      expect(user.appMetadata?.providers, contains('phone'));
    });

    test('should handle nested user metadata', () {
      final json = {
        'id': '123',
        'user_metadata': {
          'full_name': 'John Doe',
          'avatar_url': 'https://example.com/avatar.jpg',
          'email_verified': true,
        },
      };

      final user = UUser.fromJson(json);

      expect(user.userMetadata?.fullName, 'John Doe');
      expect(user.userMetadata?.avatarUrl, 'https://example.com/avatar.jpg');
      expect(user.userMetadata?.emailVerified, true);
    });
  });

  group('AppMetadata', () {
    test('should create from JSON', () {
      final json = {
        'provider': 'email',
        'providers': ['email', 'phone'],
      };

      final metadata = AppMetadata.fromJson(json);

      expect(metadata.provider, 'email');
      expect(metadata.providers?.length, 2);
      expect(metadata.providers, contains('email'));
    });

    test('should convert to JSON', () {
      final metadata = AppMetadata(
        provider: 'email',
        providers: ['email', 'phone'],
      );

      final json = metadata.toJson();

      expect(json['provider'], 'email');
      expect(json['providers'], contains('email'));
      expect(json['providers'], contains('phone'));
    });
  });

  group('UserMetadata', () {
    test('should create from JSON with all fields', () {
      final json = {
        'avatar_url': 'https://example.com/avatar.jpg',
        'email': 'test@example.com',
        'email_verified': true,
        'full_name': 'John Doe',
        'phone_verified': false,
        'name': 'John',
      };

      final metadata = UserMetadata.fromJson(json);

      expect(metadata.avatarUrl, 'https://example.com/avatar.jpg');
      expect(metadata.email, 'test@example.com');
      expect(metadata.emailVerified, true);
      expect(metadata.fullName, 'John Doe');
      expect(metadata.phoneVerified, false);
      expect(metadata.name, 'John');
    });

    test('should convert to JSON', () {
      final metadata = UserMetadata(
        fullName: 'John Doe',
        email: 'test@example.com',
        emailVerified: true,
      );

      final json = metadata.toJson();

      expect(json['full_name'], 'John Doe');
      expect(json['email'], 'test@example.com');
      expect(json['email_verified'], true);
    });
  });

  group('Session', () {
    test('should create from JSON', () {
      final json = {
        'access_token': 'token123',
        'token_type': 'bearer',
        'expires_in': 3600,
        'expires_at': 1234567890,
        'refresh_token': 'refresh123',
      };

      final session = Session.fromJson(json);

      expect(session.accessToken, 'token123');
      expect(session.tokenType, 'bearer');
      expect(session.expiresIn, 3600);
      expect(session.expiresAt, 1234567890);
      expect(session.refreshToken, 'refresh123');
    });

    test('should convert to JSON', () {
      final session = Session(
        accessToken: 'token123',
        tokenType: 'bearer',
        expiresIn: 3600,
      );

      final json = session.toJson();

      expect(json['access_token'], 'token123');
      expect(json['token_type'], 'bearer');
      expect(json['expires_in'], 3600);
    });

    test('should handle nested user', () {
      final json = {
        'access_token': 'token123',
        'user': {
          'id': '456',
          'email': 'user@example.com',
        },
      };

      final session = Session.fromJson(json);

      expect(session.user?.id, '456');
      expect(session.user?.email, 'user@example.com');
    });
  });

  group('User', () {
    test('should create from JSON with identities', () {
      final json = {
        'id': '123',
        'email': 'test@example.com',
        'identities': [
          {
            'identity_id': 'id1',
            'provider': 'email',
            'email': 'test@example.com',
          },
        ],
      };

      final user = User.fromJson(json);

      expect(user.id, '123');
      expect(user.identities?.length, 1);
      expect(user.identities?.first.provider, 'email');
    });

    test('should convert to JSON with identities', () {
      final user = User(
        id: '123',
        email: 'test@example.com',
        identities: [
          Identities(
            identityId: 'id1',
            provider: 'email',
          ),
        ],
      );

      final json = user.toJson();

      expect(json['id'], '123');
      expect(json['identities'].length, 1);
      expect(json['identities'][0]['provider'], 'email');
    });
  });

  group('Identities', () {
    test('should create from JSON', () {
      final json = {
        'identity_id': 'id1',
        'id': '123',
        'user_id': 'user123',
        'provider': 'email',
        'email': 'test@example.com',
      };

      final identity = Identities.fromJson(json);

      expect(identity.identityId, 'id1');
      expect(identity.id, '123');
      expect(identity.userId, 'user123');
      expect(identity.provider, 'email');
      expect(identity.email, 'test@example.com');
    });

    test('should convert to JSON', () {
      final identity = Identities(
        identityId: 'id1',
        provider: 'email',
        email: 'test@example.com',
      );

      final json = identity.toJson();

      expect(json['identity_id'], 'id1');
      expect(json['provider'], 'email');
      expect(json['email'], 'test@example.com');
    });

    test('should handle nested identity data', () {
      final json = {
        'identity_id': 'id1',
        'identity_data': {
          'email': 'test@example.com',
          'email_verified': true,
        },
      };

      final identity = Identities.fromJson(json);

      expect(identity.identityData?.email, 'test@example.com');
      expect(identity.identityData?.emailVerified, true);
    });
  });

  group('IdentityData', () {
    test('should create from JSON', () {
      final json = {
        'email': 'test@example.com',
        'email_verified': true,
        'phone_verified': false,
        'full_name': 'John Doe',
        'avatar_url': 'https://example.com/avatar.jpg',
      };

      final data = IdentityData.fromJson(json);

      expect(data.email, 'test@example.com');
      expect(data.emailVerified, true);
      expect(data.phoneVerified, false);
      expect(data.fullName, 'John Doe');
      expect(data.avatarUrl, 'https://example.com/avatar.jpg');
    });

    test('should convert to JSON', () {
      final data = IdentityData(
        email: 'test@example.com',
        emailVerified: true,
        fullName: 'John Doe',
      );

      final json = data.toJson();

      expect(json['email'], 'test@example.com');
      expect(json['email_verified'], true);
      expect(json['full_name'], 'John Doe');
    });
  });
}
