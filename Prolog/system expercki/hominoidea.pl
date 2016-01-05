:- dynamic hominoidea/11.

%hominoidea( imiê/identyfikator, rodzina, podrodzina, plemiê, rodzaj, gatunek, waga (kg), wzrost (cm), wiek (lata), p³eæ, sposób od¿ywiania).
hominoidea('Molly', 'Hominidae', 'Homininae', 'Hominini', 'Pan', 'Pan paniscus', '34.0', '72.0', '34', 'Female', 'Omnivore').
hominoidea('Jack', 'Hominidae', 'Homininae', 'Hominini', 'Pan', 'Pan paniscus', '38.0', '80.0', '28', 'Male', 'Omnivore').
hominoidea('Andrew', 'Hominidae', 'Homininae', 'Hominini', 'Homo', 'Homo sapiens', '78.0', '182.0', '28', 'Male', 'Omnivore').
hominoidea('Phoebe', 'Hylobatidae', '', '', 'Hylobates', 'Hylobates moloch', '6.8', '55.2', '11', 'Female', 'Frugivore ').
hominoidea('Abby', 'Hominidae', 'Ponginae', '', 'Pongo', 'Pongo abelii', '49.0', '94.0', '32', 'Female', 'Omnivore').
hominoidea('Rob', 'Hominidae', 'Homininae', 'Gorillini', 'Gorilla', 'Gorilla gorilla', '135.0', '174.0', '28', 'Male', 'Omnivore').
hominoidea('Rob2', 'Hominidae2', 'Homininae', 'Gorillini', 'Gorilla', 'Gorilla gorilla', '135.0', '174.0', '28', 'Male', 'Omnivore').

get_average_height_by_species(Average) :-
	write('Enter name of a specie: '),
	read_line_to_codes(user_input, SpecieInput),
	atom_codes(Specie, SpecieInput), nl,
	findall(Height, hominoidea(_,_,_,_,_,Specie,_,Height,_,_,_), Animals),
	average(Average,Animals).

get_average_weight_by_species(Average) :-
	write('Enter name of a specie: '),
	read_line_to_codes(user_input, SpecieInput),
	atom_codes(Specie, SpecieInput), nl,
	findall(Height, hominoidea(_,_,_,_,_,Specie,_,Height,_,_,_), Animals),
	average(Average,Animals).

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
    write('Enter name of a family: '),
    read_line_to_codes(user_input, FamilyInput),
    atom_codes(Family, FamilyInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals:\n', [AnimalsLen]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Superfamily', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).

get_by_subfamily() :-
    write('Enter name of a subfamily: '),
    read_line_to_codes(user_input, SubfamilyInput),
    atom_codes(Subfamily, SubfamilyInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals:\n', [AnimalsLen]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Superfamily', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).

get_by_tribe() :-
    write('Enter name of a tribe: '),
    read_line_to_codes(user_input, TribeInput),
    atom_codes(Tribe, TribeInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals:\n', [AnimalsLen]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Superfamily', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).

get_by_genus() :-
    write('Enter name of a family: '),
    read_line_to_codes(user_input, GenusInput),
    atom_codes(Genus, GenusInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals:\n', [AnimalsLen]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Superfamily', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
    foreach(member(IndividualInfo, UniqueAnimals), format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', IndividualInfo)).


get_by_species() :-
    write('Enter name of a specie: '),
    read_line_to_codes(user_input, SpecieInput),
    atom_codes(Specie, SpecieInput), nl,
    findall([Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet], hominoidea(Name, Family, Subfamily, Tribe, Genus, Specie, Weight, Height, Age, Sex, Diet), Animals),
    sort(Animals, UniqueAnimals),
    length(UniqueAnimals, AnimalsLen),
    writef('Found %w individuals:\n', [AnimalsLen]),
    format('~w~t~10|~w~t~25|~w~t~40|~w~t~55|~w~t~65|~w~t~85|~w~t~100|~w~t~115|~w~t~130|~w~t~145|~w~t~160|~n', ['Name', 'Superfamily', 'Subfamily', 'Tribe', 'Genus', 'Specie', 'Weight (kg)', 'Height (cm)', 'Age', 'Sex', 'Diet']),
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
    write('Individual added.').

remove_individual() :-
    write("Enter name of individual to remove:"),
    read_line_to_codes(user_input, NameInput),
    atom_codes(Name, NameInput),
    retractall(hominoidea(Name, _, _, _, _, _, _, _, _, _, _)),
    write('Individual removed.').





