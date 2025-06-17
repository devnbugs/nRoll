import 'package:nrollapp/Model/og_ads_model.dart';
import 'package:nrollapp/Repositories/og_ads_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

OgAdsRepo _ogAdsRepo = OgAdsRepo();

final ogAdsProvider = FutureProvider<OgAdsModel>((ref) async {
  return _ogAdsRepo.getOgAds();
});
