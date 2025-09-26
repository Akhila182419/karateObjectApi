package runners;

import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

public class RunTest {

    @Karate.Test
    Karate testObjectsCrud() {
        return Karate.run("classpath:feature/data_driven.feature",
                "classpath:feature/Negative.feature",
                "classpath:feature/object1.feature",
                "classpath:feature/objects_crud.feature",
                "classpath:feature/SchemaValidation.feature",
                "classpath:feature/TagsFilter.feature");
}
    @Test
    void runSmokeTests() {
        Runner.path("classpath:features")
                .tags("@smoke");
                //.parallel(5);   // run in parallel with 5 threads
    }
    @Test
    void runCrudTests() {
        Runner.path("classpath:features")
                .tags("@crud");
               // .parallel(5);
    }

    @Test
    void runUpdateTests() {
        Runner.path("classpath:features")
                .tags("@update");
               // .parallel(5);
    }

    @Test
    void runAllTagsTogether() {
        Runner.path("classpath:features")
                .tags("@smoke", "@crud", "@update") ; // OR condition
                //.parallel(5);
    }
}


