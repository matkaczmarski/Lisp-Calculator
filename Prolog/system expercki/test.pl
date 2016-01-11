get_tests():-
    get_all_data(),
    get_by_species(),
    get_average_height_by_species(),
    get_average_weight_by_species(),
    get_by_family(),
    get_by_subfamily(),
    get_by_tribe(),
    get_by_genus(),
    get_by_id().
    
add_tests():-
   get_all_data(),
   add_specified_individual('TicTac', 'Hominidae', 'Homininae', 'Gorillini', 'Gorilla', 'Gorilla beringei', '67.0', '115.0', '5', 'Male', 'Omnivore'),
   get_all_data().
   
remove_tests():-
   get_all_data(),
   remove_individual(),
   get_all_data(),
   remove_specie(),
   get_all_data().