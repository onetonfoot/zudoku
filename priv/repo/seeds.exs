# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Zudoku.Repo.insert!(%Zudoku.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Zudoku.Repo
alias Zudoku.Accounts.User
alias Zudoku.Challenges.{Lang, Question, Trial}
alias Faker.{Cannabis, Name, Internet}

elixir = %Lang{name: "Elixir", desc: "Elixir is good for writing backend applications"} |> Repo.insert!
rust = %Lang{name: "Rust", desc: "Rust is good for system programming"} |> Repo.insert!
julia = %Lang{name: "Julia", desc: "Julia is good for scientific computing"} |> Repo.insert!
elm = %Lang{name: "Elm", desc: "Elm is good for web development"} |> Repo.insert!

langs = [elixir, rust, julia, elm]

user = %User {
    name: "Test",
    email: "test@test.com",
    password: "password"
} |> Repo.insert!


for i <- 0..5 do
    u = %User {
        name: Name.name(),
        email: Internet.email(),
        password: "password",
    } |> Repo.insert!

    for i <- 0..5 do 
        q = %Question {
            question: Cannabis.strain(), 
            readme: Cannabis.health_benefit() ,
            solution: "I cant be solved!",
            test: "Testing is not my cup of tea",
        }
        
        q = Ecto.build_assoc(Enum.random(langs), :questions, q) |> Repo.insert!

        trial = %Trial {
            passed: false,
        }
        trial = Ecto.build_assoc(u, :trials, trial)
        trial = Ecto.build_assoc(q, :trials, trial) |> Repo.insert!

    end
end
