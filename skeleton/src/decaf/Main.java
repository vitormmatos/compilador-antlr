package decaf;

import java.io.*;
//import antlr.Token;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import java6035.tools.CLI.*;

class Main {
    public static void main(String[] args) {
        try {
        	CLI.parse (args, new String[0]);

        	InputStream inputStream = args.length == 0 ?
                    System.in : new java.io.FileInputStream(CLI.infile);

        	if (CLI.target == CLI.SCAN)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
        		Token token;
        		boolean done = false;
        		while (!done)
        		{
        			try
        			{
		        		for (token=lexer.nextToken(); token.getType()!=Token.EOF; token=lexer.nextToken())
		        		{
		        			String type = "";
		        			String text = token.getText();

		        			switch (token.getType())
		        			{
		        			case DecafLexer.STRINGS:
		        				type = " STRING";
		        				break;
                  case DecafLexer.ID:
  		        			type = " ID";
  		        			break;
                  case DecafLexer.CHAR_VARIABLES:
  		        			type = " CHAR";
  		        			break;
                  case DecafLexer.NUMBERS:
  		        			type = " NUMBER";
  		        			break;
                  case DecafLexer.FLOAT:
  		        			type = " FLOAT";
  		        			break;
                  case DecafLexer.HEXADECIMALS:
  		        			type = " HEXADECIMAL";
  		        			break;
                  case DecafLexer.TOKENS:
  		        			type = " TOKEN";
  		        			break;
                  case DecafLexer.BINARY:
  		        			type = " BINARY";
  		        			break;
                  case DecafLexer.OPERATOR:
  		        			type = " OPERATOR";
  		        			break;
		        			 }
		        			System.out.println (token.getLine() + type + " " + text);
		        		}
		        		done = true;
        			} catch(Exception e) {
        	        	// print the error:
        	            System.out.println(CLI.infile+" "+e);
        	            lexer.skip();
        	        }
        		}
        	}
        	else if (CLI.target == CLI.PARSE || CLI.target == CLI.DEFAULT)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
        		DecafParser parser = new DecafParser(tokens);
                parser.program();
        	}

        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}
