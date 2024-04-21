import 'package:go_routing_example/UserModel/userModel.dart';

class UserRepository {
  int currentIndex = 0;
  List<User> users;

  UserRepository({required this.users});

  User getNextUser() {
    currentIndex = (currentIndex + 1) % users.length;
    return users[currentIndex];
  }
}
