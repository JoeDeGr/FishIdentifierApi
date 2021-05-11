#User
    -has:
        username
        email
        passwordDigest
        has_many :fish, through: :user-fish
    -extension:
        maybe: photos?
        belong_to: location?
#fish
    -has:
        speciesname
        commonName
        species_photos
        has_many: users, through: :users_fish
    - extension:
        reported locations
        reported_photos?

#GooglePhotosAPI ?
