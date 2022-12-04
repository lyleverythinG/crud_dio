import '../../utils/exported_packages.dart';

class UserController {
  final userRepository = getIt.get<UserRepository>();
  final name = TextEditingController();
  final job = TextEditingController();
  final List<UserModel> users = [];

  Future<UserModel> addUser() async {
    final userToBeAdded = await userRepository.requestAddUser(
      name.text,
      job.text,
    );
    users.add(userToBeAdded);
    return userToBeAdded;
  }

  Future<UserModel> updateUserInfo(int id, String name, String job) async {
    final updatedUser = await userRepository.requestUpdateUser(
      id,
      name,
      job,
    );
    users[id] = updatedUser;
    return updatedUser;
  }

  Future<void> deleteUser(int id) async {
    await userRepository.requestDeleteUser(id);
    users.removeAt(id);
  }
}
