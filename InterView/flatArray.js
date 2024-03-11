let data = [
  { id: 3, pid: 1, name: "零食区" },
  { id: 4, pid: 2, name: "大虾" },
  { id: 5, pid: 2, name: "猪肉" },
  { id: 6, pid: 13, name: "卫生纸" },
  { id: 7, pid: 3, name: "薯片" },
  { id: 8, pid: 7, name: "烧烤味" },
  { id: 9, pid: 7, name: "黄瓜味" },
  { id: 1, pid: 0, name: "超市" },
  { id: 2, pid: 0, name: "生鲜区" },
];

/**
 * 递归过滤数组，根据指定父节点id，构建具有子节点关系的结构。
 * @param {Array} arr - 原始数组，包含所有节点信息，每个节点应包含id和pid属性。
 * @param {Number} parent - 指定的父节点id，用于筛选子节点。
 * @return {Array} 返回一个数组，包含所有指定父节点下的子节点。
 */
function recurrenceFilter(arr, parent) {
  let result = [];
  for (const item of arr) {
    if (item.pid === parent) {
      let childArray = recurrenceFilter(arr, item.id);

      if (childArray.length) {
        item.child = childArray;
      }
      result.push(item);
    }
  }
  return result;
}

const result = recurrenceFilter(data, 0);

console.log(result);
