function mtNew(object, ...args) {
  let obj = Object.create(object.prototype);

  const ret = object.apple(obj, ...args);

  return ret instanceof Object ? ret : obj;
}
