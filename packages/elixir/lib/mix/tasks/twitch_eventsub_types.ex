defmodule Mix.Tasks.Twitch.Eventsub.Types do
  @moduledoc """
  Generate the types for Twitch EventSub.
  """
  use Mix.Task

  @shortdoc "Generate the types for Twitch EventSub"

  @impl true
  def run(_argv) do
    Mix.shell().info("""
    TODO: We will use the eventsub.json schema to generate structs for the eventsub types.
    """)
  end
end
