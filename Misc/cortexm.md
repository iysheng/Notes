
### 記錄 Cortex-M 系列處理器的模塊學習

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




### (TCD1304)[https://hackaday.io/project/9829-linear-ccd-module]
---
1. SH must go high with a delay (t2) of between 100 and 1000 ns after ICG goes low.
2. SH must stay high for (t3) a minium of 1000 ns.
3. ICG must go high with a delay (t1) of minimum 1000 ns after SH goes low

This is all taken care of by the timers in the STM32F401RE.
In fact once they're set up the MCU is not doing any work.
The only thing the user has to do is to choose ICG-periods that are multiples of the SH-period.
所有的事情都可以交給定時器完成，實際上， MCU 完成初始化後就做的事情很少了，用戶
需要做的是選擇 ICG 的周期，算法是 piexl * SH-period ???
