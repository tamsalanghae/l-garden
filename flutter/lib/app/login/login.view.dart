import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starter_kit/app/app.module.dart';
import 'package:starter_kit/app/components/common-button/common-button.component.dart';
import 'package:starter_kit/app/components/text-field/text-field.component.dart';
import 'package:starter_kit/app/login/login.cubit.dart';
import 'package:starter_kit/config/application.dart';
import 'package:starter_kit/config/config_screen.dart';
import 'package:starter_kit/resources/default.i18n.dart';
import 'package:starter_kit/services/authentication/authentication.service.dart';
import 'package:starter_kit/themes/style.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  LoginCubit _cubit = LoginCubit(AuthenticationService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        margin: EdgeInsets.all(15),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Spacer(flex: 2),
            Align(
              child: Text("KTDG".i18n, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600, color: AppColor.accentColor)),
              alignment: Alignment.center,
            ),
            SizedBox(
              child: buildLoginWidget(),
              width: SizeConfig.safeBlockHorizontal * 80,
            ),
            Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  child: Text("Forgot login user name".i18n, style: TextStyle(fontSize: 14, color: Color(0xFF0294E7), fontWeight: FontWeight.w500)),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text("Forgot password".i18n, style: TextStyle(fontSize: 14, color: Color(0xFF0294E7), fontWeight: FontWeight.w500)),
                  onPressed: () => Modular.to.pushNamed(AppModule.forgotPassword),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginWidget() {
    return FormBuilder(
      key: _fbKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: SizeConfig.safeBlockVertical * 2),
          TextFieldView(
            name: "user_name",
            hintText: "User name or email".i18n,
            validator: FormBuilderValidators.required(context),
            initialValue: Application.sharePreference.getStringList("credentialData")?.elementAt(0),
            type: 'text_field',
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          TextFieldView(
            name: 'password',
            hintText: "Password".i18n,
            initialValue: Application.sharePreference.getStringList("credentialData")?.elementAt(1),
            validator: FormBuilderValidators.required(context),
            type: 'password',
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          ButtonTheme(
            minWidth: SizeConfig.safeBlockHorizontal * 55,
            height: 45.0,
            child: BlocBuilder<LoginCubit, LoginState>(
              bloc: _cubit,
              builder: (context, state) {
                return AbsorbPointer(
                  absorbing: state is Signing,
                  child: CommonButton(
                      onPressed: () async {
                        _fbKey.currentState!.saveAndValidate()
                            ? await _cubit.login(_fbKey.currentState!.value)
                                ? Modular.to.pushReplacementNamed(AppModule.home)
                                : Application.toast.showToastNotification("Wrong User Name or Password".i18n)
                            : Application.toast.showToastNotification("Invalid Value".i18n);
                      },
                      backgroundColor: AppColor.accentColor,
                      child: Container(
                        alignment: Alignment.center,
                        width: SizeConfig.safeBlockHorizontal * 80,
                        child: state is! Signing
                            ? Text("Login".i18n.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500))
                            : Theme(
                                data: ThemeData(cupertinoOverrideTheme: CupertinoThemeData(brightness: Brightness.dark)),
                                child: CupertinoActivityIndicator(),
                              ),
                      )),
                );
              },
            ),
          ),
          // Stack(
          //   alignment: Alignment.topCenter,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.only(top: 10),
          //       width: 200,
          //       child: FormBuilderCheckbox(
          //         name: "checkBox",
          //         initialValue: Application.sharePreference.hasKey("credentialData"),
          //         title: Text("Save credential".i18n),
          //         controlAffinity: ListTileControlAffinity.leading,
          //         onChanged: _cubit.changeCheckbox,
          //         decoration: InputDecoration(border: InputBorder.none),
          //       ),
          //     ),
          //     Align(
          //       child: GestureDetector(
          //         child: Container(
          //           margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical),
          //           child: Text("Forgot Password".i18n,
          //               style: const TextStyle(
          //                 fontWeight: FontWeight.w500,
          //                 fontSize: 14,
          //                 color: Color(0xFF818181),
          //                 fontStyle: FontStyle.italic,
          //               )),
          //         ),
          //         onTap: () => Modular.to.pushNamed(AppModule.forgotPassword),
          //       ),
          //       alignment: Alignment.topRight,
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
