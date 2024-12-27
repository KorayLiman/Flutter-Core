import 'dart:async';
import 'dart:io';

import 'package:flcore/flcore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum _FLListViewType {
  normal,
  builder,
  separated,
}

class FLListView extends StatefulWidget {
  const FLListView({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.itemExtentBuilder,
    this.prototypeItem,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.children = const <Widget>[],
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.onReachedEnd,
    this.onReachedEndPercentage = 0.7,
    this.onRefresh,
  })  : _listViewType = _FLListViewType.normal,
        _itemBuilder = null,
        _separatorBuilder = null,
        findChildIndexCallback = null,
        itemCount = null;

  const FLListView.builder({
    required IndexedWidgetBuilder itemBuilder,
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.itemExtentBuilder,
    this.prototypeItem,
    this.findChildIndexCallback,
    this.itemCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.onReachedEnd,
    this.onReachedEndPercentage = 0.7,
    this.onRefresh,
  })  : _listViewType = _FLListViewType.builder,
        _separatorBuilder = null,
        _itemBuilder = itemBuilder,
        children = null;

  const FLListView.separated({
    required IndexedWidgetBuilder itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.findChildIndexCallback,
    this.itemExtent,
    this.itemExtentBuilder,
    this.prototypeItem,
    this.semanticChildCount,
    this.onReachedEnd,
    this.onReachedEndPercentage = 0.7,
    this.onRefresh,
  })  : _listViewType = _FLListViewType.separated,
        _separatorBuilder = separatorBuilder,
        _itemBuilder = itemBuilder,
        children = null;

  final _FLListViewType _listViewType;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final ItemExtentBuilder? itemExtentBuilder;
  final Widget? prototypeItem;
  final IndexedWidgetBuilder? _itemBuilder;
  final List<Widget>? children;
  final IndexedWidgetBuilder? _separatorBuilder;
  final ChildIndexGetter? findChildIndexCallback;
  final int? itemCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final FutureOr<void> Function()? onReachedEnd;
  final double onReachedEndPercentage;
  final Future<void> Function()? onRefresh;

  @override
  State<FLListView> createState() => _FLListViewState();
}

