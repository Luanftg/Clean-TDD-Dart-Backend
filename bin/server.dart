import 'package:kadosh_backend/config/config.dart';
import 'package:kadosh_backend/server/server.dart';

void main() {
  Server.bootstrap(controllers)
      .then((server) => print(
          'Server listen on http://${server.address.host}:${server.port}'))
      .catchError(print);
}
