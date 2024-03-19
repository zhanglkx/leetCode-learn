function test() {
  console.log(this.a);
}

var obj = {};
obj.a = 1;
obj.m = test;
obj.m(); // output: 1
