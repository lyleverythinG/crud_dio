import '../../../../utils/exported_packages.dart';

class API {
  final DioClient dioClient;

  API({required this.dioClient});

  Future<Response> addUser(String name, String job) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.users,
        data: {
          'name': name,
          'job': job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateUser(int id, String name, String job) async {
    try {
      final Response response = await dioClient.put(
        Endpoints.users + '/$id',
        data: {
          'name': name,
          'job': job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await dioClient.delete(Endpoints.users + '/$id');
    } catch (e) {
      rethrow;
    }
  }
}
