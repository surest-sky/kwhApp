import 'package:flutter/material.dart';

class NoteAction extends StatelessWidget {
  const NoteAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('编辑'),
              leading: Icon(Icons.edit),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: const Text('移除'),
              leading: const Icon(Icons.delete),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
