package decaf;
import org.antlr.symtab.FunctionSymbol;
import org.antlr.symtab.GlobalScope;
import org.antlr.symtab.LocalScope;
import org.antlr.symtab.Scope;
import org.antlr.symtab.VariableSymbol;
import org.antlr.symtab.Symbol;
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeProperty;


/**
 * This class defines basic symbols and scopes for Decaf language
 */
public class DecafSymbolsAndScopes extends DecafParserBaseListener {
    ParseTreeProperty<Scope> scopes = new ParseTreeProperty<Scope>();
    GlobalScope globals;
    Scope currentScope; // define symbols in this scope

    @Override
    public void enterProgram(DecafParser.ProgramContext ctx) {
        globals = new GlobalScope(null);
        pushScope(globals);
    }

    @Override
    public void exitProgram(DecafParser.ProgramContext ctx) {
        System.out.println(globals);
    }

    @Override
    public void enterMethod_decl(DecafParser.Method_declContext ctx) {
        String name = ctx.ID().getText();
        //int typeTokenType = ctx.type().start.getType();
       // DecafSymbol.Type type = this.getType(typeTokenType);

        // push new scope by making new one that points to enclosing scope
        FunctionSymbol function = new FunctionSymbol(name);
         //function.setType(type); // Set symbol type

        currentScope.define(function); // Define function in current scope
        saveScope(ctx, function);
        pushScope(function);
    }

    @Override
    public void exitMethod_decl(DecafParser.Method_declContext ctx) {
        popScope();
    }

    @Override
    public void enterBlock(DecafParser.BlockContext ctx) {
        LocalScope l = new LocalScope(currentScope);
        saveScope(ctx, currentScope);
         //pushScope(l);
    }

    @Override
    public void exitBlock(DecafParser.BlockContext ctx) {
        //popScope();
    }

    @Override
    public void enterField_decl(DecafParser.Field_declContext ctx) {
        defineVar(ctx.type(), ctx.ID().getSymbol());
    }

    @Override
    public void exitField_decl(DecafParser.Field_declContext ctx) {
        String name = ctx.ID().getSymbol().getText();
        Symbol var = currentScope.resolve(name);
        if ( var==null ) {
            this.error(ctx.ID().getSymbol(), "no such variable: "+name);
        }
        if ( var instanceof FunctionSymbol ) {
            this.error(ctx.ID().getSymbol(), name+" is not a variable");
        }
    }

    void defineVar(DecafParser.TypeContext typeCtx, Token nameToken) {
        int typeTokenType = typeCtx.start.getType();
        VariableSymbol var = new VariableSymbol(nameToken.getText());

        //DecafSymbol.Type type = this.getType(typeTokenType);
         //var.setType(type);

        currentScope.define(var); // Define symbol in current scope
    }
 @Override
    public void enterPar(DecafParser.ParContext ctx) {
        defineVar(ctx.type(), ctx.ID().getSymbol());

    }

    @Override
    public void exitPar(DecafParser.ParContext ctx) {
        String name = ctx.ID().getSymbol().getText();
        Symbol var = currentScope.resolve(name);
        if (var == null) {
            this.error(ctx.ID().getSymbol(), "no such variable: " + name);
        }
        if (var instanceof FunctionSymbol) {
            this.error(ctx.ID().getSymbol(), name + " is not a variable");
        }

    }
  @Override
    public void enterAssign_op(DecafParser.Assign_opContext ctx) {

    }

    @Override
    public void exitAssign_op(DecafParser.Assign_opContext ctx) {
    }

    @Override
    public void enterVar(DecafParser.VarContext ctx) {
        defineVar(ctx.type(), ctx.ID().getSymbol());

    }

    @Override
    public void exitVar(DecafParser.VarContext ctx) {

        String name = ctx.ID().getSymbol().getText();
        Symbol var = currentScope.resolve(name);
        if (var == null) {
            this.error(ctx.ID().getSymbol(), "no such variable: " + name);
        }
        if (var instanceof FunctionSymbol) {
            this.error(ctx.ID().getSymbol(), name + " is not a variable");
        }

    }

    @Override
    public void enterType(DecafParser.TypeContext ctx) {
    }

    @Override
    public void exitType(DecafParser.TypeContext ctx) {
    }

    @Override
    public void enterStatement(DecafParser.StatementContext ctx) {
    }

