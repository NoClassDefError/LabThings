import org.apache.commons.io.IOUtils;
import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class Test2 {
    @Test
    public void test2(){
        File file = new File("");
        System.out.println(file.getAbsolutePath());
        System.out.println(file.listFiles());
//        try {
//            IOUtils.copy(new FileInputStream(file),System.out);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
}
