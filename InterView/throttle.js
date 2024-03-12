/**
 * 时间戳解法
 * @returns  null
 */
function throttle() {
  let now = +new Date();
  let self, args;

  return function (fn, delay) {
    if (+new Date() - now < delay) {
      return;
    }

    self = this;
    args = arguments;

    timer = setTimeout(function () {
      fn.apply(self, args);
    }, delay);
  };
}
