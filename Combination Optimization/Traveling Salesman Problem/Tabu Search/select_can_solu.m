function [nbest_distance,nbest_solution,...
          next_distance,next_solution,new_tabu_list] = select_can_solu(...
          best_distance,best_solution,current_distance, current_solution, ...
          neighborhood_solution, tabu_list, tabu_length)
%通过查禁忌表和最优解来选择候选解
%更新当前解，最优解，禁忌表
nbest_distance = best_distance;
nbest_solution = best_solution;
new_tabu_list = tabu_list;
%邻域选择的最优策略
[city_a,city_b] = find(neighborhood_solution == ...
                       min(min(neighborhood_solution)));              
next_distance = current_distance + neighborhood_solution(city_a,city_b);

while (tabu_list(city_a,city_b) ~= 0) && (next_distance > best_distance)         %既无法填入空缺也无法满足特赦准则                  
    neighborhood_solution(city_a,city_b) = Inf;                                    
    [city_a,city_b] = find(neighborhood_solution == ...
                       min(min(neighborhood_solution)));
    next_distance = current_distance + neighborhood_solution(city_a,city_b);
end

%更新禁忌表
new_tabu_list(city_a,city_b) = tabu_length;
%更新当前解
i = find(current_solution == city_a);
j = find(current_solution == city_b);
next_solution = current_solution;
next_solution(i) = city_b;
next_solution(j) = city_a;
%满足特赦准则就更新最优解
%特赦准则为邻域解优于当前最优解
if next_distance < best_distance                                        
    nbest_distance = next_distance;
    nbest_solution = next_solution;
end

