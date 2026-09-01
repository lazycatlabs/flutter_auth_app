part of 'dashboard_page.dart';

class _DashboardEmpty extends StatelessWidget {
  const _DashboardEmpty({this.message});

  final String? message;

  @override
  Widget build(BuildContext context) =>
      Center(child: Empty(errorMessage: message));
}
