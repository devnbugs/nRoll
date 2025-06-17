import 'package:nrollapp/Model/personaly_model.dart';
import 'package:nrollapp/Repositories/personaly_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

PersonalyRepo _personalyRepo = PersonalyRepo();

final personalyProvider = FutureProvider<PersonalyModel>((ref) async {
  return _personalyRepo.getPersonaly();
});
