import '../../utils/exported_packages.dart';

class UserRepository {
  final API userApi;

  UserRepository({required this.userApi});

  Future<UserModel> requestAddUser(String name, String job) async {
    try {
      final response = await userApi.addUser(name, job);
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.dioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserModel> requestUpdateUser(int id, String name, String job) async {
    try {
      final response = await userApi.updateUser(id, name, job);
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.dioError(e).toString();
      throw errorMessage;
    }
  }

  Future<void> requestDeleteUser(int id) async {
    try {
      await userApi.deleteUser(id);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.dioError(e).toString();
      throw errorMessage;
    }
  }
}
