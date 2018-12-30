zebra_puzzle(Colors, Origins, Pets, Beverages, Cigarets):-
	% There are five houses. Each of the five houses is painted a different color, 
	% and their inhabitants are of different national extractions, own different 
	% pets, drink different beverages and smoke different brands of American cigarets 

	Colors = [Red, Green, Ivory, Yellow, Blue], Colors ins 1..5, all_different(Colors),
	Origins = [Englishman, Spaniard, Ukranian, Norwegian, Japanese], Origins ins 1..5, all_different(Origins),
	Pets = [Dog, Snails, Fox, Horse, Zebra], Pets ins 1..5, all_different(Pets),
	Beverages = [Coffee, Tea, Water, Juice, Milk], Beverages ins 1..5, all_different(Beverages), 
	Cigarets = [Chesterfield, Kools, Lucky, Parliaments, OldGold], Cigarets ins 1..5, all_different(Cigarets),

	% The Englishman lives in the red house.
	Englishman #= Red,
	% The Spaniard owns the dog.
	Spaniard #= Dog,
	% Coffee is drunk in the green house.
	Coffee #= Green,
	% The Ukrainian drinks tea.
	Ukranian #= Tea,
	% The green house is immediately to the right of the ivory house.
	Green #= Ivory + 1,
	% The Old Gold smoker owns snails.
	OldGold #= Snails,
	% Kools are smoked in the yellow house.
	Kools #= Yellow,
	% Milk is drunk in the middle house.
	Milk #= 3,
	% The Norwegian lives in the first house.
	Norwegian #= 1,
	% The man who smokes Chesterfields lives in the house next to the man with the fox.
	abs(Chesterfield - Fox) #= 1,
	% Kools are smoked in the house next to the house where the horse is kept.
	abs(Kools - Horse) #= 1,
	% The Lucky Strike smoker drinks orange juice.
	Lucky #= Juice,
	% The Japanese smokes Parliaments.
	Japanese #= Parliaments,
	% The Norwegian lives next to the blue house.
	abs(Norwegian - Blue) #= 1,
	
	labeling([], Colors), labeling([], Origins), labeling([], Pets), 
	labeling([], Beverages), labeling([], Cigarets).


