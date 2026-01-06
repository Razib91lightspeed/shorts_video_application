import 'package:flutter/material.dart';
import '../../services/feed_service.dart';
import '../../widgets/video_feed_item.dart';

class HomeFeedPage extends StatelessWidget {
  const HomeFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final feed = FeedService().getMockGlobalFeed();

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: feed.length,
      itemBuilder: (context, index) {
        return VideoFeedItem(post: feed[index]);
      },
    );
  }
}
