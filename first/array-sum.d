/*
 * Problem: Given an unsorted array of non-negative integers, 
 * find a continuous sub-array which adds to a given number.
 *
 * Approach: 
 *  Iterate one by one, for each element from the start
 *   to identify whether a subset exists with given sum
 *   As soon as a subset is found, break the loop.
 * 
*/


// Define a module
module array_sum;

// Import for using stdin/out
import std.stdio;

// Sample main function
void main () {
    // Declare n: size of the main set of numbers
    //         s: the sum to look for
    int n, s;
    int[] array;

    // Read them from stdin
    write ("N: "); readf (" %d", &n);
    write ("S: "); readf (" %d", &s);
    
    // Define a dynamic array, and read numbers from stdin
    array = new int[] (n);
    writef ("Ready to read %d elements to find the sum %d\n", n, s);
    for (int i=0; i<n; i++) {
        readf (" %d", &array[i]);
    }

    // start, and end to hold the info on subset. 
    int start, end;
    L1: for (start = 0; start < n - 1; start++) {
        int sum = array[start];

        // Look for subset that adds up to s, starting at start.
        for (int i = start + 1; i < n ; i++) {
            // If sum is found, done! 
            if (sum == s) {
                end = i - 1;
                break L1;
            }
            // If sum > s, no need to look further
            else if (sum > s) {
                break;
            }
            // else keep adding
            else {
                sum += array[i];
            }
        }
    }
    
    // Print array for reference
    writeln (array);

    // end is modified only when there is a subset found
    //   except when the first number is the sum itself
    if (end == 0 && array[0] != s) 
        writeln ("No such subset found");
    else 
        writeln ("Subset: (", start, " ", end, ")");
}

