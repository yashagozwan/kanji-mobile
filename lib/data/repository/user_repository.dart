import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kanji_app/data/source/remote/user_remote_data_source.dart';

import '../../domain/model/user/user_model.dart';
import '../../domain/repository/i_user_repository.dart';
import '../source/local/user_local_data_source.dart';

@Injectable(as: IUserRepository)
class UserRepository implements IUserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  UserRepository(this._userRemoteDataSource, this._userLocalDataSource);

  @override
  Future<UserModel> loginWithGoogle() async {
    try {
      final user = await _userRemoteDataSource.loginWithGoogle();
      await _userRemoteDataSource.insertAccount(user);
      await _userLocalDataSource.insertAccount(user);
      return user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Future<bool> logoutGoogleAuth() async {
    await _userLocalDataSource.removeAccount();
    return _userRemoteDataSource.logoutGoogleAuth();
  }

  @override
  Future<bool> isLoggedInGoogleAuth() {
    return _userRemoteDataSource.isLoggedGoogleAuth();
  }

  @override
  Future<UserModel> getAccount() {
    return _userLocalDataSource.getAccount();
  }

  @override
  Future<bool> removeAccount(String userId) {
    // TODO: implement removeAccount
    throw UnimplementedError();
  }
}
