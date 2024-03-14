function red() {
  console.log("红灯");
}
function green() {
  console.log("绿灯");
}
function yellow() {
  console.log("黄灯");
}

function trafficLight(fn, timer) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      fn();
      resolve();
    }, timer);
  });
}

function timer() {
  Promise.resolve()
    .then(() => {
      return trafficLight(red, 3);
    })
    .then(() => {
      return trafficLight(green, 2);
    })
    .then(() => {
      return trafficLight(yellow, 1);
    });
}

timer();
