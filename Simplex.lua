-- Simplex in Lua--------------------------------------

--[[

1---Type of variables:
    L:number of constraints"<="
    E:....................."="
    G:.....................">="
    N:.......... variables
    F: = 1, if maximize
       =-1, if minimize
    A:coefficient matrix of the simples
      matrix is arranged in the following sequance:
      1. <=
      2. =
      3. >=
      4. objective
    Remark: initialize matrix A ???

2---How to use it
    Simplex(L,G,E,N,F,A)

3---Error information

4---Dependent
    Matrix Lua ???

]]--

function Simplex(L,G,E,N,F,A)

-- Initialization---------------------------------------
    for i=1,N do
        A[L+E+G][i]=-F*A[L+E+G][i]
    end
    Error=0
    C=1
    M=L+G+E
    B=M+N+G+1
    W=M
    M=M-1
    H=1
    for k=1,(M+1) do
        A[k-1][N+G+k]=1
        A[k-1][0]=k+N+G
    end

-- BloceA-----------------------------------------------
    for k=(L+E+1),(M+1) do
        A[k-1][k+N-L-E]=-1
    end
    W=W+1
    Q=0
    for j=1,(N+G) do
        S=0
        for i=M-G-E+1,M do
            S=S+A[i][j]
        end
        A[W][j]=-S
        if A[W][j]<=Q then
            Q=A[W][j]
            C=j
        end
    end


-- BloceB1----------------------------------------
    H=H+1
    Q=9.9e37
    R=-1
    for i=0,M do
        if A[i][C]>0 then
            if (A[i][B]/A[i][C])<=Q then
                Q=A[i][B]/A[i][C]
                R=i
            end
        end
    end

-- -----BloceB2----------------------------------------









end
-- Fine---------------------------------------