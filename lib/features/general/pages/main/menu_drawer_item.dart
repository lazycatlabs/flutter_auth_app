part of 'menu_drawer.dart';

class _MenuDrawerItem extends StatelessWidget {
  const _MenuDrawerItem({required this.menu, required this.onTap});

  final DataHelper menu;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final isDestructive = menu.title == Strings.of(context)!.logout;
    final foreground = isDestructive
        ? colorScheme.error
        : menu.isSelected
        ? colorScheme.onPrimaryContainer
        : colorScheme.onSurface;

    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.space4),
      child: AnimatedContainer(
        duration: Motion.medium,
        curve: Motion.standard,
        decoration: BoxDecoration(
          color: menu.isSelected
              ? colorScheme.primaryContainer
              : colorScheme.primaryContainer.withValues(alpha: 0),
          borderRadius: const BorderRadius.all(
            Radius.circular(Dimens.cornerRadius),
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.all(
              Radius.circular(Dimens.cornerRadius),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimens.space12,
                horizontal: Dimens.space16,
              ),
              child: Row(
                spacing: Dimens.space12,
                children: [
                  if (menu.icon != null)
                    Icon(menu.icon, size: Dimens.space20, color: foreground),
                  Expanded(
                    child: AnimatedDefaultTextStyle(
                      duration: Motion.medium,
                      style:
                          (menu.isSelected
                                  ? TextTheme.of(context).bodyLarge500
                                  : TextTheme.of(context).bodyLarge)
                              ?.copyWith(color: foreground) ??
                          const TextStyle(),
                      child: Text(menu.title ?? ''),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
