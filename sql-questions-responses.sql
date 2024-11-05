-- 1.) Find all tasks that a user (identified by user_id) has access to but does not have permission to edit.

--  -- By "has access to", I assume that means "created" since the only options are "created_by" and "can_edit"
select tasks.task_id, tasks.task_name, users.user_id, users.name, permissions.can_edit
from users, tasks, permissions
where users.user_id = tasks.created_by and
permissions.user_id = tasks.created_by and
permissions.can_edit = TRUE;

-- 2.) Find all users who have created tasks but do not have permission to edit them.
select users.user_id, users.name, tasks.task_name
from users
join tasks on users.user_id = tasks.created_by
left join permissions on tasks.task_id = permissions.task_id 
and users.user_id = permissions.user_id
where permissions.can_edit = FALSE;

-- Bonus: Write an SQL script that restores edit permissions for a user if they have created a task but lost the edit permission.
-- update permisisons.can_edit = 1;
-- from permissions
-- join users on users.user_id = tasks.created_by
-- left join permissions on tasks.task_id = permissions.task_id 
-- and users.user_id = permissions.user_id
-- where permissions.can_edit = 0;