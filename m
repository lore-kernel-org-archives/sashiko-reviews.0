Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793877122;
	b=1YpRoC6bqCkCvhwSt6VWh+H9hsNnN5ICNc6lP3xwrzY+FYr/hVxUaHf+EsW0UqVvxpNW
	 BxU923o10yiYNR6XDfJF/IORHKoye/j74y+gwRUh0nR1Hv3IwrpRCkQ6px3ATXWd28aEb
	 Qw4cV8xH3CufhI0O2/w4U1PEx7rgIBXmS09aOGscXOAhex9bGszF9LK6t29IV0LDwnH6K
	 wxIYhARa40jn95s3VaCHcKu3zP6MBPx/3743yijcjV+sfv0UoIpbFTuc6CkbheZZMW3Nl
	 gHEv4iFCJcOgGMjXeCbIkoBD99j5WNjamduALOu5d8OAcTxORDscbnIchDwY2aATviA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=f5DWhonRTvOzTZ4ViqhPZMyjZ1DHiyMyd6NuOWVjNWA=;
	b=OPnn3R48bPmP3UgJnYbzkb9gewSAf/zWrDJCj5LrwwEo8wDEC3XDp7puCSAZmLniB0B+
	 fAhGNN3hbrPtzu8EiLrJwMSz0xZ9hDScgj04S4+MDO2N0uGZyhbHp39mRns45/mdf/lyp
	 07MZrcw/pVYVoRCrrHpDdmpbjtE6NnnKzS84Uu2yXjkfx6Uo4MbkbPCR47AZXKiXIfdOy
	 bUzU7u7VNrtqVvXdZayd/6nqOPlX8Ze/QLfU71BswuUWuk8Jq8mR4O4qUD5I/t94LnIA6
	 R8qYTlp6YRam1piJcerYGst8rvuN/tp9KTRW6dypZJZXpBZ/FIpmlU90QjQdjRE4Cew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mxioeeGP;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=aEqXfuAJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E21606D816
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 11:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E21606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mxioeeGP;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=aEqXfuAJ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A531HrP3669696;
	Thu, 5 Nov 2026 05:11:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=f5DWhonRTvOzTZ4ViqhPZMyjZ1DHiyMyd6NuOWVjNWA=; b=
	mxioeeGP7AGFDc2NalwB+iSKJ9Oi1YAOGHqDJOE1SvkHWzw2MiZiUctcJS46Tr7t
	rTA7f2nvG1R9SURkC4xsIQ7ZAVAmUZTIDZNBPRq3ClT+hVtxN89cODUU1ciRqE2x
	PJn6ZU3uGhW5mICiZQzffFk2c/j7h0Xqci46WoRMMvMmzZLFOhkYm2lvuODB2F3e
	2x8ixaR8pghXIWHeJ0OnRZPoiWWS6aqzPIbKtsgk2ZB3zbagZhiAJ4puZNOEZc59
	e9ktqmDzvL2E02E6HdfqoxM9LvQ4sChYQJ3X0wnmvBLYZhvGcVvUHpuqX1nRkqsE
	Pq4GqRyIpXKgFHFADfcibw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020113.outbound.protection.outlook.com [52.101.201.113])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hr73fhn9y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 05:11:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnNJO+5LEfb8cbqysTMqBDQ1oMc3DVJxlaIaClYpagFAqVcYQMfKirkROFBG3cTm8RedcHOjXyWg2ylGkwi9n+7zfklQ6eiZlpFK9mDtaTKSh8SRaVzxCnrKy9duhzRkGABQYXVz6O+B38MNqQhSBA8+Vv8a30jg9Ietdh/WsO/4Hd6dewLeLMo+nfdv3Yv4gALu0eYmW0Mrhl9CYJNXnOV+eVC9NGe37z5oSMY17Hdn+lJnIq7NHKNabai26plZmo/0KWfTbPNI6dmbgsxtqOLR1Q1ylDoz8iLTcVTg3Rb72IR3mjbIIVq0McImMxQruWkkkQTMK8cs9ySCclBouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5DWhonRTvOzTZ4ViqhPZMyjZ1DHiyMyd6NuOWVjNWA=;
 b=hkod8FrSvcAL9myURBCocMwjoIhhxpsn11Qyl7pMKYsLvg2oEapo2eZC6doFYPN/bRmC+yzTpKWJbpYfVhvUTrdv+8ZAlglwae0WqrL32L+wgHkbQu0TsKVuUjK8KFuK9qEK1OkJYUO4PlE0d8eWCYkJqUPlBUR5U1dsA11Q3RcyghqHnbh4f1asVNcNVRZ3AeJMg3E/5XNHpKLAQiOTFp7EO+0JJJ/SkFFJox5VS70oPXCo2SPYcJRBXaEXHtFcU1POdrPOgoo1gJdOK+KqTS4INWwjyX3rUDRO3Z9XkcjgYmu2NMgZ8zlcuRjcRfbGTKhFHmZtSMea/J9EoZ9lTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5DWhonRTvOzTZ4ViqhPZMyjZ1DHiyMyd6NuOWVjNWA=;
 b=aEqXfuAJ/W697Djx5MQz3UvVsVvf75+4NFO2XKbEnn9LBEICvnMtP+/Pk8A5PcIZbAFHQtcnTNZzvow9P7Ir3bsksabeuJ0yF/KG8JeCLL6tKK5fXPbVDcZiqEdV9qhtJHtpqqBB6yN8BHyIhC/sXzwYMagAmgCsV2MBcs8N2HU=
