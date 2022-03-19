import core.stdc.stdio;
import core.stdc.stdlib;
import core.stdc.string;
import core.stdc.ctype;
import brew.util;
import brew.parse;
import brew.comp;
import brew.ast;
import brew.vm;
import brew.opt;

Array!Opcode optCompile(Array!char src) {
	Parser parser = Parser();
	parser.state = ParseState(src);
	Array!Form ast = parser.readDefs();
	return compile(ast.allopt);
}

extern(C) int main(int argc, const(char*)* args) {
	if (argc <= 1) {
		printf("args: [input] [output]\n");
		return 1;
	}
	size_t count = 1;
	bool run = false;
	while (args[1][0] == '-') {
		if (!strcmp(args[1], "-r")) {
			run = true;
			args += 1;
		} else {
			printf("unknown option: %s\n", args[1]);
			return 1;
		}
	}
	Array!char src;
	{
		FILE* fp = fopen(args[1], "r");
		scope(exit) fclose(fp);
		while (!feof(fp)) {
			char chr = cast(char) fgetc(fp);
			if (isprint(chr)) {
				src ~= chr;
			}
		}
	}
	Array!Opcode res;
	foreach (index; 0 .. count) {
		res = optCompile(src);
	}
	if (res.length == 0) {
		printf("compiler failed to compile: empty buffer\n");
		return 1;
	}
	if (run) {
		int nargs = 0;
		while (args[nargs] != null) {
			nargs += 1;
		}
		runvm(res, nargs, args);
	} else {
		Array!FileOpcode ops;
		foreach (op; res) {
			ops ~= cast(FileOpcode) op;
		}
		{
			FILE* output = fopen("out.bc", "wb");
			scope(exit) fclose(output);
			foreach (op; ops) {
				fwrite(ops.ptr, FileOpcode.sizeof, ops.length, output);
			}
		}
	}
	return 0;
}
