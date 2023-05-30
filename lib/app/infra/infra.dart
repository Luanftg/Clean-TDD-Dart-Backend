library infra;

import 'package:kadosh_backend/app/data/data.dart';
import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';
import 'package:postgres/postgres.dart';

part 'dao/clients/get_clients_dao.dart';
part 'dao/clients/add_client_dao.dart';
part 'connection/connection.dart';
part 'connection/fake/fake_db.dart';
part 'connection/postgres/postgres.dart';