Received: from BN9PR03CA0217.namprd03.prod.outlook.com (2603:10b6:408:f8::12)
 by PH0PR19MB4876.namprd19.prod.outlook.com (2603:10b6:510:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:11:52 +0000
Received: from BN7PEPF00000097.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::4b) by BN9PR03CA0217.outlook.office365.com
 (2603:10b6:408:f8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 11:11:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF00000097.mail.protection.outlook.com (10.167.245.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 11:11:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D3324406544;
	Thu,  5 Nov 2026 11:11:49 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B8AD8820273;
	Thu,  5 Nov 2026 11:11:49 +0000 (UTC)
Message-ID: <6fdf2434-199e-4387-bb85-d3feb449a850@opensource.cirrus.com>
Date: Thu, 5 Nov 2026 11:11:49 +0000
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: madera: release runtime PM ref on FLL
 config failure
To: sashiko-reviews@lists.linux.dev, Wentao Liang <vulab@iscas.ac.cn>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com
References: <20261104022814.1484284-1-vulab@iscas.ac.cn>
 <sashiko-outbox-196515@kernel.org>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <sashiko-outbox-196515@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000097:EE_|PH0PR19MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2018a8-3452-4e83-ede5-08df3b2d9763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|23010399003|82310400026|36860700016|11063799006|56012099006|4143699003|261022105027099003|261021121427099003|261022075727099003|261009221227099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|10067099003|16102099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OScXuYrRMrwQX0LDpcfRteIM4HP842QODJ/g7NQ9ytgoCMF2dUwaqnr0+wUXRK36CaY43t4SFmsYdujK2UbnHGZEs/5tCW1m/v0GJAjjpa6aImlIbZur/OBLPw+MBivKqvUvr0QWYoyfHF5hRTrplX1bTkUeBMYpwJg1xnHD21OeSyyoXU3u0TjI2JpJemYXylG1pzj1EmXHd/Rn7KEEiYdLewhYc32of+h22EvTeR5sL/hWSooGYMDv0YwwY7eQGylJOzJ0DEnbVqu1eJEeNs8Zy8OkaAP1Z+hAYYwmNB8KvrrLU/3nLHnlNwjMEQdrj5LZD/CTBYjIZmILWlIQk1gAO95aqwIE4LWbQPVp4w5QFVaEnL4WM7vwSyRUKlt6HAejxhJ1jd+4zgk5SnhDDyO51vqDu56dhIUZKgcl4qLguYZ8k5B6l/W38AYIQckr0mgYJmKxRE1aBxXPpN/SP+k/0anqFzga5iwGphVH6iIOMaDWKwA/1tOPYzGjK1tehGC13UjZRsLViR27EzCzxo2chZsW76kWNMyS2HOQ/z8x+8he89Lv1nuravIokU3UaZkNNr8WfXJzkrrf0nbOFkcTbHFa0QwETwbgsI1RPNbUNxVtk1/7zsDP9xgVtnHC1YNkgF0xV4TMoCZb1aBY5gSAVWaXKf3Rwu+V5XllRVr7+TiwVjdPta46wrA8ytS8Mp/JKWex6d19538Woxomsg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(4143699003)(261022105027099003)(261021121427099003)(261022075727099003)(261009221227099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(16102099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K8pygDXWSQGj+IY4X34OpQszwcbAG0CFBuKXrc12E2R1nsYjT0HDZsFihwBdGQfBGbDntOuTerzxZJ4wzF11y8IQ2xTeRZiBqioxBt71OoWek0TLYWcSzmKChZJTE8yG55kUBOI4DZ7sMqSPgz9qmO9hnE88Qr4wLZnV1Zu9f5ikcKRYhau4uc6W+rGcRfx9AKWUytbqvlNV00CL6fuzdZoBP1lXg0qckMnGr4VOmRB6OiQJuXRCjBld15Z8K6ajJ8bh/SVXDv7u7rnm0rW8X4KhEeh5AzmFnUp+1xdwRN29/gKl9bJDm8G1lvGy8uYDz5ne4oA6N6fEn+YxrBSF2DdTn9c16CTiENpW1TYX9N15Fq/B/EmQr2f1vftl/7uC+WSyX8YqIM+mYm4/2EXoDZSpG61ZGUpla7y1DXm9J5JntTRbZ39AjUGNw/mrvSLc
X-Exchange-RoutingPolicyChecked:
	OtzzV/HWNV/Rgm6wJjZl8z1/MtfJ/3kEogqZOffkFUuu1if5PG8dOD2tnSSwmAi6h772mRuPR834gqlbRuHZBPvgYf/EhLTd7K1kR/icwI/6Wdfn1QU1YPegQj2TsWVTsSl0+5x4FgN+91fzDLRcqX8UeB4fZ5ckh8z5FNPnJq+r6L/zwJ7vab66rchVEt8QJ7gVPxAjwWtFyBOWTnzAANOFu6ZIuZPXj+fzTtKGKYsI49iMHTGswycM+Cf9DQJN8uT9YNSwW+QfmCBzYhYkLF+s0A3tBUcVSVvjv7gmX9C8Ql5j6M9XzloB1YRCPF/T0JAJo69M10N8zSd794Ctwg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:11:50.7231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2018a8-3452-4e83-ede5-08df3b2d9763
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF00000097.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4876
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXxb1Bh1TSjHnJ
 bgyLsk293E4QVc6vrUqiOrVD7ArZ7OdfiJFSh2/bh21xacgrVerqDRNdOaY3tFUiYsawuacdWAf
 +/GcljwuJRE0g96zjkj8/k2DUdrPTlw=
X-Proofpoint-GUID: z43XA20BW19IMY5wP-vWJduymnGHs90K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX44VQyq7vjvnK
 EI/gbkXAh6nQZRoMp+xy/YcWQmzU63Xtmjw087y8pRSHbh+QdMZxeNxNHX+nXv9JaPdqi3ZZ1dS
 SUC5ybJ9vFqZjSdRqgpKvAS6J/HwVwjZTeju3Wf0b5d4ouPc6nCfMy8sLdjTVg4GQaKv/BYGZ22
 KNEJmlQ0KmQZz3RWOiyylK8+yo6dobqP031XvV3NS56OTdbOEL5AtEk9iX4dD3twBysV6tNg9U7
 Z0Mu5a+//0montfMDfSUYYoMTQ6Z5uHaDNO56YgeZ0gEJvD48crYDNhZu2qGVFLjn3P2ldje3w6
 4sF+k8aghToNCOL53boNKbPIoC0Do1/n5GBU8SNw67NMhyqOvRl25diTVZtWlf0cBF+KI7S2CtP
 E5ctCgQVWUcDGGjbdxyoZlvtfJJgj7VgzQtPWtw9cQJaQwBevAEnRCXQYkohHmnhMMF+1WV/Xvc
 nrfAecBNaVhVV7TU+Aw==
X-Proofpoint-ORIG-GUID: z43XA20BW19IMY5wP-vWJduymnGHs90K
X-Authority-Analysis: v=2.4 cv=K6S3jCWI c=1 sm=1 tr=0 ts=6aec647b cx=c_pps
 a=ecT/4VdmJWkC/4d2ldM4Bg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=_i_QtqxvmHF1u0Z3ZgIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 04/11/2026 2:42 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ASoC: madera: broken error handling and return value in madera_fllhj_enable()
> --
> 
> commit 0527a87963a29c49669e1565c1faf7d3cc1ad756
> Author: Wentao Liang <vulab@iscas.ac.cn>
> 
> ASoC: codecs: madera: release runtime PM ref on FLL config failure

Sashiko doesn't send its reports to everyone on the email it is replying
to. So I'm forwarding its findings.

There are some potential issues with register state introduced by this
patch. Can you check this?

> 
> This commit releases the runtime PM reference and skips waiting for FLL lock
> when madera_fllhj_apply() fails in madera_fllhj_enable() while the FLL was
> previously disabled.
> 
>> diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
>> index 58255844b4df3..2f6256f8e87b2 100644
>> --- a/sound/soc/codecs/madera.c
>> +++ b/sound/soc/codecs/madera.c
>> @@ -4608,8 +4608,17 @@ static int madera_fllhj_enable(struct madera_fll *fll)
>>   			   MADERA_FLL1_HOLD_MASK,
>>   			   0);
>>   
>> -	if (!already_enabled)
>> -		madera_wait_for_fll(fll, true);
>> +	/*
>> +	 * If configuring the FLL failed it is left disabled, so a later
>> +	 * madera_fllhj_disable() will not see the ENA bit set and will not
>> +	 * drop the runtime PM reference taken above.
>> +	 */
>> +	if (!already_enabled) {
>> +		if (ret)
>> +			pm_runtime_put_autosuspend(madera->dev);
>> +		else
>> +			madera_wait_for_fll(fll, true);
>> +	}
>>   
>>   	return 0;
>>   }
> 
> [Severity: High]
> When madera_fllhj_apply() fails in sound/soc/codecs/madera.c, execution
> jumps to the out label before calling pm_runtime_put_autosuspend() and
> returning:
> 
> sound/soc/codecs/madera.c:madera_fllhj_enable() {
> 	...
> 	ret = madera_fllhj_apply(fll, fll->ref_freq);
> 	if (ret) {
> 		madera_fll_err(fll, "Failed to set FLL: %d\n", ret);
> 		goto out;
> 	}
> 	...
> out:
> 	regmap_update_bits(madera->regmap,
> 			   fll->base + MADERA_FLL_CONTROL_11_OFFS,
> 			   MADERA_FLL1_LOCKDET_MASK,
> 			   MADERA_FLL1_LOCKDET_MASK);
> 
> 	regmap_update_bits(madera->regmap,
> 			   fll->base + MADERA_FLL_CONTROL_2_OFFS,
> 			   MADERA_FLL1_CTRL_UPD_MASK,
> 			   MADERA_FLL1_CTRL_UPD_MASK);
> 
> 	/* Release the hold so that flln locks to external frequency */
> 	regmap_update_bits(madera->regmap,
> 			   fll->base + MADERA_FLL_CONTROL_1_OFFS,
> 			   MADERA_FLL1_HOLD_MASK,
> 			   0);
> }
> 
> As documented in madera_fllhj_disable(), a disabled FLL requires
> MADERA_FLL1_LOCKDET_MASK = 0, MADERA_FLL1_HOLD_MASK = 1, and
> MADERA_FLL1_CTRL_UPD_MASK = 0 across runtime suspend and resume so that
> regcache_sync() does not latch CTRL_UPD before writing out all FLL
> registers:
> 
> sound/soc/codecs/madera.c:madera_fllhj_disable() {
> 	...
> 	/* ctrl_up gates the writes to all the fll's registers, setting it to 0
> 	 * here ensures that after a runtime suspend/resume cycle when one
> 	 * enables the fll then ctrl_up is the last bit that is configured
> 	 * by the fll enable code rather than the cache sync operation which
> 	 * would have updated it much earlier before writing out all fll
> 	 * registers
> 	 */
> 	regmap_update_bits(madera->regmap,
> 			   fll->base + MADERA_FLL_CONTROL_2_OFFS,
> 			   MADERA_FLL1_CTRL_UPD_MASK, 0);
> }
> 
> Does dropping the runtime PM reference at the end of madera_fllhj_enable()
> allow the device to runtime-suspend while MADERA_FLL1_CTRL_UPD_MASK = 1,
> MADERA_FLL1_LOCKDET_MASK = 1, and MADERA_FLL1_HOLD_MASK = 0 remain set in
> the regcache for a disabled FLL?
> 
> Additionally, madera_fllhj_enable() still returns 0 instead of ret at the
> end of the function. Because cs47l92_set_fll() -> madera_fllhj_set_refclk()
> stores fll->fout before calling madera_fllhj_enable():
> 
> sound/soc/codecs/madera.c:madera_fllhj_set_refclk() {
> 	...
> 	fll->ref_src = source;
> 	fll->ref_freq = fin;
> 	fll->fout = fout;
> 
> 	if (fout)
> 		ret = madera_fllhj_enable(fll);
> 	else
> 		madera_fllhj_disable(fll);
> 
> 	return ret;
> }
> 
> shouldn't madera_fllhj_enable() avoid setting LOCKDET/CTRL_UPD or clearing
> HOLD on error and return ret so the caller does not see success with
> fll->fout left non-zero while the FLL hardware is disabled?
> 

