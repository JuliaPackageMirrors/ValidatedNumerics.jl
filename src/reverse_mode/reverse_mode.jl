# From the IEEE 1788 standard on interval arithmetic:

"""For a unary function ϕ,
ϕRev(c, 𝒙) ⊇ {x ∈ 𝒙 | ϕ(x) is defined and in c}

The second argument 𝒙 is optional, and is set equal to the real line if not given.
"""


doc"""sqrRev(c) is the interval x such that x^2 ⊆ c."""
function sqrRev(c)
    x1 = -sqrt(c)
    x2 = sqrt(c)

    x = hull(x1, x2)
end

doc"""sqrRev(c, x) is (or, strictly, contains) the restriction of x to the sub-interval x̃ of x such that x̃^2 ⊆ c.
"""
function sqrRev(c, x)
    x1 = -sqrt(c) ∩ x
    x2 = sqrt(c) ∩ x

    x = hull(x1, x2)
end

doc"""absRev(c, x) is the subset of x such that |x| is in c,
i.e. c = |x| """
function absRev(c, x=entireinterval())
    x1 = x ∩ c
    x2 = x ∩ (-c)

    hull(x1, x2)
end

doc"""pownRev(c, x, p) is the subset of x such that c = x^p with p an integer"""
function pownRev(c, x, p)
    if iseven(p)
        x1 = x ∩ (c^(1//p))
        x2 = x ∩ -(c^(1//p))
        hull(x1, x2)
    else
        x ∩ ( c^(1//p) )
    end
end

doc"""sinRev(c, x) is the subset of x such that c = sin(x)"""
function sinRev(c, x)
end

# Binary functions
"""
⦿Rev₁(b, c, x) ⊇ {x ∈ x | b ∈ b exists such that x ⦿ b is defined and in c}
⦿Rev₂(a, c, x) ⊇ {x ∈ x | a ∈ a exists such that a ⦿ x is defined and in c}

If commutative then these agree and just implement ⦿Rev

"""

"""mulRev(b,c,x):
subset of x such that b*x is in c, i.e. c = b*x
"""
function mulRev(b, c, x)  # commutative
    x = x ∩ (c / b)
end
