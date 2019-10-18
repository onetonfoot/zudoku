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

lang_elixir = %Lang{name: "Elixir", desc: "Elixir is good for writing backend applications"} |> Repo.insert!
lang_rust = %Lang{name: "Rust", desc: "Rust is good for system programming"} |> Repo.insert!

user_1 = %User {
    name: "Dom",
    email: "Dom@dom.com",
    password: "p@ssw0rd"
} |> Repo.insert!

user_2 = %User {
    name: "Karen",
    email: "Karen@karen.com",
    password: "p@ssw0rd"
} |> Repo.insert!

question_1 = %Question {
    question: "Two-fer", 
    readme: "Please don't read me!",
    solution: "I cant be solved!",
    test: "Testing is not my cup of tea",
}
question_1 = Ecto.build_assoc(lang_elixir, :questions, question_1) |> Repo.insert!

question_2 = %Question {
    question: "Roman Numerals", 
    readme: "Please don't read me!",
    solution: "I cant be solved!",
    test: "Testing is not my cup of tea",
}
question_2 = Ecto.build_assoc(lang_rust, :questions, question_2) |> Repo.insert!

question_3 = %Question {
    question: "Two-fer", 
    readme: "Please don't read me!",
    solution: "I cant be solved!",
    test: "Testing is not my cup of tea",
}
question_3 = Ecto.build_assoc(lang_rust, :questions, question_3) |> Repo.insert!


trial_1 = %Trial {
    passed: false,
}
trial_1 = Ecto.build_assoc(user_1, :trials, trial_1)
trial_1 = Ecto.build_assoc(question_1, :trials, trial_1) |> Repo.insert!

trial_2 = %Trial {
    passed: true,
}
trial_2 = Ecto.build_assoc(user_1, :trials, trial_2)
trial_2 = Ecto.build_assoc(question_1, :trials, trial_2) |> Repo.insert!