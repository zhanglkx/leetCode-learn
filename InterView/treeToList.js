function treeToList(tree) {
  let queen = [];
  let out = [];

  queen = queen.concat(tree);
  while (queen.length) {
    let item = queen.shift();

    if (item.children) {
      queen = queen.concat(item.children);
      delete item["children"];
    }
    out.push(item);
  }

  return out;
}
let tree = [
  {
    id: 1,
    pid: "-1",
    children: [
      { id: 11, pid: "1", children: [] },
      { id: 12, pid: "1", children: [] },
    ],
  },
];
let res = treeToList(tree); //[{"id":1,"pid":"-1"},{"id":11,"pid":"1"},{"id":12,"pid":"1"}]
console.log(res);
