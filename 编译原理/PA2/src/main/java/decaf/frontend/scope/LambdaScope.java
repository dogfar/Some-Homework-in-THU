package decaf.frontend.scope;

import decaf.frontend.symbol.LambdaSymbol;
import decaf.frontend.type.BuiltInType;
import decaf.frontend.type.ClassType;
import decaf.frontend.type.FunType;
import decaf.frontend.type.Type;

import java.util.ArrayList;
import java.util.List;


public class LambdaScope extends Scope {
    //TODO

    public LambdaScope() {
        super(Kind.FORMAL);
    }

    public LambdaSymbol getOwner() {
        return owner;
    }

    public void setOwner(LambdaSymbol owner) {
        this.owner = owner;
    }

    public ArrayList<Type> returnTypes = new ArrayList<>();

    public Type getbound(){
        return getreturnType(returnTypes);
    }

    private Type getreturnType(List<Type> returnTs){

        var nonnulltp = new ArrayList<Type>();
        if(returnTs.isEmpty())return BuiltInType.VOID;
        for (var t: returnTs){
            if(!t.eq(BuiltInType.NULL))nonnulltp.add(t);
        }
        if(nonnulltp.isEmpty())return BuiltInType.NULL;
        if(nonnulltp.size() < returnTs.size()){
            for(var t:nonnulltp){
                if(!t.isClassType())return BuiltInType.ERROR;
            }
        }
        returnTs = nonnulltp;
        Type t = returnTs.get(0);
        if(t.isBaseType() || t.eq(BuiltInType.VOID) || t.isArrayType()){
            for(var type:returnTs){
                if(!type.eq(t))return BuiltInType.ERROR;
            }
            return t;
        }
        else if(t.isClassType()){
            for (var type:returnTs){
                while(!type.subtypeOf(t)){
                    if(((ClassType)t).superType.isPresent()){
                        t = ((ClassType)t).superType.get();
                    }
                    else return BuiltInType.ERROR;
                }
            }
            return t;
        }
        else if(t.isFuncType()){
            var retlist = new ArrayList<Type>();
            var arglist = new ArrayList<ArrayList<Type>>();
            for(int i = 0;i<((FunType)t).arity(); i++){
                arglist.add(new ArrayList<>());
            }
            for(var type:returnTs){
                if(!type.isFuncType() || ((FunType)type).arity() != ((FunType)t).arity()){
                    return BuiltInType.ERROR;
                }
                retlist.add(((FunType) type).returnType);
                for(int i = 0;i<(((FunType) t).arity()); i++){
                    arglist.get(i).add(((FunType) type).argTypes.get(i));
                }
            }
            var returnType = getreturnType(retlist);
            if(!returnType.noError())return BuiltInType.ERROR;
            var params = new ArrayList<Type>();
            for(var typeList:arglist){
                var ParamType = getLowerBound(typeList);
                if(!ParamType.noError())return BuiltInType.ERROR;
                params.add(ParamType);
            }
            return new FunType(returnType, params);
        }
        else return BuiltInType.ERROR;
    }
    private Type getLowerBound(List<Type> typeList){
        if(typeList.isEmpty())return BuiltInType.VOID;
        var ts = new ArrayList<Type>();
        for(var type:typeList){
            if(!type.eq(BuiltInType.NULL))ts.add(type);
        }
        if(ts.isEmpty())return BuiltInType.NULL;
        if(ts.size() < typeList.size()){
            for(var type:ts){
                if(!type.isClassType())return BuiltInType.ERROR;
            }
        }
        typeList = ts;
        Type t = typeList.get(0);
        if(t.isBaseType() || t.isArrayType() || t.eq(BuiltInType.VOID)){
            for(var type:typeList){
                if(!type.eq(t))return BuiltInType.ERROR;
            }
            return t;
        }
        else if (t.isClassType()){
            for(var type:typeList){
                if(type.subtypeOf(t)) t = type;
                else if(!t.subtypeOf(type)){
                    return BuiltInType.ERROR;
                }
            }
            return t;
        }
        else if (t.isFuncType()){
            var retlist = new ArrayList<Type>();
            var arglist = new ArrayList<ArrayList<Type>>();
            for(int i = 0;i<((FunType)t).arity(); i++){
                arglist.add(new ArrayList<>());
            }
            for(var type:typeList){
                if(!type.isFuncType() || ((FunType) t).arity() != ((FunType) type).arity()){
                    return BuiltInType.ERROR;
                }
                retlist.add(((FunType)type).returnType);
                for(int i = 0; i<((FunType)t).arity(); i++){
                    arglist.get(i).add(((FunType) type).argTypes.get(i));
                }
            }
            var returnType = getLowerBound(retlist);
            if(!returnType.noError()) return BuiltInType.ERROR;
            var Params = new ArrayList<Type>();
            for(var tl:arglist){
                var ParamType = getreturnType(tl);
                if(!ParamType.noError())return BuiltInType.ERROR;
                Params.add(ParamType);
            }
            return new FunType(returnType, Params);
        }
        else return BuiltInType.ERROR;
    }
    @Override
    public boolean isLambdaScope() {
        return true;
    }

    /**
     * Get the local scope associated with the method body.
     *
     * @return local scope
     */
    public LocalScope nestedLocalScope() {
        return nested;
    }

    /**
     * Set the local scope.
     *
     * @param scope local scope
     */
    void setNested(LocalScope scope) {
        nested = scope;
    }

    private LambdaSymbol owner;

    private LocalScope nested;

}
