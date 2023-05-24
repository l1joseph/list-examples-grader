CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

set -e

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission 2> cloneTrash.txt
echo "Finished Cloning"
files=`find student-submission/ -name "*java"`
for file in $files
do
	if [[ $file == "student-submission/ListExamples.java" ]]
	then
		echo "File Found"
		cp $file grading-area/
	else
		echo "File Missing/Incorrect File Name"
		exit
	fi
done

cp -r TestListExamples.java grading-area/
cp -R lib/ grading-area/
cd grading-area

set +e
javac -cp $CPATH *.java 2> trash.txt
if [[ "$?" -ne 0 ]]
then 
	echo "File failed to compile"
	exit
fi
set -e
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
