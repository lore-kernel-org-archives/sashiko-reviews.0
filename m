Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C96175A7C;
	Wed,  1 Jul 2026 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899450; cv=fail; b=QJQ4aDD7zZ3kMLbNTPgLVjiD8b7hK2FqS8hlDrwk+WsWPJwn05JHlSk185eaYMq/BBBVc/PD3fr1QBBzmd2iAJMLRI8wuCcem5Cm28Mi5Al38fc733ezqhi2wfkaj7Nm+iJs+jTMRVYBnkJUvE7ppty0TmhkcBEE/5lb4rkWHoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899450; c=relaxed/simple;
	bh=B7vp9XRThA6hwhrtIj1zqOamFNHV9o46VxmkxapvEro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQpAkzdZ9wVMBBWhIeeVohr3/95GdMMXuHpkmjY57Hzha0nlNnAK9C+AqF5Hgu50k8YelfDghbUsOhV4S8d9q+gXqEmzymfBrlKLtrJHRkgZKEV/uFwg+7ADaG6AWCeH+Q3HjnEdTBBNT/awXdpkYqMcAv3mL+m75YAjMHs1qNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TtIo/Eih; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WcZJfQnW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TtIo/Eih";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WcZJfQnW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615Ga9I1082044;
	Wed, 1 Jul 2026 04:40:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xm90fcujNtRIL5HAeql7KQiiI6W1oYWvJbitZ8WpaFk=; b=
	TtIo/EihlkjcdtFHHoqEJyDitL+q9/2RJZVhqZ2DBt3n3+3T1QRneZJULGXZZ9QT
	qUwHvTGRnKrFSayo5vSpQdB/uoSE/okbJKnBI+magkxbXHL068xHqQX648WTdIKE
	6TuDaYRcGccT1+WeJG1OsFpxcc7gHQNDUHMYvrTwoZlXcklFvA3VQ9kg89TYbWQ5
	p4/sdI4uvZ3hsAZ6nprmBfiRreX6j90N+I7o3P77pT9O04WjHYUfAkNjZu1C70ui
	R60Hd/TIv+kXoh1RaW7QeeMVfgnL5lYcwv211f5J+43J0EAl1sTHSCLn4KJ4lJ4D
	/kH5url+cCRS9t40FR/n2A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020082.outbound.protection.outlook.com [52.101.61.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e679mes-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 04:40:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT57+MdUNWTy8P+rjWpPIKi3uZaJRFy3oFnK5BoOYjvtOEd+u6t5vEfzor+D0CkdsZ4FrfX08BQ41VvWZzGzociSTdamBg9Xr3v9qtzP9o12Y5OSD1ZdYddv6xkMzovHcUbj0oykXnJXlEa68xMOiZfJWqazmE0yU3aemdiBnx3cCTrSS9Piihgh2xaoH93krFqitAZoHxlimdJ164JwMsseISwI1TXnbbz/XeNsP2MPmToWT0KG1so2sDauUocHuc+hJqilVZ20XAypoPhiABsn0mJME81hAUvGJlewJwyDfKpMopwTczVg5Mi2RifBdV7rJjjYj4ibWv++56lOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm90fcujNtRIL5HAeql7KQiiI6W1oYWvJbitZ8WpaFk=;
 b=kGH2jjLRXCwhEdj6APklHObrYFhdhoZY5iC9F2iLsiCCKUbfpa9/WfCj8YJI8N3Oo5GHUXwLKSBeS9XsfUZWWo/c+cxrbhckuVCh4Q74vzONgSKCVNmLz8IuYwW9A6fm1nNYT81bPnCkPxS0dm9Fg9wKdSqMhdFHrKLKiZOELnXzTspyX2qZA+b57MYLjtUD3xWRIr/C/Wn6TBpIkkEjQmYaofb8EZzf4Dd3eiMck01qwhPc1y+SW2E3Uoi0yt112Xhnd/o3Geo1TXa+wtLWyeijxFvevcVAhjBGm3ZXibSw9Wsu1RJ95hiOINHJsghAD/GW0w/tVQ58V+hUp3rKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xm90fcujNtRIL5HAeql7KQiiI6W1oYWvJbitZ8WpaFk=;
 b=WcZJfQnW07pMZvW76o7DuZtLQbVbfXCCPdzsnER7SmeTwOxkDuCYcU5eHX3V6rAHThSnkJV0g5zOHAxOt/Xpy+4f1h4hC+whu+olC0Z6dFN5QzkuCjY3t7LQAkhJTNDAVANOkylDZuG+7g5ApSH8EFEbMM+vUGCwHdiAYNl9dZQ=
Received: from MW4PR04CA0146.namprd04.prod.outlook.com (2603:10b6:303:84::31)
 by IA0PPFE170FB303.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cd7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:38:48 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::35) by MW4PR04CA0146.outlook.office365.com
 (2603:10b6:303:84::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 09:38:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 09:38:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3A495406541;
	Wed,  1 Jul 2026 09:38:45 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2FC20820244;
	Wed,  1 Jul 2026 09:38:45 +0000 (UTC)
Message-ID: <dc5a1c0c-8c6b-4f4b-90f1-e9c83a8b91b8@opensource.cirrus.com>
Date: Wed, 1 Jul 2026 10:38:44 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] clk: cs2600: Add Fractional-N clock driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-3-rf@opensource.cirrus.com>
 <20260630161121.020FB1F000E9@smtp.kernel.org>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260630161121.020FB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|IA0PPFE170FB303:EE_
