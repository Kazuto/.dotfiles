local status, codium = pcall(require, "codium")
if not status then
	return
end

codium.setup()
