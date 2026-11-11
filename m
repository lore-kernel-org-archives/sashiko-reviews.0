Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794383439;
	b=goefllJxXLa0JqScTS8XF3tw5o0Wz05OQPlci//zhr8ZipWizfHvQ1fU89Eqr+p7ajC6
	 YAZjPfKlgqcjPngHNSRIdhbtdkDzR7PgBlL/bwBu3FITqsFeh8PYMvcT/He27FEEBzeD/
	 88GcqncAE49EeDdOfgjImrj7+qPc9ypqawZ7Obykr4+DJRBh7W+/69rDuFmzFlQ4dzJCJ
	 xrCwv3gB6K7GqXgkmGkgYw2PM9OCz0xAK2vxwXBPjwyEwOmuA6lxL7VqB8BoEAijTLxLZ
	 lGBQ9az0PSwG7ImCsO31kxUGh+kJss6ZBcWqGfvFg7rRTw5FtHAi+CfNzntM/JtTMrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383439;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yqFS2kQGzjj6F98UM90YlQhPqfeWjKXAgiJ9YLn/sdI=;
	b=RbbnYTh21JhvjjNOq/e0Tl+aCLd1hnjh2ENM02Iro6az/TJkERZMrHJkVLLWzfHXfzZT
	 Ct4JNHKq0n7kKUjhQnXIbbGhaVy/vC4GDYhg+Hj+XmbqaXluZxutxlJjIQnO+bAF1+cPc
	 g6ZOaE0KOT/QsUdiMYmPLO2YVamsEBKg2t5WRdqN64WAIfTDq7Iemlx1ln1k3iemAQi3s
	 WCt8oSZFn52uplkSw8hukAeuIJOLLEOnWwScmd8JNU2+jnJ+oyiIXqZaHrJysTOqccboL
	 XcKQ3NfFmBzDbzw7/RNjMyuJjMUwVJ1e83ATg0Wg6PgTXjogUoSUc4oIVswiW4BhBag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Xo0nq/1B";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.50
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C33606A320
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 07:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C33606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xo0nq/1B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qT0S/blvFg3E01Nq0DRGQ0AhDHTP9pMxHcvPuRTGSe9ubStarM5xFQKkojcqzzSW1t+O6AZTB1EskDs4yzQ59REN9hYB74g4beVCfuT05DcMST2r9oZBBntUx62lTf1r8O4FVtDmJW/JT9OuIiZFGGq2ipxrB/nuGopJoe6h23I2rLGWSDxeID2TxYTgRvHWxEgqqTIu89zE5QX7xppCjkcZlOWi52uJXPbLlBAur2qP1/jTryagYVsLfsrC/aMFHMxEHLgmDa73Bll75jnVS9oX25HK3x2rl1y8GewVhD+CGH5yRcI6XhBkDVbRU+3HsxTWPlYFfTRRdEv4okILPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqFS2kQGzjj6F98UM90YlQhPqfeWjKXAgiJ9YLn/sdI=;
 b=zGC0MzV3iDUL6LJIszlq6G62ocgtXXAyJIUdXBRY4Z1ts+TRgNZog26qlY3T/1kR9ejszQmxVu9tuQQQRBQLRYvw1SEvmEPyOiEmy21TPca6gxR+wu2VWkgyUyJk1bYooEhGJKXlejtQb274F6CNhpCJdxtUNARDS6aSARLNK3wuHiXRZKR51CWppK9EwCS5gafDMo6WL9vRVg6xmtqe1ri9i9KaSUtvEiggNckF9cJKLr21Z5LrLpNujuvDKaitlw2O9FQXupUYeeN523NZw9Y9NvwGUWvdfamzlag/tS4rwX/myR3cEHDrJhNNDe6z7J+FS7Mm7vYrWJFPdmweWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqFS2kQGzjj6F98UM90YlQhPqfeWjKXAgiJ9YLn/sdI=;
 b=Xo0nq/1B4XtZOTN61y1cU0hfdMKSaPjVXCCeESYUSdPXRR4x3GdKCVU4Hacj2PcOuCH1HcOOAKvCjA0VWS8oXwRk9MPyzyooWDX4ocgZxspRGJssHRdNqYazpTt+fa0nZ1+HarjgBtxM0p3IMMWsXB+U5m4vXyM6mvJacZ0/CQMp+HrCEj2K1rhyunmd8CoAsG4dll2aMweF+DxjMNhoUQg3FQSUKCSo+ztJCcd4oYQP37ybh4Ipd+gjhvht5vDvMM+H3OIrNJ2/5qDkSq8tfCkhiS2Qf2BcffQwCauQj6YjNobgUg1nEVydE8j90EEnAlfTgPGrpCvqtcvp+mj9Ww==
