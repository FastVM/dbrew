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

void main(string[] args)
{
	args = args[1 .. $];
	if (args.length == 0)
	{
		throw new Exception("args: [input] [output]\n");
	}
	size_t count = 1;
	bool run = false;
	while (args[0][0] == '-')
	{
		if (args[0] == "-r")
		{
			run = true;
			args = args[1 .. $];
		}
		if (args[0] == "-n")
		{
			args = args[1 .. $];
			count = args[0].to!size_t;
			args = args[1 .. $];
		}
	}
	string src = args[0].readFile;
	Opcode[] res;
	foreach (index; 0 .. count)
	{
		Parser parser = Parser();
		parser.state = ParseState(src);
		Node ast = parser.readDefs();
		res = compile(ast);
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
