
### 記錄 Cortex-M 系列處理器的模塊學習

### 系統部分
---
##### GD32F103
* Unique device ID (96 bits) 帶有 96 bits 的 Unique device ID
* 寄存器 0x4002103C 有一個 bit CEE 表示代碼執行增強

### flash 部分
---
##### GD32F103
gd32 的 flash 區有一個 information 區，這個區域存放的是 bootloader，這部分代碼是
固化好的不能被修改
|分類|page size|描述|information 區|
|---|---|---|---|
|GD32F10x_MD|1KB|容量在 128KB|0x1FFF F000- 0x1FFF F7FF|
|GD32F10x_HD|2KB||0x1FFF F000- 0x1FFF F7FF|
|GD32F10x_XD|2KB||0x1FFF E000- 0x1FFF F7FF|
|GD32F10x_CL|2KB||0x1FFF B000- 0x1FFF F7FF|

[![rhHeYt.png](https://s3.ax1x.com/2020/12/26/rhHeYt.png)](https://imgchr.com/i/rhHeYt)

gd32 使用外部始終，系統頻率選擇 108MHz
|總線名|頻率|
|---|---|
|sys|108MHz|
|AHB|108MHz|
|APB2|108MHz|
|APB1|54MHz|

### DMA 部分
---
##### GD32F103 系列
* DMA0 有 7 個通道
* DMA1 有 5 個通道
* 有優先級仲裁
	* 硬件優先級， 通道 0 的優先級最高，通道 6 的優先級最低
	* 軟優先級，(low, medium, high, ultra high)
* 可以配置 DMA 的數據長度，最多 65536
* 支持 8/16/32 bit 的數據訪問
* 支持固定地址和自增地址
* 支持循環發送模式
* 每一個通道的中斷有三種類型的 event flag
* 支持外設到內存、內存到外設以及內存到內存的數據傳輸



### ADC 部分
---


### TIM 部分
---
##### GD32F103 系列
* TIM0 和 TIM7 在 APB2 總線，支持 4 個通道的輸入捕獲和輸出比較
* TIM1-3 和 TIM4-6 都是在 APB1 總線
* TIM1-4 使用 16bit 的計數， 16 bit 的分頻，有 PWM 模式，帶有自動重載，支持 4 個通道的輸入捕獲和比較



### (TCD1304)[https://hackaday.io/project/9829-linear-ccd-module]
---
The TCD1304 requires the following input to function
* The master clock (fM)
* The shift gate (SH)
* The integration clear gate (ICG)

TCD1304 需要如下輸入來正常驅動
* fm 主時鍾(頻率範圍是 0.8MHz ~ 4MHz，支持用戶修改，選取 2MHz)
* SH 移位門(定義曝光時間，)
* ICG 曝光清零門(定義像素數據移動到移位寄存器)

---
1. SH must go high with a delay (t2) of between 100 and 1000 ns after ICG goes low.(SH 必須在 ICG 邊爲低電平後延時 100 ~ 1000ns 拉高，典型直是 500ns)
2. SH must stay high for (t3) a minium of 1000 ns.(t3 必須保持高電平至少 1000ns，來曝光)
3. ICG must go high with a delay (t1) of minimum 1000 ns after SH goes low(SH 變爲低電平後延時至少 1000ns， ICG 需要拉高，典型值是 5000ns)

This is all taken care of by the timers in the STM32F401RE.
In fact once they're set up the MCU is not doing any work.
The only thing the user has to do is to choose ICG-periods that are multiples of the SH-period.
所有的事情都可以交給定時器完成，實際上， MCU 完成初始化後就做的事情很少了，用戶
需要做的是選擇 ICG 的周期，算法是 piexl * SH-period ???

---
Reading the TCD1304(讀取 TCD1304 傳感器的數據):

The data rate of the CCD is 1/4 of fM, which means the pixels are clocked out at 0.50 MHz. The ADC in the STM32F401RE is fast enough to do 12 bit conversions at this rate. The pixel values are sent to a 16 bit array using DMA. From here they are sent to the Raspberry Pi over SPI at 16 MHz - also utilizing DMA - or through UART to a regular PC via the built-in ST-link's USB-connection.
( CCD 的數據速度是 1/4 的 fm。在 2MHz 輸出 fm 的情況下， 像素的數據輸出的頻率是 0.5MHz，32 的 12 bit 的ADC 足夠在這個速度下處理 AD 採樣。像素數據通過 DMA 存儲到一個 16 bit 的數組)
The voltage of an "dark" pixel is around 3.0 V and a "white" pixel has a voltage of around 1.5 V. In other words the data is upside down.(“暗”電壓大概在 3.0V，“白”電壓大概在 1.5V，換句話說和一般的 CCD 相比，“暗”和“亮”電壓剛好顛倒)
