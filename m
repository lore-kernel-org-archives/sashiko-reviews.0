Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418C94779BF
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932602; cv=fail; b=ZEW94ASHG0xRWSJTvRuhBX6bWQ1gNvf7yN1DQZHOOsEpcq+bkwjulUMrhGao+I4UpG3fMMH38BzM2YYtKgMFJdVjxwnoqp2EiG7Fz2amMqk5ibnFfmoW721fhw4FZsdA1lXjirlBbAV/8AHlWEivOPxinKoUHtSAVtc6xwKStkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932602; c=relaxed/simple;
	bh=r9B7oopihmuDaYXh3m7ktJ/iGxEwRDXZB0SF9J8p8Wk=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KHASLuXaT+vA2e3imn76bc9IO8gmJqyVVwEz8EcJhwhdNrU+SE2fMBeStTXEzblkwE97moPEtuqHHKwGnmVCedLyuEqgDtbkEe1H4hp/lw4md8ZxkoubPpT9v6fHccUei4JFFMZ1y8xC2MiLFCFcQ5/YUqmOurUmJXFLGevwZBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=GGx8rzMx; arc=fail smtp.client-ip=40.107.162.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="GGx8rzMx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSuiVipL0CTL3AHV+wx/Dc/UzFHEFyPffgSB5cTJ/fqMtor6JK6V00ULsF3nsliN6aMGbVbHK9rkzCvPaDHvXM018tteWKJphTYc+TtHiKRJv7Ta1rOc8c0vS5Xr144y44Bkw1fs/78rwm2eIlmvSRXKe+6TvjVMk+4/GL5rKQD3O+I9bJbTVDZmdS3Cq+0YPI60TcUqYqnVX1TPfO54zmPXOCP+IZtNuFSp1pvID2Cu0SvZfWIo120Ne/DSqA2Um0qHnZrb7lsUpjI9MP4CIbnOuPHdrbh7OIBu7i97JyexX3Qxx1taY0aFNqs+zW4I4pH7QediPbI2LUEEcH5aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9B7oopihmuDaYXh3m7ktJ/iGxEwRDXZB0SF9J8p8Wk=;
 b=LEw6yZVxn53TwKr90+oBEC27IGFjAn22W0ys0PYLXhtC9Ra3HZItobJ8oZdQdZ5M+0lyNbfzhnkRHqEYC7FeYybOuo0QlG1tKaolM3xdE1r7pyMwvVrtKJQ31Vj+NPQqOe/zA/ITYzTPvI0V1koDd+t6aWjyTxv0hJqlobzfts6pC/DqizXg83/LcDW06CRsBPOEu8Kzu7Dv1gXvq4D5gQ7fDzo0ZfOaTedeyAIplFvAcN+rg64XKk9/ApezQOSkDOFiUcgb7f8H14HNDHpbsM+VMZRTubAEA0XIxOdBCh+K9ihhkoxB/9JbyQwP5cE5+ieMYvtzLeIZ0ZdbfPpiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9B7oopihmuDaYXh3m7ktJ/iGxEwRDXZB0SF9J8p8Wk=;
 b=GGx8rzMxDOHK7LVMcjejTDIMnKDv7g6P1ace2G1zqU5MuF54Og6bjbp6A3t4WVRAskT2hvVZEOUGN5uX/NjVDyrkWjoIPSd711ihbrhEem8kb667DebaCMXVntDS/BA0s2JrMAp2J/PfYowVP/lDyHcYUw30luXjgW80TOEypqU=
