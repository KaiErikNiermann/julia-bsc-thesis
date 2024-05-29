import MacroTools.rmlines

mutable struct obj <: hittable 
    faces::Vector{triangle}
    bbox::aabb
end

mutable struct face
    vertices::Vector{Int64}
    normals::Vector{Int64}
    textures::Vector{Int64}
end

mutable struct scene
    # metadata
    name::String

    # scene information 
    v_array::Vector{Float64}
    vn_array::Vector{Float64}
    vt_array::Vector{Float64}
    f_array::Vector{face}
end

macro match(v, block)
    block = rmlines(block)
    pairs = block.args
    ex = nothing

    for p in reverse(pairs)
        if isnothing(ex)
            ex = esc(p.args[3])
        else
            ex = Expr(:if, Expr(:call, :(==), esc(v), esc(p.args[2])), esc(p.args[3]), ex)
        end
    end

    ex
end

function scene_summary(scene::scene)
    println("Scene: ", scene.name)
    println("Vertices: ", length(scene.v_array))
    println("Normals: ", length(scene.vn_array))
    println("Textures: ", length(scene.vt_array))
    println("Faces: ", length(scene.f_array))
end


"""
Wavefront .obj file parser
"""
function reader(file_name::String)::scene
    v_array = Vector{Float64}()
    vn_array = Vector{Float64}()
    vt_array = Vector{Float64}()

    f_array = Vector{face}()

    sc = scene("", v_array, vn_array, vt_array, f_array)
    sc_meta = Vector{String}()

    for line in eachline(file_name)
        @match true begin
            startswith(line, "v ") => begin
                v = split(line[3:end], " ")
                for i in v
                    push!(v_array, parse(Float64, i))
                end
            end
            # faces 
            startswith(line, "f ") => begin
                f = split(line[3:end], " ")
                vertices = Vector{Float64}()
                normals = Vector{Float64}()
                textures = Vector{Float64}()
                for i in f
                    @match true begin
                        # vertex, texture, normal
                        occursin(r"\d+\/\d+\/\d+", i) => begin
                            face = split(i, "/")
                            push!(vertices, parse(Int64, face[1]))
                            push!(textures, parse(Int64, face[2]))
                            push!(normals, parse(Int64, face[3]))
                        end
                        # vertex, normal
                        occursin(r"\d+\/\/\d+", i) => begin
                            face = split(i, "//")
                            push!(vertices, parse(Int64, face[1]))
                            push!(normals, parse(Int64, face[2]))
                        end
                    end
                end
                push!(f_array, face(vertices, normals, textures))
            end
            # vertex normals
            startswith(line, "vn ") => begin
                vn = split(line[4:end], " ")
                for i in vn
                    push!(vn_array, parse(Float64, i))
                end
            end
            # optional texture vertices
            startswith(line, "vt ") => begin
                vt = split(line[4:end], " ")
                for i in vt
                    push!(vt_array, parse(Float64, i))
                end
            end
            # object name
            startswith(line, "o ") => println(line)
            # groups
            startswith(line, "g ") => println(line)
            # smoothing group
            startswith(line, "s ") => println(line)
            # headers and metadata 
            startswith(line, "# ") => begin
                push!(sc_meta, line)
            end
            # material library
            startswith(line, "mtllib ") => println(line)
            # material name
            startswith(line, "usemtl ") => println(line)
        end
    end
    sc.name = join(sc_meta, "\n")
    sc
end

"""
Function to check if a point is inside the circumcircle of a triangle
"""
function in_circumcircle(t::triangle, v::Vector{Float64})

end

"""
Function to check if an edge is not shared by an array of triangles
"""
function not_shared(e::Vector{Float64}, triangles::Vector{triangle})

end

"""
Boywer-Watson triangulation algorithm
"""
function triangulation(faces::Vector{face})::Vector{triangle}
    triangles = Vector{triangle}()

    push!(triangles, triangle(0.0, 0.0, 0.0))

    for v in faces.vertices
        bad_triangles = Vector{triangle}()
        for t in triangles
            if in_circumcircle(t, v)
                push!(bad_triangles, t)
            end
        end
        polygon = Vector{Vector{Int64}}()   
        for t in bad_triangles
            for e in t.edges
                if not_shared(e, bad_triangles)
                    push!(polygon, e)
                end
            end
        end
        for t in bad_triangles
            delete!(triangles, t)
        end
        for e in polygon
            push!(triangles, triangle(e[1], e[2], v))
        end
    end
    for t in triangles
        if has_vertex(t, 0.0) 
            delete!(triangles, t)
        end
    end
    return triangles
end

sc = reader("scenes/cottage_obj.obj")

scene_summary(sc)

