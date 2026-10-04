part of 'dashboard_page.dart';

class _DashboardLoading extends StatelessWidget {
  const _DashboardLoading();

  /// Shape-only placeholder; the text is never shown, only measured.
  static const _placeholder = User(
    name: 'Placeholder Name',
    email: 'placeholder.email@mail.com',
    updatedAt: '2026-01-01T00:00:00.000Z',
  );

  @override
  Widget build(BuildContext context) => Skeletonizer(
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(Dimens.space16),
      itemCount: 8,
      itemBuilder: (_, _) => const _DashboardUserItem(user: _placeholder),
    ),
  );
}
