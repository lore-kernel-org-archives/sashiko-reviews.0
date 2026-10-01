Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5E44064E;
	Thu,  1 Oct 2026 05:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833961; cv=fail; b=NTFy9WLycHEW9f1WrY9sHZl5ezdt4pJ73YNIdf6+pdlYAmVGv7ZqFgEamcwRW1oPAsHD1ESNcMQ+r3y1+o3gR0urSZFxt/yXUVJFiFpfDay5yuwPg8P5TswYMlERyOAyLcDc+AIyv9inMs20RxGUrhyK38bZ1FcR9Fc28V5eLIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833961; c=relaxed/simple;
	bh=3G0ID6YO6HnVlUbG+s1Ac4Na8yT00lJmbLPDPo1r8ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JqJQ0rYy8Qsw2dK9nXjH4pS/Di9tsxat4q0lQKaEHwpLaLWOr/AjMB0D1UOfHkEYHYCj6MFF4IYPTfkEuyap4mJL/KhgKO1Eeq3k51FfaPWvZW5CLEHM82QNLV2UV7L5tZZnVbuOTLeZvotp+zTVeRhDzSGBC63BNYPLpRVv+5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MVk+o+8J; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=QlaQUhd7; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MVk+o+8J";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="QlaQUhd7"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gZXo411050;
	Thu, 1 Oct 2026 00:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=SUBBtG9XLOFueydiVa9hxGxK9jtDQkuQu/H5fpJiS
	eo=; b=MVk+o+8J69CZA7ZnOUDp9DLxtq+zdSpk3oGDtQd2RX2ZCoeYa1BHV6U93
	twzG6lKL2FIMnRO7FXJyicfAQv76bXYpBVo8r0cQfiin6NOAZX/UUts1LbSMNaMf
	FDMtaLrGLmt5fV+ubCiNf+aO2HOs3pcfH8+3+LCCAsGQ9WJFgyR7THQ8juCiMJD9
	Nm9Q6Zd0j0lWiPg0IVG5pH2j3vLGbuEvL2QbCCkamYd7jN3j3uERgfHguJE6i2f9
	LlwQc7BLkWtkFoZCmjGflap62Mk6usIqvhlNaGG42QCAWOcOj+YK9G2YMInPOzZS
	+PYHWgxiAd2WGLelSRZau6foPUbkw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17dju8ew-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 00:52:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2issyRhpTES9dfaZSy8fmtKbV/41sJppy86csZk1IoheG0/XBGf8rPfcGbu27stVMSPNDOtAkpEkIP+NjJVTQwS0V1etwR+Cho4EbXQlywNj1Epxi9ihVPGAnSBKFkcDttBWq/us+ofK0wnToTq273yHm6T3sV2cxUAZKn2cBu7UylFTNq16VFEiCIdKXvg4xQUzreUDCKD5NiQuIJK0aNDCOoo3//fVuG6ijSv/ZdzyErsivyZLbMyT/TKaMjx5jMX3OqPsb9vtR7LX/HDPUNgqf8hnctbq2CKOzG4czH/A5OWB9l3/wGLtPPCffPHkZpKigi36EmNDCgf8HaCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUBBtG9XLOFueydiVa9hxGxK9jtDQkuQu/H5fpJiSeo=;
 b=ZaoSmENBRK4+z8SKsYyz4HY2GsOjx2t1+xGxsfwD0R9pfqbZsYfFwErMSkL11g8YH/1u38Cco/U8m6xXWosQ9UxVmUFU3PEA7jIAARdrapkvVR1IH4m5mxzCY4C3wXP+RnJJV23cwGVl0W66aT5KyB3VgM8I4wREqpuFxNXmyo0D+e3cgthqtdiivechZ7pahp7FTPKFdp5YikGtI69YYwyqqkvbB923DaHm29jrIxTSxG8MpxYm6V6Hk+bIR7g3Y2oGYDiPvgrL6Yp+AmMgSDVjz7Oi8T39wYojbVo+YnJyXFsqRRq746FG2Yii4nLZoz5mYbeb/nMkkduF/2UVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUBBtG9XLOFueydiVa9hxGxK9jtDQkuQu/H5fpJiSeo=;
 b=QlaQUhd7R6ausM4OKaWdCQ4qbjbnmfsF6MgCzqvTJL7Mjwwg1l7jShjtrvgf7HlCPNm1O/3BK+pHcEFAJy7S984BOtfjos5qdyxhq+voqeuvnAWWWix459fn6mpyeGNlzCJO+cesA/NZ33REkR7o2yR4+bH8C855IV4CJ1hlmW0=
