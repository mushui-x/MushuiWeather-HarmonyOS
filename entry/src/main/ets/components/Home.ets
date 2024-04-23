import HomeViewModel from '../viewmodel/HomeViewModel'
import { WeatherNowData, Weather24HData, Weather } from '../viewmodel/WeatherData'
import { StyleConstants, CommonDataSource } from '@Ohos/common'
import RefreshViewModel from '../viewmodel/RefreshViewModel'

@Component
export struct Home {
  @State refreshViewModel: RefreshViewModel = new RefreshViewModel()

  aboutToAppear() {
    this.getWeatherNow()
    this.getWeather24H()
  }

  getWeatherNow() {
    HomeViewModel.getWeatherNow('101010100').then((data: WeatherNowData) => {
      this.refreshViewModel.weatherNowData = data
    }).catch((err: string | Resource) => {

    })
  }

  getWeather24H() {
    HomeViewModel.getWeather24H('101010100').then((data: Weather24HData) => {
      this.refreshViewModel.weather24HData = data
    }).catch((err: string | Resource) => {

    })
  }

  build() {
    Column() {
      this.Toolbar()
      this.WeatherNow()
      this.Weather24H()
    }.size({ width: StyleConstants.FULL_WIDTH, height: StyleConstants.FULL_HEIGHT })
  }

  @Builder
  Toolbar() {
    Row() {
      Image($r('app.media.ic_add'))
        .size({ width: $r('app.float.vp_thirty'), height: $r('app.float.vp_thirty') })
    }
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.End)
    .padding({ left: $r('app.float.vp_thirty'), right: $r('app.float.vp_thirty') })
    .margin({ top: $r('app.float.vp_47') })
    .size({ width: StyleConstants.FULL_WIDTH, height: $r('app.float.vp_sixty') })
  }

  @Builder
  WeatherNow() {
    Column() {
      Text('----')
        .fontColor($r('app.color.color_333333'))
        .fontSize($r('app.float.big_font_size'))
        .fontWeight(FontWeight.Medium)
      Text(this.refreshViewModel.weatherNowData?.now?.temp)
        .fontColor($r('app.color.color_A5D63F'))
        .fontSize($r('app.float.now_temp_font_size'))
        .fontWeight(FontWeight.Bold)
      Text(this.refreshViewModel.weatherNowData?.now?.text)
        .fontColor($r('app.color.color_666666'))
        .fontSize($r('app.float.bigger_font_size'))
    }
    .padding({ left: $r('app.float.vp_thirty'), right: $r('app.float.vp_thirty') })
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
    .width(StyleConstants.FULL_WIDTH)
  }

  @Builder
  Weather24H() {
    Column() {
      Row() {
        Image($r('app.media.ic_time'))
          .size({ width: $r('app.float.vp_twenty_four'), height: $r('app.float.vp_twenty_four') })
          .objectFit(ImageFit.Contain)
        Text('24小时天气')
          .fontColor($r('app.color.color_333333'))
          .fontSize($r('app.float.middle_font_size'))
          .margin({ left: $r('app.float.vp_15') })
      }
      .alignItems(VerticalAlign.Center)
      .padding($r('app.float.vp_15'))
      .width(StyleConstants.FULL_WIDTH)

      if (this.refreshViewModel.weather24HData?.hourly.length > 0) {
        List() {
          LazyForEach(new CommonDataSource(this.refreshViewModel.weather24HData?.hourly), (item: Weather) => {
            ListItem() {
              this.Weather24HItem(item)
            }
          })
        }.listDirection(Axis.Horizontal)
      }
    }
    .backgroundColor($r('app.color.color_B3A5D63F'))
    .borderRadius($r('app.float.vp_eight'))
    .alignItems(HorizontalAlign.Start)
    .height('205vp')
    .margin($r('app.float.vp_15'))
  }

  @Builder
  Weather24HItem(weather: Weather) {
    Column() {
      Text(weather?.temp)
        .fontColor($r('app.color.color_333333'))
        .fontSize($r('app.float.big_font_size'))
      Text(weather?.windDir)
        .fontColor($r('app.color.color_333333'))
        .fontSize($r('app.float.big_font_size'))
        .margin({ top: $r('app.float.vp_15') })
      Text(weather?.windScale)
        .fontColor($r('app.color.color_333333'))
        .fontSize($r('app.float.big_font_size'))
        .margin({ top: $r('app.float.vp_15') })
    }.width($r('app.float.vp_80'))
  }
}