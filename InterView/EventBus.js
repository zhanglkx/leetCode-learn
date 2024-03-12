class EventEmitter {
  constructor() {
    this.events = {};
  }
  //触发，传递参数
  emit(event, ...args) {
    const cbs = this.events[event];
    // 因为下方off会将this.events[event]重新赋值为null，所以需要判断一下
    if (!cbs) {
      console.log("没有当前事件", event);
      return this;
    }

    //遍历执行所有回调
    cbs.forEach((cb) => {
      cb(...args);
    });

    // 为了可以链式调用
    return this;
  }

  //监听，执行回调
  on(event, cb) {
    //如果events里面没有事件监听，那么就初始化为一个数组
    //为什么是数组，因为一个事件可能有多个监听，你触发一次，多个监听都会执行
    if (!this.events[event]) {
      this.events[event] = [];
    }
    this.events[event].push(cb);
    return this;
  }

  //移除监听回调
  off(event, cb) {
    if (!this.events[event]) {
      return;
    }

    if (!cb) {
      this.events[event] = null;
    } else {
      this.events[event] = this.events[event].filter((it) => it !== cb);
    }
  }

  /**
   * 注册一个只能执行一次的事件
   * @param {string} event 事件类型
   * @param {Function} cb 回调函数
   * @returns
   */
  once(event, cb) {
    if (!this.events[event]) {
      this.events[event] = [];
    }

    let self = this;
    function _once(...args) {
      cb.call(self, ...args);
      self.off(event, _once);
    }

    this.events[event].push(_once);
  }
}

const bus = new EventEmitter();
//累加求和
const add = (...args) => console.log(args.reduce((p, c) => p + c, 0));
//打印参数
const log = (...args) => console.log(...args);

// bus.on("add", add);
// bus.on("log", log);
// bus.emit("add", 1, 2); // 3
// bus.emit("log", "hi"); // hi
// bus.off("add");
// bus.emit("add", 1, 2); // 打印为空，因为已经off掉了
bus.once("onceAdd", add); //监听一次
bus.emit("onceAdd", 1, 2, 3, 4); //10
bus.emit("onceAdd", 1, 2, 3, 4, 5); //打印为空，
