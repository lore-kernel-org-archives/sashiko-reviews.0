Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E4D1F4181;
	Mon,  3 Aug 2026 22:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795229; cv=fail; b=BpuDBm6WCIZNRyZFXhyMNhsZRadI28mwc+J05o2nS6IKxnYXJhKx4qgkL1PzMyB/9EMWk7+bcMcEctW6oEffY5mfoX1Quc+IVuhlv4AlsDkqOzfQKGSesWAX5QSx9Y4VZy5929n793ZM4Gpd4DDaeE8LLJq8GA3HQW3Pd1xFs24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795229; c=relaxed/simple;
	bh=+X4mw8DGoqEGetnF702cAXOHKdgLb5tz7hRcBn9jww8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XHCZnQ7FzrsE3UGs5eYHLlNrl/W4OgZz8+3ORDSUuUjw0OtD7tkNIP1RPtYnohyq2Wf71sbKu7ZqY9A+Uby8Cmk2ktq7T//3XY2Pa62qhVHyEAgLdwUzHAywrEPkzTmCslFSmDz/5bb8PicOEeQazOD18gGvgbN+9+qiWoxaeLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=iQX8bEoa; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y0g9siz/; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="iQX8bEoa";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y0g9siz/"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 673Jj6r0565178;
	Mon, 3 Aug 2026 17:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OwensRbZArty6+1Cm21Wu4OoCNkmGJCBDrk4tTa6k
	dg=; b=iQX8bEoaAIEoWHki1bv6H1wFE+uHlEokXjohqTHG4icGvnYkH14dfTZdt
	MhjgOOBJyidaiQJ3GVmmcTgsLEgFcSDf3wB6zN9P/jgdl55sM1eFYM33U9KAu7Y7
	jMj/OLokq85PyhqVBP3o2b15ZaPJFA0fQW7YTKVclsp1qSBj/3ggQbZaAeY2BqqT
	hJceuN5aWSSq43pXnYLY/b3f7POPvPDqELilK4kbeZftA/iaqKSOP8G2GzmtW/s3
	/lgoiYfbO/yxav4J/mJYXTfq0HmeFLuxxWYvFYel5tLhH1bWqJMCc9rUq3/cGBkJ
	M527twjnALkzCLBo+I4JcCINy3zng==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ftsxpn4eq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 17:13:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg5iGqGVg2Cm0F0LjmVI24rGQx7UTr0J1NTOqeH3NY1nzCagAdMRVFcRF53v6e8HBeKITU4PN5fZbkZfr/Ie8rv/D9pR2/j63rmTnSLbukHIrq+/AtkgJMtCUGukVagzuAlj+piHXSy+cT1vaL22ToVypj13dBbZ1RRi8UHLVxHeomxYdSf7vabIZbbEX2G/6pcWKIj8EFzfTMKzmvYDZyx02clEJGudQQLKhlqkpF5M7bAbdcIpRrGUe/E3Y+YUbsOq5F7782+JXH+COm0rsSzSmk0S9Ghml/POOzPaliOiD6YahNuqKIJF3z0kg+I5N3A3+iFmlZ8tNavky8y1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwensRbZArty6+1Cm21Wu4OoCNkmGJCBDrk4tTa6kdg=;
 b=CQe3RhDeF102SBVsnzTK7Y2baH0VmFSDvmK8ElWUaZQtm4504QttiVDgDJcQZAPTWWEIWqNoZocDCWIMddn4PFFQhfp4XiyCMjrPjV0pvATUs4UoHh/CTtFjiR1qG2kLisCiMqq4mjS2a4Suhozx3en58nJzgtmI7Rd2iFBOVpXmXobrd75exLIrwx9yFBa62QCZSrE8NEqD5UMjSJ2kH56DIsEIJnXywRSbqCdUA4A4ONJkKElFRv/rkvcd3qnv8uqm7lWxoG7AGRqU8NI5ndyMf72Afb8+Vp9x2mA8LliypKpbHEubOdBc6AyjK3AMBvk8ocE49ufcMNGdMH9vHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwensRbZArty6+1Cm21Wu4OoCNkmGJCBDrk4tTa6kdg=;
 b=Y0g9siz/1h8UUIKf69DCxJMxDD8lr26rC8gos3DGjo/S1DWN9PEBK1Xkt64dfCasfc0cvkPWjSlpv+fqmuyU3XmUA5si4shVeoTrTL/M/6PX5FTG/t2J+TaXUhXG8uh0WHf8rS5ICRTzteRXZXSTEUk5YRhedT+U0/bGndR7eTc=
