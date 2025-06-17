import 'package:nrollapp/Model/offertoro_model.dart';
import 'package:nrollapp/Repositories/offertoro_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

OffertoroRepo _offertoroRepo = OffertoroRepo();

final offertoroProvider = FutureProvider<OffertoroModel>((ref) async {
  return _offertoroRepo.getOfferToro();
});
