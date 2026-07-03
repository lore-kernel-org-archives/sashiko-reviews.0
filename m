Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01732C942
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 19:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106373; cv=fail; b=RTZGbvQ/TNQlkDiSsC6Dp7PA+qpzM04ItRPbN67nLADMo8tKfPk0w+oeKR7ndnpD/yDz+vmI7xWyMumKGd4FfXhtg94/eWz5UW9oDudUZdES7X5q/7CMIbY+ESxvsipfH/1fIlf0f4jzh1JqOaiOrWW5srv/i2j0Ze/SdVKK4kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106373; c=relaxed/simple;
	bh=FCpZMMa0OVgbvgOUdgFCBBG+u4dqHcKbm+kl/vb0nWs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C29oj7KO68lpenz1ONAvE4WDhaAh9M5/ZOTVn55ILUgGWV00yaTal/l3+bGRKE9cUhGIy2cYCFRBHOHgx9NDs+HqtGXnAGcyoCLWnYDtpnKwVjMZd38MBjvG3FipRdODJGIgFgWQJKTxvb6UKJJjKHeGmMOnIrpC7zKinKrHljM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NQKioJ6w; arc=fail smtp.client-ip=52.101.53.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NQKioJ6w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaCsoVEVwsmpN63QHj1bvjUCe44JABlH6QAw94SKBt6x1wJoLiCVWYTHQTlK2xSmI973zUU/L3tfhNpxEMrhLuG7krI0fEDAQn1Otf+Xay2iv+HZgQFHawrFxc6stFHxZAXQaXeYz/4cJRe6DhYa9o5vu6pfiTrouAPFaKUi/XfHrWvC2a1Ec999OqXX/oFpcNRUhvvyWsBg3y1O1Ek2qfl+UQ+/kLzjg5Z3WuoIkQJWvqtIYTFzmfXeDbR2QxQWcdIICOwMeTKuIGIt3g+uPT2DXIRbQuGUMH7JK3Fdvy8rldB28eGVbA1JOmQNht/sn1Q7fxpZcfXwJ41z5Sy33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCpZMMa0OVgbvgOUdgFCBBG+u4dqHcKbm+kl/vb0nWs=;
 b=sECDTfAf3WyU5YRx7dYMhTVJh9j7ieAOq3lZLfFEc0dhCf2NA3cev0wz0Ys7sNURuwsCHGLuITs2CDaQydG+9RefVp0ZMAYTZvABPPHOylDPoFsy0ShfMzQHMgjwkrAVSpQI5YinZOTMBth4jWOOBQuvEhQksF3yZqAGYSo+W6sbHVXdqZ+ph10r+yNS7luAV1Qn4B0vTrdzg/bVRAjACoCbPMVfPJnZIzhqIPHxvMCtLzXNuM7GxntvIOIDRJHeRB30pGMElXbq6GcEQY7kdHp/9qkDKkAQLxft16QzmVvYK15efEc0qG6SVlzoWfK8klRmjpT+qI9Kb3PJcL8xSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCpZMMa0OVgbvgOUdgFCBBG+u4dqHcKbm+kl/vb0nWs=;
 b=NQKioJ6wVh5ygHJG+VifoXcrctwuTkHg+b/G9JjTccPFyaNMZtiaVA6XV8XR5jzkwBC1Z25esUzaxNTJuDvEHADTp5te99LfnRoX7TBnRHA9bKrjfoEnrGERfA35RJ0u/z9ehKawcAODumt/eUWSIchnRIS+DNfkIzyx8mVZcFAmMTh9O69EvEq6dFQ4W2YC/0YyHR+GHrNfhUAbtoYELlnwOPeCCflqLF3HHpfFjhdEqjVaulKMjpIR0g0TFippvLZ+gn1CjZSVM3P+Vy4XomMl8ywlTdtZnZPOUvGbhlpISZhp4+QHOfTVKyC8UZH2Hj2fccHBzNCgKF65BeN0cA==
