"""
Purpose: Brutal Force Algorithm to beat game 4=10
Game description: Find set of operators and parenthesis, and arrangement of the numbers to make 4 given numebrs = 10
Author: Zheng Li
Time: 12/23/2022
"""
import itertools
input_nums = input("Enter the for numbers separated by space:")#ex: "1 0 6 3"
input_nums = input_nums.split()
operators = input("Enter the for numbers separated by space:")#ex: '-*/'
operators = operators.split()
answers = []
permutations = list(itertools.permutations(input_nums,4))
for perm in permutations:
    #for each permutation of the 4 numbers
    for op in list(itertools.product(operators,repeat = 3)):
        #for each arrangement of the operators
        for paren_i in list(itertools.combinations([0,1,2,3,4],2))+[(0,0)]:
            #for each arrangement of the parenthesis index
            paren_index=[]
            if paren_i[1] - paren_i[0]==1 or paren_i[1] - paren_i[0]==4: continue
            elif paren_i[1] - paren_i[0]==0: paren_index = [""]*7
            else:
                #create '' place holders for the numbers and operators
                paren_index = (paren_i[0]-0)*2*[""] + ["("] + ((paren_i[1]-paren_i[0])+(paren_i[1]-paren_i[0]-1))*[""] + [")"] + (4-paren_i[1])*2*[""]

            temp = [perm[0], op[0], perm[1], op[1], perm[2], op[2], perm[3]]
            result = ""
            #replace the '' place holders with real numbers and operators
            for i in range(len(paren_index)):
                if paren_index[i] == "":
                    paren_index[i] = temp.pop(-(len(temp)))
                result += paren_index[i]

            #eval the expressions
            try:
                eval(result)
            except:
                continue
            else:
                if eval(result) == 10:
                    answers.append(result)
print(answers)