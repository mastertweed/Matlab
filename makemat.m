function my_matrix = makemat(vec1,vec2)
if length(vec1) < length(vec2); 
  while length(vec1) ~= length(vec2);
      vec1(length(vec1)+1) = 0;
  end
end
if length(vec2) < length(vec1);
   while length(vec2) ~= length(vec1);
       vec2(length(vec2)+1) = 0;
   end
end
my_matrix = [vec1;vec2];
end
  