Received: from BN0PR04CA0094.namprd04.prod.outlook.com (2603:10b6:408:ec::9)
 by DS0PR12MB9447.namprd12.prod.outlook.com (2603:10b6:8:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 19:19:23 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::ab) by BN0PR04CA0094.outlook.office365.com
 (2603:10b6:408:ec::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Fri, 3
 Jul 2026 19:19:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 19:19:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Jul
 2026 12:19:14 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Jul
 2026 12:19:12 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Jacky Huang <jackyhuang@nvidia.com>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Date: Sat, 4 Jul 2026 04:15:35 +0900
Message-ID: <20260703191604.2238473-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702171315.921CF1F000E9@smtp.kernel.org>
References: <20260702165524.2168091-1-jackyhuang@nvidia.com> <20260702165524.2168091-3-jackyhuang@nvidia.com> <20260702171315.921CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|DS0PR12MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: 90950387-dc3c-4cfd-4a25-08ded937fd5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|4143699003|11063799006|22082099003|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PmdU3gEpfg61ICveKgwWAZUNcfIPnDu41YdVdiGgBMPBPsWzyxwCZlpsDBOJR8NfRdpYgHAVJMPrle1urLURIuH+dpKphs1jwmGy2OoGoVG8PCUqdhLuItsN+zAggmgWobHunBssv0g7bpH8xU4aK5BlfdtPg5PgZDvXd9mbg+ZNfKbBeAPKuut8+OAXgykOeQwL8Ztfx3QrgcbvRUNzjeKm1927e0XekChVI1wadn35ecdDz+uB14iwB7RbM4SRsyEns+CEue4GPnBVm47KSvjE2JGxxrxga6DIYe78dPKmPVr+gVXOOlGrzulXhQt4rPHAzt1Fp+HLBMVW+fmbL8dqsSRNCM9h2sXXkQJhlYJR0S/VtdNSFya8nl55LzxkrmyAJQNkkVXIR6thpTWPoyvJde5ZRqX6eodHwPk/3n+TSCv3klOboEv3cBFa2dkNrJrSpTawgx9J94lXS0yK77scwyWP0x+2yQAgsKolktnxOklodcMA2OwGAvEFBO4R977iBaoWjw1vhtYzkrO8nONdQ2FAsATN02l/NyNmq2PNHBHcn9lKienGafU8T3JYM1Pyrt4CdzKGrmakd9llwCsuQXW0+FhwZxWLMFKyEcNDvV3q8izeuo4eBDqvXEMQmYgJY7K3SusBYoGGQOlqrYLTySf2WqrnJQUdEA5oLiVG23zhsiWswvX0hD0qJbPdH6m/TA0XEbhw3lmhwo9Ynw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(4143699003)(11063799006)(22082099003)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	43T0Sf77Wb8Nc2qWZPVk0dp2RGnTgpgU0jq3p3xVPJZ1mi3SsUdyQH8f0QbOXTNjwpw3XqQ+dW4xZwHKw9UPLTPgiAUx2P/oeQ+17yCnxgb5e5yR6jqsxBX3DJEh9zKMxSqv30W1FSS6fxTn0ZHKZA9VkxCRkKygP4OYYm0a7Gsvu8mQYjvDo9FaKEdl45afMEFoxwbxYaXC/W86DKTXeaJWeE6j0+0D3DeNxZKkoQ2CdqcWoTrHqvuxKU7AJakS4ujEyzOOnuG39RtnfXuZetQNg3zHl/xJY1TFs7hAcvGNOIKs/wq2cEFWdHGsUvEQStgYYm/q2J19/+o5TRIf3cTIkoQ5EV6EX3TODIX0sOolV5nJwPYwEk/sYQPYQh6aCO6sGMjvS7xwtqFZpHoduv8IhXAOm1bm5RR7rklCus7N4iBA/Ou3SARg2QgWnVOT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 19:19:22.8523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90950387-dc3c-4cfd-4a25-08ded937fd5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9447

On Thu, Jul 02, 2026 at 05:13:13PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Since cp2112 devices expose a single HID interface, the kernel's
> usb_of_has_combined_node() assigns the parent device node to the interface
> and skips subnodes.
>
> Should these properties be placed directly on the device node, similar to
> how cp2112c is configured in this same file?
>
> [Severity: High]
> Is this interface subnode for cp2112b susceptible to the same OF node
> combining regression mentioned above?

cp2112a and cp2112b are NVIDIA composite devices that expose 3 USB
interfaces, so usb_of_has_combined_node() returns false and interface@1 is
used.

> [Severity: Low]
> An I2C device at address 0x75 is typically a PCA9539.

This is a PCA9539. Will fix the compatible to nxp,pca9539.

> [Severity: Low]
> An address of 0x38 typically corresponds to a PCA9554A.

The kernel has no nxp,pca9554a compatible, so nxp,pca9554 is used.

Jacky
