% hw7template.pl
% Name: Charles Aebi
% Date: 3/11/26
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
passed(Student, Course) :- took(Student, Course, a).
passed(Student, Course) :- took(Student, Course, b).
passed(Student, Course) :- took(Student, Course, c).


% Problem 2 - needs(Course, Req)
% Base case
needs(Course, Req) :-
    prereq(Course, Req).

% Recursive case for transitive closure
needs(Course, Req) :- 
    prereq(Course, Mid),
    needs(Mid, Req).
    

% Problem 3 - eligible(Student, Course)
% Student eligable if...
% course exists,
% student has not already passed it
% student has passed all prereqs
eligible(Student, Course) :-
    course(Course),
    \+ passed(Student, Course),
    \+ (needs(Course, Req), \+ passed(Student, Req)).


% Problem 4 - whyNotEligible(Student, Course, Reason)

% Clause for reason 1: already passed
whyNotEligible(Student, Course, already_passed) :-
    passed(Student, Course).

% Clause for reason 2: missing a req
whyNotEligible(Student, Course, missing(Req)) :-
    needs(Course, Req),
    \+ passed(Student, Req).
    
% Problem 5 - eligibleCourses(Student, CourseList, Count)
% IMPORTANT: eligibleCourses/3 (three arguments)
% Finds all courses a student is eligible for
eligibleCourses(Student, CourseList, Count) :-
    findall(
        Course, 
        eligible(Student, Course),
        CourseList),
    length(CourseList,Count).

% Problem 6 - totalPassedCredits(Student, Total)
totalPassedCredits(Student, Total) :-
    findall(
        Credits,
        (passed(Student, Course), credits(Course, Credits)),
        AllCredits),
    sum_list(AllCredits, Total).

% Problem 7 - proSchool(Student)
proSchool(Student) :-
    passed(Student, engr103),
    passed(Student, cs162),
    passed(Student, cs261),
    passed(Student, math251),
    totalPassedCredits(Student, T),
    T > 29. 
