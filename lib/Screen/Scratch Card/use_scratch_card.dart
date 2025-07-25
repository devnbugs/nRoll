import 'package:nrollapp/Model/scratch_card_model.dart';
import 'package:nrollapp/generated/l10n.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scratcher/widgets.dart';

import '../../Provider/profile_provider.dart';
import '../../Repositories/authentication_repo.dart';
import '../Constant Data/constant.dart';

class UseScratchCard extends ConsumerStatefulWidget {
  const UseScratchCard({super.key, required this.scratchCardModel});
  final Data scratchCardModel;

  @override
  ConsumerState<UseScratchCard> createState() => _UseScratchCardState();
}

class _UseScratchCardState extends ConsumerState<UseScratchCard> {
  bool isBalanceShow = false;
  final scratchKey = GlobalKey<ScratcherState>();
  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 90,
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: containerGradiant, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        ),
        title: Text(
          lang.S.of(context).scratchCard,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Scratcher(
                key: scratchKey,
                brushSize: 30,
                threshold: 50,
                color: Colors.grey.shade400,
                image: Image.asset('images/a1.png', fit: BoxFit.cover),
                // onChange: (value) => print("Scratch progress: $value%"),
                onThreshold: () async {
                  scratchKey.currentState!.reveal();
                  try {
                    EasyLoading.show(status: lang.S.of(context).gettingReward);
                    bool status = await AuthRepo().visitWebsite(widget.scratchCardModel.id.toString());
                    if (status) {
                      await ref.refresh(personalProfileProvider);
                      await ref.refresh(scratchCardProvider.future);
                      if (!mounted) return;
                      EasyLoading.showSuccess(lang.S.of(context).rewardedSuccessfully);
                      Navigator.pop(context);
                    } else {
                      if (!mounted) return;
                      EasyLoading.showError(lang.S.of(context).errorOccurred);
                    }
                  } catch (e) {
                    EasyLoading.showError(e.toString());
                  }
                },
                child: Container(
                  height: 238,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        lang.S.of(context).youHaveEarned,
                        style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kGreyTextColor, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.scratchCardModel.rewardPoint} ${lang.S.of(context).coins}',
                        style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kWhite, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Scratch the card', // Replace with localized string if available
              style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kWhite),
            )
          ],
        ),
      ),
    );
  }
}
