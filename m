Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A9481FC9
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932609; cv=fail; b=IJD9dZXt7CTP/4CM3xzzcYYjtuyuxTC7xo+mOTdsthUJoN72jmh5eUdkW3KRQ9gOOT7v6sik+vk3L34hwEeg926JHhvyxr5jtE8LrtJwpg/P4YRlyudfb46Yg+FFNucxmzFhJVxhd/HxR3qYaso5cMa8lEYr2k6hxhBHm3l35n4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932609; c=relaxed/simple;
	bh=7NxXIlkzOT6NNAi1g/g0WECD97AxRhKRBXoep4bUyyA=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a5lU46trLWO5SHulsRlwlJe2PtG881idbGy9DT/zJUq04Z0P03wfqD8HHWQy4mt/ssBJcBkJiD1zWusWuuDcb9bSqL2rsvdzGtjFfkT9+nSmjqlFjvexeCSpaVYKMV2G39j3aeRV45f6Zz/FHOMkf5+kJu4qUBGSAmMoVmgDmsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Eh9IqaoL; arc=fail smtp.client-ip=52.101.72.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Eh9IqaoL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzLOGMyTNF5K56UtNMdQihVNDhZ9W0oAd8m21S/SD0+g7zRjqJuX6Ve2WVJq/rWdhRYsUnynIydNUVVFVToB7wEb+yqDqEfr/acquGgWYfPtUJCmVUhYUohrOI62q35yNMsI/VSxpOlzh96ILqueWffX82nhxEvNJ5qbS1DAe81P/M2qx6BYJZgYu0R4sylfuyjK3hrTvFwPcVUsCeYNZwH67ToleB2zo3hmCRQD6GfXNaCydbF2+NLSpXYnoEu6dX1/UU+o9gq0IKZ2jgooQyqcMMFRVwjb2qsREUvxrK0jDclIEPaaxKUGqarM+38FLa9z8nJl/ica+lvfwi2VhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NxXIlkzOT6NNAi1g/g0WECD97AxRhKRBXoep4bUyyA=;
 b=x4UvqJ1MQvSUs072YOvl2ouS5IUI3XMMz/XAivymZYjvpEOP5sTjyP4P4V4mCXeMG7wtr+u3WdEazYqv2RnrkgEZXqzxafvOqfNVojBp2mRmm2BeO90IODRVZ9BDtHak5fDnRplOBxUkL7DaeTEX3+tmZ2hmVHqU+yul44tfid1vYC6Eka/omtB9muC8DiQ6pPBPRqc3Rvej9evEnWnzhIWBcNixsvhY6O11RGxcx7PSO4x/yf7MCesWhYfqfJpL5mEIx0Crc+nHHbhfTdvl6ksWaqUDzeY38761YgZc/F4hBeF7L9LwWcqAXhlwwCRvEgplVNbVRLXQor+0pfILQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NxXIlkzOT6NNAi1g/g0WECD97AxRhKRBXoep4bUyyA=;
 b=Eh9IqaoLYTHEypP6wTbocoDAGJyGC6YMeSjxZEp4lGIWcLXkRvt24cltXOwVbVaLn0tPfaqeb2mK/BR9jSQgNZHhY1nrrVCOqsMiytT1fUm8PMqrBtl8g0Wt4HvBMTaq/47VW1OYGOqWpnEwV3v8pQGDxVOXmuzm4UKiKcBfXGQ=
