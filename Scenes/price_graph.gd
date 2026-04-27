extends Control

const MAX_HISTORY = 50  # how many ticks to display

var price_history: Dictionary = {}  # { commodity_name: Array[float] }

func record_price(commodity_name: String, current_price: float):
	if not price_history.has(commodity_name):
		price_history[commodity_name] = []
	price_history[commodity_name].append(current_price)
	if price_history[commodity_name].size() > MAX_HISTORY:
		price_history[commodity_name].pop_front()
	queue_redraw()  # triggers _draw() on next frame


func _draw():
	if price_history.is_empty():
		return

	var rect = get_rect()
	var graph_width = rect.size.x
	var graph_height = rect.size.y

	# find global min/max across all tracked commodities for scaling
	var all_prices = []
	for arr in price_history.values():
		all_prices.append_array(arr)
	var price_min = all_prices.min()
	var price_max = all_prices.max()
	var price_range = max(price_max - price_min, 1.0)  # avoid division by zero

	# draw each commodity as a coloured line
	var colors = [Color.RED, Color.CYAN, Color.YELLOW, Color.GREEN, Color.ORANGE]
	var color_index = 0

	for commodity_name in price_history:
		var history = price_history[commodity_name]
		if history.size() < 2:
			continue

		var color = colors[color_index % colors.size()]
		color_index += 1

		for i in range(history.size() - 1):
			var x1 = (float(i) / (MAX_HISTORY - 1)) * graph_width
			var x2 = (float(i + 1) / (MAX_HISTORY - 1)) * graph_width
			var y1 = graph_height - ((history[i] - price_min) / price_range) * graph_height
			var y2 = graph_height - ((history[i + 1] - price_min) / price_range) * graph_height
			draw_line(Vector2(x1, y1), Vector2(x2, y2), color, 2.0)
	
	# draw horizontal grid lines
	var grid_lines = 4
	for i in range(grid_lines + 1):
		var y = (float(i) / grid_lines) * graph_height
		draw_line(Vector2(0, y), Vector2(graph_width, y), Color(1, 1, 1, 0.15), 1.0)
	for i in range(grid_lines + 1):
		var y = (float(i) / grid_lines) * graph_height
		var price_at_line = price_max - (float(i) / grid_lines) * price_range
		draw_string(ThemeDB.fallback_font, Vector2(4, y - 2), "%.1f" % price_at_line, HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color.WHITE)
