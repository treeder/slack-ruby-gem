module Slack
  class Client < API
    METHODS = %w(users.list channels.history channels.mark
                channels.list files.upload files.list
                im.history im.list groups.history groups.list
                search.all search.files search.messages
                chat.postMessage auth.test)

    def respond_to?(method)
      return METHODS.include?(method.id2name.gsub("_", ".")) || super
    end

    def method_missing(action, *args)
      get(action.id2name.gsub("_", "."), *args)
    end
  end
end
