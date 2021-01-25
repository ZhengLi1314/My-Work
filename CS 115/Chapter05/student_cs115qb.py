"""
File: student.py
Resources to manage a student's name and test scores.
"""

class Student(object):
    """Represents a student."""

    def __init__(self, name, number):
        """All scores are initially 0."""
        self.name = name
        self.scores = []
        for count in range(number):
            self.scores.append(0)

    def getName(self):
        """Returns the student's name."""
        return self.name  
    def setName(self, newname):
        self.name = newname
    
    def setScore(self, i, score):
        """Resets the ith score, counting from 1."""
        self.scores[i-1]=score

    def getScore(self, i = None):
        """Returns the ith score, counting from 1."""
        if i == None:
            return self.scores
        return self.scores[i - 1]
   
    def getAverage(self):
        """Returns the average score."""
        return sum(self.scores)/(len(self.scores))
    
    def getHighScore(self):
        """Returns the highest score."""
        return max(self.scores)
 
    def __str__(self):
        """Returns the string representation of the student."""
        return "Students' Name: " + self.getName() + "\nNumber of Assignment: " + str(len(self.scores)) + "\n" + str(self.scores)

def main():
    """A simple test."""
    # instantiate a student object
    testStudent = Student("Jane Doe", 10)
    testStudent.setScore(1,40)
    testStudent.setScore(4,50)
    print(testStudent.getScore())
    print(testStudent.getAverage())
    print(testStudent.__str__())

if __name__ == "__main__":
    main()


