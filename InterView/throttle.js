/**
 * 时间戳解法
 * @returns  null
 */
function throttle(fn, delay) {
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

// 测试代码
let a = throttle(logFun, 1000);
function textFun(params) {
  console.log(11);
  setInterval(() => {
    // console.log(22);

    a();
  }, 100);
}

function logFun(params) {
  console.log("测试代码");
}

textFun();
