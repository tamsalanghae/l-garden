import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_kit/config/application.dart';
import 'package:starter_kit/services/authentication/authentication.service.dart';
import 'package:starter_kit/utils/exception.dart';

part 'login.state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationService _authenticationService;

  LoginCubit(this._authenticationService) : super(LoginInitial());

  bool rememberPassword = Application.sharePreference.hasKey("credentialData") ? true : false;

  void changeCheckbox(val) => rememberPassword = val as bool;

  Future<bool> login(Map<String, dynamic> data) async {
    rememberPassword
        ? Application.sharePreference.putStringList("credentialData", data.values.map((e) => e.toString()).toList())
        : Application.sharePreference.remove("credentialData");
    var params = {
      "userName": data["user_name"],
      "password": data["password"],
    };
    try {
      // emit(Signing());
      // LoginData result = await _authenticationService.login(params);
      // Application.sharePreference..putString("authToken", "${result.authToken}")..putString("userId", "${result.user?.id}");
      // emit(Signed());
      return true;
    } on NetworkException catch (e) {
      var _message = e.message!["message"] != null ? "${e.message!["message"]}" : "";
      emit(LoginError(_message));
      emit(Signed());
      return false;
    }
  }
}
