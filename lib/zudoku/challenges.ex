defmodule Zudoku.Challenges do
  @moduledoc """
  The Challenges context.
  """

  import Ecto.Query, warn: false
  alias Zudoku.Repo

  alias Zudoku.Challenges.Lang

  @doc """
  Returns the list of langs.

  ## Examples

      iex> list_langs()
      [%Lang{}, ...]

  """
  def list_langs do
    Repo.all(Lang)
  end

  @doc """
  Gets a single lang.

  Raises `Ecto.NoResultsError` if the Lang does not exist.

  ## Examples

      iex> get_lang!(123)
      %Lang{}

      iex> get_lang!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lang!(id), do: Repo.get!(Lang, id)
  def get_lang_by(opts), do: Repo.get_by(Lang, opts)

  @doc """
  Creates a lang.

  ## Examples

      iex> create_lang(%{field: value})
      {:ok, %Lang{}}

      iex> create_lang(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lang(attrs \\ %{}) do
    %Lang{}
    |> Lang.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lang.

  ## Examples

      iex> update_lang(lang, %{field: new_value})
      {:ok, %Lang{}}

      iex> update_lang(lang, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lang(%Lang{} = lang, attrs) do
    lang
    |> Lang.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Lang.

  ## Examples

      iex> delete_lang(lang)
      {:ok, %Lang{}}

      iex> delete_lang(lang)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lang(%Lang{} = lang) do
    Repo.delete(lang)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lang changes.

  ## Examples

      iex> change_lang(lang)
      %Ecto.Changeset{source: %Lang{}}

  """
  def change_lang(%Lang{} = lang) do
    Lang.changeset(lang, %{})
  end

  alias Zudoku.Challenges.Question

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)
  def get_question_by(opts), do: Repo.get_by(Question, opts)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{source: %Question{}}

  """
  def change_question(%Question{} = question) do
    Question.changeset(question, %{})
  end

  alias Zudoku.Challenges.Trial

  @doc """
  Returns the list of trials.

  ## Examples

      iex> list_trials()
      [%Trial{}, ...]

  """
  def list_trials do
    Repo.all(Trial)
  end

  @doc """
  Gets a single trial.

  Raises `Ecto.NoResultsError` if the Trial does not exist.

  ## Examples

      iex> get_trial!(123)
      %Trial{}

      iex> get_trial!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trial!(id), do: Repo.get!(Trial, id)
  def get_trial_by(opts), do: Repo.get_by(Trial, opts)

  @doc """
  Creates a trial.

  ## Examples

      iex> create_trial(%{field: value})
      {:ok, %Trial{}}

      iex> create_trial(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trial(attrs \\ %{}) do
    %Trial{}
    |> Trial.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trial.

  ## Examples

      iex> update_trial(trial, %{field: new_value})
      {:ok, %Trial{}}

      iex> update_trial(trial, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trial(%Trial{} = trial, attrs) do
    trial
    |> Trial.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Trial.

  ## Examples

      iex> delete_trial(trial)
      {:ok, %Trial{}}

      iex> delete_trial(trial)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trial(%Trial{} = trial) do
    Repo.delete(trial)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trial changes.

  ## Examples

      iex> change_trial(trial)
      %Ecto.Changeset{source: %Trial{}}

  """
  def change_trial(%Trial{} = trial) do
    Trial.changeset(trial, %{})
  end
end
