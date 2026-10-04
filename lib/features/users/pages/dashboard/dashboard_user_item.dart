part of 'dashboard_page.dart';

class _DashboardUserItem extends StatelessWidget {
  const _DashboardUserItem({required this.user, this.index});

  final User user;

  /// Position in the list; the first page staggers in, later pages just
  /// fade so scrolling back never replays a long cascade.
  final int? index;

  static const _staggeredItems = 10;

  @override
  Widget build(BuildContext context) {
    final position = index ?? 0;

    return FadeSlideIn(
      delay: position < _staggeredItems
          ? Motion.stagger * position
          : Duration.zero,
      duration: index == null ? Duration.zero : Motion.slow,
      child: Padding(
        padding: EdgeInsets.only(bottom: Dimens.space12),
        child: LzyctCard(
          child: Padding(
            padding: EdgeInsets.all(Dimens.space12),
            child: Row(
              spacing: Dimens.space12,
              children: [
                Skeleton.replace(
                  replacement: Bone.circle(size: Dimens.avatar),
                  child: CircleImage(
                    url: user.avatar ?? '',
                    size: Dimens.avatar,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Dimens.space2,
                    children: [
                      Row(
                        spacing: Dimens.space4,
                        children: [
                          Flexible(
                            child: Text(
                              user.name ?? '',
                              style: TextTheme.of(context).titleMedium600,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (user.isVerified ?? false)
                            Icon(
                              Icons.verified_rounded,
                              size: Dimens.space16,
                              color: ColorScheme.of(context).primary,
                            ),
                        ],
                      ),
                      Text(
                        user.email ?? '',
                        style: TextTheme.of(context).bodySmall?.copyWith(
                          color: ColorScheme.of(context).onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${Strings.of(context)!.lastUpdate}'
                        '${(user.updatedAt ?? '').toStringDateAlt()}',
                        style: TextTheme.of(context).labelSmall?.copyWith(
                          color: ColorScheme.of(context).onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
