defmodule ZudokuWeb.LanguagesResolver do
    alias Zudoku.Language
    alias Zudoku.Repo

    def all_languages(_root, _args, _info) do
        languages = Repo.all(Language)
        {:ok, languages}
    end
end