package decaf;

import java.io.*;
import java.util.Arrays;
import javax.swing.JFrame;
import javax.swing.JPanel;

import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java6035.tools.CLI.*;

class Main {

    private static String[] tokenStrings = {
      "", "PROGRAM", "LCURLY", "RCURLY", "LBRACKET", "RBRACKET", "LPARENTHESIS",
      "RPARENTHESIS", "COMMA", "SEMICOLON", "IF", "BOOLEAN", "BREAK", "CALLOUT", "CLASS",
      "CONTINUE", "ELSE", "FOR", "INT", "RETURN", "VOID", "OP_ASSIGN", "OP_ARITH", "OP_REL",
      "OP_EQ", "OP_COND", "BOOLEANLITERAL", "CHARLITERAL", "STRINGLITERAL", "ID", "ALPHA_NUM",
      "NONZERODIGIT", "DIGIT", "HEX_PREFIX", "HEX_DIGIT", "BIN_DIGIT", "BIN_PREFIX", "MINUS",
      "EXCLAMATION"
    };

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
		        			String type = tokenStrings[token.getType() -1];
		        			System.out.println (token.getLine() + " " + type + " " + token.getText());
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

            ParseTree tree = parser.program();

            if (CLI.debug) {
                // Se estiver no modo debug imprime a Ã¡rvore de parsing
                // Create Tree View
                // Source: https://stackoverflow.com/questions/23809005/how-to-display-antlr-tree-gui


                //show AST in console
                System.out.println(tree.toStringTree(parser));

                //show AST in GUI
                JFrame frame = new JFrame("Antlr AST");
                JPanel panel = new JPanel();
                TreeViewer viewr = new TreeViewer(Arrays.asList(
                        parser.getRuleNames()),tree);
                viewr.setScale(1.5);//scale a little
                panel.add(viewr);
                frame.add(panel);
                frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame.setSize(200,200);
                frame.setVisible(true);
            }
        	}
        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}