X-MS-Office365-Filtering-Correlation-Id: c6feff9a-664e-4a20-4027-08ded7548c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|23010399003|30052699003|82310400026|3023799007|6133799003|11063799006|56012099006|4143699003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QcIvftDjbCqjOx3n7q50GQrGqU4skAOEDtHpeyMlpgrDfOG6Io0gIQscuQQq6JDUAutPmROcGLDufk65Y2lDK8+gKIQ7mm5K0VF1fKetAkWX+RkzEoinqr7/88SNFlekVQgOb/uefb/E59GmIPgQCxxxLUpxtWrOhddFb4vsmlcodHxCVX6YBCZAcESsKe3EYwRLtWFZ5X5Yp/oa9Nkams80g0X+pPh1GqiAsjqwBZzrMv2mpzWuy3IvmQ1vpscAP2zxuR917bollLk4ouAI9lyIGe/YpW8RVVVxB4ThyQLIa2AmYIoRo5sqAgAX4J6Mcvk6ZN4J/jXtVZS6uFCxbHsY0OkY1sIkWE5Q+KBYj3096TqI5oBxzc1fkkHqW1mTwJllWL2C+vHcqpbD6dD1ZEdB5Lnj8vhotpF9zCR+Xb/gMDK59Iz6cp0XK4m3/DdM0ND4egm/ubAoG0hYD5+xzJewlCq/3JVqgIKmsDztMFiyFnncjSowcJxHoDFic5afAgcstn2YJ1yYIXKvZ/ptf3C2T7O2yMM9+OiU7UoKf/jpc3l/zcGEKXgawjbNo6onFsYNrTaaOc3EtOogmQ6NMUSxiWOApzlGlSZ8RCnh2c/3apx5nhaVcaW8L0BwvAZ5RHzlVfIFMKS4YLtuR5nCZtRlN+Sf434Eckf1YvU8epDkX5r+CDV/0bb5PuDjE/rmc+LAZ2FFoTxxi7XRVIiqxg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(23010399003)(30052699003)(82310400026)(3023799007)(6133799003)(11063799006)(56012099006)(4143699003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L6+Uv1VVj1UoLQgx2451DUNTwyZAF1LCie/2FYKKx2Eux7JZamcM+BQHhfXizCjMN4zF/Pg5NzwtRRAtiXVWj3xLoh7/lOmOML27QKNyEKem1jiWEjnogxK33iyQ4IPcRDojIPykuK8dGK6aw20lInDVKNdRa5MAWN2XI6eU75Ziwf7D0NNB3brtH1dZ+UlyBHhsEVsHCBgvwWYaO27306P53F5ocfCw5Wktv7sSpkfB9mbUZfI2Zba96Zp5I8nrbccFpiWybIwvM1u3urj5iwJYkH8SesNIDejZzLwYkOYn9jnFMSEA9vKBro9nhUlYHabgFu/qYjbcjaCLs8Y+cdzFKDWPOvyuSGOK5IdYZPNnmZhKTaunS1lTWEPg1d6D2Bq0ZSBiQ6NBTZhViNXvvJ7TuMUOp0LGGS7YEhtD9BkCVWYUkmYAmVpVQffYIhZN
X-Exchange-RoutingPolicyChecked:
	RDwFbdApGxlqOps8ui3JZadRoi0vLj9aYPQ+le84gY8xsxZq4EncnUOPsaGOGoF292vnCk7P7TFq9KmU2ja+YhtBmWszx4OrjQZGdlzjjC1bsA0SEsLbBQdILPISiFFqW4RAzXN8QXf0BWMzBa8uVSFJVDljMU3HSAwWJCHcfcATQlnEpp9mNFsmxQr/eb+IuaKJ7vNUOs6A3oI2NtXIMhEvHKGi6RPxNUozf1jsFdeRrbAuPGJ5zF0zaQysmIavB0g0EMcE2ApalARfP7m0M5HxTGQj7O7yYLtcoM31+grQ8MkrD+XWI4fM4UlG9G58E7I+2wzYqv0kGwui6WnTRg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:38:46.5924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6feff9a-664e-4a20-4027-08ded7548c96
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFE170FB303
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5OSBTYWx0ZWRfX612wG+Qem8mR
 hEjhhuRnkAofnFYJr04Zp8sTcC+h0GVLEYc61h/NHy9hM68DVIIm1ogq7lp7PQz865SqiOBo/8y
 PPvQNbh1XANQCv/jtnSwSnu5dQ86uHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5OSBTYWx0ZWRfX9N847SO2z5d2
 M1sI9RBW9TOfbRF+fYeSZ8L9itBFGpQi397gWg4Lufx43lvIva9ay6bX9jdnd+rZy1MICba4QoC
 6JRSM2BPEdrqZL+xhs4m7HFEpF8SwgCNTlUn5rdyL5Xzy/qWjUD6YSxujYVnbXbuwwgYZs/95OU
 o90KACXRwdc82T8rnEDBFCB2nb2TkoFM2oaV6okUHe13rkYDpHuyYAP6A/xdJFGX403YOx/YLnK
 IS0La267GbM15YiSyCyArPDJqIh1a1rMdNo5I3XMVanXiArL0m3l3xMs8MWPuK/fVSY4jwTBXak
 YN/HPwwb8G/fpoxxrjgwkidb3ZLmaQQo/0GVv2a+KWvHjD8+lvLPIE7YRABWNMegwlyGOGy6vDR
 WkRNzPTpEMWO16J5rrsg3iVOq865c9b5grs2wwj2E4exQnVg7tJDZWJNKOsxZr1B8kfrWGSBXcN
 t7d0uqURS+2dJuKMJ0w==
X-Proofpoint-ORIG-GUID: G3Sb83ciQWDiV3A5W55At565qOqOWUNv
X-Proofpoint-GUID: G3Sb83ciQWDiV3A5W55At565qOqOWUNv
X-Authority-Analysis: v=2.4 cv=PrSjqQM3 c=1 sm=1 tr=0 ts=6a44e07d cx=c_pps
 a=sUOy6JvimZSrMHJk9FBmuw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=-v6U1XVBQWWziGk-J-oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 30/06/2026 5:11 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [High] The `cs2600_unfreeze` guard uses inverted lock/unlock operations, leaving the device permanently frozen.
> - [High] Clock rates and dividers are updated without the necessary hardware freeze guard, risking clock glitches.
> - [High] Data race on statically defined `parent_names` array in `cs2600_clk_register`.
> - [High] The `cs2600_pll_out_recalc_rate` callback returns uninitialized software state instead of interrogating the hardware.
> - [High] Refcount underflow in `cs2600_pll_out_unprepare` due to early return in `cs2600_pll_out_prepare`.
> - [Medium] The `determine_rate` callbacks incorrectly return `-EINVAL` and emit log spam instead of rounding `req->rate`.
> - [Medium] Missing `clk_in` validation in smart mode leads to 0 parents, breaking rate calculation.
> --
> 

Gemini has found some real issues and some bogus stuff, which I've
commented on below.
I'll hold off on doing a V7 to fix the real issues, to give people
a chance to add other reviews.

> commit ce7a3c3019cf88623a644142e879bd585ca8f100
> Author: Paul Handrigan <paulha@opensource.cirrus.com>
> 
> clk: cs2600: Add Fractional-N clock driver
> 
> Add driver for the Cirrus Logic CS2600 fractional-N clock synthesizer
> and multiplier.
> 
>> diff --git a/drivers/clk/cirrus/clk-cs2600.c b/drivers/clk/cirrus/clk-cs2600.c
>> new file mode 100644
>> index 0000000000000..73937ac868fcd
>> --- /dev/null
>> +++ b/drivers/clk/cirrus/clk-cs2600.c
> 
> [ ... ]
> 
>> +static void cs2600_clear_freeze(struct cs2600 *cs2600)
>> +{
>> +	regmap_clear_bits(cs2600->regmap, CS2600_PLL_CFG2, CS2600_FREEZE_EN);
>> +}
>> +
>> +DEFINE_GUARD(cs2600_unfreeze, struct cs2600 *,
>> +	     cs2600_clear_freeze(_T), cs2600_set_freeze(_T))
> 
> [Severity: High]
> Are the lock and unlock operations inverted here?
> 

No, they are not. FREEZE_EN must be cleared to write protected bits and
set after they have been written.

> [ ... ]
> 
>> +static unsigned long cs2600_pll_out_recalc_rate(struct clk_hw *hw,
>> +						unsigned long parent_rate)
>> +{
>> +	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
>> +	struct cs2600 *cs2600 = clk_hw->priv;
>> +
>> +	if ((parent_rate == 0) || (cs2600->pll_target_rate == 0))
>> +		return 0;
>> +
>> +	if (parent_rate == cs2600->pll_parent_rate)
>> +		return cs2600->pll_target_rate;
>
> [Severity: High]
> Does this function need to interrogate the actual hardware state?

If the parent rate hasn't changed, the output rate hasn't changed.
This is to prevent multiple fractional->integer conversions causing
the set frequency to drift away from the best frequency.

> 
> During boot, the Common Clock Framework relies on recalc_rate to determine the
> active hardware rate. Because cs2600->pll_target_rate initializes to 0, this
> will report 0 Hz even if the bootloader previously configured and enabled the
> PLL.
> 
> Will this break downstream consumers that depend on inheriting the correct
> operational clock rate from the hardware?

The driver resets the CS2600 during probe.

> 
> [ ... ]
> 
>> +static int cs2600_pll_out_set_rate(struct clk_hw *hw, unsigned long rate,
>> +				   unsigned long parent_rate)
>> +{
>> +	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
>> +	struct regmap *regmap = clk_hw->priv->regmap;
>> +	struct cs2600 *cs2600 = clk_hw->priv;
>> +	unsigned int ratio, smart_s_ratio;
>> +	bool hi_res;
>> +	int ret;
>> +
>> +	ret = cs2600_calc_ratio(cs2600, rate, parent_rate, &ratio, &hi_res);
> 
> [Severity: High]
> Should this function acquire the unfreeze guard before modifying the ratio
> registers?

No, FREEZE_EN doesn't affect the ratio registers.

> 
> This function performs multiple 16-bit regmap_write operations to update a
> 32-bit ratio. Without suspending the hardware state machine during these
> updates, the chip might briefly operate with a corrupted 32-bit ratio
> (half old, half new).
> 
> Could this missing guard cause clock glitches, frequency spikes, or a
> temporary loss of lock?

It's a PLL. The output frequency will drift to the new frequency, and
this can be preferable to a hard switch.
However, I will double-check with hardware people whether we should
enforce that the clock is stopped around a ratio change instead of

> 
> [ ... ]
> 
>> +static int cs2600_pll_out_prepare(struct clk_hw *hw)
>> +{
>> +	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
>> +	struct regmap *regmap = clk_hw->priv->regmap;
>> +	struct cs2600 *cs2600 = clk_hw->priv;
>> +	int ret;
>> +
>> +	ret = regmap_test_bits(regmap, CS2600_PLL_CFG1, CS2600_PLL_EN1);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (ret)
>> +		return 0;
> 
> [Severity: High]
> Will this early return cause a refcount underflow later?

This quick exit is something in V5 I hadn't noticed, and it's a bit
strange. This test should always return false.

> 
> [ ... ]
> 
>> +static int cs2600_bclk_determine_rate(struct clk_hw *hw,
>> +				      struct clk_rate_request *req)
>> +{
>> +	struct cs2600_clk_hw *clk_hw = hw_to_cs2600_clk(hw);
>> +	struct cs2600 *cs2600 = clk_hw->priv;
>> +
>> +	if (req->rate > CS2600_BCLK_OUT_MAX ||
>> +	    req->rate < CS2600_BCLK_OUT_MIN) {
>> +		dev_err(cs2600->dev, "Invalid bclk rate %lu", req->rate);
>> +		return -EINVAL;
>> +	}
> 
> [Severity: Medium]
> Should this callback adjust req->rate to the closest supported frequency
> instead of returning -EINVAL?

Nope, there's no way that this driver can determine what an appropriate
parent rate would be. The parent rate is likely clocking some hardware
via CLK_OUT and we can't arbitrarily change that rate.

> [ ... ]
> 
>> +static int cs2600_clk_register(struct cs2600 *cs2600)
>> +{
>> +	static const char *parent_names[2];
> 
> [Severity: High]
> Is it safe to share this static array across all driver instances without
> synchronization?

Valid. This static should not be here.
This is a bug inherited from V5 that had not been picked up by any
automated or manual code reviews until Gemini took a look.

> [ ... ]
> 
>> +	/* ref_clk_in is only a parent option in manual mode */
>> +	if (!cs2600_is_smart_mode(cs2600))
>> +		parent_names[input_num++] = __clk_get_name(cs2600->ref_clk);
>> +
>> +	if (cs2600->clk_in)
>> +		parent_names[input_num++] = __clk_get_name(cs2600->clk_in);
>> +
>> +	init[CS2600_PLL_OUT].parent_names = parent_names;
>> +	init[CS2600_PLL_OUT].num_parents = input_num;
> 
> [Severity: Medium]
> What happens if clk_in is NULL when the device operates in smart mode?

Yes, this is a bug.
