RSpec.describe InsideDocker do
  it "has a version number" do
    expect(InsideDocker::VERSION).not_to be nil
  end

  it "responds to inside_docker?" do
    expect(Object.respond_to?(:inside_docker?)).to be(true)
  end

  describe "inside_docker?" do
    let(:target_file) { "/proc/1/sched" }

    before do
      allow(File).to receive(:readlines).with(target_file).and_return([target_file_content])
    end

    context "when inside a docker container" do
      let(:target_file_content) { "bash (10418, #threads: 1)" }

      it "returns true" do
        expect(inside_docker?).to be(true)
      end
    end

    context "when outside a docker container" do
      let(:target_file_content) { "systemd (1, #threads: 1)" }

      it "returns false" do
        expect(inside_docker?).to be(false)
      end
    end
  end
end
