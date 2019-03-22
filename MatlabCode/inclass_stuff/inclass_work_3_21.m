% Cell array for movies in class

cellarray = {'Movie', 'Director', 'Year_Released', 'Millions_Grossed', 'Audience_Score';
             'Snatch', 'Guy Ritchie', 2001, 30.1, 93;
             'Serenity', 'Joss Whedon', 2005, 25.3, 91;
             'The Big Lebowski', 'Joel Coen', 1998, 18, 94};

fieldNames = cellarray(1,:);

movie_struct.fieldNames = fieldNames;
movie_struct.movieOne = cellarray(2,:);
movie_struct.movieTwo = cellarray(3,:);
movie_struct.movieThree = cellarray(4,:);

movie_Struct_2 = cell2struct(cellarray, fieldNames, 2);

movie_table = struct2table(movie_Struct_2);