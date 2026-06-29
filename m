Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCB6346E40;
	Mon, 29 Jun 2026 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730711; cv=fail; b=PGFbLkSBer9pP40gGYMzWMX/QlgD8YMPnysfwl0UXzFURuffqCbSQ6RXCBG41v+KYbosG4X8z6RI6RoPWkaAxi2jPpQBe62cTy9YLSHI72oVSAIVY24Ta6vP89Y1BMxIctSPkgJIcwC0PPtN6+MoN5IuqkTRGvA02ode8CX7OhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730711; c=relaxed/simple;
	bh=PwtNTvzCkypAh3D3agG8xJ6Yosi6kFBEu5AI46MVTW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MhvoopvO9jm2/qRTilnEUGXC3H4wBRvivLTr4todYVs0H4agsp65aCxpk0KobEcnfm7abZzAt8VVjKn6hRkmIcbzarvv4Q2a98mJxRIr9uQ0hpFPQ/oQWp2VFka8j8OhqfoDkx6bPHBkhxit7fceB4smBWElQwYr8fvSTmQEZdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=faX1qjsk; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PxoeNydl; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="faX1qjsk";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PxoeNydl"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATGNK1855853;
	Mon, 29 Jun 2026 05:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wmQjY1KSMP/zx9VZrXyzxa6CWxhecR/oH3KB6doFR
	Ig=; b=faX1qjskdbFCMWQ5oOWrhirLcgWJIVq/fvy1227IGyi1edtP1luzxY9K4
	Knkk8Tm7z4difL6LkmYPfpm7a+ugPxRfaduWua60fjVZEtRCvY5g4fFmZEBPFlmY
	2ykH5ZZ9tgIouGkGZmub4p1a79MgB0GZklKLjrAHJLovWR9XFXYwmpM2TlCb/Rtv
	kOLH7pcg/ih0OeJ5mkxS64SjGKaG72k79TuLhdDsT4YaplLz/gduBwTsiAZddbJM
	eCVv51T3EvBCAsay/N8+02OAIFlC7ptQpovh8q5EH9H7vQcrrrYQ7cx+hFmmoOvh
	C4kh6JwI7g08wht7uA0PbyJmJripA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f32hjp6p7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 05:58:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdreUlyNWkeRhiv9cWM+Qu79CyG23Q8KSu2DGGHtRgMkuFkQxJ39hiizpeeSnUd3+L1gtt6YLKuit2ZUKwpmNj8LjcP1damjDecH0jHWAKKWD9rIIsU0zrDwF/Ajs/70asAwWZVmL6eATcy+hhAfB31ay2KMCovlErEOBVzDHLxj+yYvTJkfK+qdtSK6xM8wc4iJrCbMWMe0HjMzUqOnk8oJlHyLDAH4uy8yOr75x5/72GsmOkzG78+U0ZLB2Hzx/iJ4cdN/evUQW7g97slHsfA3F4gkWi8baCJ/B80OUp3X63Gdv+N7lBveMUYVdifS+EFoKHbkcMJMZsBkimzgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmQjY1KSMP/zx9VZrXyzxa6CWxhecR/oH3KB6doFRIg=;
 b=IEF5lUkEd0uBXJwabMMqN9kZarhygPaLEr8gZHhNVsoSNzR/p7RUiiZn+14kh+oRG9gkYd1lJtgUQOUnQaDriXUYO/wPKCyejsHRGXDTiOSrVB2+v82Lg3EtPF/GXC5zeJA+/P1X0dlVnV5LAzvWcR2X2PouG4Vsi1IfZYrwj5R2OrbQUqJMLQ/lTWRqu2g3NZBaKhTb7jO1yKd3ZOxiUkZcfQajiv7JMwY8ATqmv4JpabsdjXlm3+9hbCRWfEQyHu0+Qs5Eo+5aNHOWucSg+6vOhx/IA4pkp2Hdh14xiRtLUxfIsaOny6DXzUPDM5gTx8abdArN/tDoRSGK5m30SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmQjY1KSMP/zx9VZrXyzxa6CWxhecR/oH3KB6doFRIg=;
 b=PxoeNydlp2KWYN9ikcZWsoU2GKxM4ik4ZP8zAmb3FXPrLX6QnOhs9vcxyUkH8vtHPlpN/H1tqmSGq/sdk9bbYiA3oBpkgqK4NwOlotuF9KW0atXlY0nR4VwWLnbsu9K99fLSZtokiRSV1GAxD5NlVsIOoOgbejKs+B4W9o8Y6G0=
