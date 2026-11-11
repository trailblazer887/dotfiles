-- ==================================================
--  KoolDots (2026)
--  Project URL: https://github.com/LinuxBeginnings
--  License: GNU GPLv3
--  SPDX-License-Identifier: GPL-3.0-or-later
-- ==================================================

-- User monitor overrides for Lua workflow.
-- MonitorProfiles.sh writes selected Lua monitor profiles into this file.
-- Keep custom hl.monitor(...) entries here so upgrades preserve them.

-- Example:
-- hl.monitor({
--     output = "eDP-1",
--     mode = "preferred",
--     position = "auto",
--     scale = "1",
-- })

-- 高 DPI 内屏缩放
hl.monitor({
	output = "eDP-2",
	mode = "preferred",
	position = "0x0",
	scale = "2",
})