Received: from CH5PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:1f1::25)
 by PH7PR10MB5722.namprd10.prod.outlook.com (2603:10b6:510:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Thu, 1 Oct 2026
 05:52:29 +0000
Received: from LV8PEPF00000059.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::49) by CH5PR03CA0007.outlook.office365.com
 (2603:10b6:610:1f1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 05:52:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 LV8PEPF00000059.mail.protection.outlook.com (10.167.245.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 05:52:28 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 00:52:27 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 00:52:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 00:52:27 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6915qPkY1316889;
	Thu, 1 Oct 2026 00:52:26 -0500
Message-ID: <3f168454-81eb-4896-8630-f993e8ad4e9d@ti.com>
Date: Thu, 1 Oct 2026 11:22:24 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: ti,secure-proxy: Add TDA54
 variant compatible
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
References: <20260930172948.2901336-1-b-padhi@ti.com>
 <20260930172948.2901336-2-b-padhi@ti.com>
 <20260930174206.428061F00899@smtp.kernel.org>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20260930174206.428061F00899@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000059:EE_|PH7PR10MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7573a6-883a-44eb-28b9-08df1f802d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|4143699003|10067099003|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VvORvhvvRZ6yQ1G7QWVXhWzvNwMriAsHWt8/Gb7DeoJ+U4PHSAbfSg7Z4dF/AO8Clza+MN2oO7pGVIHhVQXNo69jYAmWR10oj/s7e+qbcTG0mDYAFXysrLupvjKZHInq8CqNjWC6oxA5iByT/lpCwXSX0ou8m9OKTkxqzvGtIO2sPYahjyd7NFCrbXXY3KLYHTYIpyQ1wuNvN011YxSqkd3kfZd12yvWeM6XrJM3NHngiplVrVMpRohzZDEZB/HKMevHm0d37hiN9Z5n89FjzHBQLvQA3ROj5S/t7skQLqZTkwINkhr8Hh+6ByzTl7UInZd/nx0uqFpOVRHuk7OcliZWAEFtqFA3Yzn0KMDS+kGYR8/7JoXrhnLRO//5tsZnBOGdcMoksVHoA0S/yOcucrYcmKakU6BvRPJ/khe3J3VE2eKZFujk7x9W0vGe582lw02WQh/i2mULtljhmJ4j+S4xdMMhTvbSb9PncuVKzR7NW3M9UHqqyDeqxOiqPwWiLATv3G7ZNlmV6UrWzZsZMXi5qL2Ck7nlfxigz5JvB4dVPP1xiq+mnnhCAaRZ2qZLnTXmOiYM5K/l9WR/V2pbH3QlUQeG5PX6Qy4suAO2kI0vMkF458gUYNEVFP2tyZ8xHLQjJPXihzLI4dQzCuTODjLWqlSbdzYCVzzl4ZDQ2a9NqBXZq4vq0K/fnCzpWmQNuEIYwnbHM4A/OVuzXrdgnA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(4143699003)(10067099003)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wHtOfoDgIw1CxqkTM3A17bGb86xsOm4s4D2JU586IeJZ9WFk701/bAAJVKvLnU2qGMnCQwgxaBT63yGqs+oKLjiDlWuEtLDS6tySeL2lwjKTyL9WtRv8Y5S7FLTy/WYh2dbe4Hj+lqzm/UqgIYRPy1B4x+0FQNfLmhhWmGgVdA0IUoXqO73rBfgNet9KUsvLl/Hf+oia2p/o/4ol01vH4SPtWpExmiJhEe9F4w6GApH7gn8NLKHjL6uJYVg5Q3K5Bayetd4vs9jTIissFP+YSErczqDgamGpsG6QiHNBnyGRcDye8ZZefC5FrE6Fm88+s8rERnI1MF6+JZwIj3BvbJ6xlLozam4O9OdDxoo0hPWCCLMA+93kVxaKQlEw9o8Jhd+qx/AD1BygwbcD4t61scHOZymfnxEEmfnxEuW4hbGCU6gnXAa3YwA1VoAZZkzo
X-Exchange-RoutingPolicyChecked:
	Tecy7u/T0D1eQv+/fnHzIqAWndqifLD4E8jtWR73xQoxceDCXrraY945Fh/ZNiWoNY2alqFd9Bmwc7XgRPJF4qNjOCfiTzAegY6kIesHWI9Ui6FkErhPX5i2aP14owhdkwqHNmKYO7r6bB5XDhXUYAnDle5Lx1PAnPeZZwoAEfOVjz8bsPCYVkRg6wAe5SN93ruthmtu2E1+PBYIAPGE1elgo7ajiwUkTXVHmu5+9M1zSsQB49zZwNdgRyO6IjcyyALIS2LvwNyC7VfJOr+ClbtKG+HBdwS6SSHCMxD/hoVfaPFpBH6l8eM+twlaGUJSpgzEcy09KKqXRChdrKpLmw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 05:52:28.7232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7573a6-883a-44eb-28b9-08df1f802d6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000059.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5722
X-Proofpoint-GUID: DxBvyDcHx6k59Mti7XZFF1-qBi8z0c7B
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abdf521 cx=c_pps
 a=+TgAdn5i6nn1e/5/V9fTSg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=N8v2ItizDwCvTsHp2JIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DxBvyDcHx6k59Mti7XZFF1-qBi8z0c7B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMyBTYWx0ZWRfXzcHGp1i3QPxF
 GVTG3QbjdJHxhl3vbZ8RNGhEC66f0RvGjIYaG6zQ7VZOQ4gCTeDMcp/4hkz2BScxhJTfkfmPXW/
 1lzV5tHwXnUG/vH2JfcGvIiNN6icAYk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMyBTYWx0ZWRfX70M6ZfrtYQCk
 5ccsI/0Ycu5XGPBeO8He8lHNPF0JvHqQJWBGBMBIxU4HtxaC+oaUzxCyNKGrT8CojiIO+SBFa59
 OxRhy8Lboi0zsdB/ZZVBF6GtFi20HS0ZQM1Ri36DpzlA5r+I4PEjD3WDcxeT3a1PoH3IG/EotZ0
 jpfuzItYCWLsdurZVOmOgvh1UWBWJX1PsI2srLbe/Yu/Vci9Pg7sxpbJrhKKSymRAqjQe0ini6l
 Uvg7efbbOBVDRClAySDZ+HH873TYT9R9jeirPhlZrq8eLrFtOVFyyl+9rMJSm4AAVAoW9JaXQ2j
 ogJOMZpHnxcW9TgXMicMGvreduSQJTJTAn8caUda+udkG76ShcWHvIOKlz7PcwJB08KR5R2r2AF
 dHpf3a+MGrTZ3HxAtCzBHaY83dPrkQgtWQeAQm9ObflldoqCJfyDDUkt7u0nkuL+tJxz+kg0rQo
 AkwLG4q1pntBUwzUaqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010023


On 9/30/2026 11:12 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: mailbox: ti,secure-proxy: interrupt maxItems limits TDA54 threads
> --
>
> commit 462da78495412d18a7d7ecfb35e5147704655806
> Author: Beleswar Padhi <b-padhi@ti.com>
>
> dt-bindings: mailbox: ti,secure-proxy: Add TDA54 variant compatible
>
> This commit adds the ti,tda54-main-secure-proxy compatible to the Texas
> Instruments secure proxy mailbox controller binding. The new TDA54 variant
> features up to 444 threads with 60-byte messages per thread.
>
>> diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
>> index c321b69f0ccd3..525266953c974 100644
>> --- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
>> @@ -22,7 +22,9 @@ properties:
>>       pattern: "^mailbox@[0-9a-f]+$"
>>   
>>     compatible:
>> -    const: ti,am654-secure-proxy
>> +    enum:
>> +      - ti,am654-secure-proxy
>> +      - ti,tda54-main-secure-proxy
> [Severity: Low]
> Does the addition of this compatible require updating the maximum number of
> allowed interrupts in the schema?


No.

>
> The commit message notes that the TDA54 hardware supports up to 444 threads.
> However, the existing properties limit both interrupts and interrupt-names
> to a maximum of 100 items:


The hardware has 444 threads for different clients. Linux/HLOS being 1 
client uses
1 thread and therefore 1 interrupt.

>
>    interrupt-names:
>      minItems: 1
>      maxItems: 100
>
>    interrupts:
>      minItems: 1
>      maxItems: 100
>
> If a device tree for the new variant specifies more than 100 receive
> interrupts, won't it fail schema validation?


Not going to happen.

Thanks,
Beleswar

