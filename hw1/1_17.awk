BEGIN{
max= 0
ans= " "
}

{
if( $2=="Tom" && $3== "enter")
TT= $1
if( $2=="Tom" && $3== "leave" && $1 - TT> max)
{
  max= $1- TT 
  name= $2
}

if( $2=="John" && $3== "enter")
JT= $1
if( $2=="John" && $3== "leave" && $1 - JT> max)
{
  max= $1- JT 
  name= $2
}

if( $2=="Mary" && $3== "enter")
MT= $1
if( $2=="Mary" && $3== "leave" && $1 - MT> max)
{
  max= $1- MT 
  name= $2
}

}


END{
print name, "has dined longest"
}
