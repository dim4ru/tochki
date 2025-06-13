import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tochki/feature/place/widgets/photos_row_controller.dart';
import 'package:tochki/shared/ui_kit/circular_loader.dart';
import 'package:tochki/shared/ui_kit/shimmers.dart';
import 'package:tochki/shared/ui_kit/spacers.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../shared/ui_kit/colors.dart';
import '../../../shared/ui_kit/snackbar.dart';
import '../../authorization/controller.dart';
import 'no_photos_text.dart';

class PhotosRow extends GetView<PhotosController> {
  final int placeId;
  const PhotosRow({
    super.key,
    required this.placeId,
    List<String>? initialUrls,
    this.uploadButton = false,
    this.showAllButton = false,
  }) : imageUrls = initialUrls ?? const [];

  final imageUrls;
  final bool uploadButton;
  final bool showAllButton;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhotosController(placeId: placeId));
    if (controller.uploadedUrls.isEmpty && imageUrls.isNotEmpty) {
      controller.uploadedUrls.assignAll(imageUrls);
    }

    return Column(
      children: [
        const SizedBox(height: TSpacers.spacing2),
        Obx(() {
          final urls = controller.uploadedUrls;
          if (urls.isEmpty) {
            return NoPhotosText(onPressed: ()=> controller.uploadPhoto());
          }
          return SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: urls.length + (uploadButton ? 1 : 0),
              separatorBuilder: (_, __) => const SizedBox(width: TSpacers.spacing2),
              itemBuilder: (context, index) {
                if (uploadButton && index == 0) {
                  return Container(
                    color: TColors.black,
                    width: MediaQuery.sizeOf(context).width * 0.15,
                    child: Center(
                      child: controller.isLoading.value
                          ? SizedBox(width: 40, height: 40, child: TCircularLoader())
                          : IconButton(
                        onPressed: () {
                          Get.find<AuthController>().guestMode
                              ? TSnackbar.show(context, 'Авторизуйтесь чтобы добавить фото')
                              : controller.uploadPhoto();
                        },
                        icon: const Icon(Icons.add_a_photo_outlined, color: TColors.white),
                      ),
                    ),
                  );
                }
                final imgUrl = urls[uploadButton ? index - 1 : index];
                return GestureDetector(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CachedNetworkImage(
                      imageUrl: imgUrl,
                      placeholder: (_, __) => TShimmers.imageShimmer,
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                    onTap: () {
                      FullscreenImageViewer.open(
                          context: context,
                          child: CachedNetworkImage(
                            imageUrl: imgUrl,
                          ));
                    });
              },
            ),
          );
        })
      ],
    );
  }
}
