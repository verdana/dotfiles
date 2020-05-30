function touch-all
    find . -print0 | xargs -0 touch
end
