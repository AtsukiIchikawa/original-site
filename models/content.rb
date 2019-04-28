class Content < ActiveRecord::Base
    validates :pagetitle, :body, presence: true

    # callback
    before_destroy :print_before_msg
    after_destroy :print_after_msg

    protected
        def print_before_msg
            puts "#{self.pagetitle} will be deleted"
        end
        def print_after_msg
            puts "#{self.pagetitle} deleted"
        end
end
