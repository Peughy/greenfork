import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenfork/src/commons/common_buttons_widget.dart';
import 'package:greenfork/src/constants/app_color.dart';
import 'package:greenfork/src/constants/app_size.dart';
import 'package:greenfork/src/constants/app_style.dart';
import 'package:greenfork/src/notifiers/app_notifier.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  CommonButtonsWidget commonButtonsWidget = CommonButtonsWidget();

  bool isLoading = false;
  bool isPasswordShow = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return Scaffold(
          backgroundColor: isDarkMode ? AppColor.bgDark : AppColor.bgWhite,
          appBar: AppBar(
            backgroundColor: isDarkMode ? AppColor.bgDark : AppColor.bgWhite,
            surfaceTintColor: Colors.transparent,
            leading: commonButtonsWidget.commonBackButton(context),
          ),
          body: Padding(
            padding: EdgeInsets.all(AppSize.pad),
            child: ListView(
              children: [
                Text(
                  "Mot de passe oublié.",
                  style: AppStyle(
                    fontSize: 42,
                    color: AppColor.primary[900],
                    fontWeight: FontWeight.bold,
                  ).titleTextStyle(),
                ),
                Text(
                  "Vous avez oublié votre mot de passe ? Pas de problème. Renseigner votre adresse mail",
                  style: AppStyle(
                    fontSize: 20,
                    color: isDarkMode ? AppColor.white : AppColor.black,
                  ).simpleTextStyle(),
                ),
                SizedBox(height: AppSize.pad * 2),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSize.pad,
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez renseigner votre adresse mail";
                          }

                          if (!value.contains('@') || !value.contains('.')) {
                            return "L'adresse mail renseigner n'est pas valide";
                          }

                          return null;
                        },
                        style: AppStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColor.white : AppColor.black,
                        ).simpleTextStyle(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(AppSize.btnPad),
                          hintText: "Adresse mail",
                          hintStyle: AppStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode ? AppColor.white : AppColor.black,
                          ).simpleTextStyle(),
                          prefixIcon: Icon(
                            FontAwesomeIcons.solidEnvelope,
                            size: 26,
                            color: isDarkMode ? AppColor.white : AppColor.black,
                          ),
                          errorStyle: AppStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColor.error,
                          ).simpleTextStyle(),
                          border: CustomBorderStyle(
                            color: isDarkMode ? AppColor.white : AppColor.black,
                          ).borderStyle(),
                          enabledBorder: CustomBorderStyle(
                            color: isDarkMode ? AppColor.white : AppColor.black,
                          ).borderStyle(),
                          focusedBorder: CustomBorderStyle(
                            color: isDarkMode ? AppColor.white : AppColor.black,
                          ).borderStyle(),
                          errorBorder: CustomBorderStyle(
                            color: AppColor.error,
                          ).borderStyle(),
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(AppSize.btnPad),
                            backgroundColor: AppColor.primary[900],
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(
                                AppSize.radius,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                            }
                          },
                          child: isLoading
                              ? Transform.scale(
                                  scale: 0.65,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: AppColor.white,
                                  ),
                                )
                              : Text(
                                  "Recupérer".toUpperCase(),
                                  style: AppStyle(
                                    fontSize: 20,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w500,
                                  ).simpleTextStyle(),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
