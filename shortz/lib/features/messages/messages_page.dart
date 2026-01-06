import 'package:flutter/material.dart';
import 'thread_page.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final threads = List.generate(12, (i) => ('user_$i', 'Hey from user_$i'));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Messages')),
        body: ListView.separated(
          itemCount: threads.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final (user, last) = threads[i];
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(user),
              subtitle: Text(last, maxLines: 1, overflow: TextOverflow.ellipsis),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ThreadPage(peerUsername: user)),
              ),
            );
          },
        ),
      ),
    );
  }
}
