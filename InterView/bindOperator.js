Function.prototype.bind2 = function (context) {
  const self = this; //this代表的是调用bind的对象
  const args = Array.prototype.slice.call(arguments, 1);

  const fNOP = function () {};

  const fBound = function () {
    const bindArgs = Array.prototype.slice.call(arguments);
    // 这里使用this instanceof fNOP会为true是因为，fBound.prototype = new fNOP();这句代码，相当于fNOP位于fBound的原型链上，
    // 原直接将 fBound. prototype = this.prototype，我们直接修改 fBound.prototype 的时候，
    // 也会直接修改绑定函数的 prototype。这个时候，我们可以通过一个空函数来进行中转
    return self.apply(
      this instanceof fNOP ? this : context,
      args.concat(bindArgs)
    );
  };

  fNOP.prototype = this.prototype;
  fBound.prototype = new fNOP();
  return fBound;
};
