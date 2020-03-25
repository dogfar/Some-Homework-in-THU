package decaf.frontend.symbol;

import decaf.frontend.scope.ClassScope;
import decaf.frontend.scope.LambdaScope;
import decaf.frontend.tree.Pos;
import decaf.frontend.tree.Tree;
import decaf.frontend.type.FunType;
import decaf.frontend.type.BuiltInType;
import decaf.frontend.type.Type;
import java.util.ArrayList;
import java.util.List;

public final class LambdaSymbol extends MethodSymbol {
 //   public FunType type;

    public final LambdaScope scope;

    public final ClassSymbol owner;

    public List<VarSymbol> captured;

    public boolean hasThis = false;

    @Override
    public ClassScope domain() {
        return (ClassScope) definedIn;
    }

    public LambdaSymbol(LambdaScope scope, String name, Pos pos,
                        ClassSymbol owner) {
        super(name, new FunType(BuiltInType.NULL, new ArrayList<Type>()), scope, pos, new Tree.Modifiers(), null, owner);
        this.scope = scope;
        this.owner = owner;
        scope.setOwner(this);
    }

    @Override
    protected String str() {
        return String.format("function %s : %s", name, type);
    }

    @Override
    public boolean isLambdaSymbol() {
        return true;
    }
}
