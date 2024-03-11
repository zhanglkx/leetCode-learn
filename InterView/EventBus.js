class Bus {
  constructor() {
    let busList = [];
  }

  addListener(type, fun) {
    if (!this.busList[type]) {
      this.busList[type] = [];
    }
    this.busList[type].push(fun);
  }

  trigger(type, arg) {
    if (!this.busList[type]) {
      return;
    }
    this.busList[type].forEach((element) => {
      element.bind(this, arg);
    });
  }

  removeListener(type) {
    if (this.busList[type]) {
      this.busList[type] = [];
    }
  }
}
