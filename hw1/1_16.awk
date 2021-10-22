BEGIN{
max= 0
name= " "
}

{
  if($3=="pay" && $4>max)
  {
  name = $2
  max= $4
  }
}

END{
print name, "spend the most money"
}
