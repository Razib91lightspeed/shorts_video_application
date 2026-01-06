class VideoPost {
  final String id;
  final String creatorUid;
  final String creatorUsername;
  final String videoUrl;
  final String? thumbnailUrl;
  final String caption;
  final int durationSeconds;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final DateTime createdAt;

  const VideoPost({
    required this.id,
    required this.creatorUid,
    required this.creatorUsername,
    required this.videoUrl,
    this.thumbnailUrl,
    required this.caption,
    required this.durationSeconds,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.sharesCount = 0,
    required this.createdAt,
  });
}
