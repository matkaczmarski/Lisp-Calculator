:- dynamic hominoidea/11.

%hominoidea( imiê/identyfikator, rodzina, podrodzina, plemiê, rodzaj, gatunek, waga (kg), wzrost (cm), wiek (lata), p³eæ, sposób od¿ywiania).
hominoidea('Molly', 'Hominidae', 'Homininae', 'Hominini', 'Pan', 'Pan paniscus', '34.0', '72.0', '34', 'Female', 'Omnivore').
hominoidea('Jack', 'Hominidae', 'Homininae', 'Hominini', 'Pan', 'Pan paniscus', '38.0', '80.0', '28', 'Male', 'Omnivore').
hominoidea('Perl', 'Hominidae', 'Homininae', 'Hominini', 'Pan', 'Pan paniscus', '40.2', '83.1', '29', 'Male', 'Omnivore').
hominoidea('Andrew', 'Hominidae', 'Homininae', 'Hominini', 'Homo', 'Homo sapiens', '78.0', '182.0', '28', 'Male', 'Omnivore').
hominoidea('Gertruda', 'Hominidae', 'Homininae', 'Hominini', 'Homo', 'Homo sapiens', '58.0', '162.0', '31', 'Female', 'Omnivore').
hominoidea('Phoebe', 'Hylobatidae', '', '', 'Hylobates', 'Hylobates moloch', '6.8', '55.2', '11', 'Female', 'Frugivore ').
hominoidea('Mark', 'Hylobatidae', '', '', 'Hylobates', 'Hylobates moloch', '7.8', '59.2', '15', 'Male', 'Frugivore ').
hominoidea('Abby', 'Hominidae', 'Ponginae', '', 'Pongo', 'Pongo abelii', '49.0', '94.0', '32', 'Female', 'Omnivore').
hominoidea('Rob', 'Hominidae', 'Homininae', 'Gorillini', 'Gorilla', 'Gorilla gorilla', '135.0', '174.0', '28', 'Male', 'Omnivore').
hominoidea('Dorothy', 'Hominidae', 'Homininae', 'Gorillini', 'Gorilla', 'Gorilla gorilla', '119.0', '168.0', '18', 'Female', 'Omnivore').
hominoidea('Zelda', 'Hominidae', 'Homininae', 'Gorillini', 'Gorilla', 'Gorilla gorilla', '82.0', '137.0', '8', 'Female', 'Omnivore').

print_info(Specie, Average, Infotype):-
        Average > 0,
        writef('Average %w of individuals of specie %w is %w.\n', [Infotype, Specie, Average]);
        Average == 0,
        writef('Specie %w not found.\n', [Specie]).

get_average_height_by_species() :-
        write('Enter name of a specie: '),
        read_line_to_codes(user_input, SpecieInput),
        atom_codes(Specie, SpecieInput), nl,
        findall(Height, hominoidea(_,_,_,_,_,Specie,_,Height,_,_,_), Animals),
        average(Average,Animals),
        print_info(Specie, Average, 'height').
        %writef('Average height of individuals of specie %w is %w.\n', [Specie, Average]).

get_average_weight_by_species() :-
        write('Enter name of a specie: '),
        read_line_to_codes(user_input, SpecieInput),
        atom_codes(Specie, SpecieInput), nl,
        findall(Weight, hominoidea(_,_,_,_,_,Specie,Weight,_,_,_,_), Animals),
        average(Average,Animals),
         print_info(Specie, Average, 'weight').
        %writef('Average weight of individuals of specie %w is %w.\n', [Specie, Average]).

average(Average, List) :- sum(List, Sum),
                          my_length(List, Count),
                          Average is Sum/Count.

sum([], 0).
sum([X|List], Sum) :-
    sum(List, Sum1),
    atom_number(X, Xnumber),
    Sum is Xnumber + Sum1.

my_length([], Count) :-
        Count is 1.
my_length(List, Count) :-
        length(List, Count).

