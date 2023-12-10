import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class StoriesPage extends StatefulWidget {
  StoriesPage({super.key});

  final List<String> photoUrls = [
    'https://media.istockphoto.com/id/1036131954/photo/maintaining-stock-levels-with-mobile-apps.jpg?s=2048x2048&w=is&k=20&c=X0Xj_zyheogJewOTbVJBu7gRsZSRsA7x12gb5BOjFoY=',
    'https://media.istockphoto.com/id/660133182/photo/getting-to-know-their-medication-and-the-sales-of-it.jpg?s=2048x2048&w=is&k=20&c=apjORIjTZcEFG-ZAubOOweWocpMaUxMPU5Pm28D0cMM=',
    'https://media.istockphoto.com/id/1354045739/photo/vertical-portrait-of-confident-smiling-male-caucasian-druggist-pharmacist-using-digital.jpg?s=2048x2048&w=is&k=20&c=c2IKUzuaJMVVRDGArOAklkM4Gmos9--q2bnEwwhOvPc=',
    'https://media.istockphoto.com/id/1464802793/photo/happy-female-pharmacist-using-laptop-while-working-in-pharmacy-and-looking-at-camera.jpg?s=2048x2048&w=is&k=20&c=xvGy7HmwbEKdYVUTEB4-_lkYpE2UG75a0tR-d6FpAI4='
  ];

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        itemCount: widget.photoUrls.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(widget.photoUrls[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 4,
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        backgroundDecoration: const BoxDecoration(
          color: Colors.white,
        ),
        pageController: _pageController,
        scaleStateChangedCallback: (scaleState) {
          if (scaleState == PhotoViewScaleState.originalSize) {
            _pageController.animateToPage(
              _pageController.page!.round(),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutExpo,
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
