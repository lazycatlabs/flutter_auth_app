part of 'menu_drawer.dart';

class _MenuDrawerHeader extends StatelessWidget {
  const _MenuDrawerHeader({required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) => Row(
    spacing: Dimens.space16,
    children: [
      Skeleton.replace(
        replacement: Bone.circle(size: Dimens.profilePicture),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorScheme.of(context).primary,
              width: Dimens.space2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimens.space3),
            child: CircleImage(
              url: user?.avatar ?? '',
              size: Dimens.profilePicture - Dimens.space6 - Dimens.space4,
            ),
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimens.space4,
          children: [
            Row(
              spacing: Dimens.space4,
              children: [
                Flexible(
                  child: Text(
                    user?.name ?? '',
                    style: TextTheme.of(context).titleMedium600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (user?.isVerified ?? false)
                  Icon(
                    Icons.verified_rounded,
                    size: Dimens.space16,
                    color: ColorScheme.of(context).primary,
                  ),
              ],
            ),
            Text(
              user?.email ?? '',
              style: TextTheme.of(context).bodySmall?.copyWith(
                color: ColorScheme.of(context).onSurfaceVariant,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ],
  );
}
