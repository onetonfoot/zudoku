defmodule ZudokuWeb.Schema do
    use Absinthe.Schema
  
    alias ZudokuWeb.{LanguagesResolver, QuestionsResolver}
    alias Zudoku.Repo

    object :language do
        field :id, non_null(:id)
        field :name, non_null(:string)
        field :description, non_null(:string)
    end

    object :question do 
        field :id, non_null(:id)
        field :readme, non_null(:string)
        field :test, non_null(:string)
        field :solution, non_null(:string)
        field :lang, :language do
            resolve fn question, _, _ ->
                lang = question
                |> Ecto.assoc(:lang)
                |> Repo.one

                {:ok, lang}
            end
        end
    end

    query do
      field :all_languages, non_null(list_of(non_null(:language))) do
        resolve &LanguagesResolver.all_languages/3
      end

      field :all_questions, non_null(list_of(non_null(:question))) do
        resolve &QuestionsResolver.all_questions/3
      end
    end
  end