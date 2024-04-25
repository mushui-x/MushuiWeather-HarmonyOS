import HomeViewModel from '../viewmodel/HomeViewModel'
import { WeatherNowData, WeatherNHData, WeatherIndicesData, Weather, Indices } from '../viewmodel/WeatherData'
import { StyleConstants, CommonDataSource } from '@Ohos/common'
import RefreshViewModel from '../viewmodel/RefreshViewModel'

@Component
export struct Home {
  @State refreshViewModel: RefreshViewModel = new RefreshViewModel()

  aboutToAppear() {
    this.getWeatherNow()
    this.getWeather24H()
    this.getWeatherIndices()
  }

  getWeatherNow() {
    HomeViewModel.getWeatherNow('101010100').then((data: WeatherNowData) => {
      this.refreshViewModel.weatherNowData = data
    }).catch((err: string | Resource) => {

    })
  }

  getWeather24H() {
    HomeViewModel.getWeather24H('101010100').then((data: WeatherNHData) => {
      this.refreshViewModel.weather24HData = data
    }).catch((err: string | Resource) => {

    })
  }

  getWeatherIndices() {
    HomeViewModel.getWeatherIndices('101010100').then((data: WeatherIndicesData) => {
      this.refreshViewModel.weatherIndicesData = data
    }).catch((err: string | Resource) => {

    })
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      this.Toolbar()
      List() {
        ListItem() {
          this.WeatherNow()
        }

        ListItem() {
          this.Weather24H()
        }

        ListItem() {
          this.WeatherIndices()
        }
      }
    }.size({ width: StyleConstants.FULL_WIDTH, height: StyleConstants.FULL_HEIGHT })
  }

  @Builder
  Toolbar() {
    Row() {
      Image($r('app.media.ic_add'))
        .size({ width: $r('app.float.vp_twenty_four'), height: $r('app.float.vp_twenty_four') })
    }
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.End)
    .padding({ left: $r('app.float.vp_thirty'), right: $r('app.float.vp_thirty') })
    .size({ width: StyleConstants.FULL_WIDTH, height: $r('app.float.vp_sixty') })
  }

  @Builder
  WeatherNow() {
    Column() {
      Text('----')
        .fontColor($r('app.color.color_333333'))
        .fontSize($r('app.float.big_font_size'))
        .fontWeight(FontWeight.Medium)
      Text($r('app.string.temp_n', this.refreshViewModel.weatherNowData?.now?.temp))
        .fontColor($r('app.color.color_A5D63F'))
        .fontSize($r('app.float.now_temp_font_size'))
        .fontWeight(FontWeight.Bold)
      Text(`${this.refreshViewModel.weatherNowData?.now?.text} ${this.refreshViewModel.weatherNowData?.now?.windDir}${this.refreshViewModel.weatherNowData?.now?.windScale}级`)
        .fontColor($r('app.color.color_666666'))
        .fontSize($r('app.float.big_font_size'))
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
          .size({ width: $r('app.float.vp_twenty'), height: $r('app.float.vp_twenty') })
          .objectFit(ImageFit.Contain)
        Text('24小时天气')
          .fontColor($r('app.color.color_333333'))
          .fontSize($r('app.float.middle_font_size'))
          .fontWeight(FontWeight.Medium)
          .margin({ left: $r('app.float.vp_twelve') })
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
    .height('190vp')
    .margin($r('app.float.vp_15'))
  }

  @Builder
  Weather24HItem(weather: Weather) {

    Column({ space: StyleConstants.FIFTEEN_SPACE }) {
      Text($r('app.string.temp_n', weather?.temp))
        .fontColor($r('app.color.color_333333'))
        .fontSize($r('app.float.big_font_size'))
      Image(`icons/${weather.icon}.svg`)
        .size({ width: $r('app.float.vp_twenty'), height: $r('app.float.vp_twenty') })
      Text($r('app.string.windScale_n', weather?.windScale))
        .fontColor($r('app.color.color_666666'))
        .fontSize($r('app.float.small_font_size'))
      Text(weather?.fxTime.substring(11, 16))
        .fontColor($r('app.color.color_666666'))
        .fontSize($r('app.float.small_font_size'))
    }.width($r('app.float.vp_sixty')).justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
  }

  @Builder
  WeatherIndices() {
    if (this.refreshViewModel.weatherIndicesData?.daily.length > 0) {
      Grid() {
        LazyForEach(new CommonDataSource(this.refreshViewModel.weatherIndicesData?.daily), (item: Indices) => {
          this.WeatherIndicesItem(item)
        })
      }
      .rowsTemplate('1f,1f')
      .layoutDirection(GridDirection.Row)
      .columnsGap($r('app.float.vp_ten'))
      .rowsGap($r('app.float.vp_ten'))
    }
  }

  @Builder
  WeatherIndicesItem(indices: Indices) {
    Row() {
      Text($r('app.string.windScale_n', indices?.name))
        .fontColor($r('app.color.color_666666'))
        .fontSize($r('app.float.middle_font_size'))
      Text($r('app.string.windScale_n', indices.category))
        .fontColor($r('app.color.color_666666'))
        .fontSize($r('app.float.bigger_font_size'))
        .fontWeight(FontWeight.Bold)
    }
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor($r('app.color.color_B3A5D63F'))
    .borderRadius($r('app.float.vp_eight'))
    .padding({ left: $r('app.float.vp_twelve'), right: $r('app.float.vp_twelve') })
    .height('70vp')
    .layoutWeight(1)
  }
}