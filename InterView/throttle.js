/**
 * 时间戳解法
 * @returns  null
 */
function throttle1(fn, delay) {
  let self, args;
  let previous = 0;

  return function () {
    let now = +new Date();

    self = this;
    args = arguments;

    if (now - previous > delay) {
      previous = now;
      console.log(previous, "=======", now, "----", now - previous, delay);
      fn.apply(self, args);
      // previous = now;
    }
  };
}
/**
 * 定时器方案
 * @param {Function} fn 需要截流的函数
 * @param {Number} delay 延迟时间
 * @returns 回调函数
 */
function throttle(fn, delay) {
  let timer;

  return function () {
    if (timer) {
      return;
    }

    let self = this;
    let args = arguments;
    timer = setTimeout(function () {
      fn.apply(self, args);
      timer = null;
    }, delay);
  };
}

// 测试代码
let a = throttle(logFun, 1000);
function textFun(params) {
  setInterval(() => {
    // console.log(22);

    a();
  }, 100);
}

function logFun(params) {
  console.log("测试代码");
}

textFun();
