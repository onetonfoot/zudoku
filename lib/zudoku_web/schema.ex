defmodule ZudokuWeb.Schema do
    use Absinthe.Schema
  
    alias ZudokuWeb.{ChallengesResolver}
    alias Zudoku.Repo

    object :language do
        field :id, non_null(:id)
        field :name, non_null(:string)
        field :description, non_null(:string)
        field :questions, list_of(:question) do
            resolve fn lang, _, _ ->
                {:ok, Repo.preload(lang, :questions).questions}
            end
        end
    end

    object :question do 
        field :id, non_null(:id)
        field :question, non_null(:string)
        field :readme, non_null(:string)
        field :test, non_null(:string)
        field :solution, non_null(:string)
        field :user, :language do
            resolve fn question, _, _ ->
                {:ok, Repo.preload(question, :user).user}
            end
        end
        field :lang, :language do
            resolve fn question, _, _ ->
                {:ok, Repo.preload(question, :lang).lang}
            end
        end
    end

    object :user do
        field :id, non_null(:id)
        field :email, non_null(:string)
        field :name, non_null(:string)
    end

    object :trail do
        field :id, non_null(:id)
        field :passed, non_null(:boolean)
        field :question, non_null(:question) do
            resolve fn trail, _, _ ->
                {:ok, Repo.preload(trail, :question).question}
            end
        end
        field :user, non_null(:user) do
            resolve fn trail, _, _ ->
                {:ok, Repo.preload(trail, :user).user}
            end
        end
    end

    query do
      field :all_languages, non_null(list_of(non_null(:language))) do
        resolve &ChallengesResolver.all_langs/3
      end

      field :find_lang, :language do
        arg :name, non_null(:string)
        resolve &ChallengesResolver.find_lang/3
      end

      field :all_questions, non_null(list_of(non_null(:question))) do
        resolve &ChallengesResolver.all_questions/3
      end

      field :all_trails, non_null(list_of(non_null(:trail))) do
        resolve &ChallengesResolver.all_trails/3
      end
      
    end
  end