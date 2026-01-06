import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Create')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Upload / Record (MVP stub)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              const Text(
                '''Next steps:
                • Pick video from gallery / camera
                • Enforce <= 60s
                • Upload to Firebase Storage
                • Save metadata in Firestore
                • (Optional) generate thumbnail in Cloud Functions''',
              ),

              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('TODO: implement video picker + upload')),
                  );
                },
                icon: const Icon(Icons.file_upload),
                label: const Text('Pick a video'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
