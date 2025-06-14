import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final suggestRegistration = false.obs;

  String? username;
  Session? session;
  User? user;

  get guestMode => user == null;

  @override
  onInit() {
    super.onInit();
    if (!guestMode) {
      username = user!.userMetadata?['displayName'];
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final res = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,

      );
      if (res.user != null) {
        session = res.session;
        user = res.user;
        Get.offAllNamed('/home');
        print('Started session: ${res.session}, userid: ${res.user?.id}, displayname: ${res.user?.userMetadata?['displayName']}');
      }
    } on AuthException catch (e) {
      Get.snackbar('Ошибка входа', e.message, snackPosition: SnackPosition.BOTTOM);
      suggestRegistration.value = true;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      final res = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'displayName': usernameController.value.text},
      );
      await Supabase.instance.client
          .from('users').insert({'id': res.user?.id, 'username': usernameController.value.text});
      if (res.user != null) {
        await login(email, password);
      }
    } on AuthException catch (e) {
      Get.snackbar('Ошибка регистрации', e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<String?> getUsernameById(String id) async {
    try {
      final response = await Supabase.instance.client
          .from('users')
          .select('username')
          .eq('id', id)
          .single();
      return (response)['username'] as String?;
    } on PostgrestException catch (e) {
      Get.snackbar('Ошибка при получении имени пользователя', e.message, snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }
}
