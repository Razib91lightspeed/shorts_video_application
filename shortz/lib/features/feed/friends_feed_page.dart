import 'package:flutter/material.dart';
import '../../services/feed_service.dart';
import '../../widgets/video_feed_item.dart';

class FriendsFeedPage extends StatelessWidget {
  const FriendsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // MVP: reuse mock feed as "following"
    final feed = FeedService().getMockGlobalFeed().where((p) => int.parse(p.id.split('_').last) % 2 == 0).toList();

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: feed.length,
      itemBuilder: (context, index) {
        return VideoFeedItem(post: feed[index], headerLabel: 'Following');
      },
    );
  }
}
