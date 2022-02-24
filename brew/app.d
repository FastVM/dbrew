import std.file : writeFile = write, readFile = readText;
import std.stdio;
import std.array;
import brew.parse;
import brew.comp;
import brew.ast;
import brew.fold;

void main(string[] args)
{
	if (args.length != 3)
	{
		throw new Exception("args: [input] [output]\n");
	}
	Parser parser = Parser();
	parser.state = ParseState(args[1].readFile);
	Node ast = parser.readDefs();
	Folder folder;
	folder.mark(ast);
	ast = folder.foldAll(ast);
	string res = compile(ast);
	writeFile(args[2], cast(void[]) res);
}
