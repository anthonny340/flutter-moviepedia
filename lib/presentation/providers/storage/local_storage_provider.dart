//Me va a servir para manejar la instancia de mi drift_datasource

import 'package:cinemapedia/infrastructure/datasources/drift_local_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/local_storage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider(
  (ref) {
    return LocalStorageRepositoryImpl(datasource: DriftLocalDatasource());
  },
);
