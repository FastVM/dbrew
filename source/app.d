import std.file;
import brew.parse;
import brew.comp;
import brew.ast;

void main(string[] args) {
	Parser parser = new Parser();
	parser.state = new ParseState(args[1].readText);
	Node ast = parser.readDefs();
	string res = compile(ast);
	"out.c".write(cast(void[]) res);
}
