import 'package:cakeke/data/models/user/user.dart';
import 'package:cakeke/data/providers/user_provider.dart';

class UserRepository {
  final UserProvider userProvider;

  UserRepository({required this.userProvider});

  Future<User> getUser() async {
    return await userProvider.getUser();
  }
}
