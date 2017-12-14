// get-hyperlinks.c
// evert mouw <post@evert.net>
// 2007-04-07
// extracts HTTP hyperlinks from stdin
// no httpS, links omitting http, or whatever,
// just very simple http

#include <stdio.h>

int main() {

	char c;
	const char begin[8] = "http://";
	const int beginlength = 7;
	int i = 0;
	int j;
	int output = 0;

	while ( c != EOF ) {

		c = getchar();

		// recognize end sequence
		if ( output == 1 && ( c=='"' || c==' ' ) ) {
			output = 0;
			i = 0;
			putchar('\n');
		}

		// do actual outputting
		if ( output ) putchar(c);

		// recognize begin sequence
		if ( output == 0 && c == begin[i] ) {
			i++;
			if ( i == beginlength ) {
				// we have a match, start outputting!
				// put or begin sequence back
				for (j=0;j<beginlength;j++) {
					putchar(begin[j]);
				}
				// activate outputting
				output = 1;
			}
		}

	}

	return 0;
}
