part of 'main_page.dart';

class _MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainAppBar({required this.onMenuPressed});

  final VoidCallback onMenuPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: BlocBuilder<MainCubit, MainMenu>(
      builder: (_, menu) {
        final title = menu.title(context);

        return AnimatedSwitcher(
          duration: Motion.medium,
          switchInCurve: Motion.emphasized,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween(
                begin: const Offset(0, 0.4),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          ),
          child: Text(title, key: ValueKey(title)),
        );
      },
    ),
    leading: IconButton(
      icon: Icon(
        Icons.menu_rounded,
        size: Dimens.space24,
        semanticLabel: Strings.of(context)!.menu,
      ),
      onPressed: onMenuPressed,
    ),
    actions: const [ButtonNotification()],
  );
}
