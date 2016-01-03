require! {
  fs: {read-file-sync}
  path: {resolve}
  stylus
  jade: {compile-file}
}

source-dir = resolve __dirname, \../src
styl-entry = resolve source-dir, \./index.styl
styl-str = read-file-sync styl-entry .to-string!

err, css <- stylus do
  styl-str
  compress: true
.set \paths, [source-dir]
.render

if err then return console.log err

jade-entry = resolve source-dir, \./index.jade

compiler =
  compile-file do
    jade-entry
    pretty: false
html =
  compiler do
    style: css

console.log html
