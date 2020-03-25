package decaf.driver.error;

import decaf.frontend.tree.Pos;

public class LambdaArgCountError extends DecafError {
    private int expect;

    private int count;

    public LambdaArgCountError(Pos pos, int expect,
                            int count) {
        super(pos);
        this.expect = expect;
        this.count = count;
    }

    @Override
    protected String getErrMsg() {
        return "lambda expression expects " + expect
                + " argument(s) but " + count + " given";
    }
}
