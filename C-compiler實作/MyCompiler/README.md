# MyCompiler
A simple C compiler.
## 實作架構
![](https://i.imgur.com/UNZYE8c.png)

- 平台: ubuntu、github協作做版本管理，保證流程正確、保存編輯紀錄
- 工具: LLVM、Flex、Bison
- 語言: c編譯器
- 目標: 完整性>速度>跨平台 (可參考 https://github.com/AnjaneyaTripathi/c-compiler, https://medium.com/@zetavg/%E7%B7%A8%E8%AD%AF%E5%99%A8-llvm-%E6%B7%BA%E6%B7%BA%E7%8E%A9-42a58c7a7309#1000)
## 分工
### 凱毅: 
詞法分析器(Lexer)和語法分析器(Parser) 工具：Yacc、Lex/FLex、Bison
- 詞法分析器，將源代碼分解為 tokens 的規則和實現。
- 語法分析器，將 tokens 組織成抽象語法樹（AST）的規則和實現。
- 錯誤報告機制，用於處理語法錯誤和提示。
### 紀如: 
語義分析、LLVM中間碼生成 工具:LLVM
- 型別檢查和語義檢查的實現，以確保代碼的合法性。
- 符號表（Symbol Table），用於存儲變量和函數的信息。
- 將AST轉換為中間表示（IR）的方法，轉換為LLVM IR。
### 子中:
優化和代碼生成、版本管理、統整(ppt、word、github、協調分工) 工具:LLVM
- 選擇和實現針對IR的優化方法，如常量傳播、死代碼消除等。
- 將優化後的IR轉換為目標平台的機器碼或組合語言的方法。  
## 日程分配
1. 預計5/22報告
2. 第三個禮拜(5/7-5/13那週)要有成品
3. 5/12第一次測試 (PM 8:00線上討論測試)
4. 5/19第二次測試加最後確認(PM 8:00線上討論測試)
5. 5/20、5/21做ppt和word

## Implementation 1 (LEX + YACC)
### 架構
<img width="689" alt="截圖 2023-05-12 下午10 29 26" src="https://github.com/NightLightTw/MyCompiler/assets/78789817/05fc589b-27e9-4f07-9253-d8b5a5c5cc9c">

### Requirement
```
sudo apt-get install flex bison
```

### Commands
```bash
lex lexer.l
yacc -d parser.y
cc lex.yy.c y.tab.c
./a.out < input1.c
```

For more information, please visit [here](https://github.com/AnjaneyaTripathi/c-compiler/blob/a1818231840cea321e701957ff0a0dfa2472a159/README.md).

## Implementation 2 (GCC + LLVM)
### 架構
![llvm架構](https://github.com/NightLightTw/MyCompiler/assets/78789817/4c6edebc-7be5-489d-9347-74fe04b73f20)

### Requirement
```
sudo apt-get install clang llvm
```

### Commands
```
# GCC 
gcc -S input4.c -o input_gcc.s
gcc -c input4_gcc.s -o input4_llvm_gcc.o
gcc input4_llvm_gcc.o -o input4_llvm_gcc
```
## Implementation 3 (CLANG + LLVM)
### 架構
<img width="1016" alt="截圖 2023-05-12 下午10 29 38" src="https://github.com/NightLightTw/MyCompiler/assets/78789817/c689c797-bb46-4aa4-ab59-c7aabedbbafb">


### Requirement
```
sudo apt-get install clang llvm
```
### Commands
```bash
# generate .ll file
clang -S -emit-llvm -Xclang -disable-O0-optnone input4.c

# optimization
opt -S -mem2reg input4.ll -o input4_opt.ll

# generate assembly file
llc input4.ll -o input4_llvm.s
llc input4_opt.ll -o input4_opt_llvm.s

# generate object file
as --64 -o input4_llvm_as.o input4_llvm.s

# generate executable file
# -dynamic-linker: dynamic linker shared library
# -lc: link with C standard library (libc.so)
ld input4_llvm_as.o -o input4_llvm_as -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc # Error:cannot find entry symbol
ld input4_llvm_as.o -o input4_llvm_as -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc -e main # Error:Segmentation fault (core dumped)

# generate start object file (call main() and exit() system call)
as --64 start.s -o start.o
ld start.o input4_llvm_as.o -o input4_llvm_as -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc
```
## 自動化腳本
最基本的腳本（沒有優化）
### Commands
```bash
# 使用chmod命令賦予llvm_base.sh執行權限。
chmod +x llvm_base.sh
#使用time估計時間
time ./llvm_base.sh <file.c>
```
### llvm_base.sh(Linux)
```bash=
# Get the input file name
input_file="$1"
base_name=$(basename "$input_file" .c)

# Generate .ll file
clang -S -emit-llvm -Xclang -disable-O0-optnone "$input_file"

# Perform optimization
opt -S "${base_name}.ll" -o "${base_name}_opt.ll"

# Generate assembly file
llc "${base_name}_opt.ll" -o "${base_name}_opt_llvm.s"

# Generate object files
as --64 -o "${base_name}_opt_llvm_as.o" "${base_name}_opt_llvm.s"
as --64 start.s -o start.o
ld start.o "${base_name}_opt_llvm_as.o" -o "${base_name}_opt_llvm_as" -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

# Run the output
./"${base_name}_opt_llvm_as"
```
### llvm_base_macos.sh(MacOS)
移除了start.s的使用，使用clang取代ld
```bash=
# Check for the input file
if [ $# -eq 0 ]
  then
    echo "No input file specified"
    exit 1
fi

# Get the input file name
input_file="$1"
base_name=$(basename "$input_file" .c)

# Generate .ll file
clang -S -emit-llvm -Xclang -disable-O0-optnone "$input_file"

# Perform optimization
opt -S "${base_name}.ll" -o "${base_name}_opt.ll"

# Generate assembly file
llc "${base_name}_opt.ll" -o "${base_name}_opt_llvm.s"

# Generate object files
as -o "${base_name}_opt_llvm_as.o" "${base_name}_opt_llvm.s"

# Link object files(ld->clang)
clang -o "${base_name}_opt_llvm_as" "${base_name}_opt_llvm_as.o"

# Run the output
./"${base_name}_opt_llvm_as"
```
## 測試資料
### input4.c
這個檔案測試最基本的語法，測試編譯器是否會有錯誤。
```c=
#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int main() {
    int a = 1;
    int b = 2;
    printf("a = %d\n", a);
    printf("b = %d\n", b);

    int a_plus_b = add(a, b);
    printf("a + b = %d\n", a_plus_b);

    return 0;
}
```
### mmd_serial改.c 
這個檔案透過迴圈進行矩陣相乘。
```c=
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
double **a, **b, **c;

double matrixMult(int n)
{
int i, j, k;

   for (i=0; i<n; i++) {
      for (j=0; j<n; j++) {
         c[i][j] = 0.0;
         for (k=0; k<n; k++)
            c[i][j] += a[i][k] * b[k][j];
      }
   }
}  
/* end of matrixMult */

void print(int n)
{
int i, j;

   for (i=0; i<n; i++){
      for (j=0; j<n; j++)
         printf("%f ", c[i][j]);
      putchar('\n');
   }
}

int main()
{
int size, i, j;
 
   size = 2048;
  /* allocate a, b, and c to be n by n matrices */

   a = (double **)malloc(sizeof(double)*size);
   b = (double **)malloc(sizeof(double)*size);
   c = (double **)malloc(sizeof(double)*size);

   for (i=0; i<size; i++) {
      a[i] = (double*)malloc(sizeof(double)*size);
      b[i] = (double*)malloc(sizeof(double)*size);
      c[i] = (double*)malloc(sizeof(double)*size);
   } 

/* initialize a, b, c */

   for (i=0; i<size; i++) {
      for (j=0; j<size; j++) {
         a[i][j] = 2.0;
         b[i][j] = 5.0;
         c[i][j] = 0.0;
     }
   }
  matrixMult(size);
 
/* print results */
/* print(size);*/ 
   printf("%f\n", c[size-1][size-1]);
   free(a);
   free(b);
   free(c);
   exit(0);
} /* end of main */

```
### quickSort.c
這個檔案使用quickSort排序1~10000的倒序陣列
```c=
#include <stdio.h>

void swap(int* a, int* b) {
    int t = *a;
    *a = *b;
    *b = t;
}

int partition(int arr[], int low, int high) {
    int pivot = arr[high];
    int i = (low - 1);

    for (int j = low; j <= high - 1; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return (i + 1);
}

void quickSort(int arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

void printArray(int arr[], int size) {
    int i;
    for (i = 0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[10000];

    // Initialize array with numbers from 1 to 100 in reverse order
    for (int i = 0; i < 10000; i++)
        arr[i] = 10000 - i;

    int n = sizeof(arr) / sizeof(arr[0]);
    quickSort(arr, 0, n - 1);
    printf("Sorted array: \n");
    printArray(arr, n);
    return 0;
}

```
### fibonacci.c
這個檔案使用簡單迴圈計算出第N個費波那契數，其中N是一個較大的數字EX:50
```c=
#include <stdio.h>

// Function to calculate the nth Fibonacci number
long long fib(int n) {
    if (n <= 0)
        return 0;
    else if (n == 1)
        return 1;
    else
        return fib(n - 1) + fib(n - 2);
}

int main() {
    int n = 50;
    printf("Fibonacci number #%d: %lld\n", n, fib(n));
    return 0;
}

```
### pi.c
這個檔案使用蒙特卡洛方法來估計圓周率。
通過隨機生成大量的點在一個單位正方形內，然後計算這些點落在單位圓內的比例，從而得到π的估計值。由於此方法的精度與隨機點的數量成正比，因此可以通過增加迭代次數來提高精度。
```c=
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function to generate random float numbers in range [0, 1]
double randomFloat() {
    return (double)rand() / RAND_MAX;
}

int main() {
    srand(time(0));

    int interval = 100000;
    int circlePoints = 0, squarePoints = 0;

    for (int i = 0; i < (interval * interval); i++) {
        double randX = randomFloat();
        double randY = randomFloat();

        // Distance between (randX, randY) from the origin
        if (randX * randX + randY * randY <= 1)
            circlePoints++;

        squarePoints++;

        // Estimated Pi after this iteration
        if (i % interval == 0 && i != 0) // Exclude the first iteration
            printf("Estimate after %d iterations: %f\n", i, (double)4 * circlePoints / squarePoints);
    }

    // Final estimate
    double pi = (double)4 * circlePoints / squarePoints;
    printf("Final estimate of Pi = %f\n", pi);

    return 0;
}

```
## 可視化
### linux測試結果
![linux](https://github.com/NightLightTw/MyCompiler/assets/78789817/69120479-4e86-488f-a260-6ac62ee425f2)

### MacOS測試結果
![macos](https://github.com/NightLightTw/MyCompiler/assets/78789817/2efd8ce5-78ff-4ba2-b179-3d8afc3d28f8)

For more information, please visit below links: 
* [LLVM-Clang编译器安装和使用](https://blog.csdn.net/rikeyone/article/details/100020145)
* [編譯器 LLVM 淺淺玩](https://medium.com/@zetavg/%E7%B7%A8%E8%AD%AF%E5%99%A8-llvm-%E6%B7%BA%E6%B7%BA%E7%8E%A9-42a58c7a7309)
* [LLVM opt mem2reg has no effect](https://stackoverflow.com/questions/46513801/llvm-opt-mem2reg-has-no-effect)
* [Segmentation fault (core dumped)](https://stackoverflow.com/questions/6608957/using-dynamic-linker-with-a-linker-script)
* [ANSI C grammar](https://www.quut.com/c/ANSI-C-grammar-l-2011.html)

Debug
For Ubuntu 22.04 user which meet error with `cc lex.yy.c y.tab.c`
* [How to switch between multiple GCC and G++ compiler versions on Ubuntu 22.04 LTS Jammy Jellyfish](https://linuxconfig.org/how-to-switch-between-multiple-gcc-and-g-compiler-versions-on-ubuntu-22-04-lts-jammy-jellyfish)

