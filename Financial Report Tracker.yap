[index.html](https://github.com/user-attachments/files/28395021/index.html)
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Financial Report</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />
    <style>
        *,
        *::before,
        *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: system-ui, sans-serif;
            background: #f5f5f2;
            color: #1a1a18;
            padding: 2rem 1rem;
        }

        .container {
            max-width: 860px;
            margin: 0 auto;
        }

        input,
        select,
        button {
            font-family: inherit;
            font-size: 14px;
            border: 0.5px solid #ccc;
            background: #fff;
            color: #1a1a18;
            outline: none;
            transition: border-color 0.15s;
        }

        input:focus,
        select:focus {
            border-color: #378ADD;
            box-shadow: 0 0 0 3px rgba(55, 138, 221, 0.15);
        }

        button {
            cursor: pointer;
            background: #fff;
            border: 0.5px solid #ccc;
            border-radius: 8px;
            padding: 6px 14px;
        }

        button:hover {
            background: #f0f0ee;
        }

        .header {
            display: flex;
            align-items: baseline;
            justify-content: space-between;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
            gap: 12px;
        }

        .header h1 {
            font-size: 22px;
            font-weight: 500;
        }

        .header p {
            font-size: 13px;
            color: #666;
            margin-top: 4px;
        }

        .header-controls {
            display: flex;
            gap: 8px;
        }

        .header-controls select,
        .header-controls input {
            font-size: 13px;
            padding: 6px 10px;
            border-radius: 8px;
        }

        .header-controls input {
            width: 80px;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
            gap: 10px;
            margin-bottom: 1.5rem;
        }

        .stat-card {
            background: #eeeee9;
            border-radius: 8px;
            padding: 14px 16px;
        }

        .stat-card .label {
            font-size: 11px;
            color: #888;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 4px;
        }

        .stat-card .value {
            font-size: 22px;
            font-weight: 500;
        }

        .table-wrapper {
            background: #fff;
            border: 0.5px solid #ddd;
            border-radius: 12px;
            overflow: hidden;
        }

        .table-header {
            display: grid;
            grid-template-columns: 2fr 1.2fr 1.2fr 1fr 36px;
            padding: 10px 16px;
            background: #f5f5f2;
            border-bottom: 0.5px solid #ddd;
        }

        .table-header span {
            font-size: 11px;
            font-weight: 500;
            color: #888;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .table-header span:nth-child(4) {
            text-align: right;
        }

        #rows-container .row {
            display: grid;
            grid-template-columns: 2fr 1.2fr 1.2fr 1fr 36px;
            padding: 10px 16px;
            border-bottom: 0.5px solid #eee;
            align-items: center;
        }

        .row .desc {
            font-size: 14px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding-right: 8px;
        }

        .row .amount {
            font-size: 14px;
            font-weight: 500;
            text-align: right;
        }

        .row .date {
            font-size: 13px;
            color: #666;
        }

        .row .del-btn {
            background: none;
            border: none;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 4px;
            color: #999;
        }

        .row .del-btn:hover {
            color: #e24b4a;
        }

        .badge {
            font-size: 11px;
            padding: 2px 8px;
            border-radius: 20px;
            font-weight: 500;
            display: inline-block;
        }

        .add-row {
            display: grid;
            grid-template-columns: 2fr 1.2fr 1.2fr 1fr 36px;
            padding: 8px 16px;
            border-top: 0.5px solid #ddd;
            align-items: center;
            gap: 0;
        }

        .add-row input,
        .add-row select {
            padding: 6px 10px;
            border-radius: 8px;
            margin-right: 8px;
            width: 100%;
        }

        .add-row input[type="number"] {
            text-align: right;
        }

        .add-btn {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            margin-left: 4px;
            padding: 0;
        }

        .footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
        }

        .clear-btn {
            font-size: 13px;
            color: #888;
            background: none;
            border: none;
            padding: 0;
        }

        .clear-btn:hover {
            color: #e24b4a;
        }

        .export-btn {
            font-size: 13px;
            padding: 8px 16px;
        }

        .empty {
            padding: 24px 16px;
            color: #999;
            font-size: 14px;
            text-align: center;
        }

        @media (max-width: 600px) {

            .table-header,
            #rows-container .row,
            .add-row {
                grid-template-columns: 1fr 1fr 80px 24px;
            }

            .table-header span:nth-child(2),
            .row .date,
            .add-row input[type="date"] {
                display: none;
            }
        }
    </style>
