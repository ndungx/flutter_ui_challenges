import 'package:ecommerce/list_model.dart';
import 'package:ecommerce/modal_painter.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class FrontFlipCard extends StatefulWidget {
  const FrontFlipCard({
    super.key,
    required this.gridKey,
    required this.bouncingController,
    required this.flipCardcontroller,
    required this.listSize,
  });

  final GlobalKey<AnimatedGridState> gridKey;
  final AnimationController bouncingController;
  final FlipCardController flipCardcontroller;
  final ListModel<double> listSize;

  @override
  State<FrontFlipCard> createState() => _FrontFlipCardState();
}

class _FrontFlipCardState extends State<FrontFlipCard> {
  double _currentSize = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomPaint(
        painter: ModalPainter(),
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.67,
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Select Size',
                    style: TextStyle(color: Colors.grey[400], fontSize: 22),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.22,
                    child: AnimatedGrid(
                      key: widget.gridKey,
                      initialItemCount: widget.listSize.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 2 / 1.5,
                        mainAxisSpacing: 26,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index, animation) {
                        final size = widget.listSize[index];

                        return ScaleTransition(
                          scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
                          child: FadeTransition(
                            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
                            child: InkWell(
                              onTap: () => setState(() => _currentSize = size),
                              child: AnimatedContainer(
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 300),
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: _currentSize == size
                                      ? [
                                          BoxShadow(
                                            color: Colors.orange.withOpacity(0.6),
                                            blurRadius: 10,
                                            offset: const Offset(0, 7),
                                          ),
                                        ]
                                      : [
                                          const BoxShadow(color: Colors.white),
                                        ],
                                  gradient: _currentSize == size
                                      ? LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomCenter,
                                          colors: [Colors.orange[300]!, Colors.orange],
                                        )
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    size.toStringAsFixed(size.truncateToDouble() == size ? 0 : 1),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: _currentSize == size ? Colors.white : Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Select Quantity',
                    style: TextStyle(color: Colors.grey[400], fontSize: 22),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        splashColor: Colors.grey[100],
                        highlightColor: Colors.grey[100]!,
                        icon: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(Icons.close, color: Colors.grey[300]!, size: 30),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.grey[300]!,
                                size: 26,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 6, right: 12),
                              child: Text(
                                '1',
                                style: TextStyle(color: Colors.black87, fontSize: 24),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey[300]!,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: _currentSize == 0
                            ? null
                            : () async {
                                await widget.flipCardcontroller.toggleCard();
                                await widget.bouncingController.forward();
                                await widget.bouncingController.reverse();
                                Future.delayed(
                                  const Duration(milliseconds: 300),
                                  () => _currentSize = 0,
                                );
                              },
                        splashColor: Colors.grey[100],
                        highlightColor: Colors.grey[100]!,
                        icon: AnimatedContainer(
                          width: 50,
                          height: 50,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentSize != 0 ? Colors.orange.shade300 : Colors.grey[300]!,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.check,
                            color: _currentSize != 0 ? Colors.orange.shade300 : Colors.grey[300]!,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
