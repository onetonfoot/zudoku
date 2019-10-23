defmodule ZudokuWeb.Schema do
    use Absinthe.Schema

    alias ZudokuWeb.{ChallengesResolver}
    alias Zudoku.Repo

    object :language do
        field :id, non_null(:id)
        field :name, non_null(:string)
        field :desc, non_null(:string)
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

    object :trial do
        field :id, non_null(:id)
        field :passed, non_null(:boolean)
        field :question, non_null(:question) do
            resolve fn trial, _, _ ->
                {:ok, Repo.preload(trial, :question).question}
            end
        end
        field :user, non_null(:user) do
            resolve fn trial, _, _ ->
                {:ok, Repo.preload(trial, :user).user}
            end
        end
    end

    query do
      field :all_languages, non_null(list_of(non_null(:language))) do
        resolve &ChallengesResolver.all_langs/3
      end

      field :find_lang, :language do
        arg :name, :string
        arg :id, :id
        resolve &ChallengesResolver.find_lang/3
      end

      field :all_questions, non_null(list_of(non_null(:question))) do
        resolve &ChallengesResolver.all_questions/3
      end

      field :find_question, :question do
        arg :question, :string
        arg :id, :id
        resolve &ChallengesResolver.find_question/3
      end

      field :all_trials, non_null(list_of(non_null(:trial))) do
        resolve &ChallengesResolver.all_trials/3
      end

      field :find_trial, :trial do
        arg :id, :id
        resolve &ChallengesResolver.find_trial/3
      end
    end
  end
