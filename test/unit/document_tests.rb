require 'assert'
require 'pruview/document'

class Pruview::Document

  class UnitTests < Assert::Context
    desc "Pruview::Document"
    setup do
      @document_class = Pruview::Document
    end
    subject{ @document_class }

  end

  class InitTests < UnitTests
    desc "when init"
    setup do
      @doc = @document_class.new(FILES['basic image'], OUTPUT_PATH)
    end
    subject{ @doc }

    should have_imeths :to_jpg

    should "complain about converting invalid images" do
      err = assert_raises Pruview::InvalidError do
        @document_class.new(FILES['invalid image'], OUTPUT_PATH)
      end
      assert_match /^Invalid source file/, err.message
    end

    should "complain about converting with invalid output paths" do
      err = assert_raises Pruview::InvalidError do
        @document_class.new(FILES['basic image'], INVALID_OUTPUT_PATH)
      end
      assert_match /^Invalid target directory/, err.message
    end

    should "complain about converting invalid image formats" do
      err = assert_raises Pruview::InvalidError do
        @document_class.new(FILES['invalid format'], OUTPUT_PATH)
      end
      assert_match /^Document file extension not supported/, err.message
    end

    should "create a jpg version of itself" do
      @output = subject.to_jpg('basic_image', 50, 50)
      assert_true File.exists?(@output)
      assert_equal '.jpg', File.extname(@output)
    end

  end

  class TiffTest < UnitTests
    desc "when init with a TIFF file"
    setup do
      @doc = @document_class.new(FILES['tiff'], OUTPUT_PATH)
    end
    subject{ @doc }

    should "create a jpg version of itself" do
      @output = subject.to_jpg('tiff', 50, 50)
      assert_true File.exists?(@output)
      assert_equal '.jpg', File.extname(@output)
    end

  end

end
