BIGIN{
people= 0
sum= 0
}

{
if($3=="pay")
sum= sum+ $4

if($3=="enter")
people= people+1
}

END{
print sum/people, "dollars"
}