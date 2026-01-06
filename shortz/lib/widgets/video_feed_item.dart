import 'package:flutter/material.dart';
import '../models/video_post.dart';
import '../core/utils/formatters.dart';

class VideoFeedItem extends StatelessWidget {
  final VideoPost post;
  final String? headerLabel;

  const VideoFeedItem({super.key, required this.post, this.headerLabel});

  @override
  Widget build(BuildContext context) {
    // MVP: no actual video playback yet (use `video_player` later).
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.black,
          child: const Center(
            child: Icon(Icons.play_circle_outline, size: 84, color: Colors.white24),
          ),
        ),

        // Top label
        Positioned(
          top: 18,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(headerLabel ?? 'For You', style: const TextStyle(fontWeight: FontWeight.w600)),
              const Icon(Icons.search),
            ],
          ),
        ),

        // Right actions
        Positioned(
          right: 12,
          bottom: 120,
          child: Column(
            children: [
              const CircleAvatar(child: Icon(Icons.person)),
              const SizedBox(height: 14),
              _Action(icon: Icons.favorite, label: Formatters.compactInt(post.likesCount)),
              _Action(icon: Icons.chat_bubble, label: Formatters.compactInt(post.commentsCount)),
              _Action(icon: Icons.share, label: Formatters.compactInt(post.sharesCount)),
            ],
          ),
        ),

        // Caption
        Positioned(
          left: 16,
          right: 90,
          bottom: 34,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('@${post.creatorUsername}', style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              Text(post.caption, maxLines: 3, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              Text('⏱️ ${post.durationSeconds}s', style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ],
    );
  }
}

class _Action extends StatelessWidget {
  final IconData icon;
  final String label;

  const _Action({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
