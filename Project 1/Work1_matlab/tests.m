%% Thema 1
% a) f1
format long
l = 0.01;
e = 0.004;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f1,-1, 3, l, e)

%%
format long
l = 0.01;
e = 0.002;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f1,-1, 3, l, e)

%%
format long
l = 0.01;
e = 0.001;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f1,-1, 3, l, e)

%%

% a) f2
format long
l = 0.01;
e = 0.004;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f2,-1, 3, l, e)

%%
format long
l = 0.01;
e = 0.002;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f2,-1, 3, l, e)

%%
format long
l = 0.01;
e = 0.001;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f2,-1, 3, l, e)


%%
% a) f3
format long
l = 0.01;
e = 0.004;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f3,-1, 3, l, e)

%%
format long
l = 0.01;
e = 0.002;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f3,-1, 3, l, e)

%%
format long
l = 0.01;
e = 0.001;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f3,-1, 3, l, e)


%%

% b) f1
format long
l = 0.01;
e = 0.001;
[ak, bk, min_f, min_x, k, fun_calls, a_hist, b_hist] = dichotomous_search(@f3,-1, 3, l, e)







