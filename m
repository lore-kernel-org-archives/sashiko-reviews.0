Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023091.outbound.protection.outlook.com [40.107.162.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370503B4E8A;
	Wed, 10 Jun 2026 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.91
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087816; cv=fail; b=gu+ib39pFibUSyjZrD1Tl9xULfFdQFc3URAhvr4L7DTLnCbH5eDynEJoGI82Gtof+l2wcGSDoKHnz7zW7Yh1TktAoZTeEOERFRVJf7R1AKEzIhHGNJMExswkoza2WEugEiT4Px37ed3AED77Hhg1YOM1bJRSpq4zCTdpimt3TYA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087816; c=relaxed/simple;
	bh=d2eRsa6tEMmVz0qV6qECgoQBdv7CreVmsfUHrRLsYcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ilw20EIWAeFczogPHpspakvc85SknAapbBuklRCkcKI768AruUu8EQrtwGeIoBELUXZdIb1mWHQksZnSwc1qpAHpYbI/jArojS6e2jctcOjgd1U7ugWSBGmpRYyb4BorzQlPd34RRYWGSWl0sBmFdBrVLYKNqT14tMyBJ/IM7e0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=LWjUHYJY; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=LWjUHYJY; arc=fail smtp.client-ip=40.107.162.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="LWjUHYJY";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="LWjUHYJY"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Qw7wNZBETPK+w66ketyX2JLo5HpV5AyTWCTJitHm3KCYTpGI8ueVmHaxCxj84lH9gsNdL2STMpXvFv9m6A2T2dIFCvDfyp8qRz4da5xjfnBqaI2RVjaNkjlZUCtZqRK/qqFsXmkxgZrjXmX66C33VBRhYiYDeHwdWAtsbTb45mxXDPirUCYL2+HAB1QAAqJ6p+/+++HgglSliOxWmzCsG21W7BnjiG/fu860Y8x4nDm0d1b3MlUy8R2T/L8w+3U4pAx4qwViigFoD5g6olVd1ChmISmzSK/ewG3cbqS4hABXW9+Y9mi7o30F9ueXNxV+2fGlEN/Hj9ZoH9J2OpnFiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2eRsa6tEMmVz0qV6qECgoQBdv7CreVmsfUHrRLsYcM=;
 b=dFsN8ZuJhvBQb4E0zphuYPEWv7RJzbPkXN/3fe0Vkn+xkrRIzU2FcA0+UjQAaKDOPgLd8/wMCyP2+dIfeqzhEM7EueTM+vA5UmpYTmTI6/OZWfgKY2ZP8Royll8CXBZCBZ5uh1EpxIp+/y+YVXlXLlgavfVno4pgPHf2fcdN1/kwYt0qet4JXQkaJz+eDB7S5pEvuvNLoi8Ip2HTVEG4Sg/R/mPJgt3hofGgisU1T1M/4yzZ+aiMJG9k2TKYmEK8sr/JnmyTaqmmjiWHFaOQgYnZp8O5DmQ+61s77lcHXj0bwpvkNw1AxA43lR8KZUn3bSZr2u4lGHODGPNsS0VByA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=arndb.de smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2eRsa6tEMmVz0qV6qECgoQBdv7CreVmsfUHrRLsYcM=;
 b=LWjUHYJYk2KoBfo/EpboSjPNbpa1W2kUwVMjt0WJJPPZOTkInmAofgCChL+zhl8MNIgosOTl0ahwYlrbHl7qnLAKtQ4gi4T0p1s5YXprEyHbqmFVFidHfHfC8synhkmb8+ge/9F7rYQKUJLHaSz2aqeuH5igwxgOEcPNVZUmOneiA6+hM0bXU/OaIpyOJV3jqkOmuthMx0/3ip/AaFjlI/FqOGkloxR8P/ttls6vLVc6MYe4zmtP1MgnbIaDC/oK+JXxR21d9G2zxyPqlpEFwccsDPYlG+WeJ9Qja/KDFB3UMAcvCb/aRgCK4ECmUtV+EpuiLt7ZYe2HmR1B/4QlLQ==
Received: from DBBPR09CA0031.eurprd09.prod.outlook.com (2603:10a6:10:d4::19)
 by DB9PR04MB9451.eurprd04.prod.outlook.com (2603:10a6:10:368::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 10:36:45 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::a7) by DBBPR09CA0031.outlook.office365.com
 (2603:10a6:10:d4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 10:36:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Wed, 10 Jun 2026 10:36:44 +0000
Received: from emails-6775867-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-193.eu-west-1.compute.internal [10.20.5.193])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B46557FFB2;
	Wed, 10 Jun 2026 10:36:44 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Jun 10 10:36:38 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0Ar4dVYQlbFWyW8mrHidBvLyq891532DM27nn23A3khpRylOyrBepna7RbRju9PKwvAxEpd+PLS6A4Fkc0o0bHf7jdNTwjcuQ2+3YQdnEiHJQqBVCVvmI7eNzji6AaThle8nhJcxRl3xEHYWqI0mMRHCG4SSr2Yc2Mhg45qmi8ymkqgecQ0AUEOf/VwL95GSNJOTUh8HZBrcDzxvK1/dyqtGe2kCvB7OnvHYGXCubzobtIOqW/8wjmVrbxzf+QD0G8sIaBPjbWL/LPHxdA2fKAepADgDLumwNjiT+vZyBHi5yW8bdvfCuotBxp/hNSrt45DI3AqPrdhOcRH5pEAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2eRsa6tEMmVz0qV6qECgoQBdv7CreVmsfUHrRLsYcM=;
 b=DqFvK2IyGa2WqxQ3W0aeddREi1ZC88/KS0h3Py9f7svlyPKjEJC4lgw8jkUYtwkPBDYpPDDbcLzqmbQOoSsp8Q3Hojxj/qS+FNyej5TGR1K4H6oIquFwgLPSjsfXR8gLS2TGJ4nqNNzzaUtEC7q17t8yev4UxSdFszrFUuouXY+So0eFJhdSl/CjLd99RvDIHo226dU1JaANXfsNXHSyQ2RxOQyku5WdI+idEtq3vsI2N+of6dFTuQb1Kl5YfEYekj1BoUXCDa+9G5yeyEzv3bjyEV0WeECNNS55Mdr0LV0PGbj0J7I61xkQsK5lMYUpvlU0rNQGwkoXScxLV+OUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2eRsa6tEMmVz0qV6qECgoQBdv7CreVmsfUHrRLsYcM=;
 b=LWjUHYJYk2KoBfo/EpboSjPNbpa1W2kUwVMjt0WJJPPZOTkInmAofgCChL+zhl8MNIgosOTl0ahwYlrbHl7qnLAKtQ4gi4T0p1s5YXprEyHbqmFVFidHfHfC8synhkmb8+ge/9F7rYQKUJLHaSz2aqeuH5igwxgOEcPNVZUmOneiA6+hM0bXU/OaIpyOJV3jqkOmuthMx0/3ip/AaFjlI/FqOGkloxR8P/ttls6vLVc6MYe4zmtP1MgnbIaDC/oK+JXxR21d9G2zxyPqlpEFwccsDPYlG+WeJ9Qja/KDFB3UMAcvCb/aRgCK4ECmUtV+EpuiLt7ZYe2HmR1B/4QlLQ==
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 10:36:35 +0000
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f]) by PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f%4]) with mapi id 15.21.0092.014; Wed, 10 Jun 2026
 10:36:35 +0000
