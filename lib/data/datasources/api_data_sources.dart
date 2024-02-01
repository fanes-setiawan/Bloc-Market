import 'package:blocmarket/data/models/request/login_model.dart';
import 'package:blocmarket/data/models/response/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiDataSources {
  Future<LoginResponseModel> login(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse("https://api.escuelajs.co/api/v1/auth/login"),
      body: loginModel.toMap(),
    );
    print(response.statusCode);

    final result = LoginResponseModel.fromRawJson(response.body);

    return result;
  }

  //save token in shared_preferences
  Future<void> addTokenPrefs(String token) async {
    //get share shared_preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
