module ApplicationHelper
    def cliente?(id)
        User.find(id).in_group?(Group.find(1))
    end

    def supervisor?(id)
        User.find(id).in_group?(Group.find(2))
    end

    def admin?(id)
        User.find(id).in_group?(Group.find(3))
    end

    def gestor?(id)
        User.find(id).in_group?(Group.find(4))
    end

    def super?(id)
        User.find(id).in_group?(Group.find(5))
    end
end
