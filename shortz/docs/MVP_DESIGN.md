# Shortz MVP Design (Product + Architecture + UX)

## Product decisions & assumptions
- **Max video length:** 60 seconds
- **MVP goal:** ship fast for 50–100 users, collect feedback, iterate weekly
- **Content-first UI:** full-screen vertical feed as the main surface
- **Dark mode default:** reduces glare and keeps focus on media
- **Minimal social graph:** follow/unfollow + basic profile
- **Messages:** 1-to-1 text only (no media, no calls) for MVP
- **Moderation:** light-touch for MVP; add stronger tools later (report, block, etc.)

## Recommended backend: Firebase
Firebase is the practical choice for the MVP because it bundles **Auth (phone OTP/email), Firestore, Storage, and serverless functions** with strong Flutter support and a generous free tier for small apps. citeturn0search6turn0search0  
Phone OTP can incur **SMS verification costs** beyond free quotas, but for ~50 users it typically remains low; still, monitor usage. citeturn0search12

## High-level system architecture
- **Flutter app**
  - UI (feeds, profile, create, messages)
  - Client-side caching (later)
- **Firebase Authentication**
  - Phone OTP signup/login
  - Email login after adding email
- **Firestore**
  - Users, videos, likes, comments, follows, chats
- **Firebase Storage**
  - Video files + thumbnails
- **Cloud Functions (later)**
  - Thumbnail generation
  - Video processing hook
  - Notifications, moderation rules

## Database schema (Firestore collections)
> Firestore is document-based; below is a pragmatic MVP mapping.

### `users/{uid}`
```json
{
  "uid": "string",
  "username": "string (unique)",
  "displayName": "string",
  "photoUrl": "string|null",
  "email": "string|null",
  "phoneNumber": "string|null",
  "followersCount": 0,
  "followingCount": 0,
  "createdAt": "timestamp"
}
```

### `videos/{videoId}`
```json
{
  "videoId": "string",
  "creatorUid": "string",
  "creatorUsername": "string",
  "videoUrl": "string",
  "thumbnailUrl": "string|null",
  "caption": "string",
  "durationSeconds": 0,
  "likesCount": 0,
  "commentsCount": 0,
  "sharesCount": 0,
  "createdAt": "timestamp",
  "visibility": "public|private"
}
```

### `videos/{videoId}/comments/{commentId}`
```json
{
  "commentId": "string",
  "uid": "string",
  "username": "string",
  "text": "string",
  "createdAt": "timestamp"
}
```

### `videos/{videoId}/likes/{uid}`
```json
{ "createdAt": "timestamp" }
```

### `follows/{uid}/following/{targetUid}`
```json
{ "createdAt": "timestamp" }
```

### `chats/{chatId}`
```json
{
  "chatId": "string",
  "memberUids": ["uidA", "uidB"],
  "lastMessage": "string",
  "updatedAt": "timestamp"
}
```

### `chats/{chatId}/messages/{messageId}`
```json
{
  "messageId": "string",
  "senderUid": "string",
  "text": "string",
  "createdAt": "timestamp"
}
```

## API endpoint list (conceptual)
Because Firebase SDK talks directly to services, “endpoints” are mostly SDK calls.
If you later add a REST backend, these map cleanly:

- `POST /auth/phone/start`
- `POST /auth/phone/verify`
- `POST /auth/email/login`
- `POST /auth/email/signup`
- `GET /feed/global?cursor=...`
- `GET /feed/following?cursor=...`
- `POST /videos` (create metadata)
- `POST /videos/{id}/like`
- `POST /videos/{id}/comment`
- `POST /users/{uid}/follow`
- `GET /search/users?q=...`
- `GET /chats`
- `POST /chats/{id}/messages`

## UX flow per screen (text wireframes)

### Onboarding / Auth
1. Phone number entry → OTP → auto-login
2. Create username + display name (required)
3. Optional: add email later in Edit Profile

### Home (For You)
- Vertical swipe feed
- Right-side action rail: like, comment, share
- Tap creator → profile
- Tap comment → bottom sheet (later)

### Friends (Following)
- Same feed UI, but query is “following”

### Create (+)
- Pick video (gallery/camera)
- Trim to 60s if needed (later)
- Upload → progress → post

### Messages
- Thread list
- Thread screen: bubbles + input

### Profile
- Avatar, display name, @username
- Stats: followers/following/likes
- Grid of posted videos
- Edit Profile

## Risks & future improvements
- **Phone OTP cost/limits:** monitor SMS verification costs as users grow. citeturn0search12
- **Video processing:** raw uploads can be big; add compression/transcoding and thumbnails
- **Content moderation:** add report/block, and basic automated checks
- **Scalability roadmap**
  1. Add Cloud Functions for thumbnails + metadata validation
  2. Add search indexing (Algolia/Meilisearch) if Firestore queries become limiting
  3. Consider dedicated backend (NestJS/Go) for custom feeds/ranking
  4. Add CDN + adaptive streaming (HLS/DASH) when traffic grows

