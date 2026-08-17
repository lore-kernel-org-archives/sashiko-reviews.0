Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C26F303C97;
	Mon, 17 Aug 2026 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975677; cv=fail; b=IQ+mgfdPI8Zwb5mcl5NNPGts+vf4twjdZ1jAcmttUtdlvINHmdPJa2Y8blBD0YrSGXBNN98+IKvIfKEfggl8b+dkVNa8G4IpqFXbX3QdjdUac6F0l+1PP0yN/zsZZpqtQvQP/vVG+Azyl/A88cHHktRWJ4r3VU9iQ5Z0e9DshBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975677; c=relaxed/simple;
	bh=xehe1NuML8wqOd69szzNiDRRgcgQ3Rmw/yziO6g2cUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLfTosN3bH+HO+nJZFiHS5U1gTGLclVSSKPHaM4fRI39D+n5dCfEUicitqvWzDbenXOCyTxdSnrrEtcaTCK04TLe8t2DDAphEoz7sxwQG9dhiV64qYuH5lc3/MM8xq7y5/ZiQLn3uOpUeruquU+J3COlmjeCha5jUIqv9M8b7SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NNZWk2PK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FWsn2TsV; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NNZWk2PK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FWsn2TsV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H5u1Ih2274450;
	Mon, 17 Aug 2026 09:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=teOMEanxLIouQU0NK/klUdxMpjNDsGzMnLX84wcwOMw=; b=
	NNZWk2PKACnFIoPhm7aUa1rFS5YsQE/9iLyzNNVDMETWheRkcAdJHpndcAI8BAo3
	x9Da5shXPDFR4wDatyKu6UL3q61qRXWmfLF1QSFcUKI62kqwkjgVHhcu286ybn40
	MHRYZ5/iXIiHpPmMpjuBpIyUILzz8vU0+g4+veRkzitN91LHkVp0MR8yRzB6UOo7
	Tq9M8JWIztaAzqPWHYAiJ5kdliI2zBpZyuXwPqwfd7AEm/6Q/cQOPQjLVX7JTryB
	S4c7NeUQg0nAs6CL0WL8+eidG3eH3Zb3SmTYt7F3HoFg07YhGFikXytdsMYtKOFl
	iDpJUpCF6iWcAIn6zV722A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021127.outbound.protection.outlook.com [40.93.194.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4g2ngvac5t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 09:07:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoz8+cwFI5wTB/sLZmT2+wjemjFleDQZUgmvWd55TLy9xqcwA33qMZLWhAcHnjWKOB9g6GDEVHhr1NTbQzW1TzdyA/CwrRPmyicaew9WQ8LP//x453Lp8JWAPbx2WCqA6JpBSoxTrEed6Flq9if08S/0arKui7RY7zOkQEdBAkzSKsD4yoKJtcF8W/hS28CQehgKhcB4rdCWVcxC8PtKaF0yg8TcuZVebE9650JiK3bhqmW0QduiANhBKMs+htJg2KfpkZbXo6fRQPSsmBpLhg05mNxbu3Fm+/NbbpSpjSQCK7+/fu3vSnCGnUX51wr4d+yFBwXcz3FR61HbACaOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teOMEanxLIouQU0NK/klUdxMpjNDsGzMnLX84wcwOMw=;
 b=oqvTecQhzxRdUueZxvYPc0TNbVRR40uXUhoHQKo8020JG6Orof8zsBNxwuC8vPKdl9P6tQ6IUsLdHOhRHm+/pwolnbavdiuMgugA8IH+K232soR/DDGBdAeNF9F7Acy2SoF3MuAtkfEv5/jx4E3DdcAUGppIDiOF8rPnO6xJbI2s9C8EUMfee8Y9Al8kJbxh0ckJTMgchB7eAi7FrMFip9CSXN3Al8FyWsaNPT9N6AKrOiQaSgsBrmemJLavnfZJpQMpnMRI9gBiqUBheiSKQAK55vb6S5wNjCEhEKnUgW2KMS6ZsVXnYJXqNfnB9txji/BZrB0ThXYSTE1WQF5AjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teOMEanxLIouQU0NK/klUdxMpjNDsGzMnLX84wcwOMw=;
 b=FWsn2TsVZbXpOCU+EoVgL7wFS5Yd3JdMm2ZmrLxoL2TGAP/wQsSVsg+Kgec679dH0rEdSE9J+e/y82DTUlVMIyoBmqo9ZyhtYGe/G7xWMNHiQC+OrqbVaFT6MvuiOzmHh6pbrT6vQCABZHoX3ieiH+/iK4E2XYzD5dVz15+QzN4=
Received: from BN9PR03CA0351.namprd03.prod.outlook.com (2603:10b6:408:f6::26)
 by DSWPR19MB846419.namprd19.prod.outlook.com (2603:10b6:8:3b4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:07:42 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:f6:cafe::8c) by BN9PR03CA0351.outlook.office365.com
 (2603:10b6:408:f6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 14:07:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 14:07:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9C26E406540;
	Mon, 17 Aug 2026 14:07:39 +0000 (UTC)
Received: from [141.131.156.116] (unknown [141.131.156.116])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AE236820247;
	Mon, 17 Aug 2026 14:07:38 +0000 (UTC)
Message-ID: <ea8dfbc3-4505-41d7-a147-b523b1c0112b@opensource.cirrus.com>
Date: Mon, 17 Aug 2026 09:07:37 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: cs35l45: Adds support for SYNC bus
To: sashiko-reviews@lists.linux.dev, linux-sound@vger.kernel.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        patches@opensource.cirrus.com
References: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
 <20260814223456.611160-2-rriveram@opensource.cirrus.com>
 <20260814224141.0AD311F000E9@smtp.kernel.org>
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <20260814224141.0AD311F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DSWPR19MB846419:EE_
X-MS-Office365-Filtering-Correlation-Id: 84df0d9d-5a06-48c7-5072-08defc68e6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|61400799027|376014|82310400026|10067099003|11063799006|56012099006|4143699003|16102099003|22082099003|18002099003|4076005;
X-Microsoft-Antispam-Message-Info:
	9314zRWFSGz+VcaX0dT5qGbAwoxBuOKJZgnEzKIZVFpWdLvRLfSQcG6IWiMvCOXT6adwkRfNg0y0Sx10ag2diuPK+ZvkcbPx4x0DuEtVEaONvqWQv2x9GD4GNp6nzNWQr7YN/pelxBkNgXnL3xdPxyXSB8tIfstNCvipQL8tNBBvdXguyW3EnDEzQdEWBWX4n5eLW+NelkoV7Fbz2IRqt8vDebLTsgpcfiNuS2easbwPEBZEhmQevhFtnVfMsttg/CEdLOUU152uFuBjqLmsrlpeHN24VB8bdOPdGi1XvgGBLVkqeR1IS2OS3ZfkWuZw+hVvAWkPVyrNrk/bzQ+nqEIUUWqYOVBdtJ4Awck4T2WMRybgrTZMWeIgzNvBbWV5LgdKyeT0Havznuo+Z+uoW18Hx/Z/IXggXoWHMYw06iJcK3yXNPkuGy+ZaEzABNTIMe5vXnD3FPfwArd+HmicY0rjGiwYs2pU3X2euAWwskgBC8R+tNFJXeJUsP4YqUBYryfLaoFwYcpxmxmlplndFD/qq82movEhHk+7Kbzmb+B2lXA7prqWqYPHtHT7atwFaMAZHulYJWVg762WFG7fJhoci48v8qMsAz4i8qSt7/CVnaI97Ym7I3azBVkBWsR/I8ZWYL0hIVyEG6aI/tMN4+d7cMl+89Y8yPKsLje0xoxOAuqWdUIm7plaT29nZlDlUXirROR83yBHg4XKGlSwVhbYhs1dUWDoGk7YLbwV/sox9sivn++MCMkzEsFp3map
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(61400799027)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(4143699003)(16102099003)(22082099003)(18002099003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8CSdBoFi/W9ovWEn9/2UFVBF9dcpSNjHY2FksuXLUnyET+UO1eX4wdIck5j+mgVw9COcpmqPy5uguVV+JKhoPR7h2ZvRNuTh5n3LfIovaW+GSt19uyZoTd6YhG6KTPf8JFmtCAfCmnzUams9Xfd0sbTzFQJNT3/2n6BnqYwPuwzKoIXvtB2p4mn7vJarR+NvtqeF8h0gO6FP89uuyAWAEl7Fr4JgAuxBLYOH13RqCL5FA7tOtO6ab2U5X5whIx/Gbkh6IF1a5cyd/HFlK3zRNSGS5m9+btzYupXCEg91LdS78zgDKv6hbfyDKHd2qZLXa0XB0TXo4JlOAtGBRtr5cUYaCA0gAn+Rq2wq2oNhbiumCHvcCf4jz29VsTIqRVEjUlRj253ajz7cTBxETiE9sLO19HMLJeSZBOWCwX7MdopVJ6YuYFG0dcmWMe/qrqW6
X-Exchange-RoutingPolicyChecked:
	HRilpqswSAsDGvYT98Pl+Q/jQU6xqn4wzz3izlWrebqsODZpRBU9dN79nrPUKqK6+/jrTX2k4waDk/QgwmKlSbV/WXiUqKY2O75d5ajcA3sH75sxqDqsVXkb16eXlMT/L3IQAf/9sE4R23i/zQJfzEk8GKjyPYApkjjKLUGp1DNs/mbO4KbSLi8XwGcwLtDL/J+v0gn1A/Yv+LPUImWL28Gu3vFfLFmgONCa0WFbBAodayF1iWEtcpSInfDdC0TwNXRzvMQzlulnSrGyL8tZGKdzQeQ3fLlQS2gCKDQINZBsM8bteYd+8q0PGZXG8vBH26W4k8Oa/il1/dxhjvvGxA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:07:40.7388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84df0d9d-5a06-48c7-5072-08defc68e6a3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR19MB846419
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwOCBTYWx0ZWRfX9iNtKgLExp03
 DoFdgo5qvA1hmtRbmJEp0ilWsrRjXxpvpzK/lI1hjXD/9cBub5MRqXXRZmoDwFzcC8ZHaI9faSk
 EohHqLuNGt0tWj5LGu2sCbME6wp3SVWGTDJkeaGV5LDMvWuRAkhPnOpFNGDTEQ3EPUE0dwv+7Dn
 HcjToP8qkAkAigiYz8cZsaNNyVk/6q/5YIA91apg78vSQGgIgL4+oufQET00ED9rOroU/Fc5ect
 cGjQWNUplT0k1NVRG/ikxKRLL2NRFI6puMbs8DDthJBX6uagTZc1Zu6LuuRdlJJYb7L+mLGheSR
 dZtszdNrA8w5AeeNnI6KwNydI75FgE/7L8gH4Fu0lywp29fotCitIJDaDrgtWnrjnBCOXn2tWsh
 +RNVrZJ0GIRxfP2WT6zwXuVsmnei/9GEv9OMjCCz6PpnSgATTmOv/zW3zRBGcAfM6q7kGYajXzK
 O2M8KNEHeO80dSX0lZw==
X-Proofpoint-GUID: _FsJ22bkTDoUlq410coJhEvhwEcdz0I9
X-Authority-Analysis: v=2.4 cv=FccHAp+6 c=1 sm=1 tr=0 ts=6a8315b1 cx=c_pps
 a=wuCIV2M2hcCPwYkL8T+rjw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=CDz1Wt_YRD-m2CJZduMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwOCBTYWx0ZWRfXz+CXydyboNkg
 +QgEu6Ge5F/p/tjDtIQ/zxYKtf1I6BI9Acvh1MS+Oqc3QIjNzcEqAMVcLLl1OR6xp7gFjsm/9YO
 m2PT4Nl4yg0zMGuhM1uL+TpjVzsAjnI=
X-Proofpoint-ORIG-GUID: _FsJ22bkTDoUlq410coJhEvhwEcdz0I9
X-Proofpoint-Spam-Reason: safe

Sashiko and Mark,

On 8/14/26 5:41 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] cs35l45_sync_en_put() incorrectly returns 0 instead of 1 when the control value is successfully changed.
> - [Medium] The driver ignores hardware update failures in cs35l45_sync_en_put(), potentially desynchronizing software and hardware state.
> --
> 

<snip>

> 
> [Severity: Medium]
> Does this code need to check the return value of regmap_set_bits() and
> regmap_clear_bits() before updating the local software cache?
> 
> If the I2C/SPI bus transaction fails, cs35l45->sync_en will be updated even
> though the hardware state remains unchanged, potentially desynchronizing
> software and hardware state.

NACK on this in keeping with the style of the rest of ASoC unless Mark 
has any objections.

> 

<snip>

> 
> [Severity: Medium]
> Should this return 1 instead of 0 when the value is actually changed?
> 
> In the ALSA kcontrol API, put callbacks must return 1 when the hardware or
> cached state is successfully changed, so that ALSA mixer UIs and audio servers
> receive a SNDRV_CTL_EVENT_MASK_VALUE notification. Returning 0 here might lead
> to state desynchronization in userspace.

ACK, this will be fixed in v3.

> 
>> +}
> 

Ricardo
