export class SettingItemModel {
  itemType: number = SettingConstants.ITEM_TYPE_TEMP_UNIT
  title: string = '温度单位'
  desc: string = '温度单位'
  actionType: number = SettingConstants.ACTION_TYPE_CLICK
}

export default class SettingConstants {
  /**
   * item 类型 温度单位
   */
  static readonly ITEM_TYPE_TEMP_UNIT = 1
  /**
   * item操作类型 点击
   */
  static readonly ACTION_TYPE_CLICK = 1
  /**
   * item操作类型 切换
   */
  static readonly ACTION_TYPE_SWITCH = 2
}

const settingItems: SettingItemModel[] = [
  {
    itemType: SettingConstants.ITEM_TYPE_TEMP_UNIT,
    title: '温度单位',
    desc: '摄氏度(℃)',
    actionType: SettingConstants.ACTION_TYPE_CLICK
  }
]

export { settingItems }