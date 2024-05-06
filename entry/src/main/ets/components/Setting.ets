import { StyleConstants } from '@ohos/common/src/main/ets/constants/StyleConstants'
import { SettingItemModel, settingItems } from '../viewmodel/SettingData'
import SettingConstants from '../viewmodel/SettingData'

@Component
export struct Setting {
  build() {
    List({ space: StyleConstants.FIFTEEN_SPACE }) {
      ListItem() {
        this.Item(settingItems[0])
      }
    }
    .padding({ top: $r('app.float.vp_15') })
    .width(StyleConstants.FULL_WIDTH).height(StyleConstants.FULL_HEIGHT)
  }

  @Builder
  Item(itemModel: SettingItemModel) {
    Row({ space: StyleConstants.FOUR_SPACE }) {
      Text(itemModel?.title)
        .fontColor($r('app.color.color_333333'))
        .fontSize($r('app.float.middle_font_size'))
        .layoutWeight(1)
      if (itemModel?.desc != undefined && itemModel?.desc != null) {
        Text(itemModel.desc).fontColor($r('app.color.color_666666')).fontSize($r('app.float.small_font_size'))
      }
      Image($r('app.media.ic_time')).size({ width: $r('app.float.vp_sixteen'), height: $r('app.float.vp_sixteen') })
    }
    .alignItems(VerticalAlign.Center)
    .height($r('app.float.vp_50'))
    .backgroundColor(Color.White)
    .borderRadius($r('app.float.vp_eight'))
    .padding({ left: $r('app.float.vp_15'), right: $r('app.float.vp_15') })
    .margin({ left: $r('app.float.vp_15'), right: $r('app.float.vp_15') })
  }
}