</head>

<body>
    <div class="container">

        <div class="header">
            <div>
                <h1>Financial Report</h1>
                <p>Add expenses below — totals update automatically</p>
            </div>
            <div class="header-controls">
                <select id="month-sel">
                    <option>January</option>
                    <option>February</option>
                    <option>March</option>
                    <option>April</option>
                    <option>May</option>
                    <option>June</option>
                    <option>July</option>
                    <option>August</option>
                    <option>September</option>
                    <option>October</option>
                    <option>November</option>
                    <option selected>December</option>
                </select>
                <input id="year-in" type="number" value="2024" />
            </div>
        </div>

        <div class="stats">
            <div class="stat-card">
                <div class="label">Total expenses</div>
                <div class="value" id="stat-total">₱0.00</div>
            </div>
            <div class="stat-card">
                <div class="label">Items</div>
                <div class="value" id="stat-count">0</div>
            </div>
            <div class="stat-card">
                <div class="label">Avg per item</div>
                <div class="value" id="stat-avg">₱0.00</div>
            </div>
            <div class="stat-card">
                <div class="label">Largest expense</div>
                <div class="value" id="stat-max">₱0.00</div>
            </div>
        </div>

        <div class="table-wrapper">
            <div class="table-header">
                <span>Description</span>
                <span>Category</span>
                <span>Date</span>
                <span style="text-align:right;">Amount (₱)</span>
                <span></span>
            </div>
            <div id="rows-container"></div>
            <div class="add-row">
                <input type="text" id="new-desc" placeholder="Expense description…" />
                <select id="new-cat">
                    <option value="">— category —</option>
                    <option>Food &amp; dining</option>
                    <option>Transport</option>
                    <option>Utilities</option>
                    <option>Housing</option>
                    <option>Healthcare</option>
                    <option>Entertainment</option>
                    <option>Education</option>
                    <option>Office supplies</option>
                    <option>Subscriptions</option>
                    <option>Other</option>
                </select>
                <input type="date" id="new-date" />
                <input type="number" id="new-amount" placeholder="0.00" min="0" step="0.01" />
                <button class="add-btn" onclick="addRow()" title="Add expense">
                    <i class="ti ti-plus" style="font-size:18px;"></i>
                </button>
            </div>
        </div>

        <div class="footer">
            <button class="clear-btn" onclick="clearAll()">
                <i class="ti ti-trash" style="font-size:14px; vertical-align:-2px; margin-right:4px;"></i>Clear all
            </button>
            <button class="export-btn" onclick="exportReport()">
                <i class="ti ti-download" style="font-size:14px; vertical-align:-2px; margin-right:4px;"></i>Export as
                CSV
            </button>
        </div>

    </div>

    <script>
        let expenses = [];
        let idCounter = 1;

        const catColors = {
            'Food & dining': { bg: '#d0f0e6', color: '#0f6e56' },
            'Transport': { bg: '#cce3f7', color: '#185fa5' },
            'Utilities': { bg: '#fde8be', color: '#854f0b' },
            'Housing': { bg: '#e3e1fb', color: '#534ab7' },
            'Healthcare': { bg: '#f7d4e2', color: '#993556' },
            'Entertainment': { bg: '#f9d8cc', color: '#993c1d' },
            'Education': { bg: '#daefc0', color: '#3b6d11' },
            'Office supplies': { bg: '#e2e2de', color: '#444441' },
            'Subscriptions': { bg: '#c8dcf2', color: '#0c447c' },
            'Other': { bg: '#e2e2de', color: '#5f5e5a' }
        };

        function fmt(n) {
            return '₱' + Number(n).toLocaleString('en-PH', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
        }

        function render() {
            const c = document.getElementById('rows-container');
            c.innerHTML = '';
            if (expenses.length === 0) {
                c.innerHTML = '<p class="empty">No expenses yet — add one above</p>';
            } else {
                expenses.forEach(e => {
                    const row = document.createElement('div');
                    row.className = 'row';
                    const col = catColors[e.cat];
                    const badge = e.cat
                        ? `<span class="badge" style="background:${col.bg};color:${col.color};">${e.cat}</span>`
                        : '<span style="color:#aaa;">—</span>';
                    row.innerHTML = `
          <span class="desc" title="${e.desc}">${e.desc || '—'}</span>
          <span>${badge}</span>
          <span class="date">${e.date || '—'}</span>
          <span class="amount">${fmt(e.amount)}</span>
          <button class="del-btn" onclick="removeRow(${e.id})" title="Remove">
            <i class="ti ti-x" style="font-size:16px;"></i>
          </button>
        `;
                    c.appendChild(row);
                });
            }
            updateStats();
        }

        function updateStats() {
            const total = expenses.reduce((s, e) => s + e.amount, 0);
            const count = expenses.length;
            const avg = count ? total / count : 0;
            const max = count ? Math.max(...expenses.map(e => e.amount)) : 0;
            document.getElementById('stat-total').textContent = fmt(total);
            document.getElementById('stat-count').textContent = count;
            document.getElementById('stat-avg').textContent = fmt(avg);
            document.getElementById('stat-max').textContent = fmt(max);
        }

        function addRow() {
            const desc = document.getElementById('new-desc').value.trim();
            const cat = document.getElementById('new-cat').value;
            const date = document.getElementById('new-date').value;
            const amt = parseFloat(document.getElementById('new-amount').value);
            if (isNaN(amt) || amt < 0) { document.getElementById('new-amount').focus(); return; }
            expenses.push({ id: idCounter++, desc, cat, date, amount: amt });
            document.getElementById('new-desc').value = '';
            document.getElementById('new-cat').value = '';
            document.getElementById('new-date').value = today;
            document.getElementById('new-amount').value = '';
            document.getElementById('new-desc').focus();
            render();
        }

        function removeRow(id) {
            expenses = expenses.filter(e => e.id !== id);
            render();
        }

        function clearAll() {
            if (expenses.length === 0) return;
            if (confirm('Clear all expenses?')) { expenses = []; render(); }
        }

        function exportReport() {
            const month = document.getElementById('month-sel').value;
            const year = document.getElementById('year-in').value;
            let csv = 'Description,Category,Date,Amount (PHP)\n';
            expenses.forEach(e => {
                csv += `"${e.desc}","${e.cat}","${e.date}",${e.amount.toFixed(2)}\n`;
            });
            const total = expenses.reduce((s, e) => s + e.amount, 0);
            csv += `\n"TOTAL","","",${total.toFixed(2)}\n`;
            const blob = new Blob([csv], { type: 'text/csv' });
            const a = document.createElement('a');
            a.href = URL.createObjectURL(blob);
            a.download = `financial-report-${month}-${year}.csv`;
            a.click();
        }

        document.getElementById('new-amount').addEventListener('keydown', e => { if (e.key === 'Enter') addRow(); });
        document.getElementById('new-desc').addEventListener('keydown', e => { if (e.key === 'Enter') document.getElementById('new-amount').focus(); });

        const today = new Date().toISOString().split('T')[0];
        document.getElementById('new-date').value = today;

        render();
    </script>
</body>

</html>
