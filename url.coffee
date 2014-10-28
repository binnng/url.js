((WIN, DOC) ->

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


  URL = 

    # 格式化传过来的URL地址
    # 返回一个`URL`对象
    # url: `String`
    parse: (url) -> new WIN["URL"] url

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
        


   # 暴露出去
  entry = URL

  if typeof module isnt "undefined" and module.exports
    module.exports = entry

  else if typeof define is "function"
    define (require, exports, module) ->
      module.exports = exports = -> entry

  # 为angular定制
  else if typeof WIN["angular"] is "object"
    angular.module("binnng/url", []).factory "$url", -> entry

  # 啥都不是，直接暴露到window
  else
    WIN["url"] = entry

) window, document