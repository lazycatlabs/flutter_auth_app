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
    title: BlocBuilder<MainCubit, MainState>(
      builder: (_, state) => Text(switch (state) {
        MainStateLoading() => '-',
        MainStateSuccess(:final data) => data?.title ?? '-',
      }, style: TextTheme.of(context).titleLarge),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.sort,
        size: Dimens.space24,
        semanticLabel: Strings.of(context)!.menu,
      ),
      onPressed: onMenuPressed,
    ),
    actions: const [ButtonNotification()],
  );
}
