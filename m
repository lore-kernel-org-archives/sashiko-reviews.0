Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F13DA5AF;
	Tue,  1 Sep 2026 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279083; cv=fail; b=Rsr6pLz5BVK7c51fNPeV+Wz4bioLvs5gFOevuVap45Xpzjr3FkBJqXkILqrFxCYUKh20AzeS+FpHdiJoi7DbrSwKGWLrQL/t3IA7yjr9lB/zawVuyvRYlAmSgWy7uKtn9mFx/cuMjM7523inAAXzVGAUwKSqCJGFayf1LAjwTK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279083; c=relaxed/simple;
	bh=ruvSx0sH0ktBJYAL2h9mH5eOKmHnIyJSTu8Apt9WAQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CO/ND4Dj0Az70LbGZOUt0lNQpPpcNufaMwRyZapywrmfEtWF/1UUxqGXI3BRdSxnr2pljg6h66VYIzMMc3yaQJeuaP6qY1ZHTD7unNII7ZL5+EE7bCAqD2FBCFJBu8QkfwPP964zG9vMcUYcZWssTbPCr6XTjwKrwIeIpz6rSdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YOBX7Io5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hA4SxohG; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YOBX7Io5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hA4SxohG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681EMbND3139182;
	Tue, 1 Sep 2026 11:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MXYM11KpN4+3NOjOfVq+0NBJaXcW14wWDW3tJnW+NjM=; b=
	YOBX7Io5b/IUxuQR5nveI+kc3yKZ0WbAqrbm9OyNR9NDkc9ROOslYRwi719CEyG3
	uXHAJfdEVtkjysAJhUlBF9Aa19lr5oP/BfX7sPicDHTV2zeplBYzxe97gNGHgNrF
	PNE3+4XaN/4CiVUr9SZ6/V7wm0I7eouhjufYBsP3OWbg+Q1pUHKH3a45BthhZ94y
	cnvewpNTtwnoI+m6Eim0RwW78KIQBCwN6TkKtq3VKdOmtyGircy5gIgBCq7eCkbf
	/R+IloYSTeIfXdD0pXoYKGWh3VAKj68Fy//IY8gUeq8VHhUqzOJDhlxtWR+HZ01l
	NhBCUXRiiL3l2y8nxF0Ang==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021072.outbound.protection.outlook.com [52.101.57.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gduntgnyw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 11:11:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/BQ4YX/Sbcx1rPS7mpgbO47c6xCYdFijLtpQIUYKIXxFHGPSgTJIfNo47q/s5H/UTjtJe5uzfz9LuOM4/KDRQdP6gaw+BmNEqlpBLePeV5ZYx4CGxdw/q43rpRjapeSOqqIENKRzbbExmIk8FnT7p44yBX4taHAkkMt+ENcGp7UHtXsRqYt4fIY54upqf9oo+waoNXsg8IY+TPL77NoaMckgLQl8cguL2udS+Ap6A8LtU6ISPbOvqM3HbY9oF+9nyRhCC10T5/N58aDLrBVS/k+gWdENVkYYkMbZtBbAd0K2uwP9DFWvJT5/ich4tyfEUUf3sw4HF+lLps18+1HAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXYM11KpN4+3NOjOfVq+0NBJaXcW14wWDW3tJnW+NjM=;
 b=Q5ZUQjSgM+eqNMRPMGlhGfA7uabpey8WQWh9KOe9ngptEZv3JIaYzWoBdCRLpKGBCDKiQK+ZO67ygySb2whnR593nPAj+rhx9esJoIWPar6gaVb5OsY2Uebxs7EKT9eOCTtg+8A90pzWqlA+KcS6BSRDZTB9VMOrg6Y8c5UbCnffadjBD5+IZaTNvpAcvoEkzSsRySJhod/V2rWoldxnLwrWiX3XrFNi3judHZ1AiNYaX0xfN7A9G/cJnpL+jT2YW2n0viC++CmKNslv9cf70w5oX9EaZ4ZE8I3iOsVgOQGmMhZLGkrAO2h48f5LazvlbywrkcPHAnz4CfNzurEg1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXYM11KpN4+3NOjOfVq+0NBJaXcW14wWDW3tJnW+NjM=;
 b=hA4SxohGYbD88LHquOR/RMi4X+mBMcH8oHvIDDw45n0e6dmnUVVMAdd+KoruQG/s7xZnp9Y27BYfCWG7tQcomSD7wS5n12TLJq7lo02oRgR4YmLUgdnIfR514Eadu3o9TxhjwoI2NJSzfAQe49fNqc/cb4qfzSN8xX71u4e2jqU=
Received: from DS7PR07CA0020.namprd07.prod.outlook.com (2603:10b6:5:3af::12)
 by PH8PR19MB7166.namprd19.prod.outlook.com (2603:10b6:510:216::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 16:11:10 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::57) by DS7PR07CA0020.outlook.office365.com
 (2603:10b6:5:3af::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 16:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 16:11:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6D99C40654A;
	Tue,  1 Sep 2026 16:11:07 +0000 (UTC)
Received: from [141.131.156.184] (unknown [141.131.156.184])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8E4D0820247;
	Tue,  1 Sep 2026 16:11:06 +0000 (UTC)
Message-ID: <5dd66981-8b03-48f1-b8c0-90e391784257@opensource.cirrus.com>
Date: Tue, 1 Sep 2026 11:10:59 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] ASoC: cs35l45: Adds support for SYNC bus
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
 <20260828-sound-for-next-cs35l45-sync-v4-v5-2-fe3feba709ff@opensource.cirrus.com>
 <20260828155715.233751F000E9@smtp.kernel.org>
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <20260828155715.233751F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|PH8PR19MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 94872d75-a8d7-41ff-d6fb-08df0843a208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|23010399003|82310400026|376014|34020700016|4143699003|11063799006|10067099003|56012099006|16102099003|18002099003|22082099003|4076005;
X-Microsoft-Antispam-Message-Info:
	Odk0qQfw1THQeYB3IxknWUELk4C+jE0fY9prI7hz+JizDcMwml1mupxzJIBH6v3bfRxse1/oHwHmTqT2F38DPMjXfDUsNYTAzDBtfBisd5r0pdEwLIHlNulFXPGZsCcAoHnf+Pmgt8mTNDGxQyUoiBvRLYLdf/K3NXEvY7NDIT8EqzhR5e//06qinyg/0fTHhcTSYsuM+RJptz9NwK6gpW2vdNPJyaYsFMqJPwJE/S+lK6XERA7lqpgU5PSihsa3TJmAdngg0e0q4k+9T6wH1ro7aZfpKbe/1ilPwftiiB+Hyh+CrdvSh5DQxbC0kPqXpZyXSFaq/Mjki5jyyzp2py0osHAdhWMNtQttMMlHgfPcg9/SxXIiDb170Wo+7+E8dnsRUTZQKmqFkSPy7t7dh/VLTMuqkrpAsLcry7GFd/vbbfjXi6TltPZX84mRsDAI9WQGaBga70mgzIJMAiLqzB931qKvMLFFaNk30rpsQmc8DZufnXljaxSMAnsUBHwNopDhg8XLQwobnagHBZ0AccTiHn+/TDoS8IfRshUZWqEb+91xdrHheOvH3Yf2Qw+xC5WfWMkH5+dELFAWSU7JF17bQEDAdGQZx1FUec9W0UqPmleyOFaABUg4xgcG4+DKFsmmAWcvbmjYCEdzCV7z6LXxu4rIr3bewSxd4t4fiDXdsvO5qVLtbZ7fUwsGUAHpOUsUtycanmDcNatCZK9Uh4xpPz09RwMmVGIpDDEhGnmjkbG4BEOjMiPd1pxtoF3C
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(23010399003)(82310400026)(376014)(34020700016)(4143699003)(11063799006)(10067099003)(56012099006)(16102099003)(18002099003)(22082099003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JIDFrKE9+XQLRn6SRvSKbAInjvwT0Q36LQlev3VjkYj54lL3f9hqhnlw55hB7xy4CuzzZCJ64T7os5LCoEU6ewPexM7I1Y4lK/bbx7xbOywakzUuBkBBrsfQgSfmCLy94ShW4N+41+yw7z0JgxddCzL5N8QA6d5WRxqZVhnJVeRiSvtaIz0sWFlbT8ajtfjHgL14h+YqmbmaSYFudj6tD32DOLBp72ObFy1uDA3iHgXM9GyyqleFpxuH08Z5E1j3DnT9f7jmfwGfuEip/PzcBueKOlX/NlvoiwRmqtJRCCaxRVBuGGhgiKgzjyLNOOTbi3HJdzp0iEtZiYCkpBkYFXhQmWQn8cQCtQ/PWDkJa5oixMyZnkUSCmaIpS/2ytmnyaOQdpZ/rLpGtPewhZGBuh2GyWsd12vxKLM63CKJDe4RJ5Cv62dL5rpDuG0F7+uF
X-Exchange-RoutingPolicyChecked:
	4zXKXS6cGMpStlfzys9aelYTLInttDvQTPL9lVkOG3j2Sh0+gFlmVFEdO3ZhWI9iBn0ta+hcxyEv69ntPOmfXbuZRG4kWAcJmJ6KZVHFPABqNFPxqema88JDZxl0iI4eO+G0WmeI2QgbbsALeN+2kh/MEcQCXlWXksK9YL4WoBOxOAyEpde1n4O8eLBNFwIpgCFVDw1wzlRXHiZ2poqt0xmIAfVj890/pzEptfAsbEJ30o1P8jOhYO8Pode4Ov272tA8e1EnyIEfvWDjAcKQ3aaDZOwTkeVRj1ApzPqo7wQG+4o3UPiu3B5agmDhzVqLwieahuIcX8RmD7GxT7UcbQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 16:11:08.2086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94872d75-a8d7-41ff-d6fb-08df0843a208
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7166
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MyBTYWx0ZWRfX3SxgOIgG/Rsc
 0Y2m67st+GueznTPO/g12PdNKkbJ8mKNA/gyWlgRprAiyC1jOt4Mm8hdJuUxwhodMV7RUuF97jL
 8t+VTR09X7vYnAltCQy2KJu4vLFhQleEADvynpsUGRS68vncw9BZbEuF3JrBPa8q4yIwVlAyzCp
 W39IsDUK7UyNbCOFLbG8l0ynWdVfV655m4uaSlGzKw5DpbijQlcrrs8OqFgfIHjijIiShLZ2PXK
 qK/bm028FNAFGKqbU2m1X22qPttLLvi/8o24h3l9D5Hw/KTJ+EoR9pmAeICi05uFbF290/XUOqJ
 6vgC1IhK4lwCn8LBOed2TcY3HvEvZoKpMHhZVhHjdufzGnIDpvJbCJdE9LnxxX/xNA9LrnBh59w
 gcBSRDCAnoJwTeHgFV8zF6MLt/vZCxH+3sPM+oHdVkSEacoyNhGkgZvzNJViNluDVj2tFwQVHpn
 UmA0OaOmy50Vx4wh0qg==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a96f926 cx=c_pps
 a=Tmenz91GMLKLa+Z4vsoKoQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=WZT3RY53rtRZdRUujCAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MyBTYWx0ZWRfX89NF9UmLotJ1
 wZjjw8YjY7FouugLv0mt3s0p5jZEaFw9XDbFjatepRh6pAwsh0i6yG+/8VNi5sg+rz9Au1KQPft
 pYDpopAlNcfCumHZ3cpM+SJZqP3ze2Q=
X-Proofpoint-ORIG-GUID: g3MFCamI9YYDpKAROEHVykkdDEGHgie6
X-Proofpoint-GUID: g3MFCamI9YYDpKAROEHVykkdDEGHgie6
X-Proofpoint-Spam-Reason: safe

Mark,

On 8/28/26 10:57 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Hardware I/O errors in cs35l45_sync_en_put cause permanent state desynchronization.
> --
> 
> commit 81445881eb3cef5b79a02d7516346532c3f3f907
> Author: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> ASoC: cs35l45: Adds support for SYNC bus
> 
> Adds support for the multidevice synchronization (SYNC) bus. The SYNC
> bus is an opaque one wire bus that is shared between Cirrus devices.
> 
>> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
>> index a032bb23b4ac7..763cd83b5d6d8 100644
>> --- a/sound/soc/codecs/cs35l45.c
>> +++ b/sound/soc/codecs/cs35l45.c
> [ ... ]
>> @@ -195,6 +196,46 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
> [ ... ]
>> +static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
>> +				      struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct cs35l45_private *cs35l45 =
>> +			snd_soc_component_get_drvdata(component);
>> +	struct snd_soc_dapm_context *dapm =
>> +			snd_soc_component_to_dapm(component);
>> +
>> +	snd_soc_dapm_mutex_lock(dapm);
>> +
>> +	if ((bool)ucontrol->value.integer.value[0] == cs35l45->sync_en) {
>> +		snd_soc_dapm_mutex_unlock(dapm);
>> +		return 0;
>> +	}
>> +
>> +	if ((bool)ucontrol->value.integer.value[0])
>> +		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
>> +	else
>> +		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
>> +
>> +	cs35l45->sync_en = (bool)ucontrol->value.integer.value[0];
> 
> [Severity: Medium]
> Could this lead to permanent state desynchronization if the hardware I/O fails?
> The regmap API calls can fail (e.g., returning -EIO on I2C/SPI errors), but the
> error is ignored here and the software cache (cs35l45->sync_en) is updated
> unconditionally.
> 
> If this happens, the ALSA control state becomes desynchronized from the hardware.
> Because of the fast-path check at the beginning of this function:
> 
>      if ((bool)ucontrol->value.integer.value[0] == cs35l45->sync_en) {
>          ...
> 
> Any subsequent attempts from userspace to set the correct value will be dropped,
> making the failure permanent until explicitly toggled to the opposite state and
> back again. Should the return values of regmap_set_bits() and regmap_clear_bits()
> be checked before updating the cached state?

Are you expecting this comment to be addressed? I am not opposed, but 
the suggestion does not fit the style of the rest of the subsystem.

Ultimately, your call.

Ricardo
