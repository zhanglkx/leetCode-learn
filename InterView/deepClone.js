function DeepClone(obj, hash = new Map()) {
  if (typeof obj !== "object" || obj === null) {
    return obj;
  }
  if (hash.has(obj)) {
    return hash.get(obj); // 如果已经克隆过，则直接返回克隆后的对象
  }
  const cloneObj = Array.isArray(obj) ? [] : {}; // 根据类型判断是数组还是对象
  hash.set(obj, cloneObj); // 记录克隆过的对象
  for (const key in obj) {
    if (obj.hasOwnProperty(key)) {
      cloneObj[key] = DeepClone(obj[key], hash); // 递归克隆
    }
  }
  console.log(hash);
  return cloneObj;
}

// 示例使用
const obj = { a: 1, b: { c: 2 } };
obj.b.d = obj; // 创建一个循环引用
const newObj = DeepClone(obj);
// console.log(newObj);