Received: from PR1P264CA0179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:344::6)
 by PAVPR02MB9644.eurprd02.prod.outlook.com (2603:10a6:102:30f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 09:16:34 +0000
Received: from MI3PEPF00008557.eurprd05.prod.outlook.com
 (2603:10a6:102:344:cafe::69) by PR1P264CA0179.outlook.office365.com
 (2603:10a6:102:344::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 09:16:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008557.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 09:16:30 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 11:16:29 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 25/38] arm: dts: qcom: ipq8064: Break long property
 array data
In-Reply-To: <20261002091359.40B021F000FF@smtp.kernel.org>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<d8c979c34a5b49a7b83bda8101c5f74711a953a6.1790892852.git.waqar.hameed@axis.com>
	<20261002091359.40B021F000FF@smtp.kernel.org>
User-Agent: a.out
Date: Fri, 2 Oct 2026 11:16:29 +0200
Message-ID: <pndqzi85uoi.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008557:EE_|PAVPR02MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: 033e7397-5c14-4ae9-1a5d-08df2065d861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/wB8hR4ofOM53wJeynBVzrhDFS/kIqvA8kGHnyJkie6Gj5AHgZjyURY3rkgZslNKhr4mDdXFZ09nC0q649w2e2C0/OZACCV7opqAhprHsnAuRvXCEYeAZahbbkUFJC29w9+0pdro4qKE6mKSmG654rCNLMpimcnsygfjEqTBYzXWoDkxuP5DXnyXIB7iYlFSjXFN9SoEy9BP2RsicWTMVbe9UiFTiIT7PM4bTwgT7jsxxZJV9gvCRC4EZFfwjj0RKPDrQAbuj9TCgBpgYV6GpPsUuxJkdYGOaSWIBb82o+amZz2rrbWt+sQ0+eKfAIFCdoD6VsiVMD0ZsJiGbTxY2v/z2jQTlyJB5IRoN9xIAsKJwPoJDH5owvrGdskOaO9YHV4XMdaJeNiZNHjntMOzpuTnlhfBBUfo/0avaTwsFOEI9O+ie4rKLRsOtVyMs+udHD9xSPYzS1PJHigP5Zsdm599OoWPIvEHP0LRYuRwZaiyRkEkyUBWMLrOO8lC9Jp3pwewr7Hj3+E7Cmwh0tf3YWMrVBrJ2exICaxx9PYqPCrsGxzA01CuaB4JTXQeUVd0f9cSHtZxkxWaNHF57mBEXdeveLiIFjsuzr9hs6Vno/aY4CTjSFEGk+a0xWVQUDCJIdlf2if0HbbBBLjorDvJemFU6hGWE1uds99s7fjmEjEdoQiu52fpUV2El1d38y/6gxJ1vsMquUDFxbgQ+EbTzg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4V/h+XJYhsSWDtP8ihdyszX0715Sn6vqcpgM4rnIWCnvIRIG5u3fPvSQqSjMdowGTxJYiH6AIvb3y8qgEStAHwvIRIQlNKeRxyBhcNCUiciZjYu1KnTZKRa8+LFSsc5+SjJqUvVpEEd+4sELDQPTyZZkIk6bCoNOUDeHHZlnWPJomSTHN931uF67wDrss1APUfrTue5hcw4w1MklqgqjDS6rA6fO4j0YcuKef6bP7JshaEQx1kqbaxzxJhNZ2Dz+iT8xd4T3lTIffFb+Ti74hGpIijHmvz/wXYWJmGv5l7lXbxk/48jLCh4M8NbgkI1rv2s806I6qgQ6VnTN7XjzcBf625fU/2R4kHzxWjrN+zHl7sqJZofFdAL85qz9V9IAIFBXdhWEBZ0UcFesRxkZzrBRO5qDuI7Tj53XnLsy9HKV6jUWmE+p+/XU+Ju1DEYi
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 09:16:30.3335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 033e7397-5c14-4ae9-1a5d-08df2065d861
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008557.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9644

On Fri, Oct 02, 2026 at 09:13 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] arm/dts: commit message mismatch for msm8226
> --
>
> commit 48c3f8677b03cbab24e050029b004bb3e0cca06a
> Author: Waqar Hameed <waqar.hameed@axis.com>
>
> arm: dts: qcom: ipq8064: Break long property array data
>
> This commit resolves an awkward line break in a devicetree property array by
> placing all elements on a new line.
>
>> arm: dts: qcom: ipq8064: Break long property array data
>
> [Severity: Medium]
> Does this commit message prefix accurately reflect the changes?
>
> The prefix explicitly states 'ipq8064' (and shares the identical subject with
> an earlier patch in the series, commit 0462db0355be), while the only modified
> file is arch/arm/boot/dts/qcom/qcom-msm8226.dtsi which corresponds to the
> MSM8226 SoC.

Good bot! Will fix!
