url.js
======

从URL中提取信息的工具。

### API

#### url.parse

```javascript
var myUrl = url.parse("http://www.demo.com/?a=1");

console.log(myUrl.host); // => "www.demo.com"
console.log(myUrl.search); // => "?a=1"
```

#### url.search

```javascript
var searchData = url.search("http://www.demo.com/?a=1"); // => {a:1}
```
#### url.hash

```javascript
var hashData = url.hash("http://www.demo.com/?a=1#b=2"); // => {b:2}
```

### 源码
[http://binnng.github.io/url.js](http://binnng.github.io/url.js)
