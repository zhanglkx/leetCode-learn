function flat(arr) {
  let res = [];

  for (let i = 0; i < arr.length; i++) {
    if (Array.isArray(arr[i])) {
      res = res.concat(flat(arr[i]));
    } else {
      res.push(arr[i]);
    }
  }
  return res;
}

  
// 去重  
let unique = [...new Set(flat(arr))]; // 使用 Set 数据结构自动去重，然后再转回数组  
  
// 排序  
let sorted = unique.sort((a, b) => a - b); // 对数字数组进行排序  
  
console.log(sorted); // 输出 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

let arr = [[1, 2, 2], [3, 4, 5, 5], [6, 7, 8, 9, [11, 12, [12, 13, [14]]]], 10];
// newArr = [1, 2, 3, 4, 5, 6, 7 ,8, 9, 10, 11, 12, 13, 14];

console.log(flat(arr));
