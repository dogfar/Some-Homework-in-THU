package decaf.frontend.symbol;

import decaf.frontend.scope.ClassScope;
import decaf.frontend.scope.LambdaScope;
import decaf.frontend.tree.Pos;
import decaf.frontend.type.FunType;

public final class LambdaSymbol extends Symbol {
    public FunType type;

    public final LambdaScope scope;

    public final ClassSymbol owner;

    @Override
    public ClassScope domain() {
        return (ClassScope) definedIn;
    }

    public LambdaSymbol(LambdaScope scope, String name, Pos pos,
                        ClassSymbol owner) {
        super(name, pos);
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
