class UserProfile {
  final String uid;
  final String username; // unique
  final String displayName;
  final String? photoUrl;
  final String? email;
  final String? phoneNumber;

  final int followersCount;
  final int followingCount;

  const UserProfile({
    required this.uid,
    required this.username,
    required this.displayName,
    this.photoUrl,
    this.email,
    this.phoneNumber,
    this.followersCount = 0,
    this.followingCount = 0,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'displayName': displayName,
        'photoUrl': photoUrl,
        'email': email,
        'phoneNumber': phoneNumber,
        'followersCount': followersCount,
        'followingCount': followingCount,
      };

  static UserProfile fromJson(Map<String, dynamic> json) => UserProfile(
        uid: json['uid'] as String,
        username: json['username'] as String,
        displayName: json['displayName'] as String,
        photoUrl: json['photoUrl'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        followersCount: (json['followersCount'] ?? 0) as int,
        followingCount: (json['followingCount'] ?? 0) as int,
      );
}
