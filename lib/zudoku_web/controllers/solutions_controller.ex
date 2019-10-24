defmodule SolutionsController do
  use ZudokuWeb, :controller
  alias ZudokuWeb.DockerRunner

  def submit(conn, _parms) do
    # get file
    # get question and directory
    # get lang
    # exec in docker
    case DockerRunner.run_test() do
      {:ok, data} -> json conn, %{data: data}
      {:error, _} -> json conn, %{data: "ERROR!"}
    end
  end

end
