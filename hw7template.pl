% hw7template.pl
% Name: ____________________________
% Date: ____________________________
% CS 381 - Homework 7: Course Planning Advisor in Prolog
%
% Submit this file as: homework7.pl
%
% NOTE:
% - This starter file is NOT meant to pass the autograder as-is.
%   The predicate stubs below currently fail on purpose.
% - Fill in each TODO and remove the placeholder `fail.` lines.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sample College Dataset (for local testing)
% Keep this near the top of your file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ---------- Catalog ----------
% Keep course/1 facts together (avoids "discontiguous" warnings).
course(math251).
course(math252).
course(math264).

course(cs161).
course(cs162).
course(cs261).
course(cs290).
course(cs340).
course(cs381).

course(cs321).

course(ph201).
course(engr103).

% Keep credits/2 facts together (avoids "discontiguous" warnings).
credits(math251, 4).
credits(math252, 4).
credits(math264, 2).

credits(cs161, 4).
credits(cs162, 4).
credits(cs261, 4).
credits(cs290, 4).
credits(cs340, 4).
credits(cs381, 4).

credits(cs321, 3).

credits(ph201, 5).
credits(engr103, 3).

% ---------- Prereqs ----------
prereq(cs162, cs161).
prereq(cs261, cs162).
prereq(cs290, cs162).

prereq(cs340, cs261).
prereq(cs381, cs261).
prereq(cs321, cs261).

prereq(math252, math251).
prereq(math264, math251).

% ---------- Passing grades ----------
pass_grade(a).
pass_grade(b).
pass_grade(c).

% ---------- ProSchool required courses ----------
required(engr103).
required(cs162).
required(cs261).
required(math251).

% ---------- Transcript data ----------
% took(Student, Course, Grade).

took(alex, cs161, b).
took(alex, cs162, c).
took(alex, math251, b).
took(alex, engr103, a).
took(alex, cs261, d).      % not passed (D)
took(alex, cs290, b).
took(alex, ph201, c).

took(bella, cs161, a).
took(bella, cs162, b).
took(bella, cs261, b).
took(bella, math251, c).
took(bella, engr103, b).
took(bella, cs290, a).
took(bella, cs340, b).

took(carla, cs161, a).
took(carla, cs162, a).
took(carla, cs261, a).
took(carla, math251, a).
took(carla, engr103, a).
took(carla, cs290, a).
took(carla, cs340, a).
took(carla, ph201, b).
took(carla, math252, b).
took(carla, cs381, b).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicates to Implement
% (Replace each stub with your implementation.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 1 - passed(Student, Course)
passed(_Student, _Course) :-
    % TODO
    fail.

% Problem 2 - needs(Course, Req)
needs(_Course, _Req) :-
    % TODO
    fail.

% Problem 3 - eligible(Student, Course)
eligible(_Student, _Course) :-
    % TODO
    fail.

% Problem 4 - whyNotEligible(Student, Course, Reason)
whyNotEligible(_Student, _Course, _Reason) :-
    % TODO
    fail.

% Problem 5 - eligibleCourses(Student, CourseList, Count)
% IMPORTANT: eligibleCourses/3 (three arguments)
eligibleCourses(_Student, _CourseList, _Count) :-
    % TODO
    fail.

% Problem 6 - totalPassedCredits(Student, Total)
totalPassedCredits(_Student, _Total) :-
    % TODO
    fail.

% Problem 7 - proSchool(Student)
proSchool(_Student) :-
    % TODO
    fail.
