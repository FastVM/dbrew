import brew.util;
import brew.parse;
import brew.comp;
import brew.ast;
import brew.vm;
import brew.opt;

version (WebAssembly) {
	extern (C) void exit(int c);

	extern (C) void __assert(const(char)* msg, const(char)* file, int line) {
		printf("err (file: %s, line: %i): %s\n", file, line, msg);
		exit(1);
	}
}

Array!Opcode optCompile(Array!char src) {
	Parser parser = Parser();
	parser.state = ParseState(src);
	Array!Form ast = parser.readDefs();
	scope (exit) {
		foreach (form; ast) {
			form.dealloc();
		}
		ast.dealloc();
	}
	return compile(ast.allopt);
}

extern (C) int main(int argc, const(char*)* args) {
	if (argc <= 1) {
		printf("args: [input] [output]\n");
		return 1;
	}
	size_t count = 1;
	bool run = true;
	bool read = true;
	bool jit = true;
	while (args[1][0] == '-') {
		switch (args[1][1]) {
		case 'd':
			run = false;
			args += 1;
			break;
		case 'i':
			read = false;
			args += 1;
			break;
		case 'n':
			args += 1;
			count = 0;
			for (size_t index = 0; args[1][index] != '\0'; index += 1) {
				count *= 10;
				count += args[1][index] - '0';
			}
			args += 1;
			break;
		case 'j':
			if (args[1][2] == 'o' && args[1][3] == 'n' && args[1][4] == '\0') {
				jit = true;
				args += 1;
			}
			if (args[1][2] == 'o' && args[1][3] == 'f' && args[1][4] == 'f' && args[1][5] == '\0') {
				jit = false;
				args += 1;
			}
			break;
		default:
			printf("unknown option: %s\n", args[1]);
			return 1;
		}
	}
	Array!Opcode res;
	scope (exit)
		res.dealloc;
	{
		Array!char src;
		scope (exit)
			src.dealloc();
		if (read) {
			FILE* fp;
			if (args[1] == "/dev/stdin") {
				fp = stdin;
			} else {
				fp = fopen(args[1], "r");
			}
			if (fp is null) {
				printf("could not open file: %s\n", args[1]);
				return 1;
			}
			scope (exit) {
				if (fp != stdin) {
					fclose(fp);
				}
			}
			while (true) {
				char[2048] buf;
				size_t got = fread(buf.ptr, char.sizeof, 2048, fp);
				foreach (chr; buf[0 .. got]) {
					if (chr < cast(char) 128 && chr != '\0') {
						src ~= chr;
					}
				}
				if (got != buf.length) {
					break;
				}
			}
		} else {
			while (args[1]!is null) {
				if (args[1][0] == '-' && args[1][1] == '-' && args[1][2] == '\0') {
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
		res = optCompile(src);
		if (res.length == 0) {
			printf("compiler failed to compile: empty buffer\n");
			return 1;
		}
	}
	if (run) {
		version (WebAssembly) {
			vm_run_arch_int(res.length, res.ptr);
		} else {
			if (jit) {
				vm_run_arch_x86(res.length, res.ptr);
			} else {
				vm_run_arch_int(res.length, res.ptr);
			}
		}
	} else {
		FILE* output = fopen("out.bc", "wb");
		if (output is null) {
			printf("could not open file: %s\n", args[1]);
			return 1;
		}
		scope (exit)
			fclose(output);
		fwrite(res.ptr, Opcode.sizeof, res.length, output);
	}
	return 0;
}
