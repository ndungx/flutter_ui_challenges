import 'package:flutter/material.dart';

class ListModel<E> {
  ListModel({required this.listKey, Iterable<E>? initialItems})
      : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedGridState> listKey;
  final List<E> _items;

  AnimatedGridState? get _animatedGrid => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedGrid!.insertItem(
      index,
      duration: const Duration(milliseconds: 500),
    );
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}
