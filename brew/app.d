
import std.file;
import brew.parse;
import brew.comp;
import brew.ast;

void main(string[] args) {
	if (args.length != 3) {
		throw new Exception("args: [input] [output]\n");
	}
	Parser parser = Parser();
	parser.state = ParseState(args[1].readText);
	Node ast = parser.readDefs();
	string res = compile(ast);
	args[2].write(cast(void[]) res);
}
