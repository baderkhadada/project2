import 'package:bader/models/token.dart';
import 'package:bader/models/user.dart';
import 'package:bader/services/client.dart';
import 'package:dio/dio.dart';

class AuthService {
  Future<String> signup({required User user}) async {
    try {
      if (user.username.isNotEmpty && user.password.isNotEmpty) {
        final Response response =
            await ApiClient.post("/signup", data: user.toJson());
        print(response.data);
        Token tokenModle = Token.fromJson(response.data);
        return tokenModle.token.toString();
      }
      return "";
    } catch (e) {
      throw e.toString();
    }
  }

  Future signin({required User user}) async {
    try {
      final Response response =
          await ApiClient.post("/signin", data: user.toJson());
      Token tokenModel = Token.fromJson(response.data);
      return tokenModel.token;
    } catch (e) {
      throw e.toString();
    }
  }
}
