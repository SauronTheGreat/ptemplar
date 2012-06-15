class Paperclip::CommandLine
  def full_path(binary)
    [self.class.path, binary].compact.join((File::ALT_SEPARATOR||File::SEPARATOR))
  end
end if defined?(Paperclip::CommandLine)