//Rashid Al Qubaisi

PVector P1, P2, P3, V, B, VM;
P1 = new PVector(100, 0);
P2 = new PVector(20, 50);
P3 = new PVector(50, 80);

V = PVector.sub(P3, P1);
B = PVector.sub(P2, P1);

B.normalize();

VM = B.mult(V.dot(B));
println(VM); //this prints the VM on the console
