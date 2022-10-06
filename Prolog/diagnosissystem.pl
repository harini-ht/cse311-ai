/* Disease Diagnosis System */

/* Symptoms */
symptom(fever).
symptom(headache).
symptom(rash).
symptom(cough).
symptom(sore_throat).
symptom(body_ache).
symptom(runny_nose).
symptom(sneezing).
symptom(chills).
symptom(fatigue).
symptom(vomiting).
symptom(joint_pain).
symptom(shortness_of_breath).
symptom(chest_pain).
symptom(stiffness).
symptom(swelling).

/* Diseases */
disease(common_cold).
disease(chicken_pox).
disease(flu).
disease(malaria).
disease(dengue).
disease(heart_attack).
disease(arthritis).


/*  Symptoms of Diseases */
symptom_of(chicken_pox, fever).
symptom_of(chicken_pox, rash).
symptom_of(chicken_pox, body_ache).

symptom_of(common_cold, runny_nose).
symptom_of(common_cold, sore_throat).
symptom_of(common_cold, sneezing).

symptom_of(flu, fever).
symptom_of(flu, headache).
symptom_of(flu, body_ache).
symptom_of(flu, chills).
symptom_of(flu, fatigue).
symptom_of(flu, cough).
symptom_of(flu, sore_throat).

symptom_of(malaria, fever).
symptom_of(malaria, chills).
symptom_of(malaria, headache).
symptom_of(malaria, vomiting).

symptom_of(dengue, fever).
symptom_of(dengue, headache).
symptom_of(dengue, rash).
symptom_of(dengue, joint_pain).
symptom_of(dengue, muscle_pain).
symptom_of(dengue, vomiting).

symptom_of(pneumonia, cough).
symptom_of(pneumonia, fever).
symptom_of(pneumonia, chills).
symptom_of(pneumonia, sweating).
symptom_of(pneumonia, shortness_of_breath).
symptom_of(pneumonia, chest_pain).

symptom_of(heart_attack, chest_pain).
symptom_of(heart_attack, vomiting).
symptom_of(heart_attack, shortness_of_breath).

symptom_of(arthritis, joint_pain).
symptom_of(arthritis, stiffness).
symptom_of(arthritis, swelling).

/*  Rules */
has_symptom(X) :- symptom(X), write('Do you have '), write(X), write('? '),
                  read(Answer), nl, Answer == yes.
                
has_disease(X) :- disease(X), write('You may have '), write(X), nl.

/*  Queries */
diagnose :- has_symptom(fever), has_symptom(headache), has_symptom(rash),
            has_disease(dengue), !.
diagnose :- has_symptom(fever), has_symptom(headache), has_symptom(joint_pain), 
            has_symptom(muscle_pain), has_symptom(vomiting), has_disease(dengue), !.
diagnose :- has_symptom(fever), has_symptom(chills), has_symptom(headache), 
            has_symptom(vomiting), has_disease(malaria), !.
diagnose :- has_symptom(fever), has_symptom(headache), has_symptom(body_ache),  
            has_disease(chicken_pox), !.
diagnose :- has_symptom(fever), has_symptom(headache), has_symptom(chills), 
            has_symptom(fatigue), has_symptom(cough), has_symptom(sore_throat), 
            has_disease(flu), !.    
diagnose :- has_symptom(runny_nose), has_symptom(sore_throat), has_symptom(sneezing),
            has_disease(common_cold), !.
diagnose :- has_symptom(cough), has_symptom(fever), has_symptom(chills),
            has_symptom(sweating), has_symptom(shortness_of_breath), 
            has_symptom(chest_pain), has_disease(pneumonia), !.
diagnose :- has_symptom(chest_pain), has_symptom(vomiting), has_symptom(shortness_of_breath),   
            has_disease(heart_attack), !.

diagnose :- has_symptom(joint_pain), has_symptom(stiffness), has_symptom(swelling), 
            has_disease(arthritis), !.
diagnose :- write('Sorry, I can''t diagonise your disease.'), nl.



/*
# The following is the output from the program:
#
# ?- [diagnosesystem].
# true.
#
# ?- diagnose.
# Do you have fever? |: yes.
#
# Do you have headache? |: yes.
#
# Do you have rash? |: yes.
#
# You may have measles
# true.
#
# ?- diagnose.
# Do you have fever? |: yes.
#
# Do you have headache? |: yes.
#
# Do you have rash? |: no.
#
# Do you have body_ache? |: yes.
#
# You may have chicken_pox
# true.
#
# ?- diagnose.
# Do you have runny_nose? |: yes.
#
# Do you have sore_throat? |: yes.
#
# Do you have sneezing? |: yes.
#
# You may have common_cold
# true.
#
# ?- diagnose.
# Do you have fever? |: no.
#
# Do you have headache? |: no.
#
# Do you have rash? |: no.
#
# Do you have body_ache? |: no.
#
# Do you have runny_nose? |: no.
#
# Do you have sore_throat? |: no.
#
# Do you have sneezing? |: no.
#
# You do not have measles, chicken pox, or the common cold.
# true.
*/