Received: from CH2PR16CA0022.namprd16.prod.outlook.com (2603:10b6:610:50::32)
 by DS0PR12MB7746.namprd12.prod.outlook.com (2603:10b6:8:135::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 07:50:33 +0000
Received: from DM3PEPF000265BC.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::4) by CH2PR16CA0022.outlook.office365.com
 (2603:10b6:610:50::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 07:50:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM3PEPF000265BC.mail.protection.outlook.com (10.167.23.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 07:50:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 23:50:18 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 23:50:16 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	Jacky Huang <jackyhuang@nvidia.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Wed, 11 Nov 2026 15:49:41 +0800
Message-ID: <20261111074106.fb5ad69cfbaa.c2-reply@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-195218@kernel.org>
References: <sashiko-outbox-195218@kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BC:EE_|DS0PR12MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3e6a01-f499-4724-97f1-08df3fc876d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|18002099003|22082099003|11063799006|56012099006|261026121527099003|261022105027099003|10067099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	yvqBUsdaiXEKQdAoYwP40szbWBhmh0vvQrgtscR1Uc1O1KQ9rMFPvqWQZ9MTFhjerNtFiQwPmiqJnXsT311vIh7IvRgOh/T5ukc+GLab3vGnSg2+mXO4v122vPb6czjz8XdOwUScPlLG70lFrQb7SZoIb/WITYGSsw0rmhiVwLCG5hv2KB6Y52a4GFb68xSLDyzLMFpuSrbd1kOcRKY77CTvkwjGIOlnbplIEb3LXiHUczwiIoxp8Zjc+Tl+dH4IWZ9Dn9u2FUhmDn5pET245orAxfUppGR6Ju0sXsulTDa8IOQyNCSOl2tBRIVGHJNxJD/m6HmDjL2ayqZVXwrrw0ZiHzAOQbsCvamcXT2wDBwbBEhbKXfVGezvA0jxkMKO4vJ62lXx8H0GhqPQYlw7dhaH7i4mX/ugzZCkIgDV0uF5LemPXYw0PwF1KmeWaUYFX19yLBkaaeMd+89ufwpeHsb2d+HAKHbHhoJAJR3ZBVhzzikN3Kqq6nm4VnqWKz69ZxlDud0p+Y9fsGCRl3E5HhZooUFxzjwSJgmDDYCMSRbMK19YsVYax35BrwqGxIkOl6W1BZsT1pgKiMKAe6NP8vIG4rtIXNloKDoqBifH80y+fepTquXeTHK7jhBEhWhgvhnmApbuDf5NEN7x3gL1Y4q0Wmg7QS/X2wKdsMOg+u3elxbcz+0UjriLQf2i8FP/9Mor4nQ5cC4lq780q/sEEQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(261026121527099003)(261022105027099003)(10067099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OIDE5q88NT5DUCWP8EzCUbUIBFjhP/qmrR+9d0C7mKvGe8KTAsogsMHG3Qu9DhjtdjXLrJ4q9c0WBOZVn/0G7BRFRCjSoNY92bn39BkVSriP6QQFl57FsgreN6AKy02loj3pjUQgCNLcWRjSDN/qsVdn+Qdz5jmZTQxhhp+E1gXctUXZrhxqo9brQ6d0y/xI6Boecf+BsTQxvzVqUXkTPTC4O7tPvz068s9fZ0BJUYUTPfkegp5f9BNpa371f6lG4pCF4/yyCwh0W+eYhIrkkcSqZkfci3X0uSwVfNcFMvmlH32uZVe+Mi0Z3n3H8Zmf0gw7cbbVZRgrCr4JxjmHWYeKzOhlOe7X2Nw/hZCWVwsbHDWb3oSOr2wdQILyIIMqjIm+soiXNy0ILED2mfhvYBY31OTuVyJ4ztoxABlrbzg8p3V/DvOKzpW6JxJhHGg7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 07:50:32.8343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3e6a01-f499-4724-97f1-08df3fc876d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7746

> Is this framebuffer shared-dma-pool node intentionally left unreferenced?=
=0D
=0D
This pool is reserved for future use. It is marked reusable, so unused=0D
pages remain available for movable allocations.=0D
=0D
> Does pinctrl_rmii3_default on &mac2 conflict with the gpio0 lines=0D
> SGPIO_I2C_MUX_SEL-O (GPIOC0) and UART1_MUX_SEL-O (GPIOD3)?=0D
=0D
H24 and E26 are not required for NC-SI on this platform. Their GPIO line=0D
names are retained for potential future use.=0D
=0D
Jacky=0D
