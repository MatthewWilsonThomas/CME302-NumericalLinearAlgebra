function getrf!(A)
    # Uses pivoting
    n = size(A, 1)
    P = collect(1:n)
    for k = 1:n
        # Find pivot
        imx = k - 1 + argmax(abs.(A[k: end, k]))
        # Identify row with largest entry
        # Swap rows
        for j = 1:n
            A[k,j], A[imx, j] = A[imx, j], A[k,j]
        end
        P[[k, imx]] = P[[imx, k]]

        # Proceed with factorisation
        for i = k + 1:n
            A[i, k] /= A[k, k]
        end

        for j = k + 1:n, i = k + 1:n
            A[i, j] -= A[i, k] * A[k, j]
        end
    end
    return P
end

