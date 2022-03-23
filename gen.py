#!/usr/bin/env python3

import argparse

def ebwrite(file, n):
    file.write("(sub x y) ?\n")
    file.write("(add x y) ?\n")
    file.write("(lt x y) ?\n")
    for i in range(n):
        file.write(f"(fib{i} n) if lt 2 n n let n1 sub 1 n add fib{i} n1 fib{i} sub 1 n1\n")
    file.write("(main) 0\n")

def cwrite(file, n):
    for i in range(n):
        file.write(f"int fib{i}(int n){{if(n<2)return n;else{{int n1=n-1;return fib{i}(n1)+fib{i}(n1-1);}}}}\n")
    file.write(f"int main(){{}}\n")

langs = {
    "ebrew": ebwrite,
    "c": cwrite,
}

fileext = {
    "ebrew": ".eb",
    "c": ".c",
}

def rename_out(filename, lang):
    if "." not in filename.split("/")[-1]:
        return filename + fileext[lang]
    else:
        return filename.replace(".auto", fileext[lang])

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-l", dest="lang", default="ebrew", choices=langs.keys(), help="language to output")
    parser.add_argument("-o", dest="out", default="out.?", help="file to write to")
    parser.add_argument("-n", dest="num", default=1000, type=int, help="number of lines")
    args = parser.parse_args()
    output = rename_out(args.out, args.lang)
    with open(output, "w") as outfile:
        langs[args.lang](outfile, args.num)

if __name__ =="__main__":
    main()
