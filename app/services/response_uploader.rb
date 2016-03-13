require 'securerandom'

class ResponseUploader
  def initialize(test_id, test_run_id)
    @test_id = test_id
    @test_run_id = test_run_id
    @s3_object_name = generate_s3_object_name
  end

  def async_upload(response_body)
    Thread.new do
      upload(response_body)
    end

    @s3_object_name
  end

  def upload(response_body)
    s3 = Aws::S3::Resource.new
    obj = s3.bucket(ENV['AWS_S3_BUCKET']).object(s3_object_name)
    obj.put(body: response_body)
  end


  private
  def generate_s3_object_name
    ['responses', @test_id, @test_run_id, "#{SecureRandom.uuid}.txt"].join('/')
  end
end