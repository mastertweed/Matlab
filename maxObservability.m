function best_x = maxObservability(x,h,H)
angle = 90 - (atan(x./h)+ atan((h-H)./x));
[y,i]=max(angle);
best_x = 49.5+(i*0.5);
end

