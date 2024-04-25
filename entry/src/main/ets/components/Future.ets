import { StyleConstants } from '@ohos/common/src/main/ets/constants/StyleConstants'
import { CommonDataSource } from '@ohos/common/src/main/ets/utils/CommonDataSource'
import FutureViewModel from '../viewmodel/FutureViewModel'
import RefreshViewModel from '../viewmodel/RefreshViewModel'
import { Weather, WeatherNDData } from '../viewmodel/WeatherData'

@Component
export struct Future {
  @State refreshViewModel: RefreshViewModel = new RefreshViewModel()

  aboutToAppear() {
    this.getWeather7D()
  }

  getWeather7D() {
    FutureViewModel.getWeather7D('101010100').then((data: WeatherNDData) => {
      this.refreshViewModel.weather7DData = data
    }).catch((err: string | Resource) => {

    })
  }

  build() {
    if (this.refreshViewModel.weather7DData?.daily.length > 0) {
      List({ space: StyleConstants.FIFTEEN_SPACE }) {
        LazyForEach(new CommonDataSource(this.refreshViewModel.weather7DData?.daily), (item: Weather) => {
          ListItem() {
            this.FutureItem(item)
          }
        })
      }.padding({ left: $r('app.float.vp_15'), right: $r('app.float.vp_15') })
    }
  }

  @Builder
  FutureItem(weather: Weather) {
    Row() {
      Row({ space: StyleConstants.FIFTEEN_SPACE }) {
        Column({ space: StyleConstants.FOUR_SPACE }) {
          Text('Today').fontColor($r('app.color.color_666666')).fontSize($r('app.float.smaller_font_size'))
          Text(weather.text).fontColor($r('app.color.color_333333')).fontSize($r('app.float.smaller_font_size'))
        }

        Column({ space: StyleConstants.FOUR_SPACE }) {
          Text(weather.windDirDay).fontColor($r('app.color.color_666666')).fontSize($r('app.float.smaller_font_size'))
          Text(weather.windScaleDay).fontColor($r('app.color.color_666666')).fontSize($r('app.float.smaller_font_size'))
        }
      }.padding({ left: $r('app.float.vp_15'), right: $r('app.float.vp_15') })

      Row({ space: StyleConstants.FIFTEEN_SPACE }) {
        Column({ space: StyleConstants.FOUR_SPACE }) {
          Text(weather.tempMax).fontColor($r('app.color.color_666666')).fontSize($r('app.float.smaller_font_size'))
          Text(weather.tempMin).fontColor($r('app.color.color_666666')).fontSize($r('app.float.smaller_font_size'))
        }

        Image($r('app.media.icon'))
          .size({ width: $r('app.float.vp_twenty_four'), height: $r('app.float.vp_twenty_four') })
      }.padding({ left: $r('app.float.vp_15'), right: $r('app.float.vp_15') })
    }
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
    .height($r('app.float.vp_80'))
    .width(StyleConstants.FULL_WIDTH)
    .borderRadius($r('app.float.vp_eight'))
    .backgroundColor($r('app.color.color_B3A5D63F'))
  }
}