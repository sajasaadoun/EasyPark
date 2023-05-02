class ChatUser {
  late final String image;
  final String about;
  final String name;
  final String createdAt;
  final bool isOnline;
  final String id;
  final String lastActive;
  final String email;
  late final String pushToken;

  ChatUser({
    required this.image,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.isOnline,
    required this.id,
    required this.lastActive,
    required this.email,
    required this.pushToken,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      image: json['image'] ?? '',
      about: json['about'] ?? '',
      name: json['name'] ?? '',
      createdAt: json['created_at'] ?? '',
      isOnline: json['is_online'] ?? '',
      id: json['id'] ?? '',
      lastActive: json['last_active'] ?? '',
      email: json['email'] ?? '',
      pushToken: json['push_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'about': about,
      'name': name,
      'created_at': createdAt,
      'is_online': isOnline,
      'id': id,
      'last_active': lastActive,
      'email': email,
      'push_token': pushToken,
    };
  }
}

ChatUser staticUser = ChatUser(
  image: 'https://example.com/profile.png',
  about: 'Hi, I am a static user!',
  name: 'Static User',
  createdAt: '2022-01-01',
  isOnline: true,
  id: '123456',
  lastActive: '2023-04-30',
  email: 'staticuser@example.com',
  pushToken: 'abc123',
);
