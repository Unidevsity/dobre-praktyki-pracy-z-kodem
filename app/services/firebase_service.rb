class FirebaseService

  class FirebaseConnectionError < StandardError; end

  def self.send_notification(user, message)
    return unless user.firebase_token

    uri = URI.parse('https://fcm.googleapis.com/fcm/send')
    request = Net::HTTP::Post.new(uri)
    request.content_type = 'application/json'
    request
      .add_field('Authorization', "
        key=#{ENV['FIREBASE_SERVER_KEY']}

      ")
    request.body = JSON.dump({
                               'notification' => {
                                 'title' => 'New message',
                                 'body' => message,
                                 'sound' => 'default'
                               },
                               'data' => {
                                 'title' => 'New message',
                                 'body' => message,
                                 'sound' => 'default'
                               },
                               'to' => user.firebase_token
                             })
    return OpenStruct.new(success: true)
  rescue FirebaseConnectionError => e
    return OpenStruct.new(success: false, errors: ['Firebase connection error'])
  end
end
