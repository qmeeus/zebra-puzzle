house(_,_,_,_,_).
colors([red, green, ivory, yellow, blue]).
origins([englishman, spaniard, ukranian, norwegian, japanese]).
pets([dog, snails, fox, horse, zebra]).
beverages([coffee, tea, water, juice, milk]).
cigarets([chesterfield, kools, luckystrikes, parliaments, oldgold]).

zebra_puzzle:-
	% There are five houses. Each of the five houses is painted a different color, 
	% and their inhabitants are of different national extractions, own different 
	% pets, drink different beverages and smoke different brands of American cigarets.

	Colors = [Red, Green, Ivory, Yellow, Blue], Colors ins 1..5, all_different(Colors),
	Origins = [Englishman, Spaniard, Ukranian, Norwegian, Japanese], Origins ins 1..5, all_different(Origins),
	Pets = [Dog, Snails, Fox, Horse, _], Pets ins 1..5, all_different(Pets),
	Beverages = [Coffee, Tea, _, Juice, Milk], Beverages ins 1..5, all_different(Beverages), 
	Cigarets = [Chesterfield, Kools, Lucky, Parliaments, OldGold], Cigarets ins 1..5, all_different(Cigarets),

	Englishman #= Red,					% The Englishman lives in the red house.
	Spaniard #= Dog,					% The Spaniard owns the dog.
	Coffee #= Green,					% Coffee is drunk in the green house.
	Ukranian #= Tea,					% The Ukrainian drinks tea.
	Green #= Ivory + 1,					% The green house is immediately to the right of the ivory house.
	OldGold #= Snails,					% The Old Gold smoker owns snails.
	Kools #= Yellow,					% Kools are smoked in the yellow house.
	Milk #= 3,							% Milk is drunk in the middle house.
	Norwegian #= 1,						% The Norwegian lives in the first house.
	abs(Chesterfield - Fox) #= 1,		% The man who smokes Chesterfields lives in the house next to the man with the fox.
	abs(Kools - Horse) #= 1,			% Kools are smoked in the house next to the house where the horse is kept.
	Lucky #= Juice,						% The Lucky Strike smoker drinks orange juice.
	Japanese #= Parliaments,			% The Japanese smokes Parliaments.
	abs(Norwegian - Blue) #= 1,			% The Norwegian lives next to the blue house.
	
	labeling([], Colors), labeling([], Origins), labeling([], Pets), labeling([], Beverages), labeling([], Cigarets),
	display([1,2,3,4,5], _, [Colors, Origins, Pets, Beverages, Cigarets]).
	
house_attr(_, [], [], []).
house_attr(Nr, [List|Solution], [Names|Rest], [El|Attrs]):-
	house_attr(Nr, Solution, Rest, Attrs),
	nth1(Idx, List, Nr),
	nth1(Idx, Names, El).

make_house(Nr, Solution, House):-
	colors(ColNames), origins(OriginNames), pets(PetsNames), beverages(BevNames), cigarets(CigNames),
	Names = [ColNames, OriginNames, PetsNames, BevNames, CigNames],
	house_attr(Nr, Solution, Names, Attrs),
	House =..[house|Attrs].

display([], [], _).
display([HouseNr|Ns], [House|Rest], Solution):-
	make_house(HouseNr, Solution, House),
	write(House), nl,
	display(Ns, Rest, Solution).

