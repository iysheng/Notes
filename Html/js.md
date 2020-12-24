#### javascript 學習筆記

##### 第一章 變量聲明
##### 1. 變量聲明
* let\var 變量名 變量值
* 變量可以更換不同的類型，自動根據賦值匹配變量類型，換言之变量类型由所引用的值决定
* console.log() /* 調試 js */
* 使用 var 定義的代碼，聲明會被提到前面，賦值還是在原來的位置，建議使用 let/const 聲明變量，var 聲明的變量會容易產生 TDZ
* let/const 聲明的變量擁有塊作用域，var 則沒有，擁有塊作用域的變量無法被塊外的代碼訪問
* const 用來聲明常量，聲明時必須對其賦值，不允許再次全新賦值，但是可以修改 const 變量的引用類型值, Object.freeze
如果冻结变量后，变量也不可以修改了，使用严格模式会报出错误
``` html
"use strict" /* 這句話很重要，聲明使用嚴格模式 */
const INFO = {
  url: 'https://www.houdunren.com',
  port: '8080'
};
Object.freeze(INFO);
INFO.port = '443'; //Cannot assign to read only property
console.log(INFO);
```
* let 全局声明的变量不存在于 window 对象中，这与 var 声明不同
``` html
  var abc = 102;
  console.log(window.abc); /* 正確 var 定義的變量，存在 window 對象的成員 */
  let def  = 112;
  console.log(window.def); /* 錯誤 windows 沒有 def 這個成員 */
```
* 運算符 === : 不强制类型转换比较； == ： 強制類型轉換比較
* label/break ： 跳轉到制定標號的位置，類似 C 語言的 goto
* for/in ：遍歷對象的主要屬性
``` html
let hd = [
                { title: "第一章 走进JAVASCRIPT黑洞", lesson: 3 },
                { title: "ubuntu19.10 配置好用的编程工作站", lesson: 5 },
                { title: "媒体查询响应式布局", lesson: 8 }
            ];
            document.write(`
            <table border="1" width="100%">
            <thead><tr><th>标题</th><th>课程数</th></thead>
            `);
            let key = null;
            for (key in hd) {
                document.write(`
                <tr>
                    <td>${hd[key].title}</td>
                    <td>${hd[key].lesson}</td>
                </tr>

                `);
                console.log(hd[key].lesson);
            }
            document.write("</table>");
```
* typeof 用來返回以下原始類型
	1. 基本類型:number/string/boolean
	2. function
	3. object
* Ajax是发出异步HTTP请求的传统方式。可以使用HTTP POST方法发送数据，并使用HTTP GET方法接收数据。
	4. undefined
* jquery 格式化字符串爲 json 格式
``` javascript
$.parseJSON(g_basic_info_data); /* 將 json 格式的字符串轉換爲 JSON object 類型的對象 */
```
* JSON 格式化爲字符串 JSON.stringify(json對象)
* AJAX 發送請求的方法
``` javascript
      $.ajax({
          url: g_board_control_url, /* 請求的 url */
          async: true, /*  */
          contentType: "application/json;charset=utf-8", /* 頭部類型 */
          data: JSON.stringify(g_board_control_blue), /* 發送的數據 */
          type: "POST" /* 請求的方法 */
      })
```
