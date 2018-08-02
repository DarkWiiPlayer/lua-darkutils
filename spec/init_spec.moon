describe "DarkUtils", ->
  it "should load without errors", ->
    assert.not.error -> require'darkutils'
  it "should return a table", ->
    assert.table require'darkutils'
  it "should be callable", ->
    assert.function getmetatable(require'darkutils').__call