Received: from ZR2P278CA0084.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:65::8) by
 GVXPR02MB11037.eurprd02.prod.outlook.com (2603:10a6:150:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 09:16:41 +0000
Received: from MI3PEPF00008552.eurprd05.prod.outlook.com
 (2603:10a6:910:65:cafe::71) by ZR2P278CA0084.outlook.office365.com
 (2603:10a6:910:65::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 09:16:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008552.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 09:16:39 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 11:16:39 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH 32/38] arm: dts: qcom: msm8660: Align closing array bracket
In-Reply-To: <20261002091400.E19541F00893@smtp.kernel.org>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
	<20261002091400.E19541F00893@smtp.kernel.org>
User-Agent: a.out
Date: Fri, 2 Oct 2026 11:16:38 +0200
Message-ID: <pndld8g5uo9.a.out@axis.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008552:EE_|GVXPR02MB11037:EE_
X-MS-Office365-Filtering-Correlation-Id: 161f2f50-f199-4f63-112b-08df2065dddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FCtYIXl6pyaT9ty149NEVr1z7I/kWBeghwmeNw/P5jQMiPH31HWGvhxO7SKWqJ5Rk1naUwcAAndkyYcylmkToPnCukSvwnfNqjBhTtkL188Ed6ZeJ6zclCPyRqUjxLjZWd4qHzxCKaFlbufwnf8c73uzipkxv8fuAP5N44CdiQ3vZ6y2L5sJwatDeMHBPuNB95XsnPYmzuIV1BzruYzarB1enfqtGpA6JPeRxZFiA7WWdkC/wwd0yTjWNBHCcYi7LwZEGozi/PROPly/RGDTM0NxscTZnu8eXN3PTumETn2AbBfZ8xUUifhenWjdRh9gzboMlBwRl5pV7I20C6p6kdu2IGIqgWwCf6Lvmd8BU5AO8xNZst6aXfmirPFs7PWVDUA7orP89+ElwpOW8htiEUSAJzTrJKpXz9crjywmO4Y02YbouooK+/WlxfoZVVOP6wvJ4zNeT8siMFDVTewWziuux+5Jwljmnpm153qgt3DpQlawaSZuA24xIu2qxWPBSKQSitQrTliOQPtMcH8ns/TAEp1h1unY7GPoGL7qLonKywRgcAb2Kw5HmyuDAjngWmvd5BF9hq6O64bdOu+u7aDjzDEYg57f72FfaRmjv9cZXnShZqJPikF6FHPgfMedYThELfgdzKFEFgHA5xSQ70mc8uKOB4VYYI9TZcK/+ibVJ1l0cBeTT9Vc/E7u7yDRaMXUJ87O1C5Rk/m40D8Lhw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	obDBNPt5nM8uHKJPeGQqF9+4F/dig3VrDTUEcrYWuPqp5subMTmBI85auf1cD6uW8AyT+ATS/XWIxZ7OGUW6XNoAh5d3alJsntuVUsrZLaTRkUTM4Lk6l0Cr1uF12d5936RuEO7V4rZqGKhEJDDbhEEycqb4L7HuUMZv+sHcosHoeySXTUvylx0bviAPddX7sCWzwTWE+T02NA37gVLbmLMEcvAidX7fZSWlCLvMy3VodJn0Z65vUl4V/5X/4lXfcXB/RSBImoaz32rr0Djs71sizgngehnccpMNAJU78oGLETDOJFuWfjHawppobIV4wfZP//lE/tbPBOfPKt8UfpXCLodyfI5uIH20KCRe2kwyHz2Omj1szt0Xsog1NkWy5/h0iyJXrXXat3JH+aR4jGy8MKDYJVa7M6oAvS4u8ZQf8LejW7euOKBlQi7RX0I6
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 09:16:39.5339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 161f2f50-f199-4f63-112b-08df2065dddd
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008552.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB11037

On Fri, Oct 02, 2026 at 09:14 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dts: qcom: commit subject incorrectly references msm8660 instead of msm8960
> --
>
> commit b17e9982dfac5102cf428f6631b5708c042ae4d2
> Author: Waqar Hameed <waqar.hameed@axis.com>
>
> arm: dts: qcom: msm8660: Align closing array bracket
>
> This commit fixes the indentation of the closing angle bracket for the matrix
> keymap array in the device tree source.
>
>> arm: dts: qcom: msm8660: Align closing array bracket
>
> [Severity: Low]
> This isn't a bug, but the commit subject incorrectly references the msm8660
> platform, while the patch actually modifies qcom-msm8960-cdp.dts. Should the
> subject prefix be msm8960 instead?

Good bot! Will fix!
