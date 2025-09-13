package runners;

import com.intuit.karate.junit5.Karate;
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

}
