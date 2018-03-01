require "inside_docker/version"

class Object
  def inside_docker?
    File.readlines("/proc/1/sched").each do |line|
      return line.strip != "systemd (1, #threads: 1)"
    end
  rescue Errno::ENOENT => e
    false
  end
end
