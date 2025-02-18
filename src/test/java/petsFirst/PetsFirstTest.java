package petsFirst;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class PetsFirstTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:petsFirst").tags("~@ignore").tags("~@wip")
                //.outputCucumberJson(true)
                .parallel(15);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
