local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end

luasnip.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
})

luasnip.add_snippets('php', {
  luasnip.parser.parse_snippet('class', 'class $1\n{\n    $0\n}'),
  luasnip.parser.parse_snippet('pubf', 'public function $1($2): $3\n{\n    $0\n}'),
  luasnip.parser.parse_snippet('prif', 'private function $1($2): $3\n{\n    $0\n}'),
  luasnip.parser.parse_snippet('prof', 'protected function $1($2): $3\n{\n    $0\n}'),
  luasnip.parser.parse_snippet('testt', 'public function test_$1()\n{\n    $0\n}'),
  luasnip.parser.parse_snippet('testa', '/** @test */\npublic function $1()\n{\n    $0\n}'),
})

luasnip.add_snippets('typescript', {
  luasnip.parser.parse_snippet('import', "import $1 from '$0'"),
})

luasnip.add_snippets('vue', {
  luasnip.parser.parse_snippet('defineProps', 'defineProps<{\n  $0\n}>()'),
})
