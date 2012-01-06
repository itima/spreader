require "spec_helper"

describe RetrievalNotifier do
  describe "start" do
    let(:mail) { RetrievalNotifier.start }

    it "renders the headers" do
      mail.subject.should eq("Start")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "success" do
    let(:mail) { RetrievalNotifier.success }

    it "renders the headers" do
      mail.subject.should eq("Success")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "failure" do
    let(:mail) { RetrievalNotifier.failure }

    it "renders the headers" do
      mail.subject.should eq("Failure")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
