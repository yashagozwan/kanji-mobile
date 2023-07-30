import 'package:injectable/injectable.dart';
import '../model/user/user_model.dart';
import '../repository/i_user_repository.dart';
import 'user_usecase.dart';

@Injectable(as: UserUseCase)
class UserInteractor implements UserUseCase {
  final IUserRepository _userRepository;

  UserInteractor(this._userRepository);

  @override
  Future<UserModel> loginWithGoogle() => _userRepository.loginWithGoogle();

  @override
  Future<bool> logoutGoogleAuth() => _userRepository.logoutGoogleAuth();

  @override
  Future<bool> isLoggedInGoogleAuth() => _userRepository.isLoggedInGoogleAuth();

  @override
  Future<UserModel> getAccount() => _userRepository.getAccount();

  @override
  Future<bool> removeAccount(String userId) =>
      _userRepository.removeAccount(userId);
}
