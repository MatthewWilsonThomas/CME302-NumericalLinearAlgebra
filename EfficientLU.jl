function getrfAxpy!(A)
    n = size(A, 1)
    for j = 1:n
        for k = 1:j - 1
            #Linear combination of column j and k
            for i = k + 1:n
                A[i, j] -= A[i, k] * A[k, j]
            end
        end

        @assert A[j, j] != 0
        for i = j + 1:n
            A[i, j] /= A[j,j]
        end
    end
end



