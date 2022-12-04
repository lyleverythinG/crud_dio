import 'package:crud_dio/utils/exported_packages.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userController = getIt.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const AddUserScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          final UserModel user = userController.users[index];
          return Dismissible(
            key: Key(user.id != null ? user.id! : ''),
            background: Container(
              color: Colors.redAccent,
              child: const Center(
                child: Icon(Icons.delete),
              ),
            ),
            onDismissed: (direction) async {
              await userController.deleteUser(index).then((value) {
                setState(() {});
              }).then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('User Deleted Successfully'),
                    duration: Duration(seconds: 1),
                  ),
                );
              });
            },
            child: ListTile(
              title: Text(user.name!),
              subtitle: Text(user.job!),
              trailing: user.updatedAt != null
                  ? Text(DateFormat().format(DateTime.parse(user.updatedAt!)))
                  : Text(DateFormat().format(DateTime.parse(user.createdAt!))),
              onLongPress: () async {
                await userController.deleteUser(index).then((value) {
                  setState(() {});
                }).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('User Deleted Successfully'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                });
              },
              onTap: () {
                userController.name.text = user.name!;
                userController.job.text = user.job!;
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (cx) {
                    return DialogForUpdate(
                        name: userController.name,
                        job: userController.job,
                        cancelOnPressed: () {
                          Navigator.pop(cx);
                          userController.name.clear();
                          userController.job.clear();
                        },
                        updateOnPressed: () async {
                          if (userController.name.text.isNotEmpty &&
                              userController.job.text.isNotEmpty) {
                            await userController
                                .updateUserInfo(
                              index,
                              userController.name.text,
                              userController.job.text,
                            )
                                .then((value) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('User Updated Successfully'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              userController.name.clear();
                              userController.job.clear();
                              setState(() {});
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Fields must not be null.'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }
                        });
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
