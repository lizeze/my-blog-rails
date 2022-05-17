class Blog < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader
end
