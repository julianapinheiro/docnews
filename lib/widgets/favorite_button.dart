import 'package:docnews/utils/colors.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final Function onPressed;

  FavoriteButton({
    Key? key,
    bool? isFavorite,
    required Function onPressed,
  })   : isFavorite = isFavorite ?? false,
        onPressed = onPressed,
        super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _onPressed() {
    // TODO: This is temporary, might change to Stateless later
    setState(() {
      _isFavorite = !_isFavorite;
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      onPressed: _onPressed,
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _buildIcon(context),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Image.asset(
      _isFavorite
          ? 'assets/icons/ic_favorite.png'
          : 'assets/icons/ic_favorite_outline.png',
      color: _isFavorite ? FeedColors.indigo : FeedColors.gray500,
      width: 24,
      height: 24,
      key: ValueKey<bool>(_isFavorite),
    );
  }
}
