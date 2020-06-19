while iterations < #fans
  if fans[iterations] == null
    echo "Fan",iterations,"not configured"
  else
    echo "Fan",iterations,"name:",fans[iterations].name
echo "That''s all"