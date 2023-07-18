import 'package:flutter_comm/util/weburl_util.dart';

class PromotionEntity {
  final String title;
  final String text;
  final String img;
  final Map<String, String> url;

  PromotionEntity(
    this.title,
    this.text,
    this.img,
    this.url
  );

  static List<List<PromotionEntity>> getLocalData() {
    String time = "20/06/2023 - Longo prazo";
    PromotionEntity item1 = PromotionEntity("Primeiro depósito + bônus de 20%", time, "promotion-1", WebURLUtil.ACTIVITY_DETAIL_FIRST_DEPOSIT);
    PromotionEntity item2 = PromotionEntity("Benefícios-ofertasdedeposito Ate 1", time, "promotion-2", WebURLUtil.ACTIVITY_DETAIL_DEPOSIT_BONUS);
    PromotionEntity item3 = PromotionEntity("Recompensa de check-in", time, "promotion-3", WebURLUtil.ACTIVITY_DETAIL_CHECK_IN);
    PromotionEntity item4 = PromotionEntity("Jackpot de desempacotar", time, "promotion-4", WebURLUtil.ACTIVITY_DETAIL_REWARD_BOX);
    PromotionEntity item5 = PromotionEntity("Apostas cumulativas semanais, bônus de até 30%!", time, "promotion-5", WebURLUtil.ACTIVITY_REFUND);
    List<PromotionEntity> list1 = [item1, item2, item3, item4, item5];
    List<PromotionEntity> list2 = [item1, item2];
    List<PromotionEntity> list3 = [];
    List<PromotionEntity> list4 = [];
    List<PromotionEntity> list5 = [];
    List<PromotionEntity> list6 = [item3, item4, item5];
    List<List<PromotionEntity>> ret = [list1, list2, list3, list4, list5, list6];
    return ret;
  }
}