Received: from MW4PR04CA0074.namprd04.prod.outlook.com (2603:10b6:303:6b::19)
 by DS0PR10MB6727.namprd10.prod.outlook.com (2603:10b6:8:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:58:22 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::73) by MW4PR04CA0074.outlook.office365.com
 (2603:10b6:303:6b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Mon, 29 Jun 2026 10:58:21 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:58:20 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:58:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 05:58:20 -0500
Received: from [10.24.50.145] (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TAwIXt3917637;
	Mon, 29 Jun 2026 05:58:18 -0500
Message-ID: <ecde4c12-6cd8-4993-b2ec-758110bc1031@ti.com>
Date: Mon, 29 Jun 2026 16:28:17 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-j784s4: Add overlay for dual
 port USXGMII+SGMII mode
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        Gokul Praveen <g-praveen@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
 <20260629102308.56616-4-g-praveen@ti.com>
 <20260629103445.134A11F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Gokul Praveen <g-praveen@ti.com>
In-Reply-To: <20260629103445.134A11F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|DS0PR10MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d419167-68ce-42c8-314b-08ded5cd55cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|3023799007|4143699003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	498nJ/zQPuL9qLkbm8Y7cdpfUJZxJxy+Gy0LNGsqj6xHH8aqt+ZSTUqWuQc05HKYHjMFD0I9kdUOKQH2VDtfIjHBM41ZZ4GJlJtg2Wtl0TlM7K7p2MqJ/eRTRnM10gMnqnh8ycSErHEkX8SXRizJgGu6CwHHw5qQ8rz6raa8aqT+t4jNpnLzzV7RjhbImuH29qSGJYqzrmdFREoTjsuHrsXpeug1Gf3x111yK76VWP73cvwXISBY2WGBe9Ir2YkGwn7KhcAyH8sGQvVLqZ2g5Lyrp+AKgsBP7N8AXIrDYrcH8ya32MLCsZT/jCCWPVSalicbgWiETVfC1mj9fEkQ4n6hH+1St22ClHdd20S34uNQw2VCEg+Pcm6Sh1N5DeMpTor5F4xE9qB38f+9TvGQ/yaEMNtfcuFe2QFbQbLQrys9xRMOW/TeFZh9kfRywb5L6LSNV7OSKPLRdzHXOp+LpOTIC/n0XcAhKpjDUvVLxerufuf0gi035P7P/A6wtxi3krEO3+a/GlbiwnK8dAjeYKJhFrq+7e6FsT89xMPcUdsWgMLxgeZ0q3KNvT2sb1sSbj725PS1UJJjRiph0o0WkrIElKWMCUoCYt+gIukboDhSo2wCbcQqSjy0nNB0W3/z1LdNF4H+wrESkSpJWcfbC6w3SE/mX00qjkTPAr9AZHOMZewjKxFX3/oVWuh7EVf3o+oaBSV1R6hMtRKuv6GzyA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(3023799007)(4143699003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JybpLKf9VcMwSozJ5R/5mTiIDJuzLnlk0D+rQ0ACEaV72g30YKeqqi/pBwe6d6Ih+2HI70MOWXSpzynJj+GSu6dp5OYVcnTNeaF3klnx/UlDdZ+Luai1E3hRMS11SqS5vRGPEptm1VBJ6M7LrMMV+5wSjpyfpKqHVzqLkMbozLVoAfEx1t7KDCzbuTpdLP1Y1h/iEr/jROdl0FEkx9DX2CtdVKISXmBJIhZHzDhq0tFxpFqfYM2/50QFIetahrUGUIw6TXR3OOuL+M5y9vk9AnurxINIn+9RL40eZGEMy4nK/7Jb3kDMykb0bOFsB06ALat7knBT2/ULwPnpq+Bn3wwnRo8VUAXlMkRBezWy31ihCRgmG3/l/BgeWwPEEmUPZY1fKUfxm54Zm4yJsGjj37Cgghp+WlFoLzMFVCwvGaFjPFcjUIUTdbJPZAIhxVdh
X-Exchange-RoutingPolicyChecked:
	ASGVD9SlVvMLVhYfj5rX2cohoPtmYKaIfO1oW/I1FmfU43U57GOOnh3OXGggFEA0F6jUd9XAyPOjBO16dDDYR7qCiIK1OyzBFvXhNfJUVxRG0sv6AHZwjgLWZuShVUf+SBDLwki3Bg8hncDmPZYs1y2JX6kQwiBalcTL4ccV7BtqvLjZBY/JYcSHDskMGTmIvvKRmYchYw99Za/jf9ZvzTvyeQRYn5NqCGtSJOM5TQPCK7toUlxjV/7bYzRqWTcDGlH+M60GGsGUQ1ooZzyG1tvsAEWdaQViU1iYwkYpr2YssK3hQaFkcq+w/MUYHf8nCJGf/Ug5DS4fF+eiK5TJ5w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:58:21.6253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d419167-68ce-42c8-314b-08ded5cd55cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6727
X-Authority-Analysis: v=2.4 cv=DrlmPm/+ c=1 sm=1 tr=0 ts=6a424fd3 cx=c_pps
 a=WVTIIPXEjO/6WBYygohQVQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=FCeJcYwhVPdAXEGK_ygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OSBTYWx0ZWRfX8mfuc3lVse2r
 N5B82kTOuA2ak58e845atN5mzxTknPwIULjTcLQsfvVSEAHtrNnte8Lvxaeo8hK52WL22RkB98n
 291qZM8KKMhhc2kpy1tqTFZHWgnpQRFzxGjDdoyYU7o+MJiZvREllCmjInGyL9QmgJl3oijIcnI
 d5xvxikgXpu/uDJkS4P/dzamit5nd9nwiqGEiUTqUnDscCyqA8Er3Dl1jJ8LxCg1tbAgDCCIZsI
 cPAizpgRAx3inToZd4UWWwRNoqSLlz89mUSgXgl6u/HPOQePylDy/bZoODD3pzZjs9TfdesGZMl
 Q2/DnGBLB7XbAbwShzVcUMxcgtxydWWIAC75l7uLbpsB83l5zo/LViTgvixUqnKVwTjc+abEdG2
 mZI8xpsRTz5H0OB0NKbJ4/P1Rpcy0NtZqBoV5oYOmxdEniMU3VhVopf3W3VgcnaSqvcG09AVgYL
 I5GuSHjfkAa48OQHz9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OSBTYWx0ZWRfX8LGxR9WxOr0u
 umtOPMVFfbClqqbXzKRLXiQ+dmQbI0qUynzB5vGim4Ka88fTbf1BHSJFsZnN/3v+NRw6h7Y7W0H
 4H9swHNLcEAuBSDFBQTbZkPXwXuFpdY=
X-Proofpoint-GUID: TYeha_ot_BfLmZztrnZyfwIOWux1323v
X-Proofpoint-ORIG-GUID: TYeha_ot_BfLmZztrnZyfwIOWux1323v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290089

Hi,

On 29/06/26 16:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Array length mismatch between `assigned-clocks` and `assigned-clock-parents` in `&serdes_wiz2`.
> - [Low] Mismatch between node unit-address and 'reg' property in SerDes PHY links.
> - [Low] Dangling continuation backslash on the last item of a Makefile list immediately preceding a comment.
> --
>
> commit bc5648306dcc07a1bc8095cecaf3da3724e52d5d
> Author: Gokul Praveen <g-praveen@ti.com>
>
> arm64: dts: ti: k3-j784s4: Add overlay for dual port USXGMII+SGMII mode
>
> The CPSW9G instance of the CPSW Ethernet Switch supports SGMII and
> USXGMII mode with MAC Ports 1 and 2 of the instance, which are
> connected to ENET Expansion 1 and ENET Expansion 2 slots on
> the EVM respectively, through the Serdes2 instance of the SERDES.
> Enable CPSW9G MAC Ports 1 and 2 in fixed-link configuration
> SGMII and USXGMII mode at 1Gbps and 5 Gbps each.
>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
>> index 5269c9619b65c..72c91f8f7814d 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
> [ ... ]
>> @@ -337,7 +343,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>>   	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>>   	k3-j784s4-evm-quad-port-eth-exp1.dtb \
>>   	k3-j784s4-evm-usb0-type-a.dtb \
>> -	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
>> -
>> +	k3-j784s4-evm-usxgmii-exp1-exp2.dtb \
>> +	k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtb \
>> +	k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtb \
>>   # Enable support for device-tree overlays
>>   DTC_FLAGS := -@
> [Severity: Low]
> Does this trailing backslash escape the newline before the comment? Since
> Make processes continuations before comments, this merges the comment onto
> the dtb- line. If the comment is ever removed, DTC_FLAGS := -@ would be
> mistakenly pulled into the dtb- variable.
>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso
>> new file mode 100644
>> index 0000000000000..4ceb99c5c8088
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso
> [ ... ]
>> +&serdes_wiz2 {
>> +	assigned-clocks = <&k3_clks 406 6>,  <&k3_clks 406 5>;
>> +	status = "okay";
>> +};
> [Severity: Medium]
> Will this 2-element assigned-clocks array work correctly without overriding
> the assigned-clock-parents array as well? Since assigned-clock-parents has
> only 1 element in the base device tree, the clock framework evaluates
> num_parents based on that length and ignores the second clock here, leaving
> it unparented.
>
> [ ... ]

The clk 5 does not have a parent and only clk 6 does.

Hence, only one assigned-clock-parents is needed.

Also both clk 5 and clk 6 works considere which has been working

and tested.

>> +&serdes2 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	status = "okay";
>> +
>> +	assigned-clock-parents = <&k3_clks 406 5>,
>> +						 <&k3_clks 406 6>,
>> +						 <&k3_clks 406 5>;
>> +
>> +	serdes2_sgmii2_link: phy@1 {
>> +		reg = <2>;
>> +		cdns,num-lanes = <1>;
>> +		#phy-cells = <0>;
>> +		cdns,phy-type = <PHY_TYPE_SGMII>;
>> +		resets = <&serdes_wiz2 3>;
>> +	};
> [Severity: Low]
> Does this node name phy@1 violate the standard device tree schema when the
> reg property is set to 2? This mismatch will trigger a unit_address_vs_reg
> dtc compiler warning.

No , I dont think that matters at all, as the the cpsw driver does not 
relate the

reg property with the unit address.

>> +	serdes2_usxgmii_link: phy@0 {
>> +		reg = <3>;
>> +		cdns,num-lanes = <1>;
>> +		#phy-cells = <0>;
>> +		cdns,phy-type = <PHY_TYPE_USXGMII>;
>> +		resets = <&serdes_wiz2 4>;
>> +	};
> [Severity: Low]
> Similarly here, shouldn't the unit-address in phy@0 match the reg property
> of 3?

No , I dont think that matters at all, as the the cpsw driver does not 
relate the

reg property with the unit address.

>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso
>> new file mode 100644
>> index 0000000000000..ef4ebb5515469
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso
> [ ... ]
>> +&serdes_wiz2 {
>> +	assigned-clocks = <&k3_clks 406 6>,  <&k3_clks 406 5>;
>> +	status = "okay";
>> +};
> [Severity: Medium]
> Like in board1, will this assigned-clocks override fail to assign the second
> clock because it doesn't also update assigned-clock-parents to be a
> 2-element array?
>
> [ ... ]

The clk 5 does not have a parent and only clk 6 does.

Hence, only one assigned-clock-parents is needed.

Also both clk 5 and clk 6 works considere which has been working

and tested.

>> +	serdes2_sgmii2_link: phy@1 {
>> +		reg = <3>;
>> +		cdns,num-lanes = <1>;
>> +		#phy-cells = <0>;
>> +		cdns,phy-type = <PHY_TYPE_SGMII>;
>> +		resets = <&serdes_wiz2 4>;
>> +	};
> [Severity: Low]
> Does this unit-address phy@1 need to be updated to phy@3 to match the reg
> property?

No , I dont think that matters at all, as the the cpsw driver does not 
relate the

reg property with the unit address.

>> +	serdes2_usxgmii_link: phy@0 {
>> +		reg = <2>;
>> +		cdns,num-lanes = <1>;
>> +		#phy-cells = <0>;
>> +		cdns,phy-type = <PHY_TYPE_USXGMII>;
>> +		resets = <&serdes_wiz2 3>;
>> +	};
> [Severity: Low]
> Does this unit-address phy@0 need to be updated to phy@2 to match the reg
> property?
>
No , I dont think that matters at all, as the the cpsw driver does not 
relate the

reg property with the unit address.

Regards

Gokul Praveen

