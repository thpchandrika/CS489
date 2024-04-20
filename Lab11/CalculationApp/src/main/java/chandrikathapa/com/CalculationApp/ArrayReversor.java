package chandrikathapa.com.CalculationApp;

import org.springframework.beans.factory.annotation.Autowired;

public class ArrayReversor {

    @Autowired
    private ArrayFlattener arrayFlattener;

    public int[] reverseArray(int[][] input) {
        int[] flattenedArray = arrayFlattener.flattenArray(input);
        int[] reversedArray = new int[flattenedArray.length];
        for (int i = 0; i < flattenedArray.length; i++) {
            reversedArray[i] = flattenedArray[flattenedArray.length - 1 - i];
        }
        return reversedArray;
    }
}
