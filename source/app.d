import std.stdio;

import std.stdio;
import std.file;
import brew.parse;

void main(string[] args) {
	Parser parser = new Parser();
	parser.state = new ParseState(args[1].readText);
	parser.readDefs();
}
