Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023094.outbound.protection.outlook.com [40.107.159.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB37728314C
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 22:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782772458; cv=fail; b=OcETIU2/4xsVYI6VRnLAZSW5okecoqTiY9idfGIqKwa1Yt9Zp3NKmuNfOqgNNKzUSgIbs5zFoGwN2bLCtbqChNwe+3EYFL2tmdZgEE9N28xlXtdlJhr/ONh3ekr6CMI6HExlj0sSfEEayon99IfMPTBw9FMgi9eoYboeQ14CGdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782772458; c=relaxed/simple;
	bh=uMGlCr31Sel4dPUiT0J/Hc8FAH9ZBdJpcgwfcEieQnY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NxuCcM1deywruXFQSyq0Y9Wu+egjccDXwk7P4kxEcyik1G0evIWVv9ELJ4tz51t9In1JXIWSY8ejGcv+MAwv7hB794nCbMtQDsrH4fph4OBGsvUew9ito1tgK8VehE89+Eoq718de6dRpxK7b1Tc7mJ1yJAZWABCag+28yQY7HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b=R7ERuMNK; arc=fail smtp.client-ip=40.107.159.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b="R7ERuMNK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vw9e1e/hZfRbzPpOlKR7hNMW364guptR7oychfJgaVD/Gb2WE12kHLjQJpfnEwBSGfKviz3NwaTXbNV1HVcPoZn3Zd+0IB5YkgLlTx0zXnI67FBGz010p18ZskDi7+g9O6tIIyA+Vc9T8mW54jAclmH+b8Sry6WDZRcgjfwb12plT+yHbMxYn5kP1d/F8PoutyEZ/a0ytftaCUjTrumqQKojgeaHMcDl30/V51TeljU/mI/ftilaKjuUMUBineNB4i0RupUuYsYml4+Z7h00pGC8KU5KLreOYrq9kCyDr5W/CSFFxyVmpPtjJWXkLYG5VgCs/MoJ2ZP7R8MmcdNPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS3acRTT/CBNi+ZYg2PxCoo7p0Wp9catNkEdE1ASaNk=;
 b=cHz74Rs8l8i+84rKab2V5tTmyjN9qa+qWxiaUoLpY0zoK+wHkCl1K/erInfK5lRoGxF3j5E9B8hDv/6WrgnAiYk9IE8F/M279a3i97+QZwDMV9xro9sECKADRN0WDoAXfmHyPdM9x0ZgSHAz4OVGQ5H5112J5u3GpCR99R+DH71c1UruDIFVNXvZmGtB+faGpwd5vkf7uLq0JCIvFW/BrvVJEpE8OcaHPsvw2PuoCaIG+lkFiK7NJDhio65dE5umu4q7Ws5bDk8pjxQdPncUrojQhjFgh9Pv1GwPkiAuVW1JJ9WJHYp4pQSRlxi26fYJMvXfklETlXdEQFH5pW9Bjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS3acRTT/CBNi+ZYg2PxCoo7p0Wp9catNkEdE1ASaNk=;
 b=R7ERuMNKTwljkX7IXwLDnwsgi7OGOVgUpKenlLudHMlsvTAzMGRTzEy4nGYS6nhEdTV4PN0L2UbbjBh4TlDvAEFcOm0+5a+phldvqLPP+KLKU1Ts9lqkOBPiU0ognwVsTU+pAZSoFkYq83cy1FPBzkEWc7MvQCqQNJzpL6ex2FdqsQF+jgNkdoFmCO11Hzhrpv2G35+CZ5uC/MT3fUY9C+zV57MQ4nTqsjHhYOOyLT/oETPJXlm4gsKC9fSWRXVI62jGDLqlG8lPVHwSn/7hOLs9R46+e3WeXxdU8WC1D6OQMnCSHxuY9ApDGihTOw9Pm48DZUZQJCuD+TgCHi0N+w==
Received: from AS9PR06CA0499.eurprd06.prod.outlook.com (2603:10a6:20b:49b::23)
 by GVXP195MB1830.EURP195.PROD.OUTLOOK.COM (2603:10a6:150::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.16; Mon, 29 Jun 2026 22:34:12 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::66) by AS9PR06CA0499.outlook.office365.com
 (2603:10a6:20b:49b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 22:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 22:34:11 +0000
Received: from phytec.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 30 Jun
 2026 00:34:08 +0200
From: Nathan Morrisson <nmorrisson@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <sashiko-reviews@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>,
	<w.egorov@phytec.de>
Subject: [PATCH v3 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware
Date: Mon, 29 Jun 2026 15:33:52 -0700
Message-ID: <20260629223353.1495209-1-nmorrisson@phytec.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|GVXP195MB1830:EE_
X-MS-Office365-Filtering-Correlation-Id: b07cd807-bc27-4b83-b6a5-08ded62e8acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|1800799024|82310400026|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7LxSysIC1o6GUdxdsNQdHqEiWx2rNyahkFRCYeSMyeU7EalFNaC02Du7+eGpUcmuPGCA6ih10ix1c5C/WpPAr6LeavMU9HaFDVC6Uwr3rm5/tewXHRSLeR1EfWeaRp0xEmn8wWNnQ2Fpc4HkZnmmpxUdd3waM92oxCxdIAnSQkRl38pcDPjdEqzrQo8ar2KUhUvmOtfknOjGZowh4Whxyj0h0opZZg2orgT3AGtb3cxNnt6P+Vek60E8vS7nQWxxyqH0WnQfI0AhUhJteS0OBGz3Z/8qru1AjeUY0OwPdsmCG3xdvBK6bLFX0y7ZZCrZ/oa2yxo/u9cBbCqolBWvZnjfdqfbFhWZK/tQiZQl077kdg2RNh7wNaB1gKDxEsB4xOvph4FbTh7ZbBafnhKafoec1dXEoRgfKHe1vdCVrPklgBedNtv/02MTduvfx1dutEJlLlXRhUctTXJPpHZu3V4IzcfQinT2X+QHQrPIrgjewrk/Vs8hMJpuNR6NZUWfjMznSyCH+PXzgNKtH4Lp+qH3AHA2a56FMIUqjHGXriP49zGpqu2RXhroh0t+gC5piOBb3EGxs+fc5k2oTtbL+odff9ReS1O3tHeTZOse4wBPtW8v7KlZMOu/aTzpe4NCsUPqyycKUP4Z+lxxcKU9dNZITcWVgvtMBJmeS9+Hvq+GHmVFNBQd1SgukxK7Ba0fXJQ//wmHsjrXk4DkPEVJXQ==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gbSeawoeM6anVPx2X8dUltwC4hreB3OWF+6A+oJCP4vPln8GB12GDqJ6+LlijvzBmnpXTHo+lLOYD894VOYL4vxZ5WfL2WHXtYSC3me/G3jxHmEwt6vvkwNiH017ACMebl5c0GDVJjHIcH+/pVGIhQNIPsi/py10tjuDOlAyoqaPwnXqPczc/11P5hCXbnR2MQTVxA525Hyzo9qgqqipVQihKyeoWJIOpH+qNIxBkZXjqMJRimg9ucASfdt3Sz8MSpiy8Vrk31kUa3mk539GriHeb0CxGAShHkk3yDA9wynQ3eHk6jF4yr01DPr/5adj5C0P4ohk1x7A6GhF7d5vtISHDMzWdnC9AWosGfA78JXa+mG7xpfGLHjZA/lrKNpwiKQTeJKIvylmdascEKsER5k9NSspCuhob+kCkMRbhaRF+7MchXWW19/v+tGhMoxp
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 22:34:11.8185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b07cd807-bc27-4b83-b6a5-08ded62e8acb
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB1830

Add device tree bindings for the AM67x based phyCORE-AM67x SoM and
phyBOARD-Rigel.

Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
No changes in v3

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