get_by_family() :-
    write('Enter name of a genus: '),
    read_line_to_codes(user_input, FamilyInput),
    atom_codes(Family, FamilyInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, SortedAnimals),
    length(SortedAnimals, AnimalsLen),
    writef('Found %w individuals of family %w:\n', [AnimalsLen, Family]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Family', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, SortedAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).

get_by_subfamily() :-
    write('Enter name of a subfamily: '),
    read_line_to_codes(user_input, SubfamilyInput),
    atom_codes(Subfamily, SubfamilyInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals of subfamily %w:\n', [AnimalsLen, Subfamily]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Family', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).

get_by_tribe() :-
    write('Enter name of a tribe: '),
    read_line_to_codes(user_input, TribeInput),
    atom_codes(Tribe, TribeInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals of tribe %w:\n', [AnimalsLen, Tribe]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Family', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).

get_by_genus() :-
    write('Enter name of a family: '),
    read_line_to_codes(user_input, GenusInput),
    atom_codes(Genus, GenusInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals of genus %w:\n', [AnimalsLen, Genus]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Family', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).


get_by_species() :-
    write('Enter name of a specie: '),
    read_line_to_codes(user_input, SpecieInput),
    atom_codes(Specie, SpecieInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals of specie %w:\n', [AnimalsLen, Specie]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Family', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).%  writef('\t%10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w\n', IndividualInfo)).

get_by_id() :-
    write('Enter id: '),
    read_line_to_codes(user_input, IdInput),
    atom_codes(Name, IdInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals with id %w:\n', [AnimalsLen, Name]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Family', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).%  writef('\t%10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w\n', IndividualInfo)).

get_all_data():-
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals in database:\n', [AnimalsLen]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Family', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).%  writef('\t%10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w %10L%w\n', IndividualInfo)).


add_individual() :-
    write('Define new individual:'), nl, nl,
    write('Name: '),
    read_line_to_codes(user_input, NameInput),
    atom_codes(Name, NameInput),
    write('Family: '),
    read_line_to_codes(user_input, FamilyInput),
    atom_codes(Family, FamilyInput),
    write('Subfamily: '),
    read_line_to_codes(user_input, SubfamilyInput),
    atom_codes(Subfamily, SubfamilyInput),
    write('Tribe: '),
    read_line_to_codes(user_input, TribeInput),
    atom_codes(Tribe, TribeInput),
    write('Genus: '),
    read_line_to_codes(user_input, GenusInput),
    atom_codes(Genus, GenusInput),
    write('Specie: '),
    read_line_to_codes(user_input, SpecieInput),
    atom_codes(Specie, SpecieInput),
    write('Weight (kg): '),
    read_line_to_codes(user_input, WeightInput),
    atom_codes(Weight, WeightInput),
    write('Height (cm): '),
    read_line_to_codes(user_input, HeightInput),
    atom_codes(Height, HeightInput),
    write('Age (years): '),
    read_line_to_codes(user_input, AgeInput),
    atom_codes(Age, AgeInput),
    write('Sex: '),
    read_line_to_codes(user_input, SexInput),
    atom_codes(Sex, SexInput),
    write('Diet: '),
    read_line_to_codes(user_input, DietInput),
    atom_codes(Diet, DietInput),
    assertz(hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet)),
    write('Individual added.\n').

add_specified_individual(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet  ) :-
    assertz(hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet)),
    write('Individual added.\n').

remove_individual() :-
    write("Enter name of individual to remove:"),
    read_line_to_codes(user_input, NameInput),
    atom_codes(Name, NameInput),
    retractall(hominoidea(Name, _, _, _, _, _, _, _, _, _, _)),
    write('Individual is no longer in database.\n').
    
remove_specie() :-
    write("Enter name of specie to remove:"),
    read_line_to_codes(user_input, SpecieInput),
    atom_codes(Specie, SpecieInput),
    retractall(hominoidea(_, _, _, _, _, Specie, _, _, _, _, _)),
    writef('All individuals of specie %w removed from database.\n', [Specie]).





