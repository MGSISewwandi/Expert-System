
:- use_module(library(jpl)).
start :-sleep(0.4),
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.2),
		write("###################||| EXPERT SYSTEM |||#########################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,


        /*write("Hi student, How are you? What is your name? : "),
        read(Student),*/

		interface2.

       /* hypothesis(Student,status),
        write(Student),write(', you '), write(' should attend '),write(status), write('lectures.'),undo,
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.*/


question(Student,vaccine) :- verify(Student," State of Covid 19 Vaccination (y/n) ?").

    question(Student,one_dose) :- verify(Student," Did you get 1st dose  (y/n) ?").

	question(Student,second_dose) :- verify(Student," Did you get 2nd dose (y/n) ?").

	question(Student,third_dose) :- verify(Student," Did you get 3rd dose (y/n) ?").

    question(Student,first_year) :- verify(Student," Are you a 1st year student (y/n) ?").

    question(Student,second_year) :- verify(Student," Are you a 2nd year student(y/n) ?").

    question(Student,third_year) :- verify(Student," Are you a 3rd year student(y/n) ?").

  question(Student,fourth_year) :- verify(Student," Are you a 4th year student(y/n) ?").


	/*question(_,"Sorry,It seem you enter the invalid answers.").*/


    hypothesis(Student,physical) :-
		question(Student,vaccine),
		question(Student,one_dose),
		question(Student,second_dose),
		question(Student,third_dose),
		question(Student,first_year).

 hypothesis(Student,physical) :-
		question(Student,vaccine),
		question(Student,one_dose),
		question(Student,second_dose),
		question(Student,third_dose),
		question(Student,second_year).

 hypothesis(Student,physical) :-
		question(Student,vaccine),
		question(Student,one_dose),
		question(Student,second_dose),
		question(Student,third_dose),
		question(Student,third_year).

hypothesis(Student,physical) :-
		question(Student,vaccine),
		question(Student,one_dose),
		question(Student,second_dose),
			question(Student,third_dose),
		question(Student,fourth_year).

hypothesis(Student,physical) :-
		question(Student,vaccine),
		question(Student,one_dose),
		question(Student,second_dose),
		question(Student,first_year).

hypothesis(Student,physical) :-
		question(Student,vaccine),
		question(Student,one_dose),
		question(Student,second_dose),
		question(Student,second_year).


hypothesis(Student,physical) :-
		question(Student,vaccine),
		question(Student,one_dose),
		question(Student,second_dose),
		question(Student,third_year).


hypothesis(Student,physical) :-
		question(Student,vaccine),
		question(Student,one_dose),
		question(Student,second_dose),
		question(Student,fourth_year).



hypothesis(Student,online) :-
		question(Student,vaccine),
		question(Student,one_dose),
	       question(Student,first_year).
hypothesis(Student,online) :-
		question(Student,vaccine),
		question(Student,one_dose),
	       question(Student,second_year).

hypothesis(Student,online) :-
		question(Student,vaccine),
		question(Student,one_dose),
	       question(Student,third_year).


hypothesis(Student,online) :-
		question(Student,vaccine),
		question(Student,one_dose),
	       question(Student,fourth_year).

hypothesis(Student,online) :-
		question(Student,first_year).

hypothesis(Student,online) :-
		question(Student,second_year).

hypothesis(Student,online) :-
		question(Student,third_year).

hypothesis(Student,online) :-
		question(Student,fourth_year).


	hypothesis(_,"Sorry, It seem you enter the invalid answers.").

    response(Reply) :-
        read(Reply),
        write(Reply),nl.

ask(Student,Question) :-
	write(Student),write(', '),write(Question),

		/*read(N),
	( (N == yes ; N == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail),*/

	interface(', ',Student,Question),
	write('Loading.'),nl,
	sleep(1),
	write('Loading..'),nl,
	sleep(1),
	write('Loading...'),nl,
	sleep(1),
    nl.

:- dynamic yes/1,no/1.

verify(P,S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


pt(Student):-

		hypothesis(Student,Status),
		interface3(Student,', you can attend to ',Status,' lectures.'),
        write(Student),write(', you can attend to'),write(status),write('lectures.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- EXPERT SYSTEM FOR VERIFYING ELIGIBILITY TO ATTEND PHYSICAL LECTURES ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [600,300], _),
	jpl_call(F, setSize, [600,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _),
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).

interface2 :-
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- EXPERT SYSTEM FOR VERIFYING ELIGIBILITY TO ATTEND PHYSICAL LECTURES ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [600,300], _),
	jpl_call(F, setSize, [600,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hi Student, How are you? What is your name'], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(null)
		->	write('you cancelled'),interface3('you cancelled. ','Thank you ','for use ','me.'),end,fail
		;	write("Hi student, How are you? What is your name : "),write(N),nl,pt(N)
	).


interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- EXPERT SYSTEM FOR VERIFYING ELIGIBILITY TO ATTEND PHYSICAL LECTURES ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [600,300], _),
	jpl_call(F, setSize, [600,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).

help :- write("To start the expert system please type 'start.' and press Enter key").
