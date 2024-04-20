package chandrikathapa.com.CalculationApp;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

public class ArrayFlattenerTest {

    @Test
    public void testFlattenArrayValidInput() {
        ArrayFlattener arrayFlattener = new ArrayFlattener();
        int[][] input = {{1, 3}, {0}, {4, 5, 9}};
        int[] expectedOutput = {1, 3, 0, 4, 5, 9};
        assertArrayEquals(expectedOutput, arrayFlattener.flattenArray(input));
    }

    @Test
    public void testFlattenArrayNullInput() {
        ArrayFlattener arrayFlattener = new ArrayFlattener();
        int[][] input = null;
        int[] expectedOutput = {};
        assertArrayEquals(expectedOutput, arrayFlattener.flattenArray(input));
    }
}
