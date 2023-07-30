import '../../../domain/model/user/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> loginWithGoogle();

  Future<bool> logoutGoogleAuth();

  Future<bool> isLoggedGoogleAuth();

  Future<UserModel?> getAccount();

  Future<bool> insertAccount(UserModel user);

  Future<bool> removeAccount(String userId);
}