    @Override
    public void exitStatement(DecafParser.StatementContext ctx) {
    }

    @Override
    public void enterMethod_call(DecafParser.Method_callContext ctx) {
    }

    @Override
    public void exitMethod_call(DecafParser.Method_callContext ctx) {
    }

    @Override
    public void enterLocation(DecafParser.LocationContext ctx) {
    }

    @Override
    public void exitLocation(DecafParser.LocationContext ctx) {
    }

    @Override
    public void enterExpr(DecafParser.ExprContext ctx) {
    }

    @Override
    public void exitExpr(DecafParser.ExprContext ctx) {
    }

    @Override
    public void enterMethod_name(DecafParser.Method_nameContext ctx) {
    }

    @Override
    public void exitMethod_name(DecafParser.Method_nameContext ctx) {
    }

    @Override
    public void enterCall_arg(DecafParser.Call_argContext ctx) {
    }

    @Override
    public void exitCall_arg(DecafParser.Call_argContext ctx) {
    }

    @Override
    public void enterBin_op(DecafParser.Bin_opContext ctx) {
    }

    @Override
    public void exitBin_op(DecafParser.Bin_opContext ctx) {
    }

    @Override
    public void enterAr(DecafParser.ArContext ctx) {

    }

    @Override
    public void exitAr(DecafParser.ArContext ctx) {
    }

    @Override
    public void enterRel(DecafParser.RelContext ctx) {
    }

    @Override
    public void exitRel(DecafParser.RelContext ctx) {
    }

    @Override
    public void enterEq(DecafParser.EqContext ctx) {
    }

    @Override
    public void exitEq(DecafParser.EqContext ctx) {
    }

    @Override
    public void enterCond(DecafParser.CondContext ctx) {
    }

    @Override
    public void exitCond(DecafParser.CondContext ctx) {
    }

    @Override
    public void enterLiteral(DecafParser.LiteralContext ctx) {
    }

    @Override
    public void exitLiteral(DecafParser.LiteralContext ctx) {
    }

    @Override
    public void enterInt_literal(DecafParser.Int_literalContext ctx) {
    }

    @Override
    public void exitInt_literal(DecafParser.Int_literalContext ctx) {
    }

    @Override
    public void enterDec(DecafParser.DecContext ctx) {
    }

    @Override
    public void exitDec(DecafParser.DecContext ctx) {
    }

    @Override
    public void enterHex(DecafParser.HexContext ctx) {
    }

    @Override
    public void exitHex(DecafParser.HexContext ctx) {
    }

    @Override
    public void enterBool_literal(DecafParser.Bool_literalContext ctx) {
    }

    @Override
    public void exitBool_literal(DecafParser.Bool_literalContext ctx) {
    }

    @Override
    public void enterChar_literal(DecafParser.Char_literalContext ctx) {
    }

    @Override
    public void exitChar_literal(DecafParser.Char_literalContext ctx) {
    }

    @Override
    public void enterString_literal(DecafParser.String_literalContext ctx) {
    }

    @Override
    public void exitString_literal(DecafParser.String_literalContext ctx) {
    }


  
    /**
     * Método que atuliza o escopo para o atual e imprime o valor
     *
     * @param s
     */
    private void pushScope(Scope s) {
        currentScope = s;
        System.out.println("entering: "+currentScope.getName()+":"+s);
    }

    /**
     * Método que cria um novo escopo no contexto fornecido
     *
     * @param ctx
     * @param s
     */
    void saveScope(ParserRuleContext ctx, Scope s) {
        scopes.put(ctx, s);
    }

    /**
     * Muda para o contexto superior e atualia o escopo
     */
    private void popScope() {
        System.out.println("leaving: "+currentScope.getName()+":"+currentScope);
        currentScope = currentScope.getEnclosingScope();
    }

    public static void error(Token t, String msg) {
        System.err.printf("line %d:%d %s\n", t.getLine(), t.getCharPositionInLine(),
                msg);
    }

    /**
     * Valida tipos encontrados na linguagem para tipos reais
     *
     * @param tokenType
     * @return
     */
    public static DecafSymbol.Type getType(int tokenType) {
        switch ( tokenType ) {
            case DecafParser.VOID :  return DecafSymbol.Type.tVOID;
            case DecafParser.NPO :   return DecafSymbol.Type.tINT;
        }
        return DecafSymbol.Type.tINVALID;
    }


}
