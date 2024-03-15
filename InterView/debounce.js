function debounce(fn, delay) {
  let timer;

  return function () {
    let self = this,
      args = arguments;
    clearTimeout(timer);
    timer = setTimeout(function () {
      fn.apple(self, args);
    }, delay);
  };
}
