defmodule PortScanner do
  def scan(target_ip, start_port, end_port) do
    ports = Enum.to_list(start_port..end_port)
    ports
    |> Enum.map(&Task.async(fn -> scan_port(target_ip, &1) end))
    |> Enum.each(&Task.await(&1, 5000))
  end

  defp scan_port(ip, port) do
    case :gen_tcp.connect(to_charlist(ip), port, [:binary, active: false], 1000) do
      {:ok, _socket} ->
        IO.puts("Porta #{port} está aberta em #{ip}")
      {:error, _reason} ->
        :ok
    end
  end
end
