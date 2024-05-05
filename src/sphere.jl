include("aabb.jl")

struct sphere <: hittable
    center::Vector{Float64}
    radius::Float64
    mat::material
    r_squared::Float64
    bbox::aabb
    function sphere(center::Vector{Float64}, radius::Float64, mat::material)
        radius = max(radius, 0.0)
        bbox = aabb(center - radius, center + radius)
        new(center, radius, mat, radius^2, bbox)
    end
end

function hit!(s::sphere, r::ray, t_min::Float64, t_max::Float64, rec::hit_record)
    oc = r.origin - s.center
    a = dot(r.direction, r.direction)
    half_b = dot(oc, r.direction)

    c = dot(oc, oc) - s.r_squared
    discriminant = half_b^2 - a * c
    if (discriminant < 0)
        return false
    end

    sqrtd = sqrt(discriminant)

    # Nearest root that lies in the acceptable range
    root = (-half_b - sqrtd) / a
    if (root < t_min || root > t_max)
        root = (-half_b + sqrtd) / a
        if (root < t_min || root > t_max)
            return false
        end
    end

    rec.t = root
    rec.p = at(r, rec.t)
    outward_normal::Vector{Float64} = (rec.p - s.center) / s.radius
    set_face_normal!(rec, r, outward_normal)
    rec.mat = s.mat

    return true
end