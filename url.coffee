# ```
# url.js 0.0.1
# 
# ! CopyRight: binnng http://github.com/binnng/url.js
# Licensed under: MIT
# http://binnng.github.io/url.js
# ```

# ### Fork me on [Github](https://github.com/binnng/url.js)!

# ### [Homepage](http://binnng.github.io/url.js)
  
define "binnng/url.js", (require, exports, module) ->

  WIN = window
  DOC = document

  decode = WIN["decodeURIComponent"]

  # 从查询字符串中提取JSON值
  # 查询字符串格式：`a=1&b=2&c=3`
  # 返回得到的JSON
  # params `String`
  getDataFromParams = (params) ->

    ret = {}
    querys = params.split "&"

    # "a=1" 这种形式的单个参数的字符串转换进 `ret` 
    setDataFromParam = (item) ->
      item = item.split "="

      name = item[0]
      value = item[1] or ""

      ret[decode(name)] = decode(value)

    setDataFromParam(item) for item in querys

    ret

  class _URL

    WIN_URL = WIN["URL"]

    # 系统是否支持 URL 类
    isSurportURL = typeof WIN_URL is "function"

    constructor: (@url) ->
      @search = @hash = null

      search = (url.split "?")?[1]
      @search = "##{search}" if search

      hash = (url.split "#")?[1]
      @hash = "##{hash}" if hash



  URL = 

    # 格式化传过来的URL地址
    # 返回一个`URL`对象
    # url: `String`
    parse: (url) -> new _URL url

    # 从url的search中提取的数据
    search: (url = "") ->
      url = URL.parse url
      search = url.search

      ret = if search then getDataFromParams search.substr(1) else null

      ret

    # 从url的hash中提取的数据
    hash: (url = "") ->
      url = URL.parse url
      hash = url.hash

      ret = if hash then getDataFromParams hash.substr(1) else null

      ret

    getDataFromParams: getDataFromParams
        


   # 暴露出去
  entry = URL
  
  module.exports = entry

