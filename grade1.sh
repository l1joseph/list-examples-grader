CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ArrayExamples.java ]]
then
  echo 'ArrayExamples.java found'
else
  echo 'ArrayExamples.java not found'
  echo 'Score: 0/5'
fi

cp student-submission/ArrayExamples.java ./


javac -cp $CPATH *.java 2> trash.txt
java -cp $CPATH org.junit.runner.JUnitCore ArrayTests > junit-output.txt


FAILURES=`grep -c FAILURES!!! junit-output.txt`

if [[ $FAILURES -eq 0 ]]
then
  echo 'All tests passed'
  echo '5/5'
else
  RESULT_LINE=`grep "Tests run:" junit-output.txt`
  COUNT=${RESULT_LINE:25:1}
  let "a=5-$COUNT" 
  echo "JUnit output was:"
  cat junit-output.txt
  echo ""
  echo "--------------"
  echo "| Score: $a/5 |"
  echo "--------------"
  echo ""
fi
