begin{
Tom_Time= 0
John_Time= 0
Mary_Time= 0
}

{

if( $2=="Tom" && $3== "enter")
Tom_Time= $1
if( $2=="Tom" && $3== "leave")
print $2, $1 - Tom_Time, "minutes"

if( $2=="Mary" && $3== "enter")
Mary_Time= $1
if( $2=="Mary" && $3== "leave")
print $2, $1 - Mary_Time, "minutes"

if( $2=="John" && $3== "enter")
John_Time= $1
if( $2=="John" && $3== "leave")
print $2, $1 - John_Time, "minutes"

}

end{}
