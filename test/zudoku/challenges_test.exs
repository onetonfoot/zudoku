defmodule Zudoku.ChallengesTest do
  use Zudoku.DataCase

  alias Zudoku.Challenges

  describe "langs" do
    alias Zudoku.Challenges.Lang

    @valid_attrs %{desc: "some desc", name: "some name"}
    @update_attrs %{desc: "some updated desc", name: "some updated name"}
    @invalid_attrs %{desc: nil, name: nil}

    def lang_fixture(attrs \\ %{}) do
      {:ok, lang} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Challenges.create_lang()

      lang
    end

    test "list_langs/0 returns all langs" do
      lang = lang_fixture()
      assert Challenges.list_langs() == [lang]
    end

    test "get_lang!/1 returns the lang with given id" do
      lang = lang_fixture()
      assert Challenges.get_lang!(lang.id) == lang
    end

    test "create_lang/1 with valid data creates a lang" do
      assert {:ok, %Lang{} = lang} = Challenges.create_lang(@valid_attrs)
      assert lang.desc == "some desc"
      assert lang.name == "some name"
    end

    test "create_lang/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Challenges.create_lang(@invalid_attrs)
    end

    test "update_lang/2 with valid data updates the lang" do
      lang = lang_fixture()
      assert {:ok, %Lang{} = lang} = Challenges.update_lang(lang, @update_attrs)
      assert lang.desc == "some updated desc"
      assert lang.name == "some updated name"
    end

    test "update_lang/2 with invalid data returns error changeset" do
      lang = lang_fixture()
      assert {:error, %Ecto.Changeset{}} = Challenges.update_lang(lang, @invalid_attrs)
      assert lang == Challenges.get_lang!(lang.id)
    end

    test "delete_lang/1 deletes the lang" do
      lang = lang_fixture()
      assert {:ok, %Lang{}} = Challenges.delete_lang(lang)
      assert_raise Ecto.NoResultsError, fn -> Challenges.get_lang!(lang.id) end
    end

    test "change_lang/1 returns a lang changeset" do
      lang = lang_fixture()
      assert %Ecto.Changeset{} = Challenges.change_lang(lang)
    end
  end

  describe "questions" do
    alias Zudoku.Challenges.Question

    @valid_attrs %{question: "some question", readme: "some readme", solution: "some solution", test: "some test"}
    @update_attrs %{question: "some updated question", readme: "some updated readme", solution: "some updated solution", test: "some updated test"}
    @invalid_attrs %{question: nil, readme: nil, solution: nil, test: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Challenges.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Challenges.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Challenges.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = Challenges.create_question(@valid_attrs)
      assert question.question == "some question"
      assert question.readme == "some readme"
      assert question.solution == "some solution"
      assert question.test == "some test"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Challenges.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, %Question{} = question} = Challenges.update_question(question, @update_attrs)
      assert question.question == "some updated question"
      assert question.readme == "some updated readme"
      assert question.solution == "some updated solution"
      assert question.test == "some updated test"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Challenges.update_question(question, @invalid_attrs)
      assert question == Challenges.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Challenges.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Challenges.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Challenges.change_question(question)
    end
  end

  describe "trials" do
    alias Zudoku.Challenges.Trial

    @valid_attrs %{passed: true}
    @update_attrs %{passed: true}
    @invalid_attrs %{passed: nil}

    def trial_fixture(attrs \\ %{}) do
      {:ok, trial} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Challenges.create_trial()

      trial
    end

    test "list_trials/0 returns all trials" do
      trial = trial_fixture()
      assert Challenges.list_trials() == [trial]
    end

    test "get_trial!/1 returns the trial with given id" do
      trial = trial_fixture()
      assert Challenges.get_trial!(trial.id) == trial
    end

    test "create_trial/1 with valid data creates a trial" do
      assert {:ok, %Trial{} = trial} = Challenges.create_trial(@valid_attrs)
      assert trial.passed == @valid_attrs.passed
    end

    test "create_trial/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Challenges.create_trial(@invalid_attrs)
    end

    test "update_trial/2 with valid data updates the trial" do
      trial = trial_fixture()
      assert {:ok, %Trial{} = trial} = Challenges.update_trial(trial, @update_attrs)
      assert trial.passed == @update_attrs.passed
    end

    test "update_trial/2 with invalid data returns error changeset" do
      trial = trial_fixture()
      assert {:error, %Ecto.Changeset{}} = Challenges.update_trial(trial, @invalid_attrs)
      assert trial == Challenges.get_trial!(trial.id)
    end

    test "delete_trial/1 deletes the trial" do
      trial = trial_fixture()
      assert {:ok, %Trial{}} = Challenges.delete_trial(trial)
      assert_raise Ecto.NoResultsError, fn -> Challenges.get_trial!(trial.id) end
    end

    test "change_trial/1 returns a trial changeset" do
      trial = trial_fixture()
      assert %Ecto.Changeset{} = Challenges.change_trial(trial)
    end
  end
end
