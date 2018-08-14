Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'msogosearch:sogo-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://m.sogou.com/web/searchList.jsp?keyword=#{cased}"
        Shell.openExternal url
