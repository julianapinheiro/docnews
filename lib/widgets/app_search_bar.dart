import 'package:docnews/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppSearchBar extends StatefulWidget {
  final String title;
  final TextEditingController? textController;
  final VoidCallback? onCancelSearch;
  final Widget? child;

  const AppSearchBar({
    Key? key,
    required this.title,
    this.textController,
    this.onCancelSearch,
    this.child,
  }) : super(key: key);

  @override
  _AppSearchBarState createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar>
    with TickerProviderStateMixin {
  // Constants
  static const _searchTitle = 'Search';

  // State
  bool _isExpanded = false;
  String _title = "";

  // Animation
  late AnimationController _controller;
  late final Animation<double> opacity;
  late final Animation<double> barHeight;
  late final Animation<double> containerHeight;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _title = widget.title;
    _setupAnimations();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setupAnimations() {
    containerHeight = Tween<double>(begin: 84, end: 144).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );
    barHeight = Tween<double>(begin: 0, end: 40).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );
    opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.7, curve: Curves.easeIn),
      ),
    );
  }

  Future<void> _playAnimation() async {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    try {
      if (_isExpanded) {
        await _controller.forward().orCancel;
      } else {
        await _controller.reverse().orCancel;
      }
    } on TickerCanceled {}
    if (widget.onCancelSearch != null) {
      widget.onCancelSearch!();
    }
  }

  Widget _buildBar(BuildContext context, Widget? child) {
    return ClipPath(
      clipper: BarClipper(),
      child: Container(
        color: FeedColors.indigo,
        child: Container(
          height: containerHeight.value,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 64, maxHeight: 64),
                child: Row(
                  children: <Widget>[
                    Text(
                      _isExpanded ? _searchTitle : _title,
                      key: ValueKey<bool>(_isExpanded),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    AnimatedSwitcher(
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      duration: Duration(milliseconds: 400),
                      child: IconButton(
                        icon: ImageIcon(AssetImage(_isExpanded
                            ? 'assets/icons/ic_clear.png'
                            : 'assets/icons/ic_search.png')),
                        key: ValueKey<bool>(_isExpanded),
                        color: Colors.white,
                        iconSize: 24,
                        onPressed: _playAnimation,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: barHeight.value,
                  child: Opacity(
                    opacity: opacity.value,
                    child: SearchInput(controller: widget.textController),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (widget.child != null)
          Padding(
            padding: EdgeInsets.only(top: containerHeight.value - 20),
            child: widget.child!,
          ),
        _buildBar(context, child)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: _controller,
    );
  }
}

class BarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final radius = 16.0;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..arcToPoint(Offset(size.width - radius, size.height - radius),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(radius, size.height - radius)
      ..arcToPoint(Offset(0, size.height),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BarClipper oldClipper) => false;
}

class SearchInput extends StatelessWidget {
  final TextEditingController? controller;

  const SearchInput({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Container(
        height: 40,
        decoration: ShapeDecoration(
          color: Colors.black.withOpacity(0.3),
          shape: StadiumBorder(
            side: BorderSide(color: Colors.transparent),
          ),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Search for anything',
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
            ),
            border: InputBorder.none,
            prefixIcon: ImageIcon(
              AssetImage('assets/icons/ic_search.png'),
              color: Colors.white.withOpacity(0.8),
              size: 24,
            ),
          ),
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
