Function.prototype.apply1 = function (context, arr) {
  context = context || window;
  let res;
  context.fn = this;
  if (!arr) {
    res = context.fn();
  } else {
    res = context.fn(...arr);
  }

  delete context.fn;
  return res;
};
