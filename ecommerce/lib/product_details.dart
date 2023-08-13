import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/back_flip_card.dart';
import 'package:ecommerce/carousel_indicator.dart';
import 'package:ecommerce/front_flip_card.dart';
import 'package:ecommerce/list_model.dart';
import 'package:ecommerce/shopping_bag_clipper.dart';
import 'package:ecommerce/shose_info.dart';
import 'package:ecommerce/size_qty.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:motion_blur/motion_blur.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with TickerProviderStateMixin {
  final _gridKey = GlobalKey<AnimatedGridState>();
  int _current = 2;
  bool _shoseMotionBlur = true;

  late final CarouselController _carouselController;

  late final FlipCardController _flipCardcontroller;

  final List<Widget> listImage = [
    Image.asset('assets/images/air-force-1-ls.png'),
    Image.asset('assets/images/air-force-1-b.png'),
    Image.asset('assets/images/air-force-1-rs.png'),
  ];

  late ListModel<double> _listSize;

  late AnimationController _sizeQtyController;
  late AnimationController _shoesAppearController;
  late AnimationController _shoesPhaseOneController;
  late AnimationController _shosePhaseTwoController;
  late AnimationController _boxController;
  late AnimationController _bouncingController;
  late AnimationController _checkoutPhaseOneController;
  late AnimationController _checkoutPhaseTwoController;

  final _sizeQtyRotateTween = Tween<double>(
    begin: 0,
    end: -1,
  ).chain(CurveTween(curve: Curves.decelerate));
  final _sizeQtyOffsetTween = Tween<double>(
    begin: 0,
    end: -80,
  ).chain(CurveTween(curve: Curves.easeIn));

  final _shoesAppearOffsetTween = Tween<double>(
    begin: -200,
    end: 0,
  ).chain(CurveTween(curve: Curves.easeOut));
  final _shoesAppearScaleTween = Tween<double>(
    begin: 0.2,
    end: 1,
  ).chain(CurveTween(curve: Curves.easeOut));
  final _shoesAppearFadeTween = Tween<double>(
    begin: 0,
    end: 1,
  ).chain(CurveTween(curve: Curves.easeOut));

  final _shoesRotatePhaseOneTween = Tween<double>(
    begin: 0,
    end: -8,
  ).chain(CurveTween(curve: Curves.easeOutSine));
  final _shoseOffsetPhaseOneTween = Tween<double>(
    begin: 0,
    end: -100,
  ).chain(CurveTween(curve: Curves.easeOut));

  final _shoesRotatePhaseTwoTween = Tween<double>(
    begin: 0,
    end: 16,
  ).chain(CurveTween(curve: Curves.easeOutSine));
  final _shoesScalePhaseTwoTween = Tween<double>(
    begin: 1,
    end: 0.02,
  ).chain(CurveTween(curve: Curves.easeOutSine));
  final _shoseOffsetPhaseTwoTween = Tween<double>(
    begin: 0,
    end: 300,
  ).chain(CurveTween(curve: Curves.easeOutSine));

  final _boxOffsetTween = Tween<double>(
    begin: 380,
    end: 100,
  ).chain(CurveTween(curve: Curves.easeOut));
  final _boxScaleTween = Tween<double>(
    begin: 0.5,
    end: 0.9,
  ).chain(CurveTween(curve: Curves.easeOut));

  final _checkoutScalePhaseOneTween = Tween<double>(
    begin: 0,
    end: 1,
  ).chain(CurveTween(curve: Curves.easeOut));
  final _checkoutFadePhaseOneTween = Tween<double>(
    begin: 0,
    end: 1,
  ).chain(CurveTween(curve: Curves.easeOut));

  final _checkoutOffsetPhaseTwoTween = Tween<double>(
    begin: 0,
    end: 120,
  ).chain(CurveTween(curve: Curves.easeOut));

  final _bouncingTween = Tween<double>(
    begin: 0,
    end: 20,
  ).chain(CurveTween(curve: Curves.linearToEaseOut));

  double get _sizeQtyRotateX => _sizeQtyRotateTween.evaluate(_sizeQtyController);
  double get _sizeQtyOffset => _sizeQtyOffsetTween.evaluate(_sizeQtyController);

  double get _shoesAppearOffset => _shoesAppearOffsetTween.evaluate(_shoesAppearController);
  double get _shoesAppearScale => _shoesAppearScaleTween.evaluate(_shoesAppearController);

  double get _shoseRotatePhaseOne => _shoesRotatePhaseOneTween.evaluate(_shoesPhaseOneController);
  double get _shoseOffsetPhaseOne => _shoseOffsetPhaseOneTween.evaluate(_shoesPhaseOneController);

  double get _shoseRotatePhaseTwo => _shoesRotatePhaseTwoTween.evaluate(_shosePhaseTwoController);
  double get _shoseScalePhaseTwo => _shoesScalePhaseTwoTween.evaluate(_shosePhaseTwoController);
  double get _shoseOffsetPhaseTwo => _shoseOffsetPhaseTwoTween.evaluate(_shosePhaseTwoController);

  double get _boxOffset => _boxOffsetTween.evaluate(_boxController);
  double get _boxScale => _boxScaleTween.evaluate(_boxController);

  double get _checkoutScalePhaseOne {
    return _checkoutScalePhaseOneTween.evaluate(_checkoutPhaseOneController);
  }

  double get _checkoutPhaseTwoOffset {
    return _checkoutOffsetPhaseTwoTween.evaluate(_checkoutPhaseTwoController);
  }

  double get _bouncing => _bouncingTween.evaluate(_bouncingController);

  Future<void> forwardAnimation() async {
    _sizeQtyController.forward();
    _boxController.forward();
    await _shoesPhaseOneController.forward();
    _shosePhaseTwoController.forward();
    await Future.delayed(const Duration(milliseconds: 250));
    await _bouncingController.forward();
    _flipCardcontroller.toggleCard();
    _bouncingController.reverse();
    _checkoutPhaseOneController.forward();
    await Future.delayed(const Duration(milliseconds: 100));

    final sizes = List.generate(15, (index) => index * 0.5 + 6);
    for (var i = 0; i < sizes.length; i++) {
      _listSize.insert(i, sizes[i]);
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  Future<void> reverseAnimation() async {
    setState(() => _shoseMotionBlur = false);
    _checkoutPhaseOneController.reverse();
    Future.delayed(
      Duration.zero,
      () => _boxController.reverse(),
    );
    _checkoutPhaseTwoController.forward().then((_) {
      _checkoutPhaseTwoController.reset();
    });
    _sizeQtyController.reverse();

    _shoesPhaseOneController.reverse();
    await Future.delayed(const Duration(milliseconds: 200));
    _shosePhaseTwoController.reset();
    _shoesAppearController.reset();

    await _shoesAppearController.forward();
    await Future.delayed(
      const Duration(milliseconds: 50),
      () => setState(() => _shoseMotionBlur = true),
    );
  }

  @override
  void initState() {
    super.initState();

    _listSize = ListModel(
      listKey: _gridKey,
      initialItems: [],
    );

    _sizeQtyController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _sizeQtyController.addListener(() => setState(() {}));

    _shoesAppearController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward(from: 500);
    _shoesAppearController.addListener(() => setState(() {}));

    _shoesPhaseOneController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
      reverseDuration: const Duration(milliseconds: 600),
    );
    _shoesPhaseOneController.addListener(() {});

    _shosePhaseTwoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shosePhaseTwoController.addListener(() => setState(() {}));

    _boxController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
      reverseDuration: const Duration(milliseconds: 600),
    );
    _boxController.addListener(() => setState(() {}));

    _bouncingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
    );
    _bouncingController.addListener(() => setState(() {}));

    _checkoutPhaseOneController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _checkoutPhaseOneController.addListener(() => setState(() {}));

    _checkoutPhaseTwoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 920),
    );
    _checkoutPhaseTwoController.addListener(() => setState(() {}));

    _flipCardcontroller = FlipCardController();

    _carouselController = CarouselController();
  }

  @override
  void dispose() {
    _sizeQtyController.dispose();
    _shoesAppearController.dispose();
    _shoesPhaseOneController.dispose();
    _shosePhaseTwoController.dispose();
    _boxController.dispose();
    _bouncingController.dispose();
    _checkoutPhaseOneController.dispose();
    _checkoutPhaseTwoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Transform.translate(
            offset: Offset(0, _bouncing),
            child: Transform.scale(
              scale: _boxScale,
              child: Transform.translate(
                offset: Offset(0, _boxOffset),
                child: Image.asset('assets/images/shopping-bag.png'),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizeQty(
                  sizeQtyOffset: _sizeQtyOffset,
                  sizeQtyRotateX: _sizeQtyRotateX,
                  forwardAnimation: forwardAnimation,
                ),
                const ShoseInfo(),
              ],
            ),
            Transform.translate(
              offset: Offset(0, _shoseOffsetPhaseOne),
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    CarouselIndicator(
                      carouselController: _carouselController,
                      currentImage: _current,
                      listImage: listImage,
                    ),
                    ClipPath(
                      clipper: ShoppingBagClipper(context),
                      child: Transform.translate(
                        offset: Offset(0, _shoseOffsetPhaseTwo),
                        child: Transform.scale(
                          scale: _shoseScalePhaseTwo,
                          child: Transform.rotate(
                            angle: _shoseRotatePhaseTwo * math.pi / 180,
                            child: Transform.rotate(
                              angle: _shoseRotatePhaseOne * math.pi / 180,
                              child: FadeTransition(
                                opacity: _shoesAppearFadeTween.animate(_shoesAppearController),
                                child: Transform.translate(
                                  offset: Offset(0, _shoesAppearOffset),
                                  child: Transform.scale(
                                    scale: _shoesAppearScale,
                                    child: MotionBlur(
                                      intensity: _shoseMotionBlur ? 1.5 : 0,
                                      child: CarouselSlider(
                                        items: listImage,
                                        carouselController: _carouselController,
                                        options: CarouselOptions(
                                          reverse: true,
                                          initialPage: listImage.length - 1,
                                          enlargeFactor: 0.6,
                                          aspectRatio: 12 / 9,
                                          enlargeCenterPage: true,
                                          enableInfiniteScroll: true,
                                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                                          onPageChanged: (index, reason) {
                                            setState(() => _current = index);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 75,
          left: 0,
          right: 0,
          child: FadeTransition(
            opacity: _checkoutFadePhaseOneTween.animate(_checkoutPhaseOneController),
            child: Transform.translate(
              offset: Offset(0, _checkoutPhaseTwoOffset),
              child: Transform.scale(
                scale: _checkoutScalePhaseOne,
                alignment: Alignment.bottomCenter,
                child: FlipCard(
                  speed: 370,
                  flipOnTouch: false,
                  side: CardSide.BACK,
                  controller: _flipCardcontroller,
                  direction: FlipDirection.HORIZONTAL,
                  front: FrontFlipCard(
                    gridKey: _gridKey,
                    bouncingController: _bouncingController,
                    flipCardcontroller: _flipCardcontroller,
                    listSize: _listSize,
                  ),
                  back: BackFlipCard(onTap: reverseAnimation),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
