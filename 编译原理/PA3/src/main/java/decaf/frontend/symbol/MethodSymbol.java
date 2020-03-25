package decaf.frontend.symbol;

import decaf.frontend.scope.ClassScope;
import decaf.frontend.scope.FormalScope;
import decaf.frontend.tree.Pos;
import decaf.frontend.tree.Tree;
import decaf.frontend.type.FunType;

import java.util.ArrayList;

/**
 * Method symbol, representing a method definition.
 */
public class MethodSymbol extends Symbol {

    public FunType type;

    /**
     * Associated formal scope of the method parameters.
     */
    public final FormalScope scope;

    public final Tree.Modifiers modifiers;

    public final ClassSymbol owner;

    public ArrayList<Tree.LocalVarDef> args;

    public MethodSymbol(String name, FunType type, FormalScope scope, Pos pos, Tree.Modifiers modifiers, ArrayList<Tree.LocalVarDef> args,
                        ClassSymbol owner) {
        super(name, type, pos);
        this.type = type;
        this.scope = scope;
        this.modifiers = modifiers;
        this.args = new ArrayList<Tree.LocalVarDef>();
        if(args != null)this.args.addAll(args);
        this.owner = owner;
        scope.setOwner(this);
    }

    @Override
    public ClassScope domain() {
        return (ClassScope) definedIn;
    }

    @Override
    public boolean isMethodSymbol() {
        return true;
    }

    @Override
    protected String str() {
        var modStr = modifiers.toString();
        if (!modStr.isEmpty()) modStr += " ";
        return modStr + String.format("function %s : %s", name, type);
    }

    /**
     * Is it a main function?
     *
     * @return true/false
     */
    public boolean isMain() {
        return main;
    }

    /**
     * Set as main function, by {@link decaf.frontend.typecheck.Namer}.
     */
    public void setMain() {
        this.main = true;
    }

    public boolean isStatic() {
        return modifiers.isStatic();
    }

    private boolean main = false;
}
