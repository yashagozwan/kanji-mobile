import '../../../domain/model/user/user_model.dart';

abstract class UserLocalDataSource {
  Future<bool> insertAccount(UserModel user);

  Future<UserModel> getAccount();

  Future<bool> removeAccount();
}
