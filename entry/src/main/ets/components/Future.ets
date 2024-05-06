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
          Text(weather.fxDate).fontColor($r('app.color.color_333333')).fontSize($r('app.float.small_font_size'))
        }

        Column({ space: StyleConstants.FOUR_SPACE }) {
          Text((weather.textDay === weather.textNight) ? `${weather.textDay}` : `${weather.textDay}转${weather.textNight}`)
            .fontColor($r('app.color.color_333333'))
            .fontSize($r('app.float.small_font_size'))
          Text(`${weather.windDirDay}${weather.windScaleDay}级`)
            .fontColor($r('app.color.color_666666'))
            .fontSize($r('app.float.smaller_font_size'))
        }
        .justifyContent(FlexAlign.Start)
        .alignItems(HorizontalAlign.Start)
      }.padding({ left: $r('app.float.vp_15'), right: $r('app.float.vp_15') })

      Row({ space: StyleConstants.FIFTEEN_SPACE }) {
        Column({ space: StyleConstants.FOUR_SPACE }) {
          Text($r('app.string.temp_n', weather.tempMax))
            .fontColor($r('app.color.color_333333'))
            .fontSize($r('app.float.middle_font_size'))
          Text($r('app.string.temp_n', weather.tempMin))
            .fontColor($r('app.color.color_333333'))
            .fontSize($r('app.float.middle_font_size'))
        }

        Image(`icons/${weather.iconDay}.svg`)
          .size({ width: $r('app.float.vp_twenty'), height: $r('app.float.vp_twenty') })
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