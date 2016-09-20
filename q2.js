function Chain(letter) {
    var obj = function (letter) {
        return new Chain(letter);
    };
    obj.letter = letter;

    obj.ancestor = Chain.caller;
    Object.setPrototypeOf(obj.ancestor, Chain.prototype);

    obj.__proto__ = Chain.prototype;
    return obj;
}
Chain.prototype.toString = function () {
    if (this.ancestor && this.ancestor.toString()){
        return this.ancestor.toString() + this.letter;
    }
    return this.letter;
};

var foo =  Chain("h");
var bar = foo("e")("l")("l")("o");


console.log(foo.toString());
console.log(bar.toString());
console.log(bar.ancestor.toString());
console.log(bar.ancestor.ancestor.toString());
console.log(Chain("t").toString());
console.log(Chain("t").ancestor.toString());

