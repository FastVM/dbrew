import std.file;
import brew.parse;
import brew.comp;
import brew.ast;

void main(string[] args) {
	if (args.length != 3) {
		throw new Exception("takes an input and an output");
	}
	Parser parser = new Parser();
	parser.state = new ParseState(args[1].readText);
	Node ast = parser.readDefs();
	string res = compile(ast);
	args[2].write(cast(void[]) res);
}
