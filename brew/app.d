import brew.util;
import brew.parse;
import brew.vm;

version (WebAssembly) {
	extern(C) void __assert(const char *msg, const char *file, int line) {
		printf("ERROR: %s\n", msg);
	}
}

Array!Opcode optCompile(Array!char src) {
	Parser parser = Parser();
	parser.state = ParseState(cast(string) src.ptr[0..src.length]);
	parser.readDefs();
	// foreach (op; parser.ops) {
	// 	printf("%zu\n", op);
	// }
	return parser.ops;
}

extern(C) int main(int argc, const(char*)* args) {
	if (argc <= 1) {
		printf("args: [input] [output]\n");
		return 1;
	}
	size_t count = 1;
	version (WebAssembly) {
		bool run = true;
		bool read = false;
	} else {
		bool run = false;
		bool read = true;
	}
	while (args[1][0] == '-') {
		if (!strcmp(args[1], "-r")) {
			run = true;
			args += 1;
		} else if (!strcmp(args[1], "-i")) {
			read = false;
			args += 1;
		} else {
			printf("unknown option: %s\n", args[1]);
			return 1;
		}
	}
	Array!char src;
	if (read) {
		FILE* fp = fopen(args[1], "r");
		if (fp is null) {
			printf("could not open file: %s\n", args[1]);
			return 1;
		}
		scope(exit) fclose(fp);
		while (!feof(fp)) {
			char[2 ^^ 16] buf = void;
			size_t got = fread(buf.ptr, char.sizeof, buf.length, fp);
			foreach (chr; buf[0..got]) {
				if (isprint(chr)) {
					src ~= chr;
				}
			}
		}
	} else {
		while (args[1] !is null) {
			if (!strcmp(args[1], "--")) {
				args += 1;
				break;
			}
			size_t index = 0;
			while (args[1][index] != '\0') {
				src ~= args[1][index];
				index += 1;
			}
			args += 1;
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
		args += 1;
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
			if (output is null) {
				printf("could not open file: %s\n", args[1]);
				return 1;
			}
			scope(exit) fclose(output);
			fwrite(ops.ptr, FileOpcode.sizeof, ops.length, output);
		}
	}
	return 0;
}
