/**
 * 给你一个字符串 s，找到 s 中最长的回文子串

如果字符串的反序与原始字符串相同，则该字符串称为回文字符串。

示例 1：

输入：s = "babad"
输出："bab"
解释："aba" 同样是符合题意的答案。
示例 2：

输入：s = "cbbd"
输出："bb"
 

提示：

1 <= s.length <= 1000
s 仅由数字和英文字母组成
 */

let maxLen = 0, tempLen = 0;

let left = right = 0;

var longestPalindrome = function (s) {

    if (s.length == 0 || s === null) {
        return0
    }

    for (let index = 0; index < s.length; index++) {
        tempLen = 1;
        if (!index == 0) {
            tempLen = ijEqual(0, index, s);
            console.log(tempLen)
        }
        maxLen = tempLen > maxLen ? tempLen : maxLen;
    }
    return maxLen;
};

function ijEqual(strLen, anchorPoint, str) {
    // 如果越界，返回lenth长度
    if ((anchorPoint - strLen > 0 && anchorPoint + strLen < str.length)) {

        if (str[anchorPoint - strLen] === str[anchorPoint + strLen]) {
            tempLen++;
            strLen++;
            strLen = ijEqual(strLen, anchorPoint, str)
        } else {
            return strLen;
        }

    }
    return strLen;
}
console.log("最长回文子串")
console.log(longestPalindrome("cbbbbbb"));
/**
 * 思路：采用左右指针，以for循环的index为锚点，先和左边计较，相同就左移一位，右边亦然，同时判断和左边，右边，以及左右两边是否相同，看同事能不能结合递归函数来实现
 */