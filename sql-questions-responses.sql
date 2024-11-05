-- 1.) Find all tasks that a user (identified by user_id) has access to but does not have permission to edit.

--  -- By "has access to", I assume that means "created" since the only options are "created_by" and "can_edit"
select task_id, user_id, permissions.can_edit
from users, tasks, permissions
where users.user_id = tasks.created_by and
permissions.user_id = tasks.created_by;

-- 2.) Find all users who have created tasks but do not have permission to edit them.

-- Bonus: Write an SQL script that restores edit permissions for a user if they have created a task but lost the edit permission.