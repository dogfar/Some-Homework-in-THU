package decaf.driver.error;

import decaf.frontend.tree.Pos;

public class BadAbstractClass extends DecafError {
    private String classname;
    public BadAbstractClass(Pos pos, String name){
        super(pos);
        this.classname = name;
    }
    @Override
    protected String getErrMsg() {
        return "'"+ classname +"' is not abstract and does not override all abstract methods";
    }
}
