init = ->
  document.get-element-by-id \alert .set-attribute \style, 'display: none;'
  document.get-element-by-id \container .set-attribute \style, 'display: block;'
  [].forEach.call do
    document.get-elements-by-class-name \picture
    (el)->
      el.set-attribute \style, "height: #{window.inner-height}px"

if location.hash is \#direct
  init!
else
  document.get-element-by-id \enter .add-event-listener \click, init
