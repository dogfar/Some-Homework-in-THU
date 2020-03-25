package decaf.driver;

import decaf.frontend.parsing.JaccParser;
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

    public Task<InputStream, Tree.TopLevel> parse() {
        return new JaccParser(config);
    }
}
