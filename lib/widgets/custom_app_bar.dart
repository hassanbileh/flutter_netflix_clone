import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/assets.dart';
import 'package:flutter_netflix_ui/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double? scrollOffset;
  const CustomAppBar({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black
          .withOpacity((scrollOffset! / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomeMobileAppBar(),
        desktop: _CustomeDesktopAppBar(),
      ),
    );
  }
}

class _CustomeMobileAppBar extends StatelessWidget {
  _CustomeMobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                    title: 'TV Shows', onTap: () => print('TV Shows')),
                _AppBarButton(title: 'Movies', onTap: () => print('Movies')),
                _AppBarButton(title: 'My List', onTap: () => print('My List')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomeDesktopAppBar extends StatelessWidget {
  _CustomeDesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: 'Home', onTap: () => print('Home')),
                _AppBarButton(
                    title: 'TV Shows', onTap: () => print('TV Shows')),
                _AppBarButton(title: 'Movies', onTap: () => print('Movies')),
                _AppBarButton(title: 'Latest', onTap: () => print('Latest')),
                _AppBarButton(title: 'My List', onTap: () => print('My List')),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print('Search'),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28.0,
                  ),
                ),
                _AppBarButton(
                    title: 'KIDS', onTap: () => print('KIDS')),
                _AppBarButton(
                    title: 'DVD', onTap: () => print('DVD')),
               IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print('Search'),
                  icon: const Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                    size: 28.0,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print('Search'),
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 28.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const _AppBarButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
