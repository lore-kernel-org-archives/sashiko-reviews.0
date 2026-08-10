Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130943DA7C8
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367157; cv=fail; b=n6HhAShYSTU4Yp1P8U+gitS+p210BY8YvGXn7s7fZ3H5GH3RiW6yq3+nBLaZ7mOTHfdesP+9M02afow2g3eOkVeqdk/5SNoHI5hBFQmXjAnBYXwUga++kx8JtnkdhlPC8GdAQUhJsmlVjwuM71JtGu2Je7wCAWFflAMk2puW+Ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367157; c=relaxed/simple;
	bh=/Csfq9rYTEO0mHwdIcmwY8kOzD6J4hvAcp4/bkr3ytA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EwaKvgWlGoB5K1UhG/SbE+59E+QI8Jo76Uw9AXtHJlkp4or2p61bt+em+EPOeRRcsq+BwJCMrIiQ51Q7iBT0UjDHJHME72IG00aweqalqlxhXajCHNM9iqkTI1PuW//DfgkIAKyY96onjVGhdFV2qz6ZhOqgvTH9+erI9PAtnD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=LIojmVSr; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="LIojmVSr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSxrSDTHiRC/5Awj/ZQV2FXkbOUXKvT1VCMT26k1O09KVdtuepl0Pd1PcIffQWJl7FJFNj3sLb4E6Jj3cpkMRlg9NGzfsPCKIV6Zed/MJmoScPz80YWJlMquWrFGP+celdFPRGuQsiy0rGF6jAFu3Ac5n8eDP0LaQGOhm8EY50stlpEzCfsh07fMJTluE+cZgvN7Chvo9CT+EuI2H5L8U82FhbtRnn6IgX5XLqfXIP5jqM802IT9aXm3nwyOpI7BCWyJh4y9aPGpKl5TucYW1gX3mqNCcjlZIKp2UszpPEn9BmamSPPpW/9+umYyFjqJWdBKzAo+t3Yv8Q2NYUmzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Csfq9rYTEO0mHwdIcmwY8kOzD6J4hvAcp4/bkr3ytA=;
 b=mWBNhr5ZDArb25PR9RiIyNNsIieJlC0ISib0CkP/il+YiLfg8T37tYkd8o4R1b6oxu6zZJ188IzHW2AvH5ZHlbwwlAg42otRZISn9e3h2yWfDcQL9DLARzzMoOwWLTPbVwwQIpfjmMDqis4t4AIKRmIaQnvLmRapaOwcL+Fqvdo0wS5oQmfd2M8A2100OuP8x8D3dRxYGAeM9bxYbL4u799kmAm88a3Yd7EDftwqyoDKQ/bz/bhuMYoQOCT0if61y9KM4qwG65ZV+GcUGP62/0vB+ZWjABfy/WAyHPUItVUXOn8tD0+liayvxpQZk/aMu88lnJMwP6J/O0KJTMd8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Csfq9rYTEO0mHwdIcmwY8kOzD6J4hvAcp4/bkr3ytA=;
 b=LIojmVSrkwkkqgWQjSJrFZa0mQZHW7oeMEu07W/NjwVdmUDk7HGVK0NgJHOHXVrMX0z5S6aHwL5RUdg9ARtsgVpzZd+V9Hajz/AMpjT4wPIv8ElS+irbuq38n4+2lEdDDZjKgxWKo6uBvmtIhBisLdWmjQo2zKYYYwNwIeWZn40=
Received: from DU2PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:10:234::11)
 by GV4PR06MB10038.eurprd06.prod.outlook.com (2603:10a6:150:29d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 13:05:51 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::14) by DU2PR04CA0036.outlook.office365.com
 (2603:10a6:10:234::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 13:05:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 10 Aug 2026 13:05:51 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 10 Aug 2026 15:05:50 +0200
From: Robert Leussler <robert.leussler@leica-geosystems.com>
To: sashiko-bot@kernel.org
Cc: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	robert.leussler@leica-geosystems.com,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] rtc: ds1307: fix RX8130 wakeup alarm WADA bit for day-of-month mode
Date: Mon, 10 Aug 2026 13:05:29 +0000
Message-ID: <20260810130544.3551013-1-robert.leussler@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721083021.7D2921F000E9@smtp.kernel.org>
References: <20260721083021.7D2921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Aug 2026 13:05:51.0012 (UTC) FILETIME=[F7FD3640:01DD28C8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|GV4PR06MB10038:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6e762362-6ecc-454c-b165-08def6e01ad6
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	roK4C3P4o77bRZk+m+sJOqzIU8FAGWCgFXr2V3nIbefg8hcd/e+iu87Jb+aLTW6f0TsKeAcCvIQo4IlEA3wJMRmF6hEvwCeeKk+ryw9CX+DG3kd36SadZm7CZBxkTg6jnCgAK6TUbbVssAb6oAzvVkh7SBgnKOAVwY/lRgzpMxrBW5ld7nF47J0PwTaI93+Qxj+gwSPnp2HhIJRxWqgQIhP81ac6/dVs5bISU8VFj5CBCEpd1BXmaCJXva/D7tpM4rG1vMgZngd57nTPzD0YtH6dKSuWRMP0Y2kMUF6tSTAZVRisX7EDUAPANF0e9M+CIbrDTn32AR8dkDqQOri6QnsS1DGtxusuoqMaZZ+KUTtazyxGnBrvhcbpvy1nqzbKe/X5sl6eI26wokm13BwGVTSjt7llwg0Ee8Bn7696qRXoUQ1kUdE/NWQqZzauUsx/PGi+qzrqIUKBkm28QJ6VsF3412abWCtOStSmifEBi928ODlC4IsAnGT9C/y22Rt7CPiE0yGM0uwH/fq7n6SXB++ZNzH9gmG1sqDRe/HJevCqT7QLlCbQQpTxX8XTsRhH3UDf9WIUvkZ82ea56s/16gaiy5dpcFiEInr38w1kvBeV1zSKxq7HSnrzWAL5yU+nl/z3cIngk/ybYHSgJMEWhMoq4qBrU3hOElS9H+MV7f9ro800BbXtl8KDHh/bw+BcYlLi0hhFSF5RwwyIyuoPpg==
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TYOBXHS40oXACdK5hIyL1S/JH6gr2jW7WbJsyhcwwjdEl4jVIN4yXP4gdmpYopbgoJbEZ6G6k6VKouIIsICWdfZU9KszhDJevaOcoFzRtgH9lgjVgelmug532h7LH+BATdVKNQP/ywbNRr3fxvxLDGbHHpGN1zpgX50RJqvoZ7w+tCrK108Gw8DBm4TLn50S0jzvyQxi2py7sfpD3/gRFD1tSTb1nGgHoir74D2u9w0mPsjWVFCIx0pPDOVJ+uJt/aTD4rtrqqK24Kmf0RGzOUKwvX6pHBpVn81iNNHFVm/95364o+iBgAvZytKFWmUSfgDdf+0/wgGFPX7kEtRHV480BrTuVmBDcPxTW/uvIsX0nDWmViVTewaJMNXedNko3P9GiHoeVQmHlrUDhIgVGHvlEPHFAnQZZ2Kvc1V6St0iMhXerOxzzlyoIhqORji5
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 13:05:51.2588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e762362-6ecc-454c-b165-08def6e01ad6
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB10038

Hi,

Thanks for the review.

This appears to be a pre-existing issue in the RX8130 FLAG register
handling. However, it is unrelated to the WADA bit fix introduced by
this patch.

I'd prefer to keep this patch focused on the WADA fix and address any
FLAG register handling issues separately.

Thanks,
Robert
