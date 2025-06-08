import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../shared/ui_kit/spacers.dart';
import '../../shared/ui_kit/typography.dart';
import 'controller.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSpacers.spacing9),
            child: SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.16),
                  Text('Добро пожаловать в Tochki!',
                      style: TTypography.headline2),
                  // Text('Требуется авторизация', style: TTypography.headline2),
                  SizedBox(height: TSpacers.spacing9*1.5),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: TSpacers.spacing3),
                      Text('Email', style: TTypography.caption2),
                      SizedBox(height: TSpacers.spacing3),
                      UiTextField.standard(
                          controller: controller.emailController.value),
                      SizedBox(height: TSpacers.spacing4),
                      Text('Пароль', style: TTypography.caption2),
                      SizedBox(height: TSpacers.spacing3),
                      UiTextField.standard(
                        controller: controller.passwordController.value,
                        obscureText: true,
                      ),
                      SizedBox(height: TSpacers.spacing4),
                      _submitButtons(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitButtons() {
    return Obx(() => AnimatedSwitcher(
          switchInCurve: Curves.easeOutCirc,
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: !controller.suggestRegistration.value
              ? Row(
                  key: const ValueKey(false),
                  children: [
                    Spacer(),
                    UiButton.filledPrimary(
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.arrow_forward_outlined),
                      onPressed: () {
                        controller.login(controller.emailController.value.text,
                            controller.passwordController.value.text);
                      },
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  key: const ValueKey(true),
                  children: [
                    Text('Юзернейм для регистрации', style: TTypography.caption2),
                    SizedBox(height: TSpacers.spacing3),
                    UiTextField.standard(
                        controller: controller.usernameController.value),
                    SizedBox(height: TSpacers.spacing4),
                    Row(
                      children: [
                        Expanded(
                          child: UiButton.filledPrimary(
                            iconAlignment: IconAlignment.end,
                            icon: Icon(Icons.app_registration_rounded),
                            label: Text('Регистрация',
                                style: TTypography.body4,
                                textAlign: TextAlign.center),
                            onPressed: () {
                              controller.register(
                                  controller.emailController.value.text,
                                  controller.passwordController.value.text);
                            },
                          ),
                        ),
                        SizedBox(width: TSpacers.spacing3),
                        Expanded(
                          child: UiButton.filledPrimary(
                            iconAlignment: IconAlignment.end,
                            icon: Icon(Icons.login),
                            label: Text('Вход',
                                style: TTypography.body4,
                                textAlign: TextAlign.center),
                            onPressed: () {
                              controller.login(
                                  controller.emailController.value.text,
                                  controller.passwordController.value.text);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: TSpacers.spacing3),
                    Text(
                      'Если вы еще не зарегистрированы, можете сделать это сейчас, указав также имя пользователя или попробывать войти снова',
                      style: TTypography.caption2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ));
  }
}
