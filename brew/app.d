import std.file : writeFile = write, readFile = readText;
import std.stdio;
import std.array;
import std.conv;
import std.range;
import std.parallelism;
import brew.parse;
import brew.comp;
import brew.ast;
import brew.vm;
import brew.fastcomp;

version = fast;

Opcode[] fastCompile(string src)
{
	FastParser parser = FastParser();
	parser.state = FastParseState(src);
	parser.readDefs();
	return parser.ops;
}

Opcode[] optCompile(string src) 
{
	Parser parser = Parser();
	parser.state = ParseState(src);
	Node ast = parser.readDefs();
	return compile(ast);
}

void main(string[] args)
{
	args = args[1 .. $];
	if (args.length == 0)
	{
		throw new Exception("args: [input] [output]\n");
	}
	size_t count = 1;
	bool run = false;
	bool opt = false;
	while (args[0][0] == '-')
	{
		switch (args[0])
		{
		case "-O":
			opt = true;
			args = args[1 .. $];
			break;
		case "-r":
			run = true;
			args = args[1 .. $];
			break;
		case "-n":
			args = args[1 .. $];
			count = args[0].to!size_t;
			args = args[1 .. $];
			break;
		default:
			throw new Exception("unknown option: " ~ args[0]);
		}
	}
	string src = args[0].readFile;
	Opcode[] res;
	foreach (index; 0 .. count)
	{
		if (opt)
		{
			res = optCompile(src);
		}
		else
		{
			res = fastCompile(src);
		}
	}
	if (res is null)
	{
		return;
	}
	if (run)
	{
		runvm(res);
	}
	else
	{
		FileOpcode[] ops;
		foreach (op; res)
		{
			ops ~= cast(FileOpcode) op;
		}
		File("out.bc", "wb").rawWrite(ops);
	}
}
