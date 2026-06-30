Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023133.outbound.protection.outlook.com [52.101.83.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C898135C1B7
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840714; cv=fail; b=H1e9C1OntoLb4noijBGkb2aSLYjubG7ms8n9Q4jfcELT5Ym1UAOiWQgMEOtvw0t+XZdCrgGa4oVObtB0r1DPEweNAaAkbiaUXGl/Kuv8KeySk58mor8D/n1uNjcB/yJr/soi2wWe34OunwDVPRcpUmlw+3b4T2Qfy981a2cWMac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840714; c=relaxed/simple;
	bh=AoZzWhnCL7c48bHRPzskpZVipUuhbZWEaZMXeOO28Q8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SyVt+rHg6emily5EUNCNm52Bh7l4r2JYTzad1apt/0nATpwO70+jXMDsJxWNb8rPLN/Ouj8/IA9TFjpOcb1+CYsLEW9ZKTLk6wWpSnuo3u03LYwC92NYqWTINUSfiUo6404XMVrNxE9ASKi9J9zXd6s1kgDYOOA1gkn/z3PoEv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b=XWz7x2VH; arc=fail smtp.client-ip=52.101.83.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b="XWz7x2VH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKOLwcufPiEKzCO4KuV6xKjvv1RIY2eQxJUWAyLnLSfUIJxMJkD63gDniRZzOgGZNAhWsDGly9Nm7GvOsW1LmJ7odD5Bq+zYcmGcaAY4WS0rYxKM8gYsOoCIWsiTa/x/kMDd0e+HTc7n60NuPngJbMU0MdMxFpqA0+uor2HB+8KE/kk+aAgkBRc3tMA0Mxl6AVMQ3qxBBldE7knUWh/aUdNBsfYPoCX8ZGuTjyK/vIKGKDulyAfDVcrV3NReqbCwbtyMIO+Q94fR97HANU28PyxIw3oLoAf8ijnW5GVAGFJe8wBlDBawj/bsRww1XJ9U/M+ECY15eQiqA6mUx7M7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipUmui8TJzzr8XggvtlSs6nZP/vI0PIg2RgYY7dISp0=;
 b=eEFVghXqWGZjKg/XnrqdYEzmsGe+WwJ77YsVYoAfKf66XV/QCT4pye2IEmvlGsmSzA+Uv+cbZ7UaT4yHpoobY8sufuGQNcc445nkBiP/+uQg12kM2TiLpPseDzHOP6Lx3bwKee5UZLjvCJpFbwIgYSsfI4NFVB5XL67yxlljsNnrIKD2FVLqXsAa8udWYMVJ4lvs5x4PEO9kVkJhVAVlaUJx0oNt+Y2Fd49iCw2sa8FKcgudxUH/i1z+7waxPNsGY7EtN+nCOtMsYfVs7Am1P/j4JNz8lz2xMtFFEmgapwGIdfWbQPOj88+m4aXvWgRSq2RGuLB38beL4DxfsKZ4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipUmui8TJzzr8XggvtlSs6nZP/vI0PIg2RgYY7dISp0=;
 b=XWz7x2VHaRpHdSvXNEiN3bsQ18yXgeXoN/4m11KEpdXe/5baWYWwisu/+oBEiPkCodbIZouGUpNpEPNbaTR1nW5HlBFYtcswGyO9owD4GOnpm+evY5k+wHphkB99upohsXvRAedlrtqvAuY37gz+mR9krbrxA0o71p9ag6MRn/PSE+2+pTXyDwdNB3tcaLtXdM+GpfNMfJDzZTBzRzwkdBU8fANEQUG1KjoZAvkU8SEcrc2avJhRyxvZfyc7Bl6oEuTvGX/RSeYkRlnAnWSQQRS/nEEFqPM+Xb+xQgpSoSI6FpwUI9h6KcQjVBN/kYYaTa7fU/tJsv8rPvuNA8eMUQ==
Received: from AS4P189CA0056.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::26)
 by AS1P195MB1595.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 17:31:48 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:659:cafe::73) by AS4P189CA0056.outlook.office365.com
 (2603:10a6:20b:659::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 17:31:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Tue, 30 Jun 2026 17:31:48 +0000
Received: from phytec.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 30 Jun
 2026 19:31:45 +0200
From: Nathan Morrisson <nmorrisson@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <sashiko-reviews@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>,
	<w.egorov@phytec.de>
Subject: [PATCH v4 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware
Date: Tue, 30 Jun 2026 10:31:30 -0700
Message-ID: <20260630173131.3000303-1-nmorrisson@phytec.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|AS1P195MB1595:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e0dbc5-6074-41aa-a68b-08ded6cd76c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|82310400026|36860700016|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	LmUcD39Mb+ZehA63vc2fVHMNcFTavVdjiLrwe+ek6CLIkkxGzl+oQGTqzYpNwrGNezL7LluHSyEeDc7dVzjybb1e4BYCXSQfMWS1KpcADgbvhTJ48HnIi7f3vDumiLPjkhp+gxMMZYwUpyem2DOX64UypqizYSNyXT0NrnhjVacF0lZiu5pA0kFOxNbPcWUqxMdGpFO4FHbQcpZTlhsXhjBNM7TKqE80ELa6i+KzkRtfyPtd4UH8crBrF1ktOkTkziIqt53eHOIf5T8GMA7ibzda1397zGQYgRTOZXkSK0OQ0MpjzmqZjJo6HIHK6GKdPl7x/TO2bNhk0/sInLuJPYthF0JbPrY6pOUibkeqxPnG0Z+wY+B1Ymva4U2CIXfsNjL8Ds18n5+WtZjHbAOvHybfxwmBYoEwO9gbZEe+BKFhrm+wwWdiGOEJng23JM3Pg6GJG/2KWaV5rww0UYAo0xBzaJHucLIPDxqL/lpZjOXtNpx9EutcSrw7RmB+qSl+MzcsYIt8llHRb1BBDQkW5eMmWSYouvG+cpF+OjgsOMJenXAJbczxLDIywp8+92qrhbVYWjzx2UYhn7EQZWc0sYeYw7n/IQEHR38N31UJYQCCMJWLwy63etRlhFuVbXKkPzxWwb/PSZBwyTeA+KDiuluMgqMbSlYUFQGtyYt4TImhs9jGaPXcQakSPXlTHTRlktJRenar4Z0nd50mcx80Pg==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(82310400026)(36860700016)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cbbebBilNuFSy67hMYSvKavwDQ6PeRPiUEZC0GzD8hg2L5Afj9n+ecRhZlGAdbtd7jptFe2QrQMASfnFjE/17rKc4AZLPCVQqsLP0rQ7RAtyD/6kpoxhEojixuY0lP7mlDHH9S+tDMZiK5peSIHwZYxmHwN6iEQizCcm5dS5TXUa6xI0W3NyU31Dn0R/B+llc7bAdcT03GhSvMMXsxU0Aby+WChd4kbsD+/Pb7CDrykvlFpmo7hP/RG5ssi0pLSjlAoYCNFj4BKsZSbFIORD9D1dhgexSol0ed1mdjk2crYi+1M+I5NcD0n9AylAQaMhEoXLoBhQd+vPHLoB5nVe2Y3dAjz7S2H5KbGPgz1us1NhfoVzTM40rxB0W5mX4l+Ox7O/blJxnt5hC+GpP0a+ZoPKAfVYATnBrA82ubjrsono7I2J5SBocrdPHMKdVZJD
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 17:31:48.1946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e0dbc5-6074-41aa-a68b-08ded6cd76c3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P195MB1595

Add device tree bindings for the AM67x based phyCORE-AM67x SoM and
phyBOARD-Rigel.

Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
No changes in v4

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..ae47190d1f82 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -222,6 +222,13 @@ properties:
               - ti,j722s-evm
           - const: ti,j722s
 
+      - description: K3 AM67 SoC PHYTEC phyBOARD-Rigel
+        items:
+          - enum:
+              - phytec,am6754-phyboard-rigel
+          - const: phytec,am67-phycore-som
+          - const: ti,j722s
+
       - description: K3 J742S2 SoC
         items:
           - enum:
-- 
2.43.0

