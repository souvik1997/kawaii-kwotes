
defmodule KawaiiKwotes.WebHookController do
  use FacebookMessenger.Phoenix.Controller
  require Logger

  def message_received(msg) do
    images = ["https://media.giphy.com/media/3iyAZtcZyQ6eA/giphy-facebook_s.jpg",
              "https://s-media-cache-ak0.pinimg.com/originals/fd/4f/fa/fd4ffaeff5127cd7aaab3281d1f3656b.gif",
              "http://cdn.wallpapersafari.com/49/20/ct3xPz.jpg",
              "https://s-media-cache-ak0.pinimg.com/originals/9a/a6/83/9aa683c8f3dd7daf9a7228f95d4f82af.jpg",
              "http://data.whicdn.com/images/79165746/original.png",
              "https://i.ytimg.com/vi/n9q2JThdcqQ/maxresdefault.jpg",
              "https://s-media-cache-ak0.pinimg.com/originals/ec/74/d7/ec74d7b32074c4eb943a1064d1c3a6b6.jpg",
              "http://data2.whicdn.com/images/27283514/adorable-amazing-anime-art-beautiful-Favim.com-366185_large.jpg",
              "http://vignette3.wikia.nocookie.net/drunken-peasants-podcast/images/e/ef/Anime_girl_kawaii.jpeg/revision/latest?cb=20150404160452",
              "http://pm1.narvii.com/5772/caa1dc8887917ba80ee15e0e0a8a7c889f6cf14f_hq.jpg",
              "https://secure.static.tumblr.com/8a17c9f5a8c57745776ce90dd98881e1/e2qbg5b/58bni987u/tumblr_static_tumblr_static_22fuvat9s5lwwow08sw8kkcw4_640.gif",
              "http://img1.wikia.nocookie.net/__cb20130824064043/fanfiction/images/e/e6/Anime-girl-cute-kawaii-purple-hair-Favim_com-328591.jpg",
              "http://images6.fanpop.com/image/photos/34600000/Kawaii-girl-pocky-kawaii-anime-34624512-362-500.png",
              "https://pbs.twimg.com/media/B0VXmLxIUAAUVSd.jpg",
             "http://orig08.deviantart.net/bac7/f/2014/167/6/a/_render__anime_kawaii_by_shingo_kanji-d7mllz9.png"]
    {:ok, markovText} = GenServer.call(MarkovChain, {:traverse, 20})
    text = FacebookMessenger.Response.message_texts(msg) |> hd
    sender = FacebookMessenger.Response.message_senders(msg) |> hd
    imageFile = Enum.random(images)
    Logger.info("received text: #{inspect(text)}")
    case text do
      nil -> :ok
      _ ->
        FacebookMessenger.Sender.send(sender, %{message: %{text: markovText}})
        FacebookMessenger.Sender.send(sender, %{message: %{
                                                   attachment: %{
                                                     type: "image",
                                                     payload: %{
                                                       url: imageFile
                                                     }
                                                   }
                                                }})
        :ok
    end
  end

end
