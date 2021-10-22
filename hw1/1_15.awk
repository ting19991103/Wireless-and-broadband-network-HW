BEGIN{
TimeSum= 0
People= 0
}

{
if($3== "enter")
  {
  People= People+1
  TimeSum= TimeSum-$1
  }
if($3== "leave")
  TimeSum= TimeSum+$1
}


END{
print "average dining time: ", TimeSum/People, "minutes"
}
