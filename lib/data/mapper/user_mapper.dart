import 'package:firebase_auth/firebase_auth.dart';
import 'package:kanji_app/data/source/local/hive/user/user_hive.dart';
import 'package:kanji_app/domain/model/user/user_model.dart';

class UserMapper {
  static UserModel toModel(UserHive user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      image: user.image,
      createdAt: user.createdAt,
    );
  }

  static UserModel mapToModel(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  static UserHive toHive(UserModel user) {
    return UserHive(
      id: user.id,
      name: user.name,
      email: user.email,
      image: user.image,
      createdAt: user.createdAt,
    );
  }

  static UserModel firebaseAuthToModel(User? user) {
    return UserModel(
      id: '${user?.uid}',
      email: '${user?.email}',
      name: '${user?.displayName}',
      image: '${user?.photoURL}',
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  static Map<String, dynamic> objectFirebaseToMap(Object object) {
    return UserModel.fromJson(
      object as Map<String, dynamic>,
    ).toJson();
  }
}
