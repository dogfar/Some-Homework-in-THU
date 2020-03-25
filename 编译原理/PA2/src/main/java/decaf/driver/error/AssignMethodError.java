package decaf.driver.error;

import decaf.frontend.tree.Pos;

public class AssignMethodError extends DecafError {

    private String name;
    public AssignMethodError(Pos pos, String name){
        super(pos);
        this.name = name;
    }
    protected String getErrMsg() {
        return "cannot assign value to class member method '"+ name + "'";
    }
}
