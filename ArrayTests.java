import static org.junit.Assert.*;
import org.junit.*;

public class ArrayTests {
	@Test 
	public void testReverseInPlace() {
    int[] input1 = { 3 };
    ArrayExamples.reverseInPlace(input1);
    assertArrayEquals(new int[]{ 3 }, input1);
	}


  @Test
  public void testReversed() {
    int[] input1 = { };
    assertArrayEquals(new int[]{ }, ArrayExamples.reversed(input1));
  }

  @Test
  public void testReversedNew() {
    int[] input1 = {1,2,3};
    int[] output1 = {3,2,1};
    assertArrayEquals(output1, ArrayExamples.reversed(input1));
  }

  @Test
  public void testReversedInPlaceNew(){
    int[] input1 = {1,2,3};
    int[] input2 = {3,2,1};
    ArrayExamples.reverseInPlace(input1);
    assertArrayEquals( input2, input1);
  }
  @Test
  public void testAverageWithoutLowest() {
      double[] input1 = {1, 2, 3};
      double output1 = ArrayExamples.averageWithoutLowest(input1);
      assertEquals(2.5, output1, 0.0001);
  
      double[] input2 = {4, 4, 4};
      double output2 = ArrayExamples.averageWithoutLowest(input2);
      assertEquals(4.0, output2, 0.0001);
  
      double[] input3 = {5};
      double output3 = ArrayExamples.averageWithoutLowest(input3);
      assertEquals(0.0, output3, 0.0001);
  
      double[] input4 = {};
      double output4 = ArrayExamples.averageWithoutLowest(input4);
      assertEquals(0.0, output4, 0.0001);
      
      double[] input5 = {1, 1, 2};
      double output5 = ArrayExamples.averageWithoutLowest(input5);
      assertEquals(1.5, output5, 0.0001);
  
  }
}