From: Josua Mayer <josua@solid-run.com>
To: Arnd Bergmann <arnd@arndb.de>, Frank Li <frank.li@oss.nxp.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Frank
 Li <Frank.Li@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add
 64-bit pci regions
Thread-Topic: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add
 64-bit pci regions
Thread-Index:
 AQHc641BrJq/RKSt4UOASflXt3DyN7YdSLuAgAAhOgCAGSh2gIAACn4AgAAaeACAABAfAIAAECEAgAALnICAAJ88AIAAMHGA
Date: Wed, 10 Jun 2026 10:36:35 +0000
Message-ID: <d8373e08-bbd0-4a6c-849b-628c49fc2ec4@solid-run.com>
References: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
 <20260524151347.BD92A1F000E9@smtp.kernel.org>
 <3528dc91-1ffc-42f9-94ea-a27c6c1d6a50@solid-run.com>
 <9e6326f6-dad1-4169-a63c-e62ee5b341f2@app.fastmail.com>
 <023aa47c-6fbc-486f-b5c7-5145ddf8e8fe@oss.nxp.com>
 <72087d5c-c6f9-4452-b4bd-a9f086700e62@app.fastmail.com>
 <48248207-7b4f-43c9-85e9-64e8440fab10@oss.nxp.com>
 <753fca23-c3eb-45e3-aeac-b7b248fa723a@app.fastmail.com>
 <177431ea-c4ba-4424-b17e-9d2e2884d466@oss.nxp.com>
 <4f7cc399-785f-4967-adec-714ccc69ada8@app.fastmail.com>
