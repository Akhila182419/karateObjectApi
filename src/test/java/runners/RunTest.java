package runners;

import com.intuit.karate.junit5.Karate;

public class RunTest {

    @Karate.Test
    Karate testObjectsCrud() {
        return Karate.run("classpath:feature/objects_crud.feature");
    }
}
