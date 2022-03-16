import std.file : writeFile = write, readFile = readText;
import std.stdio;
import std.array;
import std.range;
import std.parallelism;
import brew.parse;
import brew.comp;
import brew.ast;
import brew.vm;

void main(string[] args)
{
	if (args.length != 2)
	{
		throw new Exception("args: [input] [output]\n");
	}
	string src = args[1].readFile;
	Parser parser = Parser();
	parser.state = ParseState(src);
	Node ast = parser.readDefs();
	Opcode[] res = compile(ast);
	runvm(res);
}
