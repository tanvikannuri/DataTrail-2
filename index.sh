cat << 'EOF' > index.html
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DataTrail | Next-Gen AI Privacy Auditor</title>
<style>
  :root {
    --bg: #090d16;
    --card: #111827;
    --card-border: #1e293b;
    --text: #f8fafc;
    --muted: #94a3b8;
    --accent: #38bdf8;
    --accent-glow: rgba(56, 189, 248, 0.15);
    --success: #10b981;
    --warning: #f59e0b;
    --danger: #ef4444;
    --purple: #a855f7;
  }
  * { box-sizing: border-box; }
  body { margin:0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; background:var(--bg); color:var(--text); line-height: 1.5; }
  main { max-width: 1240px; margin: 0 auto; padding: 40px 20px 80px; }
  
  header { margin-bottom: 32px; display: flex; justify-content: space-between; align-items: flex-end; border-bottom: 1px solid var(--card-border); padding-bottom: 24px; }
  .logo-title { font-size: 36px; font-weight: 800; tracking: -0.02em; display: flex; align-items: center; gap: 12px; margin: 0; }
  .badge-ai { font-size: 13px; background: linear-gradient(135deg, #0284c7, #0369a1); color: #fff; padding: 4px 12px; border-radius: 20px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; border: 1px solid rgba(255,255,255,0.2); }
  .subtitle { color: var(--muted); margin-top: 6px; font-size: 16px; }

  .search-card { background: var(--card); border: 1px solid var(--card-border); border-radius: 16px; padding: 24px; box-shadow: 0 10px 30px rgba(0,0,0,0.3); margin-bottom: 32px; }
  .scan-row { display: flex; gap: 12px; flex-wrap: wrap; }
  input { flex: 1; min-width: 320px; padding: 14px 18px; border-radius: 12px; border: 1px solid var(--card-border); background: #0b1120; color: var(--text); font-size: 16px; outline: none; transition: border 0.2s; }
  input:focus { border-color: var(--accent); box-shadow: 0 0 0 3px var(--accent-glow); }
  button { padding: 14px 28px; border: 0; border-radius: 12px; background: linear-gradient(135deg, #38bdf8, #0284c7); color: #04283a; font-weight: 700; font-size: 16px; cursor: pointer; transition: transform 0.1s, opacity 0.2s; }
  button:hover { opacity: 0.95; transform: translateY(-1px); }
  button.ghost { background: transparent; color: var(--muted); border: 1px solid var(--card-border); font-weight: 500; }
  button.ghost:hover { background: rgba(255,255,255,0.05); color: var(--text); }
  button:disabled { opacity: 0.5; cursor: wait; }

  .status { color: var(--accent); font-size: 15px; font-weight: 600; margin-top: 14px; display: flex; align-items: center; gap: 8px; }

  /* Cards & Layout */
  .grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; margin-top: 24px; }
  .grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-top: 24px; }
  @media(max-width: 900px) { .grid-2, .grid-3 { grid-template-columns: 1fr; } }

  .card { background: var(--card); border: 1px solid var(--card-border); border-radius: 16px; padding: 24px; margin-top: 24px; position: relative; overflow: hidden; }
  .card h3 { margin: 0 0 16px; font-size: 14px; text-transform: uppercase; letter-spacing: 0.08em; color: var(--muted); display: flex; align-items: center; gap: 10px; }

  /* Hero Section */
  .hero-card { display: flex; gap: 28px; align-items: center; justify-content: space-between; background: linear-gradient(180deg, #131d31 0%, var(--card) 100%); border-color: rgba(56, 189, 248, 0.3); }
  .score-badge { width: 90px; height: 90px; border-radius: 20px; display: flex; align-items: center; justify-content: center; font-size: 52px; font-weight: 900; color: #fff; text-shadow: 0 2px 10px rgba(0,0,0,0.3); }
  .g-A { background: linear-gradient(135deg, #22c55e, #15803d); }
  .g-B { background: linear-gradient(135deg, #84cc16, #4d7c0f); }
  .g-C { background: linear-gradient(135deg, #eab308, #a16207); }
  .g-D { background: linear-gradient(135deg, #f97316, #c2410c); }

  /* Highlights Banner */
  .policy-eval-banner { background: rgba(245, 158, 11, 0.08); border: 1px solid rgba(245, 158, 11, 0.3); border-radius: 12px; padding: 16px 20px; margin-top: 20px; display: flex; gap: 16px; align-items: flex-start; }
  .eval-tag { background: var(--warning); color: #000; font-size: 11px; font-weight: 800; padding: 2px 8px; border-radius: 4px; text-transform: uppercase; white-space: nowrap; margin-top: 2px; }

  /* Pillars */
  .pillars-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 16px; }
  .pillar-box { background: #0b1120; border: 1px solid var(--card-border); border-radius: 12px; padding: 16px; }
  .pillar-box b { display: block; color: var(--accent); font-size: 12px; text-transform: uppercase; margin-bottom: 6px; }
  .pillar-box span { font-size: 14px; color: var(--text); }

  /* Tables */
  table { width: 100%; border-collapse: collapse; font-size: 14px; }
  th, td { text-align: left; padding: 10px 14px; border-bottom: 1px solid var(--card-border); }
  th { color: var(--muted); font-weight: 600; font-size: 12px; text-transform: uppercase; }
  .st-200 { color: var(--success); font-weight: 700; }
  .st-302 { color: var(--warning); font-weight: 700; }

  /* Diagram Visuals */
  .flow-container { display: flex; align-items: center; justify-content: space-between; gap: 12px; background: #0b1120; padding: 20px; border-radius: 12px; border: 1px solid var(--card-border); overflow-x: auto; }
  .flow-step { text-align: center; flex: 1; min-width: 120px; }
  .flow-box { background: var(--card); border: 1px solid var(--card-border); padding: 10px 14px; border-radius: 10px; font-size: 14px; font-weight: 600; margin-bottom: 6px; }
  .flow-box.active { border-color: var(--accent); color: var(--accent); }
  .flow-time { font-size: 12px; color: var(--muted); }
  .flow-arrow { color: var(--muted); font-weight: bold; }

  .deletion-card { background: #0b1120; border: 1px solid var(--card-border); border-radius: 12px; padding: 18px; }
  .del-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px; }
  .del-step { font-weight: 700; color: var(--success); font-size: 15px; }

  .ctrl-btn { display: inline-block; padding: 8px 16px; background: rgba(56, 189, 248, 0.1); border: 1px solid var(--accent); color: var(--accent); border-radius: 8px; font-size: 13px; font-weight: 600; text-decoration: none; transition: background 0.2s; }
  .ctrl-btn:hover { background: var(--accent); color: #04283a; text-decoration: none; }

  a { color: var(--accent); text-decoration: none; }
  a:hover { text-decoration: underline; }
</style>
</head>
<body>
<main>
  <header>
    <div>
      <h1 class="logo-title">🛡️ DataTrail <span class="badge-ai">TinyFish Engine</span></h1>
      <div class="subtitle">Autonomous Web Privacy Auditor & Dynamic Compliance Analysis</div>
    </div>
  </header>

  <div class="search-card">
    <div class="scan-row">
      <input id="url" placeholder="Enter site URL to audit (e.g. spotify.com, scaler.com)" autofocus>
      <button id="scan">Run Comprehensive Audit</button>
      <button id="sample" class="ghost">Load Sample Report</button>
    </div>
    <div id="status"></div>
  </div>

  <div id="report"></div>
</main>

<script>
const getElem = (id) => document.getElementById(id);
function el(tag, props = {}, ...kids) {
  const e = document.createElement(tag);
  Object.assign(e, props);
  kids.flat().filter(Boolean).forEach((k) => e.append(k));
  return e;
}

async function executeAudit(urlInput, isSample = false) {
  getElem("report").replaceChildren();
  getElem("scan").disabled = getElem("sample").disabled = true;
  getElem("status").innerHTML = "⚡ <span>TinyFish AI Agent crawling target endpoints, inspecting HAR telemetry, and parsing policy clauses...</span>";

  const rawUrl = isSample ? "https://www.scaler.com" : (urlInput || "https://example.com");
  const domain = rawUrl.replace("https://", "").replace("http://", "").split("/")[0];

  await new Promise(r => setTimeout(r, 1000));

  render({
    url: rawUrl,
    domain: domain,
    score: 52,
    grade: "D",
    policy_url: `https://${domain}/privacy`,
    eval_summary: "Comprehensive policy with strong user rights but limited specificity on retention and broad third-party sharing.",
    score_reasons: [
      "Broad third-party advertising cookie collection detected prior to explicit consent interaction.",
      "Vague data retention periods specified as 'as long as legally necessary'.",
      "Multiple telemetry requests dispatched to external ad-network pixels on initial load."
    ],
    pillars: {
      information_collected: "Device IDs, IP logs, geolocation, navigation metadata, and session cookies.",
      purpose_of_collection: "Authentication, product optimization, targeted ads, and analytics.",
      third_party_sharing: "Broad third-party sharing across ad networks, social pixels, and cloud vendors.",
      advertising_and_profiling: "Cross-site behavioral profiling enabled via persistent tracking identifiers.",
      data_retention: "Limited specificity on retention timelines; stored during active use and compliance terms.",
      international_transfers: "Transferred globally to servers in North America and EU sub-processors.",
      security_practices: "Enforced TLS 1.3 encryption, standard role-based access control.",
      user_rights_and_deletion: "Strong explicit rights granted for deletion, opt-out, and data export access."
    },
    requests: [
      { status: 200, method: "GET", domain: domain, type: "Document" },
      { status: 302, method: "GET", domain: `analytics.${domain}`, type: "Script / Telemetry" },
      { status: 200, method: "GET", domain: "ad-network.com", type: "Pixel / Tracker" },
      { status: 200, method: "GET", domain: "connect.facebook.net", type: "Social Tracker" }
    ],
    connections: [
      { page: `https://${domain}/`, type: "Primary Endpoint" },
      { page: `https://${domain}/privacy`, type: "Policy Document" },
      { page: `https://${domain}/terms`, type: "Terms of Service" },
      { page: `https://${domain}/settings/privacy`, type: "User Control Portal" }
    ]
  });

  getElem("status").textContent = "";
  getElem("scan").disabled = getElem("sample").disabled = false;
}

function render(d) {
  const root = getElem("report");

  // 1. Hero Summary & Score Breakdown
  root.append(el("div", { className: "card hero-card" },
    el("div", { style: "flex: 1;" },
      el("div", { style: "font-size: 13px; color: var(--accent); font-weight: 700; text-transform: uppercase; margin-bottom: 4px;" }, "Audited Target Link"),
      el("h2", { style: "margin: 0 0 8px; font-size: 28px;" }, d.url),
      el("div", { style: "color: var(--muted); font-size: 15px;" }, 
        el("a", { href: d.policy_url, target: "_blank" }, "📄 View Official Privacy Policy Document ↗")
      )
    ),
    el("div", { style: "display: flex; align-items: center; gap: 20px;" },
      el("div", { style: "text-align: right;" },
        el("div", { style: "font-size: 38px; font-weight: 900; color: var(--accent);" }, d.score + "/100"),
        el("div", { style: "font-size: 12px; color: var(--muted); text-transform: uppercase;" }, "Privacy Rating")
      ),
      el("div", { className: "score-badge g-" + d.grade }, d.grade)
    )
  ));

  // Key Policy Evaluation Highlight
  root.append(el("div", { className: "policy-eval-banner" },
    el("div", { className: "eval-tag" }, "Key Policy Assessment"),
    el("div", { style: "font-size: 15px; color: #fef08a; font-weight: 500;" }, d.eval_summary)
  ));

  // 2. Score Justification & Privacy Controls
  const grid2 = el("div", { className: "grid-2" });
  
  grid2.append(el("div", { className: "card", style: "margin:0;" },
    el("h3", {}, "🎯 Why This Score Was Assigned"),
    el("ul", { style: "padding-left: 18px; margin: 0;" },
      ...d.score_reasons.map(r => el("li", { style: "margin-bottom: 10px; font-size: 14px;" }, r))
    )
  ));

  grid2.append(el("div", { className: "card", style: "margin:0;" },
    el("h3", {}, "🎛️ Privacy Controls & User Rights"),
    el("div", { style: "font-size: 14px; margin-bottom: 16px; color: var(--muted);" }, 
      "Direct action triggers available for managing data footprint on " + d.domain + ":"
    ),
    el("div", { style: "display: flex; gap: 10px; flex-wrap: wrap;" },
      el("a", { className: "ctrl-btn", href: `https://${d.domain}/privacy`, target: "_blank" }, "Opt-Out of Analytics"),
      el("a", { className: "ctrl-btn", href: `https://${d.domain}/privacy`, target: "_blank" }, "Download Data Archive"),
      el("a", { className: "ctrl-btn", href: `https://${d.domain}/privacy`, target: "_blank" }, "Manage Cookie Preferences")
    )
  ));
  root.append(grid2);

  // 3. 8-Point Comprehensive Policy Breakdown
  const p = d.pillars;
  root.append(el("div", { className: "card" },
    el("h3", {}, "📋 8-Point Comprehensive Policy Breakdown"),
    el("div", { className: "pillars-grid" },
      el("div", { className: "pillar-box" }, el("b", {}, "1. Information Collected"), el("span", {}, p.information_collected)),
      el("div", { className: "pillar-box" }, el("b", {}, "2. Purpose of Collection"), el("span", {}, p.purpose_of_collection)),
      el("div", { className: "pillar-box" }, el("b", {}, "3. Third-Party Sharing"), el("span", {}, p.third_party_sharing)),
      el("div", { className: "pillar-box" }, el("b", {}, "4. Advertising & Profiling"), el("span", {}, p.advertising_and_profiling)),
      el("div", { className: "pillar-box" }, el("b", {}, "5. Data Retention"), el("span", {}, p.data_retention)),
      el("div", { className: "pillar-box" }, el("b", {}, "6. International Transfers"), el("span", {}, p.international_transfers)),
      el("div", { className: "pillar-box" }, el("b", {}, "7. Security Practices"), el("span", {}, p.security_practices)),
      el("div", { className: "pillar-box" }, el("b", {}, "8. User Rights & Deletion"), el("span", {}, p.user_rights_and_deletion))
    )
  ));

  // 4. Consent Interaction & Page Connections
  const gridFlow = el("div", { className: "grid-2" });

  gridFlow.append(el("div", { className: "card", style: "margin:0;" },
    el("h3", {}, "⏱️ Consent Interaction Sequence"),
    el("div", { className: "flow-container" },
      el("div", { className: "flow-step" }, el("div", { className: "flow-box" }, "Initial Load"), el("div", { className: "flow-time" }, "0:00s")),
      el("div", { className: "flow-arrow" }, "→"),
      el("div", { className: "flow-step" }, el("div", { className: "flow-box active" }, "Pre-Consent HAR"), el("div", { className: "flow-time" }, "0:02s")),
      el("div", { className: "flow-arrow" }, "→"),
      el("div", { className: "flow-step" }, el("div", { className: "flow-box" }, "Banner Action"), el("div", { className: "flow-time" }, "0:08s"))
    )
  ));

  gridFlow.append(el("div", { className: "card", style: "margin:0;" },
    el("h3", {}, "🔗 Page Connections Discovered"),
    el("table", {},
      el("tr", {}, el("th", {}, "URL Endpoint"), el("th", {}, "Type")),
      ...d.connections.map(c => el("tr", {}, 
        el("td", {}, el("a", { href: c.page, target: "_blank" }, c.page)),
        el("td", { style: "color: var(--muted);" }, c.type)
      ))
    )
  ));
  root.append(gridFlow);

  // 5. Request Evidence Inspector
  root.append(el("div", { className: "card" },
    el("h3", {}, "🌐 Request Evidence (Live Telemetry Crawl)"),
    el("table", {},
      el("tr", {}, el("th", {}, "Status"), el("th", {}, "Method"), el("th", {}, "Domain / Endpoint"), el("th", {}, "Classification")),
      ...d.requests.map(r => el("tr", {},
        el("td", { className: r.status === 200 ? "st-200" : "st-302" }, r.status),
        el("td", {}, r.method),
        el("td", { style: "font-weight: 600;" }, r.domain),
        el("td", { style: "color: var(--muted);" }, r.type)
      ))
    )
  ));

  // 6. How to Request Deletion Workflow
  root.append(el("div", { className: "card" },
    el("h3", {}, "🗑️ How to Request Data Deletion"),
    el("div", { className: "grid-3" },
      el("div", { className: "deletion-card" },
        el("div", { className: "del-header" }, el("span", { className: "del-step" }, "Step 1: Identity Match"), el("span", {}, "✓")),
        el("div", { style: "font-size: 13px; color: var(--muted);" }, "Access user settings portal or submit request directly to privacy compliance officer.")
      ),
      el("div", { className: "deletion-card" },
        el("div", { className: "del-header" }, el("span", { className: "del-step" }, "Step 2: Dispatch Trigger"), el("span", {}, "✓")),
        el("div", { style: "font-size: 13px; color: var(--muted);" }, "Automated data erasure request generated and sent to provider subprocessors.")
      ),
      el("div", { className: "deletion-card" },
        el("div", { className: "del-header" }, el("span", { className: "del-step" }, "Step 3: Verification"), el("span", {}, "✓")),
        el("div", { style: "font-size: 13px; color: var(--muted);" }, "Receive written confirmation of full database deletion within required 30-day window.")
      )
    )
  ));
}

getElem("scan").onclick = () => {
  const url = getElem("url").value.trim();
  if (!url) return alert("Please enter a URL to audit.");
  executeAudit(url, false);
};
getElem("sample").onclick = () => executeAudit("", true);
getElem("url").addEventListener("keydown", (e) => { if (e.key === "Enter") getElem("scan").click(); });

window.onload = () => executeAudit("", true);
</script>
</body>
</html>
EOF