Received: from CH0PR07CA0016.namprd07.prod.outlook.com (2603:10b6:610:32::21)
 by IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 22:13:38 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::6c) by CH0PR07CA0016.outlook.office365.com
 (2603:10b6:610:32::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:13:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 22:13:37 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 17:13:36 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 17:13:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 3 Aug 2026 17:13:36 -0500
Received: from [10.249.34.24] ([10.249.34.24])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 673MDZSd3248171;
	Mon, 3 Aug 2026 17:13:35 -0500
Message-ID: <bd89123c-b181-44bd-82d4-5287d1014bd2@ti.com>
Date: Mon, 3 Aug 2026 17:13:35 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT
To: <sashiko-reviews@lists.linux.dev>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <20260729195958.671147-1-jm@ti.com>
 <20260729195958.671147-4-jm@ti.com>
 <20260729200807.98B3D1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20260729200807.98B3D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|IA1PR10MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 8282b615-ea1e-48b0-7e87-08def1ac7765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|18002099003|22082099003|4143699003|3023799007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1MU6PDZEdutFjSmE2z/3aJVX/giemjLJFUsGN//EA2yyNDuoZ9ZKAFxt5OnwkeH2r4QqeCFH8aXNH6D/JE3uNoFJrOz+/4lI0jWynte7L8NztcePInOyRJ3Tkafx0a4WVjCAeB/P1vI6YiawrONUfnyRah0Ulfn1PsBrEka39wyTeLwZ6VxR1e4y6BdaMZC/QV+L7K9xLmAv69QK6RwKVIn+RncJTFRW752qUcZC9Sq8xs68llQg4Un0jiY3xo5Ugk+iO+Yc7g0v0+KhjI42J8GLZqKHDmVLzkN/HV9yQ1RMX63yTKr75+SDJU7cNUWy6RWMoiNro4n7RMKDydEuolM308CWd//oN4mF2OdoA1ekq9maCo3dWCk7GHtUNo4kIPEiyR/n4Ge8UV4Mg1pixH1ogrhZ75QM0CrV+z0dp03hZw2uLm1gF/5C1rlhyst2B5j4t27MwwKUKrnw8kUs0cm0g94Fqi8lHHkY1UmQGL7cmKRgIJQTy/N53CVmz3AaGUbjX7ZVOXNd91Vy42L+XQvzQa9I3Ue9bs+Ha2DsrHAe1rkmCIAxf3VLbqv6o9wXHmDEhcyM/N78AkVdSM6RmCeq4yyFDqXVlghdsX4+OPZGBQX65ccX5KRt/X/z54fM2SwWt9KpdzJZbbC0F8kgSHcKXRdAKW1ZKPXq1B1jS0YWcwtR8y1FX0SLm7POO7SlDHn4eNdqccrTDobox+d8Vg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(3023799007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/SyWC7Zdh2QsV6WWzkbWDat8RGSu42gF5mNy06zfiG4oX3MDW2viI6L6309IGioSKmOFH/KbQPhHsCyytWWpUlNhVwxkQqQvQley3nhqDAeATf5xdAfYYW0cmPUVS4K0xVUZqtXPCEyWqx+a739stpBu5w+p6iBNugIV5xwHY8fISHrYm2nku90ZLbo3ITbzSKBw/mZDbciVEUYO/QjJzae3S0V4VbHeVpOMyF/RdvDhuEjOEpjkIzHVFbF1F9thoK/FCbpqB43WqKru54q/Gk2DlnteZGejOJeLc6VT585QaeqTyJNAOE3XzrU6JTeE38/1+Znjn/V4sloUDrwIqu4mBfvAvfLZUE1l3973Yl8viwfRbAFHagbpGHQ/czVKq0ZUVEXVeKg5sDYH6ALdH2NrlIUPiH8hDgGhrlj6Oyue0PE6MhmO2SQL9rbOm9kH
X-Exchange-RoutingPolicyChecked:
	C+dHp8xVmmbAK9hbblEx1Le6E8jZbBldMaynMeBh8PhGReglLuo4BnaFFVAiUfTa69DZgY0OFWnHN3CnjrhyePMXJ/njycYK2RnnMYoEXh0bLJtlgtKPRQAAmuRrUC7PwsHMJ7Ok/yC1xScUJhXMPVniJbh3h+RL0AfLaBjpjQlCqSmxMgCfm9n9tgLw7yF3greBr9CsqwpS02Jxj+LBLfzXjIWSwdIYSKnoh8kLR1K6KQAgU0qM/Udc+RnJwTgKGcejSJpmGqvrnXXkB3flrKbR/A4LMEaGVtzd96sWFQDKOcY0vp0798H7rc26YG/YTrI9vGk3lJ0aquoNVQbCkA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:13:37.1969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8282b615-ea1e-48b0-7e87-08def1ac7765
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7309
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE5NCBTYWx0ZWRfX84Y+g6fq0gKp
 0Nev+oUmEdqc7jrYRfWD0FQgJb1xIZiQNjlu/eQVJZu0vq+R4hViI+o64BhL0L2PMX8gQ9/dY21
 dleAJ9VjJiCCowkfhzR8pmEG5/boUveg7SD4AlmBpy0WndN81v1TU3xvcTVDZEZk97xTTc+mtfN
 wB0F1lyCgHDdG+b0Ek/EOwFxAn2Atogo/ZR1qzpHg7KCoce754oQ7ChGOnaEmYvkoAl75pLzl2g
 i/ffaTkTKSqGIpOrxjqPDfL3y281I55xwNoU+Bp6hbsD3f3fJDzkX4ylO0rOmWuI5YI82K7xQAQ
 8FbTY+qEQoXqbjOJWsYdIlCaFBPS21SxT39spk9U3VjXp1DGpDG31ZdduZD55SSfih39NF2im+P
 F7981jE8zlVnNUQCvtfuerg6oXn6oXgnv2i1FI/QS+S34nzr87C9NrQa0plUGW2V+GFWtsFZNkS
 7/nll7rYjojUU0sHg+w==
X-Authority-Analysis: v=2.4 cv=YaaNIQRf c=1 sm=1 tr=0 ts=6a711299 cx=c_pps
 a=awRqKgK+okXhs1gjjWqUCg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=vt_HHeVVYlU3oRR0hs8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Fz8seRNaw6bHoRtz7UFdlaO2qkxYIDjJ
X-Proofpoint-GUID: Fz8seRNaw6bHoRtz7UFdlaO2qkxYIDjJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE5NCBTYWx0ZWRfX6R1cE6gMldvg
 WibFTfJbdpVUkZ0BgSC4tep9uud+V1xvoQCOiCOJ2C+l1n6vk7SZ5/JgvC/VlBI5Qr4C2B7b1hL
 XALXBGWajTUPdAzglsgm8UkNeqIJXDw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030194

Hi all,

Responding to sashiko review.

On 7/29/2026 3:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the commit fails to apply the necessary AM62x SoC hardware constraint to several third-party device trees. While it correctly updates the TI SK and Beagle boards' MMC clock pins to `PIN_OUTPUT` to disable the receiver per the TRM (SPRUIV7), boards like the Toradex Verdin, PHYTEC phyCORE, TQ, and Variscite AM62x SOMs still incorrectly define MMC0/1/2 clock pins as `PIN_INPUT` or `PIN_INPUT_PULLDOWN`. As this is an underlying SoC requirement, all boards integrating the AM62x SoC must implement the correct pad configuration.
> --
> 
> --- Patch [3]: [PATCH 3/8] arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT ---
> commit 7601627985b20fa80186e314fd493c2b9a330fe1
> Author: Judith Mendez <jm@ti.com>
> 
> arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT
> 
> This commit updates the MMC clock pin configuration on various AM62x boards to
> use PIN_OUTPUT. This matches the TRM requirement to disable the receiver for
> these pins.
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
>> index dfd65c00f5b95..7fd508f4eddf1 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
>> @@ -86,7 +86,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
>>   		bootph-all;
>>   		pinctrl-single,pins = <
>>   			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (V3) MMC0_CMD */
>> -			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (Y1) MMC0_CLK */
>> +			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (Y1) MMC0_CLK */
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but while this updates the TI SK and
> Beagle boards to use PIN_OUTPUT for MMC clock pins, it looks like several
> third-party AM62x boards still define these pins as PIN_INPUT or
> PIN_INPUT_PULLDOWN.
> 
> For example:
> 
> arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi:pinctrl_sdhci0()
>      AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) MMC0_CLK  */
> 
> arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi:main_mmc0_pins_default()
>      AM62X_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB1) MMC0_CLK */
> 
> arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi:main_mmc1_pins_default()
>      AM62X_IOPAD(0x234, PIN_INPUT_PULLDOWN, 0) /* (B22) MMC1_CLK */
> 
> arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:main_mmc0_pins_default()
>      AM62AX_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB7) MMC0_CLK */
> 
> arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi:main_mmc0_pins()
>      AM62X_IOPAD(0x218, PIN_INPUT, 0)
> 
> Since this is an underlying AM62x SoC hardware requirement from the TRM, should
> these other device trees also be updated to prevent potential signal integrity
> issues and intermittent SD/eMMC I/O failures?

As far as I know, this issue is more of a documentation fix and does not
prevent potential signal integrity issues.

~ Judith

> 