class _FLListViewState extends State<FLListView> {
  late final ScrollController _scrollController;
  bool _showIndicator = false;
  ScrollController? _primaryScrollController;
  late ScrollPosition _position;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();

    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _primaryScrollController = PrimaryScrollController.maybeOf(context)?..attach(_position = _scrollController.position);
    });
  }

  @override
  void dispose() {
    _primaryScrollController?.detach(_position);
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget._listViewType) {
      _FLListViewType.normal => _listView,
      _FLListViewType.builder => _listViewBuilder,
      _FLListViewType.separated => _listViewSeparated,
    };
  }

  Future<void> _onScroll() async {
    if (!_isBottom || _showIndicator) return;

    setState(() => _showIndicator = true);
    await widget.onReachedEnd?.call();
    setState(() => _showIndicator = false);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * widget.onReachedEndPercentage);
  }

  Widget get _listView {
    final listView = ListView(
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: _scrollController,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemExtent: widget.itemExtent,
      itemExtentBuilder: widget.itemExtentBuilder,
      prototypeItem: widget.prototypeItem,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
      children: [
        ...widget.children!,
        if (_showIndicator) const _ListViewAdaptiveIndicator(),
      ],
    );
    return widget.onRefresh == null
        ? listView
        : Platform.isAndroid
            ? RefreshIndicator(onRefresh: widget.onRefresh!, child: listView)
            : _CustomScrollView(
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ...widget.children!,
                      if (_showIndicator) const _ListViewAdaptiveIndicator(),
                    ],
                  ),
                ),
              );
  }

  Widget get _listViewBuilder {
    final listView = ListView.builder(
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: _scrollController,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemExtent: widget.itemExtent,
      itemExtentBuilder: widget.itemExtentBuilder,
      prototypeItem: widget.prototypeItem,
      itemBuilder: (context, index) {
        if (index == widget.itemCount!) return const _ListViewAdaptiveIndicator();
        return widget._itemBuilder!(context, index);
      },
      findChildIndexCallback: widget.findChildIndexCallback,
      itemCount: widget.itemCount == null
          ? 0
          : _showIndicator
              ? widget.itemCount! + 1
              : widget.itemCount!,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
    );

    return widget.onRefresh == null
        ? listView
        : Platform.isAndroid
            ? RefreshIndicator(onRefresh: widget.onRefresh!, child: listView)
            : _CustomScrollView(
                sliver: SliverList.builder(
                  itemBuilder: (context, index) {
                    if (index == widget.itemCount!) return const _ListViewAdaptiveIndicator();
                    return widget._itemBuilder!(context, index);
                  },
                  itemCount: widget.itemCount == null
                      ? 0
                      : _showIndicator
                          ? widget.itemCount! + 1
                          : widget.itemCount!,
                ),
              );
  }

  Widget get _listViewSeparated {
    final listView = ListView.separated(
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: _scrollController,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemBuilder: (context, index) {
        if (index == widget.itemCount!) return const _ListViewAdaptiveIndicator();
        return widget._itemBuilder!(context, index);
      },
      findChildIndexCallback: widget.findChildIndexCallback,
      separatorBuilder: widget._separatorBuilder!,
      itemCount: widget.itemCount == null
          ? 0
          : _showIndicator
              ? widget.itemCount! + 1
              : widget.itemCount!,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
    );

    return widget.onRefresh == null
        ? listView
        : Platform.isAndroid
            ? RefreshIndicator(onRefresh: widget.onRefresh!, child: listView)
            : _CustomScrollView(
                sliver: SliverList.separated(
                  itemBuilder: (context, index) {
                    if (index == widget.itemCount!) return const _ListViewAdaptiveIndicator();
                    return widget._itemBuilder!(context, index);
                  },
                  separatorBuilder: widget._separatorBuilder!,
                  itemCount: widget.itemCount == null
                      ? 0
                      : _showIndicator
                          ? widget.itemCount! + 1
                          : widget.itemCount!,
                ),
              );
  }
}

@immutable
final class _ListViewAdaptiveIndicator extends StatelessWidget {
  const _ListViewAdaptiveIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

/// iOS style custom scroll view with refresh indicator.
@immutable
final class _CustomScrollView extends StatefulWidget {
  const _CustomScrollView({
    required this.sliver,
  });

  final Widget sliver;

  @override
  State<_CustomScrollView> createState() => _CustomScrollViewState();
}

class _CustomScrollViewState extends State<_CustomScrollView> {
  /// Whether the scroll view is at the top.
  ///
  /// This is used to determine whether to show the refresh indicator.
  var _isAtTop = true;
  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_FLListViewState>();
    if (state == null) return emptyBox;
    final widget = state.widget;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        /// Check if the scroll view is at the top.
        ///
        /// True when scroll offset <= 0. False otherwise.
        if (notification is ScrollStartNotification) {
          if (state._scrollController.offset <= 0 && !_isAtTop) {
            scheduleMicrotask(() {
              if (mounted) {
                setState(() {
                  _isAtTop = true;
                });
              }
            });
          } else if (state._scrollController.offset > 0 && _isAtTop) {
            scheduleMicrotask(() {
              if (mounted) {
                setState(() {
                  _isAtTop = false;
                });
              }
            });
          }
        }
        return false;
      },
      child: CustomScrollView(
        physics: widget.physics,
        cacheExtent: widget.cacheExtent,
        clipBehavior: widget.clipBehavior,
        controller: state._scrollController,
        dragStartBehavior: widget.dragStartBehavior,
        keyboardDismissBehavior: widget.keyboardDismissBehavior,
        primary: widget.primary,
        restorationId: widget.restorationId,
        reverse: widget.reverse,
        scrollDirection: widget.scrollDirection,
        semanticChildCount: widget.semanticChildCount,
        shrinkWrap: widget.shrinkWrap,
        slivers: [
          /// Show the refresh indicator only when the scroll view is at the top.
          if (_isAtTop) CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
          SliverPadding(padding: widget.padding ?? EdgeInsets.zero, sliver: this.widget.sliver),
        ],
      ),
    );
  }
}
