import '../models/user_model.dart';

abstract class AbstractRepository {
  Future<UserModel> resetPassword({required String email});
  Future<String> checkIn({required String username});
  Future<UserModel> signIn(
      {required String email, required String password});
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String userName,
  });
}
