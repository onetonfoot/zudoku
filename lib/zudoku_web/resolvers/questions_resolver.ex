defmodule ZudokuWeb.QuestionsResolver do
    alias Zudoku.Question
    alias Zudoku.Repo

    def all_questions(_root, _args, _info) do
        questions = Repo.all(Question)
        {:ok, questions}
    end
end