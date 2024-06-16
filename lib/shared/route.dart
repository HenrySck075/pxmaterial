import "package:go_router/go_router.dart";
GoRouter router = GoRouter(routes: []);

void updateRouter(GoRouter r) {
  router = r;
}

Uri currentRouteURI() {
  final RouteMatch lastMatch = router.routerDelegate.currentConfiguration.last;
  final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : router.routerDelegate.currentConfiguration;
  return matchList.uri;
}
