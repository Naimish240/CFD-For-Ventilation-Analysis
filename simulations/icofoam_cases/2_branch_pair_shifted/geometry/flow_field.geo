Merge "flow_field.step";
//+
Physical Volume("flow_field", 310) = {1};
//+
Physical Volume("flow_field", 310) += {1};
//+
Physical Volume("flow_field", 310) += {1};
//+
Physical Surface("wall", 311) = {36, 5, 4, 3, 1, 2, 49, 50, 52, 51, 37, 38, 40, 39, 41, 42, 44, 43, 46, 45, 48, 47};
//+
Physical Surface("inlet", 312) = {106, 109};
//+
Physical Surface("outlet", 313) = {107, 108};
//+
Physical Surface("surface", 314) = {19, 20, 22, 23, 21, 100, 25, 24, 99, 26, 29, 27, 98, 28, 34, 35, 33, 96, 31, 32, 30, 97};
//+
Physical Surface("surface", 314) += {101, 18};
//+
Physical Surface("surface", 314) += {16, 17, 15, 102, 14, 13, 12, 103, 11, 9, 10, 104, 8, 105, 7, 6};
//+
Physical Surface("surface", 314) += {53, 54, 55, 85, 58, 57, 56, 86, 59, 60, 61, 87, 62, 88, 64, 63, 89, 67, 66, 65, 90, 68, 70, 69, 73, 72, 71, 91, 92, 76, 75, 74, 77, 78, 79, 93, 82, 94, 81, 80, 84, 83, 95};
