Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795072983;
	b=pV9y6Svosc7FG6G39wMd9ZOtrX+u6VHOq2wkeT4vyTJgPkf7EarjufHW7etIBGCyyqya
	 43wrXRTlA6TK/i2WVReSAmpy4UV98pcvYJyD8BF58MWdbkkGT6Ft8KlpeQ9RzL8k4CJ3j
	 GFd2gv8kSrYKX6rX3NEoyycYdE9aOcUC2OuXRFWlIS52a4jt2ZjuMY0PsIiG+kr+W+LJF
	 wBtRq/XNavf8+xPE+ITMDQQS/ftPcRW3urnFQhzyhr6kXCxo+jrzhz1dXC0wCi30uLxWO
	 Y/KobDTfnf4Ga+B2SWsySWFIAXNJ8ykjS2DMpq6RVS5llrpwBLfrSnU8I2FYovCrNbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072983;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=AOeaHf3J+Mll/h0hQkQ3pzBu2reVg3YP1BCGaR1ZMuI=;
	b=sLnXZ3iF2/11iztk13KNFPtGKIG1jzQwXUuLDCXKHvV1/4nAlkZ5X7keOWGQwYW6u4zH
	 Er29p9U7IyaE28v8Nav5gb0p1/fiJ9oqhujxXz0ivLapr4dbO/TtRyK77vXZZrybFV91u
	 HH0TV861YzEFkEuXVfmeB2jhqpjnClDBviwnsRnDdqaKyMkMWpFehnX8L+F93RD+vUkyt
	 zJ465iUbUe69jPmIhBKL7PTUeF2IRV1pwY/gZ38yZa/qSgJz/7KKu3wM2NOZD8XxqNAub
	 HJSi6WNOxfHM02cX1lv7rVHhbjpD0NXZ1PmC22xYHAMvuT5CPPe5DJ1EE2jXmGXjxfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y9P86yPn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.64
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E75606A326
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 07:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E75606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y9P86yPn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUKR/ac4kosIqIOTA2lFlueopq264Fd/8EuXKvXRQNguegpYozNGTCf442lS9+U4ujQ/Aa28sFftWANw3jqkH1pkgSji34EIyCRSO+P/tDOoR1cB3LXqGVdGqr/n6vHDrktF/o+Z102/Z6EsYGjeERbT3gUuwNxxL1Ph2Ay8MY92KdQ0y69oPXReEQnQFN3f5Ib5TEsL4x/VPfzi9EXXmgZI/ZPJkPoAcBg/na4d3co+sJSpQOhSySkTwcc82gK5AGvi2dcoavR9uMQHfqQfUl/dWROoJ5Lc8oyur2TnsXFbmYWZE07v2MjNBfzeXNX//2Y+6ZSFf0SKVpW9JZa14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOeaHf3J+Mll/h0hQkQ3pzBu2reVg3YP1BCGaR1ZMuI=;
 b=IkF/Q6SEcbE81AVdnaX+7ZvDa05IQCMkhUGPcHWBO6yTbpieSiOmURev4TTisjcmeHSaq1Pj5jpyJhKr1sBKtV5l0pQHXoDMD/kmDQ5aTuge929UVhS9Kz3eIAEiCFT0kl8fbNm69LwdhB3JMhM1w7FRhIcK0pqTYoAcWthpXVsV/jqpCyUi+sgX2r4BIskbOe+yiDUKmTCMhZ+G9wk0Z4wwlRmrAwHUXY/c/xG+BNL4t64VPQrnG2J+xdQ+QTgnnFV/pOL4Ze4TTyk/fvZYVJGDHc5ICKzPyMyDpCnlUMlZvE/sCmxBHmclcp8xfY/Xk0cKE5w7dG2JPs7QC07tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOeaHf3J+Mll/h0hQkQ3pzBu2reVg3YP1BCGaR1ZMuI=;
 b=Y9P86yPnhZwtdVn2/KuGFHm2fk3a5rhe9QDWx/z0uvXpnLBJaAAPHL2t9JYwHgLd82adop3QZm2FCQ/HZddmQvHESbBDKru+ZhdBg/u3opowyX8Dx/WpCaZl+dmt1j4wwslEtzaS2Cx+IKzeNFweViJpiPHwZI7bWG1sZ5yp13Ja5mYqgn1+8dZ7sntQK4CAN1StScJfmazjkwaeh4VgaKFbBSG9MTf9Pg/P08FFl1qhhvwvrb4LRuupHetTwlWbU2kSEkEetlNoLWbJBKOT5teZ2lDDns7qgLtVqyApASzIIynTDnwsPLUQkYdeKSt7XBgUfSGw5eOjDnjw56G/Bw==
