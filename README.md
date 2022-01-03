# Following along with code examples from [this book](https://www.amazon.com/Low-Level-Programming-Assembly-Execution-Architecture-ebook/dp/B073GN6V7P/ref=tmm_kin_swatch_0?_encoding=UTF8&qid=&sr=)

## Build Command Examples

```bash
nasm -felf64 ch02_hello.asm -o ./build/hello.o 
ld -o ./build/hello ./build/hello.o 
chmod u+x ./build/hello # only if necessary
```

## Required Dependencies

* A linux machine, virtual machine, or a WSL instance if on windows (I use Ubuntu)
* `NASM`, `make`, `gcc`, `gdb`, and a text editor (I am using `VS Code`, or `vim` if I am feeling frisky)
