% HW7_student_tests.pl
% Quick local tests for Homework7.pl
% Usage (SWI-Prolog):
%  ?- [homework7].          % load student's file (rename HW7Template -> Homework7.pl)
%  ?- [hw7_student_tests].  % load this test harness
%  ?- run_hw7_tests.            % run the quick tests below

:- use_module(library(plunit)).

% The harness assumes the student file provides the sample dataset at top.
% If you removed the sample dataset while editing, re-add it or consult it separately.

:- begin_tests(hw7_quick).

test(passed_sample) :-
    % sample checks (should match the handout)
    passed(alex, cs162),
    \+ passed(alex, cs261),
    passed(carla, cs340).

test(needs_sample) :-
    % once prevents warnings
    once(needs(cs261, cs162)),
    once(needs(cs261, cs161)),
    \+ needs(cs162, cs261).

test(eligible_sample) :-
    eligible(alex, cs261),
    \+ eligible(alex, cs340),
    eligible(bella, cs381),
    \+ eligible(bella, cs340).

test(eligibleCourses_sample) :-
    eligibleCourses(alex, L, N),
    N =:= 3,
    sort(L, SL),
    sort([cs261, math252, math264], Expected),
    SL == Expected.

test(totalCredits_sample) :-
    totalPassedCredits(alex, 24),
    totalPassedCredits(bella, 27).

:- end_tests(hw7_quick).

% Convenience: a run_tests wrapper
run_hw7_tests :-
    run_tests([hw7_quick]).
