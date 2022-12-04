import '../../utils/exported_packages.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final userController = getIt.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (c) => const HomePage()));
          },
        ),
        actions: [
          TextButton(
              onPressed: () async {
                if (userController.name.text.isNotEmpty &&
                    userController.job.text.isNotEmpty) {
                  await userController.addUser();
                  userController.name.clear();
                  userController.job.clear();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HomePage())));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Fields must not empty."),
                  ));
                }
              },
              child: const Text(
                'ADD',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Enter Name:'),
            TextFormField(controller: userController.name),
            const SizedBox(height: 20),
            const Text('Enter Job:'),
            TextFormField(controller: userController.job),
          ],
        ),
      ),
    );
  }
}
