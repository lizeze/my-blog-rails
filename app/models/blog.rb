class Blog < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader
    validates :title, presence: true
    validates :attachment,presence: true
end