Received: from DM6PR01CA0024.prod.exchangelabs.com (2603:10b6:5:296::29) by
 BN7PPFCEE68E7BF.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 07:22:57 +0000
Received: from DS1PEPF00053452.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::a) by DM6PR01CA0024.outlook.office365.com
 (2603:10b6:5:296::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 07:22:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00053452.mail.protection.outlook.com (10.167.23.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 07:22:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 23:22:40 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 23:22:38 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Thu, 19 Nov 2026 16:22:18 +0900
Message-ID: <20261119072223.2983298-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-220421@kernel.org>
References: <cover.1794985308.git.jackyhuang@nvidia.com> <70ecd17b83b36e0010a7eec28006abe12bf26218.1794985308.git.jackyhuang@nvidia.com> <sashiko-outbox-220421@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00053452:EE_|BN7PPFCEE68E7BF:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1f7ce6-215e-4f3d-1748-08df460deec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	egA+rKkT4Fls+KsZgfkOa06oGc1gVNIGpF7HpNXGMPHb1811MLJIzB8+EoAxLUjh3N/s/MXNyGkexUNHlSvkta4n93qpWU47OldEHDq7IUeYLdSO1XfzkxJvO6WN0MUOcoLqYFVLS7pBJ7WL3ZniRLoYQMrAy+rk235LDgNuQ9tRdnuv37Mhd7egMZi4Np2ULoSKpxQ03ysixNBRkVANp9S8PFuKZnmWFsCzzQcqoMT3fxzbRuJCcxJ0ZYNCmqsAfJzKDrp2nQe9ILmLMQEcRNaa4KskQfPAeqnI/ca98V503D77tok4RZ6G80iJYwgRzc7CndhfQbZZKjHT2wTI+roZXsenI/JBYmS4Ydy2oaIvLJMlSeX/rK/SiXkJdpyI87qdXNyXy0NVZGolntHC9G+rBaqUt9YpVmIM5sanxvD6+lXlhBcpuf1/2MWw446avgdWxugqsew3WfGPV3lILC6BBW6tVlNRuOrTJyMOc+aLFfl4maY2SiMdHSMHqDb3pn9GN8myDeKtl4GBgaN5MsGwSneNOcQxPC4zx8+An2CfmokNGZGRSXSgb1v4cecDohXmzr6WJTiU/eo8GneB3p8mfXP5aUFYL/uhLNpeiCxTicWtfNFvRcOv+K8n9JrpqBdNHTvofUy/OxA9fZx+dGy45ZqKkcgHwx9ub1oGBEAMzfCicqCLan7P9J/j2GU9o7bfl6Nj34hrVwXE+lDb1w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QV0kquCfuXy6z9NeKMLvzYk+frq1lXSzNpY4JmMJrugsb+oGQr823tjkhO0ZNMVJgUQRNQn4xuf3+JUeViZIUiEyqNlz+8U+JohkzVO44aGFyxnP1frvx+hpASpryMtzUa2r3BA2SFRbCNXIjivNko9GiFRl35sOvOaJ/UXBbV8p8O+zWUwI5THSFAzOuwUgCn6BRZPBFCnFg42pxhI/9ri98AWTq5G55MODBCRAbcjkjINMkjr6utfP8u+OiTa2vZo1nSAaHZ3+mTgihLe2lHDMgXaoMawbdr/cv93xFYrSivyJmu0HMiMf/ovPFo0CDzbJl6oMGIk3MogPSadjWlEnyXTVm0kAuzgS5w3O84DTxQu8J6FHXE/2dPiyK7ImYyGFK2s97qT9HywxnztdjGsgm0GRNKIE5qvQ1RrfQc7JQP8cJSQwNY3Yy+eBhB1D
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 07:22:56.3196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1f7ce6-215e-4f3d-1748-08df460deec8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053452.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCEE68E7BF

> Does pinctrl_rmii3_default on mac2 conflict with GPIOC0
> (SGPIO_I2C_MUX_SEL-O) and GPIOD3 (UART1_MUX_SEL-O) on gpio0?

H24 and E26 are not required for NC-SI on this platform.

Jacky
