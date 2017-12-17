import UIKit
/*:

 # Swift Strings
 =======================
 
 ## Learning Objectives
 
 * **Articulate** how Strings are stored
 
 * **Manipulate** characters in Strings
 
 * **Parse** words inside of a String
 
 * **Iterate** through characters in a String
 
 ## Connection to long term goal:
 
 Strings is a fundamental type in Swift, a struct but not a class that is used throughout Swift itself as well as iOS application development.
 
 ## Opening (5 - 10 Mins)
 
 What is a String type?
 
 ## Practice Problem
 
 Write a function that takes a number represented as a String and converts it to an Int.

 ## DEFINITION
 
 "A String is a series of characters."
 
 **Syntax**:
 
 `var stringName: Type? = ...`
 ```
 var name: String = "Eric"
 
 ```
 
 ## Introduction: Strings (10 mins)
 
 Strings are important. As constants String types play a key role in iOS development.  A value for `kURL`, for instance, may be an example of how a String type is used to facilitate HTTP requests; A storyboard ID is a String type that you can use to create a new ViewController based on that storyboard's ViewController or for the sake of assigning a class to a scene in Interface Builder we use a String type. Here is an example of a real world application of the String type to iOS application development.
 
 ![StoryboardID](./StoryboardID.png)
 
 ```
 @IBAction func buttonPressed(sender: AnyObject) {
 let vc = storyboard?.instantiateViewControllerWithIdentifier("MyViewController") as MyCustomViewController
 presentViewController(vc, animated: true, completion: nil)
 }
 ```

 */
var string: String = "Hello"

// write code here 
var chars = string.characters

chars.removeFirst()

print(chars)

/*:

 # DEMO (15 mins)
 
 * Iterate through the String using a for loop.
 
 * Iterate through the String using index
 
 * Solve the opening problem
 
 * Splitting Strings
 
 ---
 
 */
func printEmptyLines(_ numberOfLines: Int) {
    
    print("=====================================")
    for _ in 1..<numberOfLines {
        print()
    }
}



//PART 1

//=====================
//ADD LINE BREAKS
//=====================

var poem = "Language is meanin🤡 " +
    "Humans make Language " +
    "So Humans make meaning " +
    "Meaning is created " +
"Not found."


//print(poem)
//printEmptyLines(2)


//=====================
//ITERATE USING FOR LOOP
//=====================

/*
for character in poem.characters {
    print("Using Loop: ", character)
}

printEmptyLines(2)


//=====================
//ITERATE USING INDEX
//=====================

for index in poem.characters.indices {
    let character = poem[index]
    if character == Character("🤡") {
        //poem[index] = Character("🤠")
    }
    print("By Index: \(character)")
}
*/
/*
func coolString(_ string: String) -> String {
    return "😎" + string + "😎"
}

<<<<<<< HEAD
func appendStuff(string: String) -> String {
    return string + "😎"
}

print(appendStuff(string: "Yo "))




print(poem)
=======
print(poem[poem.index(poem.startIndex, offsetBy: 4)])
>>>>>>> 5189c79404606e9ade46b1d13c5962c9e4d8b38c

print(coolString(poem))

printEmptyLines(2)
*/

//PART 2

//=====================
//SPLITTING STRINGS
//=====================

let question = "A book costs $1 plus half its price. How much does it cost?"
let wordsInQuestion = question.components(separatedBy: " ")
print(wordsInQuestion)


printEmptyLines(2)


// You split strings using any character
let interests = "Programming,Swift,Tai Chi,Music,Bike Riding,Reading,Business"
let interestsArray = interests.components(separatedBy: ",")
print(interestsArray)

printEmptyLines(2)



/*:
 
 # INDEPENDENT PRACTICE (10 mins)
 
 ## PRACTICE PROBLEMS
 
 Write a function that
 
 * Take a String and returns the String with an emoji character appended to the original
 
 * Take a String and returns a String with an emoji character prepended to the original
 
 * Takes a String and returns a count of how many spaces are in the String
*/

// Map, Filter, Reduce

// Reduce: 

//poem.characters.reduce (not really useful w/ strings)
// reduce takes a list of characters/ints and converts all to a single item 
// useful: if you have array of ints and want sum
// output.count == 1


// Map: converts an array of something into a diff array of something
// perform some operation of array and returns new array w/result of that operation
// input.count == output.count

// Filter: takes an array of x and returns smaller array of x based on which item met criteria
// input.count >= output.count

let heyOs = String(poem.characters.filter({$0 == "o"}))
print(heyOs)




/*:
 
 # PAIR-PROGRAMMING PRACTICE (15 mins)
 
 ## PRACTICE PROBLEMS
 
 * Takes a String representing a sentence and returns a String with the words (not the characters) reversed
 
 * Takes a String and prints it in all upper case
 
 * Write  a function that takes a String and returns a new String with all instances of the Character ‘a’ with the character ‘o’.
 
 * Write a function that prints all of the Unicode characters (advanced)
 
 */

// Take a string representing a sentence and returns a string with the words (not the characters) reversed.

func reverse(inputString: String) -> String {
    return inputString.components(separatedBy: " ").reversed().joined(separator: " ")
    // taking existing sentence and calling its components based on where they are separated by (creating an array of the sentence)
    //return String(inputString.characters.reversed())
}
print(reverse(inputString: "how you doing"))

// Takes a string and prints it in all upper case.

func upperCase(lowercase: String) -> String {
    return lowercase.uppercased()
}
print(upperCase(lowercase: "hey wassup hello"))

// Write a function that takes a string and returns a new string with all instance of the character 'a' with the character 'o'.

func aoConverter(inputString: String) -> String {
    return inputString.replacingOccurrences(of: "a", with: "o")
}
print(aoConverter(inputString: "Yo abhi"))





///*:
//
//*/

// write code here 
func reverseWords(sentence: String) -> String {
    return sentence.components(separatedBy: " ").reversed().joined(separator: " ")
}

func toUpper(input: String) -> String {
    return input.uppercased()
}

func replaceAWithO(input: String) -> String {
    return input.replacingOccurrences(of: "a", with: "o")
}

func printUnicode() {
    var i = 0
    while(true) {
        var unicode = UnicodeScalar(i)
        if let unicode = unicode {
            var char = Character(unicode)
            print(char, separator: "", terminator: "")
        } else {
            break
        }
        i += 1
    }
}
/*:

*/
//print(reverseWords(sentence: poem))
//printUnicode()


let newString = poem.unicodeScalars.map({Character(UnicodeScalar(Int($0.hashValue) + 1)!) })
let realString = String(newString)
print("It worked?? \(realString)")

let heyyOs = String(poem.characters.filter({$0 != "." }))

//map: input.count == output.count
//filter: input.count >= output.count
//reduce: output.count == 1

/*filter:
 for each item in the array
    call a function, which passes in item and returns bool
    ->func doSomething($0: T) -> Bool
 
 */


print(heyOs)



/*:
 # CONCLUSION (5 mins)
 
 ## CHECK-FOR-UNDERSTANDING: WRITE-SHARE
 
 *Write down what you think is the purpose of a String type.*
 
 ## TAKEAWAYS
 
 * The structure reference for a String type reveals a `struct` with definite methods & properties for its manipulation as a data types; the String type is an Array of characters.
 
 * Most of what your users communicate to you will be through Strings: passwords, emails, numbers, names, etc.
 
 ## Further Reading
 [Strings & Characters](https://developer.apple.com/library/mac/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID285)
 [Swift evolution design overview](https://github.com/apple/swift/blob/master/docs/StringDesign.rst)
 
 */
// SWIFT STRINGS LAB




