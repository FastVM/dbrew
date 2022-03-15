import std.file : writeFile = write, readFile = readText;
import std.stdio;
import std.array;
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
	Parser parser = Parser();
	parser.state = ParseState(args[1].readFile);
	Node ast = parser.readDefs();
	Opcode[] res = compile(ast);
	run(res);
}
