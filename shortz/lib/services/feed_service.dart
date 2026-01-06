import '../models/video_post.dart';

/// For MVP UI: returns mock videos.
/// Replace with Firestore queries + pagination later.
class FeedService {
  List<VideoPost> getMockGlobalFeed() {
    return List.generate(12, (i) {
      return VideoPost(
        id: 'mock_$i',
        creatorUid: 'u$i',
        creatorUsername: 'creator_$i',
        videoUrl: 'https://example.com/video_$i.mp4',
        caption: 'Mock video #$i • Replace with real data',
        durationSeconds: 18 + (i % 30),
        likesCount: 1000 * (i + 1),
        commentsCount: 25 * (i + 1),
        sharesCount: 10 * (i + 1),
        createdAt: DateTime.now().subtract(Duration(hours: i * 5)),
      );
    });
  }
}
