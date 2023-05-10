CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'
set -e
rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'
files=`find student-submission/ -name "*java"` 
for file in $files
do
    if [[ $file == "student-submission/ListExamples.java" ]]
    then
        echo 'File Found'
        cp $file grading-area/
    else
        echo 'File Missing/Incorrect File Name'
        exit
    fi
done

cp -r TestListExamples.java grading-area/
cp -R lib/ grading-area/
cd grading-area/
javac -cp $CPATH ListExamples.java TestListExamples.java 
if [[ $? -ne 0 ]]
then  
    echo 'error'
    exit 1
else
    echo 'compile muy bueno'
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
