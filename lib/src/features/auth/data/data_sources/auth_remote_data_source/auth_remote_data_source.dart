
import '../../data.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserModel> signup(SignupModel signup);
  Future<UserModel> login(LoginModel login);
  Future<void> logout();
}
