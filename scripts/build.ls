require! {
  fs: {read-file-sync}
  path: {resolve}
  livescript: lsc
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

ls-entry = resolve source-dir, \./script.ls
ls-str = read-file-sync ls-entry .to-string!
script = lsc.compile ls-str

jade-entry = resolve source-dir, \./index.jade

compiler =
  compile-file do
    jade-entry
    pretty: false
html =
  compiler do
    style: css
    script: script

console.log html
