defmodule ZudokuWeb.DockerRunner do

  @host_work_dir "/Users/tong/Desktop/workspace/hello_world"
  @container_work_dir "/src/app"
  @test_cmd_of %{
    "elixir" => ["mix", "test", "--include", "pending"],
    "java" => [".\mvnw", "test"]
  }

  def run_test() do
    case execute() do
      {data, 0} -> {:ok, data}
      {_, 1} -> {:error, nil}
    end
  end

  defp execute() do
    lang = "elixir"
    options = ["run", "-v", "#{@host_work_dir}:#{@container_work_dir}", "-w", @container_work_dir, lang]
    System.cmd("docker", options ++ @test_cmd_of[lang])
  end

end
