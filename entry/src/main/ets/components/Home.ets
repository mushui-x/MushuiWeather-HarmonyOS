import HomeViewModel from '../viewmodel/HomeViewModel'
import { WeatherNowData, WeatherNHData, WeatherIndicesData, Weather, Indices } from '../viewmodel/WeatherData'
import { StyleConstants, CommonDataSource } from '@Ohos/common'
import RefreshViewModel from '../viewmodel/RefreshViewModel'
import { requestPermissionsFromUser } from '@ohos/common'
import { Permissions } from '@ohos.abilityAccessCtrl'
import getLocationManager from '@ohos.geoLocationManager'
import Logger from '@ohos/common/src/main/ets/utils/Logger'
import { LocationListData } from '../viewmodel/LocationData'

@Component
export struct Home {
  @State refreshViewModel: RefreshViewModel = new RefreshViewModel()

  aboutToAppear() {
    this.checkLocationPermission()
  }

  checkLocationPermission() {
    const permissions: Array<Permissions> = ['ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION']
    requestPermissionsFromUser(getContext(), permissions,
      () => {
        // 权限申请成功
        this.getLocation()
      },
      () => {
        // 权限申请失败
      })
  }

  getLocation() {
    let requestInfo = {
      'priority': getLocationManager.LocationRequestPriority.ACCURACY,
      'timeInterval': 0,
      'distanceInterval': 0,
      'maxAccuracy': 0
    }
    let locationChange = (location: getLocationManager.Location) => {
      Logger.info('locationChanger: data: ' + JSON.stringify(location))
      this.lookupCity(`${location.longitude},${location.latitude}`)
    }
    getLocationManager.on('locationChange', requestInfo, locationChange)
  }

  lookupCity(location: string) {
    HomeViewModel.lookupCity(location).then((data: LocationListData) => {
      if (data?.location?.length > 0) {
        this.refreshViewModel.location = data.location[0]
        let locationId: string = data.location[0]?.id
        this.refreshViewModel.weatherNowData
        this.getWeatherNow(locationId)
        this.getWeather24H(locationId)
        this.getWeatherIndices(locationId)
      }
    }).catch((err: string | Resource) => {

    })
  }

  getWeatherNow(location: string) {
    HomeViewModel.getWeatherNow(location).then((data: WeatherNowData) => {
      this.refreshViewModel.weatherNowData = data
    }).catch((err: string | Resource) => {

    })
  }

  getWeather24H(location: string) {
    HomeViewModel.getWeather24H(location).then((data: WeatherNHData) => {
      this.refreshViewModel.weather24HData = data
    }).catch((err: string | Resource) => {

    })
  }

  getWeatherIndices(location: string) {
    HomeViewModel.getWeatherIndices(location).then((data: WeatherIndicesData) => {
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
      Text(this.refreshViewModel?.location?.name)
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
          GridItem() {
            this.WeatherIndicesItem(item)
          }.width('48%')
        })
      }
      .layoutDirection(GridDirection.Row)
      .maxCount(2)
      .minCount(2)
      .columnsGap($r('app.float.vp_ten'))
      .rowsGap($r('app.float.vp_ten'))
      .width(StyleConstants.FULL_WIDTH)
      .padding({ left: $r('app.float.vp_15'), right: $r('app.float.vp_15') })
    }
  }

  @Builder
  WeatherIndicesItem(indices: Indices) {
    Column({ space: StyleConstants.TWELVE_SPACE }) {
      Text(indices?.name)
        .fontColor($r('app.color.color_666666'))
        .fontSize($r('app.float.small_font_size'))
      Text(indices.category)
        .fontColor($r('app.color.color_333333'))
        .fontSize($r('app.float.middle_font_size'))
        .fontWeight(FontWeight.Bold)
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor($r('app.color.color_B3A5D63F'))
    .borderRadius($r('app.float.vp_eight'))
    .padding({ left: $r('app.float.vp_twelve'), right: $r('app.float.vp_twelve') })
    .width(StyleConstants.FULL_WIDTH)
    .height('70vp')
  }
}