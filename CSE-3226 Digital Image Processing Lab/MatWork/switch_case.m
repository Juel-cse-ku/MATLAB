clc;
close all;
% n=input('Enter Number ');
favcolor=menu('Press Any color ','Red','Green','Blue','Cyan','Megenta','Yellow');
switch favcolor
      case 0
        disp('You do not peak any color');
      case 1
        disp('My Name is Masum');
      case 2
        disp('I read in KU');
      case 3
        disp('Read in CSE Discipline');
      case 4
        disp('My village Name is Katipara');
      case 5
        disp('My Thana is Paikgacha');
      case 6
        disp('My District is in Khulna');
    otherwise
        disp('Apni Wrong Input Diasen');
end