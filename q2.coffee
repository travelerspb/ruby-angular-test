foo = Chain("h")
bar = foo("e")("l")("l")("o")

console.log foo.toString()
console.log bar.toString()
console.log bar.ancestor.toString()
