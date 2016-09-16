class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    recording = yield if block_given?
    record(recording) if recording
  end

  def play
    puts @recordings
  end
end

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    return unless block_given?
    recording = yield
    record(recording)
  end

  def play
    puts @recordings
  end
end

listener = Device.new
listener.listen { "Hello World!"}
listener.listen
listener.play