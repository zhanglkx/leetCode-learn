Function.prototype.call1 = function (context, ...args) {
  context = context || window;

  context.fn = this;

  let params = [...args].slice(1);
  let res = context.fn(...params);
  delete context.fn;
  return res;
};
