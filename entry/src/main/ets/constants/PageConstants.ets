/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class PageConstants {
  /**
   * Delay time to router MainPage.
   */
  static readonly DELAY_TIME: number = 2000;
  /**
   * The value of letter space: 16vp.
   */
  static readonly LETTER_SPACE: string = '16vp';
  /**
   * The value of tab bar button space: 6vp.
   */
  static readonly BUTTON_SPACE: string = '6vp';
  /**
   * MainPage url.
   */
  static readonly MAIN_PAGE_URL: string = 'pages/MainPage';
  /**
   * Index of home tab.
   */
  static readonly TAB_HOME_INDEX: number = 0;
  /**
   * Index of future tab.
   */
  static readonly TAB_FUTURE_INDEX: number = 1;
  /**
   * Index of setting tab.
   */
  static readonly TAB_SETTING_INDEX: number = 2;
  /**
   * Image aspect ratio value: 1.
   */
  static readonly IMAGE_ASPECT_RATIO: number = 1;
  /**
   * Key of router get params: tabIndex.
   */
  static readonly TABLE_INDEX_KEY: string = 'tabIndex';
}