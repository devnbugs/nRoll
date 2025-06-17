import 'package:nrollapp/Model/kiwi_wall_model.dart';
import 'package:nrollapp/Repositories/kiwi_wall_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

KiwiWallRepo _kiwiWallRepo = KiwiWallRepo();

final kiwiWallProvider = FutureProvider<KiwiWallModel>((ref) async {
  return _kiwiWallRepo.getkiwiWall();
});
