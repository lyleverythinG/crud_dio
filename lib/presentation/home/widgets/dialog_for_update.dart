import 'package:crud_dio/utils/exported_packages.dart';

class DialogForUpdate extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController job;
  final VoidCallback cancelOnPressed;
  final VoidCallback updateOnPressed;
  const DialogForUpdate(
      {Key? key,
      required this.name,
      required this.job,
      required this.cancelOnPressed,
      required this.updateOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Update User Info',
        style: TextStyle(
            fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(alignment: Alignment.topLeft, child: Text('Name:')),
          Flexible(
            child: TextFormField(
              maxLines: 1,
              controller: name,
            ),
          ),
          const SizedBox(height: 10),
          const Align(alignment: Alignment.topLeft, child: Text('Job:')),
          Flexible(
            child: TextFormField(
              maxLines: 2,
              controller: job,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: cancelOnPressed,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: updateOnPressed,
          child: const Text('Update'),
        ),
      ],
    );
  }
}
