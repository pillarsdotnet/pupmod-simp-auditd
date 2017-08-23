# A set of audit rules that are configured to meet the general goals of SIMP
#
# Any variable that is not described here can be found in auditd.conf(5) and
# auditctl(8).
#
# @see auditd.conf(5)
# @see auditctl(8)
#
# @param log_file
# @param num_logs
# @param ignore_failures
# @param buffer_size
# @param failure_mode
# @param rate
#
# @param immutable
#   Whether or not to make the configuration immutable. Be aware that, should
#   you choose to make the configuration immutable, you will not be able to
#   change your audit rules without a reboot.
#
# @param root_audit_level
#   What level of auditing should be used for su-root activity. Be aware that
#   setting this to anything besides 'basic' may overwhelm your system and/or
#   log server.
#   Options can be, 'basic', 'aggressive', 'insane'
#    - Basic: Safe, should not follow program execution outside of the base app
#    - Aggressive: Adds execve
#    - Insane: Adds fork, vfork, write, chown, creat, link, mkdir, rmdir
#
# @param uid_min
#     The minimum UID for human users on the system. Any logs generated by
#     users below this number will be ignored unless set to absolute first when
#     using auditd::add_rule.
#
# @param ignore_crond
# @param ignore_errors
# @param ignore_anonymous
# @param ignore_system_services
# @param audit_unsuccessful_file_operations
# @param audit_unsuccessful_file_operations_tag
# @param audit_chown
# @param audit_chown_tag
# @param audit_chmod
# @param audit_chmod_tag
# @param audit_su_root_activity
# @param audit_su_root_activity_tag
# @param audit_suid_sgid
# @param audit_suid_sgid_tag
# @param audit_kernel_modules
# @param audit_kernel_modules_tag
# @param audit_time
# @param audit_time_tag
# @param audit_locale
# @param audit_locale_tag
# @param audit_mount
# @param audit_mount_tag
# @param audit_umask
# @param audit_umask_tag
# @param audit_local_account
# @param audit_local_account_tag
# @param audit_selinux_policy
# @param audit_selinux_policy_tag
# @param audit_login_files
# @param audit_login_files_tag
# @param audit_session_files
# @param audit_session_files_tag
# @param audit_sudoers
# @param audit_sudoers_tag
# @param audit_grub
# @param audit_grub_tag
# @param audit_cfg_sys
# @param audit_cfg_sys_tag
# @param audit_cfg_cron
# @param audit_cfg_cron_tag
# @param audit_cfg_shell
# @param audit_cfg_shell_tag
# @param audit_cfg_pam
# @param audit_cfg_pam_tag
# @param audit_cfg_security
# @param audit_cfg_security_tag
# @param audit_cfg_services
# @param audit_cfg_services_tag
# @param audit_cfg_xinetd
# @param audit_cfg_xinetd_tag
# @param audit_yum
# @param audit_yum_tag
# @param audit_ptrace
# @param audit_ptrace_tag
# @param audit_personality
# @param audit_personality_tag
#
class auditd::config::audit_profiles::simp (
  Stdlib::Absolutepath                $log_file                               = $::auditd::log_file,
  Integer                             $num_logs                               = 5, # CCE-27522-2
  Boolean                             $ignore_failures                        = $::auditd::ignore_failures,
  Integer                             $buffer_size                            = $::auditd::buffer_size,
  Integer                             $failure_mode                           = $::auditd::failure_mode,
  Integer                             $rate                                   = $::auditd::rate,
  Boolean                             $immutable                              = $::auditd::immutable,
  Enum['basic','aggressive','insane'] $root_audit_level                       = $::auditd::root_audit_level,
  Integer                             $uid_min                                = $::auditd::uid_min,
  Boolean                             $ignore_crond                           = true,
  Boolean                             $ignore_errors                          = true,
  Boolean                             $ignore_anonymous                       = true,
  Boolean                             $ignore_system_services                 = true,
  Boolean                             $audit_unsuccessful_file_operations     = true,
  String                              $audit_unsuccessful_file_operations_tag = 'access',
  Boolean                             $audit_chown                            = true,
  String                              $audit_chown_tag                        = 'chown',
  Boolean                             $audit_chmod                            = false,
  String                              $audit_chmod_tag                        = 'chmod',
  Boolean                             $audit_attr                             = true,
  String                              $audit_attr_tag                         = 'attr',
  Boolean                             $audit_su_root_activity                 = true,
  String                              $audit_su_root_activity_tag             = 'su-root-activity',
  Boolean                             $audit_suid_sgid                        = true,
  String                              $audit_suid_sgid_tag                    = 'suid-root-exec',
  Boolean                             $audit_kernel_modules                   = true,
  String                              $audit_kernel_modules_tag               = 'modules',
  Boolean                             $audit_time                             = true,
  String                              $audit_time_tag                         = 'audit_time_rules',
  Boolean                             $audit_locale                           = true,
  String                              $audit_locale_tag                       = 'audit_network_modifications',
  Boolean                             $audit_mount                            = true,
  String                              $audit_mount_tag                        = 'mount',
  Boolean                             $audit_umask                            = false,
  String                              $audit_umask_tag                        = 'umask',
  Boolean                             $audit_local_account                    = true,
  String                              $audit_local_account_tag                = 'audit_account_changes',
  Boolean                             $audit_selinux_policy                   = true,
  String                              $audit_selinux_policy_tag               = 'MAC-policy',
  Boolean                             $audit_login_files                      = true,
  String                              $audit_login_files_tag                  = 'logins',
  Boolean                             $audit_session_files                    = true,
  String                              $audit_session_files_tag                = 'session',
  Boolean                             $audit_sudoers                          = true,
  String                              $audit_sudoers_tag                      = 'CFG_sys',
  Boolean                             $audit_grub                             = true,
  String                              $audit_grub_tag                         = 'CFG_grub',
  Boolean                             $audit_cfg_sys                          = true,
  String                              $audit_cfg_sys_tag                      = 'CFG_sys',
  Boolean                             $audit_cfg_cron                         = true,
  String                              $audit_cfg_cron_tag                     = 'CFG_cron',
  Boolean                             $audit_cfg_shell                        = true,
  String                              $audit_cfg_shell_tag                    = 'CFG_shell',
  Boolean                             $audit_cfg_pam                          = true,
  String                              $audit_cfg_pam_tag                      = 'CFG_pam',
  Boolean                             $audit_cfg_security                     = true,
  String                              $audit_cfg_security_tag                 = 'CFG_security',
  Boolean                             $audit_cfg_services                     = true,
  String                              $audit_cfg_services_tag                 = 'CFG_services',
  Boolean                             $audit_cfg_xinetd                       = true,
  String                              $audit_cfg_xinetd_tag                   = 'CFG_xinetd',
  Boolean                             $audit_yum                              = true,
  String                              $audit_yum_tag                          = 'yum-config',
  Boolean                             $audit_yum_cmd                          = false,
  String                              $audit_yum_cmd_tag                      = 'package_changes',
  Boolean                             $audit_rpm_cmd                          = false,
  String                              $audit_rpm_cmd_tag                      = 'package_changes',
  Boolean                             $audit_ptrace                           = true,
  String                              $audit_ptrace_tag                       = 'paranoid',
  Boolean                             $audit_personality                      = true,
  String                              $audit_personality_tag                  = 'paranoid',
) inherits ::auditd {

  $_profile_template_path = "${module_name}/rule_profiles/simp"

  auditd::rule { 'init.d_auditd':
    content => "-w /etc/rc.d/init.d/auditd -p wa -k auditd
                -w ${log_file} -p wa -k audit-logs"
  }

  auditd::rule { 'rotated_audit_logs':
    content => template("${_profile_template_path}/rotated_audit_logs.erb")
  }

  file { '/etc/audit/rules.d/00_head.rules':
    content => template("${_profile_template_path}/head.erb")
  }

  file { '/etc/audit/rules.d/05_default_drop.rules':
    content => template("${_profile_template_path}/default_drop.erb")
  }

  file { '/etc/audit/rules.d/50_base.rules':
    content => template("${_profile_template_path}/base.erb")
  }

  file { '/etc/audit/rules.d/99_tail.rules':
    content => template("${_profile_template_path}/tail.erb")
  }
}
