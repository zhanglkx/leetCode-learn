function fibonacci(n) {
  if (n === 0) {
    return 0;
  } else if (n === 1) {
    return 1;
  } else {
    return fibonacci(n - 2) + fibonacci(n - 1);
  }
}

console.log(fibonacci(0)); // 0
console.log(fibonacci(10)); // 1
console.log(fibonacci(2)); // 1