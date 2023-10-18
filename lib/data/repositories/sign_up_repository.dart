import 'package:cakeke/data/models/sign_up/service_purpose.dart';
import 'package:cakeke/data/models/sign_up/user.dart';
import 'package:cakeke/data/providers/sign_up_provider.dart';

class SignUpRepository {
  final SignUpProvider signUpProvider;

  SignUpRepository({required this.signUpProvider});

  Future<bool> signUp({
    required userId,
    required age,
    required sex,
    required password,
    required image,
    required checkPassword,
    required servicePurpose,
  }) async {
    return await signUpProvider.signUp({
      "userId": userId,
      "age": age,
      "sex": sex,
      "password": password,
      "image": image,
      "checkPassword": checkPassword,
      "servicePurpose": servicePurpose,
    });
  }

  Future<List<ServicePurpose>> getServicePurpose() async {
    return await signUpProvider.getServicePurpose();
  }

  Future<bool> checkIdDuplicate(String id) async {
    return await signUpProvider.checkIdDuplicate(id);
  }
}
