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
* js 代码,在 html 的 <script> tags 中
* js 代码也可以放在外部文件中, 在外部文件中的优势: 1. 拆分 html 2. 保持容易阅读 3. 缓存 js,加快响应, 还可以引用网络的 js 文件
``` html
<script src="demo.js"></script>
<script src="https://www.w3schools.com/js/myScript.js"></script>
```
* js 的打印删除
  1. console.log() console 调试
  2. Writing into an HTML element, using innerHTML.
  3. Writing into the HTML output using document.write().
  4. Writing into an alert box, using window.alert().
* js 会忽略空格
* 关键词:
  * var: 声明变量, 1995-2015 年使用这个
  * let: 声明块变量(Declares a block variable), 2015 年后使用这个???
  * const: 声明块常量???
  * if:
  * switch:
  * for:
  * function:声明一个函数
    * function test_func(p1, p2) { xxxxx; }
  * return:退出函数
  * try:代码块的错误处理
* 注释
  1. // 注释代码
  2. /* 多行注释  */
* JavaScript Arrow Function, 有点类似 C++ 的 lambda 表示式, 定义了一种更短语句定义一个函数的语法
  1. const decrypt = (e) => {xxxxxxx} 如果只有一个函数参数, 那么 () 符号可以省略, 等价 const decrypt = e => {xxx}
* 使用 class 关键词创建一个类
```
class ClassName {
  constructor() { ... } // 通常会创建一个构造函数
}

class Car {
  constructor(name, year)
  {
    this.name = name;
    this.year = year;
  }
}
```
* promise 是一个 js 的对象,用来连接生产者和消费者,生产者是比较耗时的代码,消费者是需要等待生产者完成之后才能执行的代码.
``` js
// 通过传递两个回调函数,构建了一个 Promise 对象, 两个回调函数分别对应
// 成功执行和错误执行的回调
let myPromise = new Promise(function(myResolve, myReject) {
// "Producing Code" (May take some time)

  myResolve(); // when successful
  myReject();  // when error
});

// "Consuming Code" (Must wait for a fulfilled Promise)
// myPromise 的 then 方法使用两个参数,一个用来成功的回调函数,一个是出错的回调函数
myPromise.then(
  function(value) { /* code if successful */ },
  function(error) { /* code if some error */ }
);

// 创建了一个 Promise 的对象
let myPromise = new Promise(function(myResolve, myReject) {
  setTimeout(function() { myResolve("I love You !!"); }, 3000);
});

// 传递了一个成功的回调函数
myPromise.then(function(value) {
  document.getElementById("demo").innerHTML = value;
});
```
* async 函数,使得异步操作变得更加方便,换一句话说,就是 Generator 函数的语法糖, async 创造了一个函数返回一个 Promise, await 创造了一个函数等待 Promise
``` js
async function myFunction() {
  return "Hello";
}

// 等价
function myFunction() {
// 返回一个 Promise
  return Promise.resolve("Hello");
}

//

function* foo(){
    yield setTimeout(()=>{console.log("第一步耗时操作 开始执行")}, 1000)
    yield setTimeout(()=>{console.log("第二步耗时操作 执行中")}, 2000)
    yield setTimeout(()=>{console.log("第三步耗时操作 执行结束")}, 3000)
}

gen=foo()
gen.next()
gen.next()
gen.next()
for (let arrayElement of gen){}

// async 语法糖,简写生成器的调用
async function foo() {
    await setTimeout(()=>{console.log("第一步耗时操作 开始执行")}, 1000)
    await setTimeout(()=>{console.log("第二步耗时操作 执行中")}, 2000)
    await setTimeout(()=>{console.log("第三步耗时操作 执行结束")}, 3000)
}

foo()
```
  1. generator 函数的执行必须依靠执行器,但是 async 函数自带执行器,即 async 函数的执行和普通函数一样,只要一行, 但是 generator 函数,需要调用 next 方法或者 for 语法
  2. async 和 await 相比 generator 的 * 和 yield 有更好的语义, async 表示函数中有异步操作, await 表示紧跟在后面的表达式需要等待结果
  3. async 相比 generator 有更广的使用性, await 后可以是 promise 对象和原始类型的值(数值,字符串和布尔值,会自动转为 resolved 的 promise 对象)
  4. async 返回值是 promise 对象, 比 generator 返回的 iterator 方便,可以用 then 指定下一步操作, async 函数返回值会被 then 方法回调到
* js object, 创建 js object 的四种方法
  1. Create a single object, using an object literal // const person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};
  2. 使用关键词 new // const person = new Object(); person.firstName = "John";
  3. js 的 object 是可变的, 通过引用寻址, 如果 person 是一个 js 的 object, ``const x=person`` 不会创建一个 person 的 copy, 有点类似 c++ 引用的概念, 即变量别名.
  4. js 中几乎所有对象都是 object
