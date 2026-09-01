part of 'dashboard_page.dart';

class _DashboardUserItem extends StatelessWidget {
  const _DashboardUserItem({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      vertical: Dimens.space12,
      horizontal: Dimens.space16,
    ),
    child: LzyctCard(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.space8),
              bottomLeft: Radius.circular(Dimens.space8),
            ),
            child: CachedNetworkImage(
              imageUrl: user.avatar ?? '',
              width: Dimens.profilePicture,
              height: Dimens.profilePicture,
              fit: BoxFit.cover,
            ),
          ),
          SpacerH(value: Dimens.space16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name ?? '',
                  style: TextTheme.of(context).titleLargeBold,
                ),
                Text(
                  user.email ?? '',
                  style: TextTheme.of(context).bodySmall?.copyWith(
                    color: ColorScheme.of(context).onSurfaceVariant,
                  ),
                ),
                const SpacerV(),
                Row(
                  children: [
                    Text(
                      Strings.of(context)!.lastUpdate,
                      style: TextTheme.of(context).labelSmall?.copyWith(
                        color: ColorScheme.of(context).onSurfaceVariant,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        (user.updatedAt ?? '').toStringDateAlt(),
                        style: TextTheme.of(context).labelSmall?.copyWith(
                          color: ColorScheme.of(context).onSurfaceVariant,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
