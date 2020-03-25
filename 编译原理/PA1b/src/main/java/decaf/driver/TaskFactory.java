package decaf.driver;

import decaf.frontend.parsing.LLParser;
import decaf.frontend.tree.Tree;

import java.io.InputStream;

/**
 * Supported tasks of Decaf compiler.
 */
public class TaskFactory {
    private final Config config;

    public TaskFactory(Config config) {
        this.config = config;
    }

    public Task<InputStream, Tree.TopLevel> parseLL() {
        return new LLParser(config);
    }
}
