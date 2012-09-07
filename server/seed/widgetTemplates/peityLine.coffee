module.exports = 
  name: "Peity Line"
  html: "<!-- This is where your widget's html goes -->\n<span class=\"line\">5,3,9,6,5,9,7,3,5,2</span>\n<div class=\"message\"></div>"
  css: "/* your widget's CSS goes here */\n\ncanvas {\n  margin-top: 15%;\n}\n\n.message {\n  padding-top:10px;\n}\n"
  script: "// The widget's html as a jQuery object\nvar widget = this.widget;\n\n// This runs when the widget is loaded\nthis.on('load', function(data){\n\n  head.js('/javascripts/peity.min.js')\n  head.ready(function(){\n    \n  widget.options = {\n     width: widget.width()*0.8,\n     height: widget.height()*0.4,\n     colour: \"#64C6FF\",\n     strokeColour: \"#327AA3\",\n     strokeWidth: 1\n   };\n\n    widget.find(\".line\").peity(\"line\",widget.options);\n  });\n\n});\n// This runs when the widget receives a transmission\nthis.on('transmission', function(data){\n  var existingData = widget.find(\".line\").text().split(',')\n  if (existingData.length > 15) {existingData.shift() };\n  if (data.value == undefined) {\n    data.value = Math.floor(Math.random()*10);\n  }\n  existingData.push(data.value);\n  widget.find(\".line\").text(existingData.toString(\",\")).change()\n  widget.find(\".message\").text(data.message);\n});\n"
  json: "{\n  \"value\": 5,\n  \"message\": \"Something going bonkers\"\n}"
  snapshotUrl: "/images/widgetTemplates/peityLine.png"