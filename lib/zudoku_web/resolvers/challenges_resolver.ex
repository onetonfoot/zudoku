defmodule ZudokuWeb.ChallengesResolver do
    alias Zudoku.Challenges
    alias Zudoku.Repo

    def all_questions(_root, _args, _info) do
        questions = Challenges.list_questions()
        {:ok, questions}
    end

    def all_langs(_root, _args, _info) do
        langs = Challenges.list_langs()
        {:ok, langs}
    end

    def all_trails(_root, _args, _info) do
        trials = Challenges.list_trials()
        {:ok, trials}
    end

    def find_lang(_root, args, _info) do
        lang = Challenges.get_lang_by(args)
        {:ok, lang}
    end
end