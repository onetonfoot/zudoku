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
alias Zudoku.{Language, Question}

lang_elixir = %Language{name: "Elixir", description: "Elixir is good for writing backend applications"}
lang_rust = %Language{name: "Rust", description: "Rust is good for system programming"}

question_1 = %Question {
    question: "Two-fer", 
    readme: "Please don't read me!",
    solution: "I cant be solved!",
    test: "Testing is not my cup of tea",
    lang: lang_elixir
}

question_2 = %Question {
    question: "Roman Numerals", 
    readme: "Please don't read me!",
    solution: "I cant be solved!",
    test: "Testing is not my cup of tea",
    lang: lang_elixir
}

question_3 = %Question {
    question: "Two-fer", 
    readme: "Please don't read me!",
    solution: "I cant be solved!",
    test: "Testing is not my cup of tea",
    lang: lang_rust
}

Repo.insert!(lang_elixir)
Repo.insert!(lang_rust)
Repo.insert!(question_1)
Repo.insert!(question_2)
Repo.insert!(question_3)