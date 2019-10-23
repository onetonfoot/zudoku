defmodule ZudokuWeb.ChallengesResolver do
    alias Zudoku.Challenges

    def all_questions(_root, _args, _info) do
        questions = Challenges.list_questions()
        {:ok, questions}
    end

    def all_langs(_root, _args, _info) do
        langs = Challenges.list_langs()
        {:ok, langs}
    end

    def all_trials(_root, _args, _info) do
        trials = Challenges.list_trials()
        {:ok, trials}
    end

    def find_lang(_root, args, _info) do
        lang = Challenges.get_lang_by(args)
        {:ok, lang}
    end

    def find_question(_root, args, _info) do
        question = Challenges.get_question_by(args)
        {:ok, question}
    end

    def find_trial(_root, args, _info) do
        trial = Challenges.get_trial_by(args)
        {:ok, trial}
    end
end
