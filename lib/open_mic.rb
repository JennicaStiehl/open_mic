class OpenMic
  attr_reader :location,
              :date,
              :performers

  def initialize(attributes)
    @location = attributes[:location]
    @date = attributes[:date]
    @performers = []
  end

  def welcome(user)
    @performers << user
  end

  def repeated_jokes? #true if not uniq
    all_jokes = []
    answer = true
    @performers.each do |user|
      user.jokes.each do |joke|
        all_jokes << joke.id
      end
      answer = all_jokes.uniq != all_jokes
    end
    answer
  end
end
