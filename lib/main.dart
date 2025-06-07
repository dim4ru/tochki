import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tochki/feature/navigation/controller.dart';
import 'package:tochki/feature/map/view.dart';
import 'package:tochki/feature/navigation/view.dart';
import 'package:ui_kit/ui_kit.dart';

import 'feature/marker/controller.dart';
import 'feature/navigation/model.dart';
import 'feature/place/edits_history/place_edits_list_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/env_file/.env");
  String supabaseUrl = dotenv.env['SUPABASE_URL']!;
  String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  Get.put(PermanentMarkerController());
  Get.put(PlaceEditsController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tochki',
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          lightColorPalette, // Подключаем цветовую палитру из ui_kit
          defaultTypography, // Подключаем типографику из ui_kit
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          darkColorPalette, // Темная палитра из ui_kit
          defaultTypography,
        ],
      ),
      themeMode: ThemeMode.system, // Поддержка светлой/тёмной темы
      // getPages: TPages.routes,
      home: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());

    final appBarTabs = [
      AppBarItem(item: AppBarTab(title: 'Точки', onTap: () => controller.changeTab(0))),
      AppBarItem(item: AppBarTab(title: 'Рецензии', onTap: () => controller.changeTab(1))),
      AppBarItem(item: AppBarTab(title: 'Временное', onTap: () => controller.changeTab(2))),
      AppBarItem(item: AppBarTab(title: 'Профиль', onTap: () => controller.changeTab(3))),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: kToolbarHeight - 10,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: appBarTabs.length,
            itemBuilder: (context, index) {
              return appBarTabs[index];
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 24,);
            },
          ),
        ),
      ),
      body: Obx(() {
        return IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            MapView(),
            Center(child: Text('Рецензии')),
            Center(child: Text('Временное')),
            Center(child: Text('Профиль')),
          ],
        );
      }),
    );
  }
}
