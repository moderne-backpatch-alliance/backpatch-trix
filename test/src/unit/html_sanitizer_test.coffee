{assert, test, testGroup} = Trix.TestHelpers

testGroup "HTMLSanitizer", ->
  test "strips data-trix-serialized-attributes", ->
    html = "<div data-trix-serialized-attributes=\"{}\">content</div>"
    sanitized = Trix.HTMLSanitizer.sanitize(html).body.innerHTML
    assert.notOk(sanitized.includes("data-trix-serialized-attributes"))

  test "preserves other data-trix-* attributes", ->
    html = "<div data-trix-attachment=\"{}\">content</div>"
    sanitized = Trix.HTMLSanitizer.sanitize(html).body.innerHTML
    assert.ok(sanitized.includes("data-trix-attachment"))
