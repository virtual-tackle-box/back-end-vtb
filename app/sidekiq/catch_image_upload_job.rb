class CatchImageUploadJob
  include Sidekiq::Job

  def perform(catch_id, image_data)
    catch = Catch.find(catch_id)
    catch.image.variant(resize: '300x300').processed
    catch.image.attach(io: image_data, filename: "catch_#{catch.id}.png")
  end
end
