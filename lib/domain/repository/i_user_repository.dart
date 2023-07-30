import '../model/user/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> loginWithGoogle();

  Future<bool> logoutGoogleAuth();

  Future<bool> isLoggedInGoogleAuth();

  Future<UserModel> getAccount();

  Future<bool> removeAccount(String userId);
}