In-Reply-To: <4f7cc399-785f-4967-adec-714ccc69ada8@app.fastmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	PAXPR04MB8813:EE_|AM7PR04MB6949:EE_|DU6PEPF0000B61D:EE_|DB9PR04MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd0e90e-3bb7-40b1-943b-08dec6dc2b02
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|4143699003|38070700021|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 NUpqm8GRvAuSPn3RUkco4onwLw44M37bHlI4EGhWBkXMKAz5p4Nzh3Rxxf+573frePnncuV282ZZllzBWdNyQF/38f1RjVE+eWHCoNOla4v5li4dO09zO62Ee2jDZsrZhqq0DFHcfWKQeHRcrQmx+SsrmMnuLKPKxifuyWCSwEqPaYJXj7XgADQDC9brT0z73Jzaflo50JeU93eBjaDGiVM9NBlnV7TfuI2NsVj8iQs/qx3+itP6BDypeoqphnjPjzgW4BPB4vL2Xudb77yQihyeBvn+5qqhP1rWd45ISqM81T45pISI1JBiKDpn/obwLsV5YIjBivDaczucwS4uAkheSMAYWzlazV5oopyrusRGfOHWET7+TJjEid31RhEUcPfDMtYSR2dAdZLzHP5kNtli9YxEjTylLBLIDReah4YGobxZYqxXpDtoMMQp/wVBUIaWuQOn8jLrrILUfBRBJZF/61SFK7QquuvkRZkZc7hFr+s/NIRPeXP2YsVt9wZjhEkATtSbiB21d/HKs4nD/nFJkJrHV4xEloey+pHQXRpykBV3h0plIuPyQiSUWhvzdqFdKSwEBIXNPyCQsCQrrQeztU9piSr3ESMDauBdYHC4B7xsSect08NHc+cwrgX0yRsUcyXjIYnFTgyeCGC5Im6NnNaJ7BwPAXNy7v9xh8+j+C9UeJTgF2pTidHeZ5s9x9TgPjzopyxrQuuvL3C501mcLCCa+6zuqpcu+IyB+i0m5vTQZZgRJA5zS1uQU90J
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8813.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(4143699003)(38070700021)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE65C4C18BAA6A4AB094A4731B4A35B7@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 UGB1qkdjvIIr3wLURVjLL3bXZbBzRCHzNIKOoNCuZRESftuzBpIgoChHKjwvjIljF6w6oKeesnZ3CEeKd0gn5XZyIRrse91ktIlMtrx2id6BldRwsf9glKVxcimIIz80DoWfOpMdMy14ckNAgqhu36k4TYpa0LDFCvJ4TDc6q1ocVGfXWwMlrcKQ/41BQsprzy4Kf9JwFiXxTEYhMpY7LnOsM3ZoqwDgqghfuz4p1p+5BmpOeJrBegRBaSueWe0SbR+HmbiLhQah/N9FigMgADH4Dqm40E6K5E/iTibymo2t9RsjNGAaJaRn6ZbVrHE7mRXhbM7lrwrztk8jxlPrVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ff0889275904425b8c13bb333cfcc47a:solidrun,office365_emails,sent,inline:d7411dfce41a2acdc94283d5b5a70ce6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bbaaf0dc-8151-446c-fbe5-08dec6dc257e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|14060799003|82310400026|1800799024|376014|35042699022|36860700016|22082099003|18002099003|6133799003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	owVKaZCMD5nRU8CcnFNDkohbQ+eZPvjpk8lykQkIK/e9sq/s7HAHydWtYr1fwu0xKeyNvCbZBrYezjl5FHgo6qLmtqZIvlmatpO3001dI8MtDF4q3vIs2JmIaZv7adYb4p1MoHsgLQ4InOmDRIJP4xVbYeVl2n3XcZlb1bvS6IrhDQ9E03oUmpJxLZLEG0wdUoFLSAt1+0ZuJdSlq685u9p27tgYB4WqouwSUUxwBmgASarL8mNKuj/ZDugBo3v82V7M/V5G94E13M6Rvu3k5pR5eScttxSqauNXMYSLbxSxi+hPYyyUrVAXtTfzKdz8IuYsavqwX2GYB7JFQIZdg3rpDTghnHHW1XmZpWSdixLWZ5s2lMDCGWhNIl1OQ6VhmMLU/58ccMP/6oqYXNLbqR7SG1p5o0EUdHGxq0egHW8oSJ+tTCtk40NLmMiZ4GI0IyGTpto/DwVldXYcvISYy4bZmrRJJ2ZxdOevjTRVX+SsroNcvGl1W6KMzZwIHatFb8/emhUYdZhfNjb/X74D/eWJFkoQjsWWK6RAJX4r9I36uwDIzD2zyzyLzevZYC2/9VgSESHByCt0kGLC/2c2doJdJr2iomhHBQn4sClz/eeVV9D9PLc0esUWWbQSmrdBotHtRF4Fbcpeh0GGQg76AVdNx1wG1dOFnmmeB/bF1V91RIWh1uyQt8wQZP/lVdl5JJ6dqyJfQGPYHJbtemEJKdopLFERMKrlyL/r914fIto=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(82310400026)(1800799024)(376014)(35042699022)(36860700016)(22082099003)(18002099003)(6133799003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sFDQxADcc7TPywP8LZcT5JANZDRivGnAI58j9KB/YmiqcNMew98SeNpccJxxTO3gzzvgTvZ84qUOxjJ8gkLoVeRWCRi0eR+nwnE4zWXmQWf3s2j6UKRDKB/Rx+93Mubi3LhiXqzcXFusF6VXr6YhBMnabiY4eMj5SQ/wPF8vy6iSAwziTYp9F1Fo/O14r6gsYcGAvGEmvWRqwNiC9SuiD7bs7PftOeYhNLyHOCoBrwaKv4QBAMlcCD6rZ8CvXo+gXaXao+R1avqPKNfWblYrR+jLheGhh+6bQgpA4FayT8zOjReR40G/TI2buqvXqj0aP9Etyw6Wg2wIvrkOTMs1xADumeA8IdMTvRVcnE9c91/eE2Hbojv+9SHzuSEwmWSXy/yAUr0mOj/oIujOlYu13mt0nHN52Hu+uPZhvgYZm7ImNCefOaDAIxvTX1teedgg
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 10:36:44.9460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd0e90e-3bb7-40b1-943b-08dec6dc2b02
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9451

SGkgQXJuZCwgRnJhbmssDQoNCkFtIDEwLjA2LjI2IHVtIDA5OjQzIHNjaHJpZWIgQXJuZCBCZXJn
bWFubjoNCj4gT24gV2VkLCBKdW4gMTAsIDIwMjYsIGF0IDAwOjEzLCBGcmFuayBMaSB3cm90ZToN
Cj4+IE9uIDYvOS8yMDI2IDQ6MzEgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pg0KPj4gSWYg
RVAgaXRzZWxmIGlzIFBDSWUgYnJpZGdlLCBpdCBtYXkgYmUgcHJvYmxlbS4gSXQnZCBiZXR0ZXIg
dG8NCj4+IGtlZXAgMzJiaXQgcmFuZ2UgdW5jaGFuZ2UuDQo+IE9rLiBJdCBpcyBub3QgdW5jb21t
b24gdG8gaGF2ZSBQQ0llIGJyaWRnZXMgZWl0aGVyIGluIHBoeXNpY2FsDQo+IGZvcm0sIG9yIGlu
c2lkZSBvZiBkZXZpY2VzIHRoYXQgaGF2ZSBtdWx0aXBsZSBQQ0llIGZ1bmN0aW9ucywNCj4gc28g
dGhpcyBkb2VzIHNlZW0gbGlrZSBhIHJlYWwgcHJvYmxlbSB0byBtZSBldmVuIHdoZW4gbW9yZSBj
b21tb25seQ0KPiB5b3UnZCBvbmx5IGhhdmUgYSBzaW5nbGUgUENJZSBmdW5jdGlvbiB3aXRoIGEg
c2luZ2xlIG1lbW9yeSBCQVINCj4gb24gZWFjaCBob3N0IGJyaWRnZS4NCj4NCj4+IERvIHlvdSBu
ZWVkIHJld29yayBwdWxsIHJlcXVlc3Q/ICBPciB5b3UgY2FuIGRyb3AgdGhpcyBwYXRjaC4NCj4g
SSBjYW4ndCBlYXNpbHkgZHJvcCB0aGUgY29tbWl0IHdpdGhvdXQgbG9zaW5nIHlvdXIgc2lnbmVk
IHRhZw0KPiBvbiB0aGUgcHVsbCByZXF1ZXN0LiBQbGVhc2UgdXBkYXRlIHRoZSBwdWxsIHJlcXVl
c3QgdG8gZWl0aGVyDQo+IGRyb3AgdGhpcyBvbiB5b3VyIGVuZCBvciBhZGQgYSBmaXh1cCBwYXRj
aCBvbiB0b3AgdGhhdCByZXZlcnRzDQo+IHRvIGEgMUdCIG5vbi1wcmVmZXRjaGFibGUgd2luZG93
IGZvciBlYWNoIG9mIHRoZSBjb250cm9sbGVycy4NCj4NCj4gT24gYSByZWxhdGVkIG5vdGUsIHBs
ZWFzZSBtYWtlIHN1cmUgdGhhdCB5b3UgZG9uJ3Qgc2VuZA0KPiBhIGxhcmdlIHNlcmllcyBsaWtl
IHRoaXMgbGF0ZSBpbiB0aGUgZGV2ZWxvcG1lbnQgY3ljbGUNCj4gc28gd2UgaGF2ZSBlbm91Z2gg
dGltZSB0byByZXNvbHZlIGFueSBpc3N1ZXMgdGhhdCBtYXkgY29tZQ0KPiB1cC4gWW91IGNhbiBh
bHNvIHNlbmQgYSBmb2xsb3ctdXAgcHVsbCByZXF1ZXN0IHdpdGggbGFzdA0KPiBtaW51dGUgZml4
dXBzIGFuZCBjaGFuZ2VzIHRoYXQgd2VyZSBzdGlsbCB3YWl0aW5nIGZvcg0KPiByZXZpZXcuIFRo
ZSBidWxrIG9mIHRoZSBicmFuY2ggY29udGVudHMgbG9vayBsaWtlIHRoZXkgDQo+IGhhdmUgYmVl
biBzdGFibGUgZm9yIGEgd2hpbGUsIHNvIHRoZSBiZXN0IHRoaW5nIHdvdWxkIGhhdmUNCj4gYmVl
biB0byBzZW5kIHRob3NlIGluIGEgZmlyc3QgUFIuDQo+DQo+IElmIGV2ZXJ5dGhpbmcgZ29lcyB3
ZWxsIG90aGVyd2lzZSwgdGhpcyBQUiBzaG91bGQgc3RpbGwgbWFrZQ0KPiBpdCBpbiB0aW1lLCBi
dXQgaXQgd291bGQgYmUgbmljZSB0byBhdm9pZCBzdWNoIG1pbnV0ZQ0KPiBleGNpdGVtZW50IGlu
IHRoZSBmdXR1cmUuDQoNClRoYW5rIHlvdSBmb3IgZGlzY3Vzc2luZyB0aGlzIGlzc3VlIGluIGRl
dGFpbCENCg0KSWYgeW91IG5lZWQgbWUgdG8gc2VuZCBhIGZpeHVwLCBraW5kbHkgbGV0IG1lIGtu
b3cuDQo=
