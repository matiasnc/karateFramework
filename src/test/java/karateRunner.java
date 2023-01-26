import com.intuit.karate.junit5.Karate;

public class karateRunner {
    @Karate.Test
    Karate testSample() {
        //return Karate.run("classpath:REST/"); //Ejecucion completa de REST.
        return Karate.run("classpath:REST/").tags("@OutlinePOST"); //Ejecucion por tags.
    }
}
