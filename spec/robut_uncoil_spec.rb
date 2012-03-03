
describe "RobutUncoil" do

  let(:subject) { ::Robut::Plugin::RobutUncoil }

  describe "#is_a_valid_uncoil_request?" do
    
    it "should return true for valid message" do
      [ "@uncoil uncoil http://bit.ly/232f23",
        "@uncoil uncoil http://bit.ly/232f23 http://tinyurl.com/2f23"
        ].each do |message|
        subject.is_valid_uncoil_request?(message).should be_true, "It broke for this message: #{message}"
      end
    end
    
    it "should return false for invalid message" do
      [
        ].each do |message|
          subject.is_valid_uncoil_request?(message).should be_false, "This shouldn't be valid: #{message}"
        end
    end
  end
  
end