import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:damazsle/core/extensions/context_ex.dart';
import 'package:damazsle/shared/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/assets/assets.gen.dart';
import '../core/utils/common.dart';
import 'app_back_button.dart';
import 'app_image_widget.dart';

class ImagesViewScreen extends StatefulWidget {
  final List<String> images;
  final int currentIndex;

  const ImagesViewScreen({
    super.key,
    required this.images,
    required this.currentIndex,
  });

  @override
  State<ImagesViewScreen> createState() => _ImagesViewScreenState();
}

class _ImagesViewScreenState extends State<ImagesViewScreen> {
  bool isShow = true;
  late PageController pageController;

  int currentImage = 0;
  Timer? timer;

  showTimer() {
    if (!isShow) return;
    if (isShow) {
      timer?.cancel();
    }
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (t) {
        setState(() {
          isShow = false;
        });
        timer?.cancel();
        timer = null;
      },
    );
  }

  @override
  void initState() {
    pageController = PageController(
      initialPage: widget.currentIndex,
    );
    currentImage = widget.currentIndex;
    showTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          _buildImages(context),
          Positioned(
            top: 0,
            child: SizedBox(
              height: kToolbarHeight + context.topPadding,
              width: context.sw,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  AppBackButton(
                    iconColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositionedDirectional(
            duration: const Duration(milliseconds: 200),
            start: 15,
            bottom: isShow ? context.bottomPadding : -70,
            height: 60,
            width: context.sw,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: currentImage == i
                            ? AppColors.primary.main
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: AppImageWidget(
                      size: const Size(50, 60),
                      radius: 0,
                      imageUrl: widget.images[i],
                      onTap: () {
                        pageController.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                    ));
              },
              separatorBuilder: (_, __) => const SizedBox(
                width: 5,
              ),
              itemCount: widget.images.length,
            ),
          ),
        ],
      ),
    );
  }

  _buildImages(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShow = !isShow;
        });
        showTimer();
      },
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (i) {
          setState(() {
            currentImage = i;
          });
        },
        itemBuilder: (context, index) {
          return _buildImageView(
            widget.images[index],
          );
        },
        itemCount: widget.images.length,
      ),
    );
  }

  _buildImageView(String url) {
    return PhotoView.customChild(
      maxScale: 1.0,
      minScale: 1.0,
      initialScale: 1.0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: CachedNetworkImage(
          imageUrl: url,
          errorWidget: (_, __, ___) {
            return  Container(
              height: context.sw,
              width: context.sh / 2,
              decoration: BoxDecoration(
                color: AppColors.primary.lighter,
              ),
              child: UnconstrainedBox(
                child: Center(
                  child: Common.defaultSvgImg(
                    svg: Assets.icon.appLogo,
                    iconColor: AppColors.primary.light,
                    boxFit: BoxFit.cover,
                    height: (context.sh / 2) * .3,
                    width: (context.sh / 2) * .3,
                  ),
                ),
              ),
            );
          },
          progressIndicatorBuilder: (_, __, progress) {
            return ShimmerLoading(
              radius: 0,
              size: Size(context.sw, context.sh),
            );
          },
        ),
      ),
    );
  }
}
