package decaf.driver.error;

import decaf.frontend.tree.Pos;

public class AbstractInstantiateError extends DecafError {
    private String classname;
    public AbstractInstantiateError(Pos pos, String name){
        super(pos);
        this.classname = name;
    }
    @Override
    protected String getErrMsg() {
        return "cannot instantiate abstract class '" + classname + "'";
    }
}
