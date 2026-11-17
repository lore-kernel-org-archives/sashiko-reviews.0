Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794928240;
	b=3WiXCBk0Q3oN9e5+tcStgoBXUob2hvAVS1oUqr8NcjDmzRKgju+D80cycU0VmQPIeZGE
	 nhQBeH8DTLj7T5GTz5U0o4tExbwbeGj6OhY04dNLP9DPfLhQJI6lXt7SVezLJPyXoMvgp
	 CrJcOVmlfiHl5UDk+bFbXAkrCKQ2xm8utOaUFo6sPy1qtT0dQdYOX0rZaJ6OOLcUkpkEl
	 3xNXKJdCQM5xYGMB0DXr3pDSmjd5NydluZ7T+cQZrSUg3ne01R+xfc1RA1uBC1ZDBnBO0
	 ws9D4usXYBKrJVZxmUCNtPX9l2zPTU2FeqRMNg/PFFrT7nGMAYRmP+FLqLErFI5jqtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928240;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=bUhrbdqEtX/cek+enPf7zBwN8UlU0QO2nmImqyExyXw=;
	b=yaLzf4Lrp0bk/mub9pZ0q1v+MduNQcvk8X/lTF0+YbDnHk+QKMsjA80TxTog3hIQqtbV
	 ayD3FxXG2Tk0ktivTqb4ol1EzzIoJVuAfFgumf5BYhZl5T9OquVuUiBui0eimG31I+SkH
	 AxXo3jXoRVk7/EOZVy2bGA7EjZIDM8AFjRjOW2SY61fdGmEz11+vUUobr+jOMZoa4gCCU
	 MNnDH3DsyNoxVhq8ePw9gZnLIygL9lKVS6B8Me0UfYsuD6P24zjdWo0nY20nbpgcV80cI
	 QnL/mmOf+0FV5UOO/FkbwZ5y8lZFt+RoFRh/jYbOraZsr9A+/fxEywHWvLYcm8lLsng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iWjiRM5l;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pOqh06ag;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2987606A31C;
	Tue, 17 Nov 2026 15:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2987606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iWjiRM5l;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pOqh06ag
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHEs51s203269;
	Tue, 17 Nov 2026 09:10:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=bUhrbdqEtX/cek+enPf7zBwN8UlU0QO2nmImqyExyXw=; b=
	iWjiRM5l9BDpwqnyQUUhQf82IShFrKQjHQnn9o/jMNlsDc6LC2zUShsofH99kqjL
	O+SgAS6dB0isBYi9Tm9tAEhgsZrsnrQ57nPIVu1/HvfOZ6iuHpNQ8UFmUdQpaPsW
	ZhrN19+ugFtGm13xW7wtpTHngMwd7iSWCGofNxP/tOVQ7cVxr8yaNqKSb5oBe+Iw
	1+GQ4zROtWFFT33vsS/vKY2Nq2ILoD09oukh/4fv7AwtUcU+gDbCnMhLQa7m+Mi/
	NvobCDWVNHhjEYxIABA090hKxlK3F6eY/IajD4G6QYPtSEKyzKLK7UA8UZMscX7+
	Oh4U05lGwE2QsvSxS4jIRg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020127.outbound.protection.outlook.com [52.101.46.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j0kr50j1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 09:10:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z28N/5mzFXCWUDyn3WL0QzB9GGrLeszlILCUP2U/dnbT/5FtcyVoRARbUVE/6ygf6cgF+A5SmseTQsz8o5R8Ay7fFo5XYpTnJcVX2+r6BwPn8Bb1F1j/J1MyZGMIZ04pHpZf34WUyXLMm5bH5H8NEn1elGkGGw1L7rmQHviQ50GnAxWxXOFxu5VVV+fIQKFlYG6yVU3uCOhjlPuR0jiEJp8rRrcVMBauq+rOZBs0q57MkUBRg2hQCL3+iAaxx3PlDrrKglFfDVMvqV7MMb4qd5y9wS+NroeN/LkLup0sXXVpziEuOLF4B0aVonG2rV4zxlDP4VDizZP4zyXI0/olYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUhrbdqEtX/cek+enPf7zBwN8UlU0QO2nmImqyExyXw=;
 b=gXoE2jFXkaChgxEYYuaV4qzBMSOTLvri4gUNruxSiJgezw17ap9ruhzKHZZfFxdyk1eO0Rjvu+3e5I1qYHhzOaACduebV+/RxIJrMXmmaiYRgZ3P8aoaHO3V3M1I9yxlpybOsl1GVl+FeSqhXU+GtPnW/ZV5iupEsZeEY/aMT7KCGbf3QaO5jpHfaschOpIvV08dcjBKVUgIhdGg4NocWXS2Sd6zN6ZX7dlfyrDKhWbOgXf4CXng9ikjmAV4+2MJZ4njtd2SqzPA/vqW1chdiL3z2onb9DqyxiV1gczA6OpZiK+PaNqv66gaxYDQxewY0FMFO8/mo/tEMpvwa1JShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUhrbdqEtX/cek+enPf7zBwN8UlU0QO2nmImqyExyXw=;
 b=pOqh06agO/lHRHqyb7nShbciL1n9o+Cqentec7f7gJXMEL2N9K/B1MYWEhuDPGGOR6pWbRGpsBcej8VHJ+2k4D8fX0/eJxl5OJUWG8cgtOpEOh6rg40vDShDqdjU+1pIN0RaWy3nhTw47f/cKFAnK9d+xUernug1sDjreoV4IBI=
Received: from BLAPR03CA0176.namprd03.prod.outlook.com (2603:10b6:208:32f::26)
 by DM6PR19MB3867.namprd19.prod.outlook.com (2603:10b6:5:248::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 15:10:34 +0000
Received: from BL4PEPF000003F5.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::9e) by BLAPR03CA0176.outlook.office365.com
 (2603:10b6:208:32f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 15:10:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL4PEPF000003F5.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 15:10:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 87B40406540;
	Tue, 17 Nov 2026 15:10:32 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 785B982025A;
	Tue, 17 Nov 2026 15:10:32 +0000 (UTC)
Message-ID: <1394feb2-66f6-4149-9491-c16c74f15b52@opensource.cirrus.com>
Date: Tue, 17 Nov 2026 15:10:32 +0000
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
Subject: Re: [PATCH 1/2] ASoC: cs35l56: Add KUnit test that widget init
 doesn't write ASP registers
To: Mark Brown <broonie@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-sound@vger.kernel.org
References: <20261117125937.658976-1-rf@opensource.cirrus.com>
 <20261117125937.658976-2-rf@opensource.cirrus.com>
 <sashiko-outbox-218869@kernel.org>
 <aa8c43bd-d55c-48fb-a022-060bdfac97ff@opensource.cirrus.com>
 <afc8e84e-5288-43ce-8a1e-1bb75eb6d7d0@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <afc8e84e-5288-43ce-8a1e-1bb75eb6d7d0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PEPF000003F5:EE_|DM6PR19MB3867:EE_
X-MS-Office365-Filtering-Correlation-Id: 3593b90e-f8a1-4d19-1632-08df44bced67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|23010399003|36860700016|18002099003|16102099003|22082099003|5023799004|4143699003|11063799006|56012099006|10067099003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	fb2wxPgB5LPtGRvqt+2sEhj7cgbJ/UdAKf9PYghaDkJH31yqLqJD98RGu61OjuAyaZQun3sj0kqJ3Je4v1TTQNfb+ZDyZIzTVKYl/14oYNwxpLIHA+FBCpiSTEhjltXlT96gXiMjXHBs8nBb042m0ndhGVgZcuU7iwXTFQQ8Wypm8wIXRMDNCvPFnK05R3Q8JTTsPkAbn5ZzJpleu58Tc5xaNjrvN33EUw+sINFhPQYXzNFpR02bigIZjtuWZr0e5VsAsHwPmti/CHe0ly1ouiDndgy8fKn7plJDpoKK7ZN03FwgpQwl7wKdO2fMBFGTEQuHNx+kwk32RwYhlWCR3wb7DLR1Suo1VGkRVUEnheB5vKg+NcbQ5RElXpStb8F17Zcy+6dTdQcHwd7KPOh1MbkklQbGKBi3Cz2hp0JxVkWYqyJUrr09PtZCC8pspQsAoxr+GogpKnKnmaUIXZtfwQJoE6mWBBkzhBsz8no6l9uL39pIaBRCvDHicsXSPnV4wKGjdHppe1VJryCNhsrX6f1imB6227Pf0ZZsYxFVyzeGzSVkA9MCxex7YRi2ZZ/hAMMfbRLLfDuTvNOoAYapAuLnrppfPzRx5uckktahkQDprByugN1Xgl7oFq+Wiq58Q+i9AWrX3b3nsp4R9geIKp5l2ySp3ztrmDj32fPWq9bIiHO0c9+pjl5eTnJP7tty2O5iQSW0lWDtayxRgice+Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(23010399003)(36860700016)(18002099003)(16102099003)(22082099003)(5023799004)(4143699003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sLCFVO/s4JCkO2n45hadVgj3HB4I9qdYU0ALdjbEuCoBK+DaqMQjCu6Uj181gfphQXBLE+aGOkEGBDUqQLMCE/ilX4mg0JYsKmVRPzZCUF55JXGZHsABzXH8f4vPaF3C4r/ViWrOl2XjFd4fYmqF0uP/Al2OmAxi/G6RuVwk9euA4T++Ufl1/FztcXrBy8E5NRLeNMhvckkRib6dnarhgNa34cCe+5fHtvr4wjdHT4bWnosFvvA0cIDy8siiu+kLAfIXuFTdVmMv8x0cfgdrpxiiIzsDz/rohUIBfujDLvwhb8DSV5ijRniHC8yTmjEEKxC8NgyQuqVINFazmc78wZQDCjjDZbgkgYlVKDcRvHpaU9wzxXdT03mAqGun1ewsnMocX5acVLKPY+BmfZHmhNf5zjDfzeZv9DR9crk+9s3AxqPSZgzOJ3JN6II3QrhN
X-Exchange-RoutingPolicyChecked:
	GW0XvZ7aFi9bgqUYsj3+xp99Nipl5j/n3H4LPvL/ef7nsf/PoLH3lFXpRabgjh9N/5VTsaydd9OBU40p85AoI8d5NX0QP53RWfsxOALXpYyxuHin0l2sIXoLniwlk4fvVaVdp3s4o2MbGawI2wu2IOPSS72BsXYZMVHlrGQe1JJj/2feeoSxgU4LHs7T1jwRFBZ8vUcz34pm+14ukZtN/Du9ijioyzbRhm7ZqjaiklZgH4Q07XHmLKFf1dIS6FTBy5FYESbNbv2Z8jpbA+PbAq+4EOf0fqwQqgcExHgZCuUbhXjsIU/+2kc0ASiOsoPBmaEf4jLrqgB8MxDrOhXtUA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:10:33.5197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3593b90e-f8a1-4d19-1632-08df44bced67
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL4PEPF000003F5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3867
X-Proofpoint-GUID: 3BvIvlYe6RXGbt0ATT8NsDEM27CICYuE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX4rehjXvWmoR6
 FQscTTWTDAEVqUyMIpfJG9P+LQ0PXnVqn9966Qr9fhwa7mfPnG2Pqam5XntPy6a7AwIj/6u5MPN
 bhrzTva9wPo7m6YOY+FgJmwb1moNQi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfXxzzDpSrFprIi
 TT2BHvRjbnKSRJAXIWbZRKHbS8R5RDRNYfItFPf9zXaqNe7PvDoHsFFAcY9r554dexU3C18oN/x
 YDitbqNGKzAuIG+PLqh9rcoM6dVH0syCcQ+EAdoOrG62NBYp4nzf8A0uxldFEnk8VerE7GuZMQH
 AnJOesUhVj9sb9UlSV0qAr+J/S1a49EU+AA/G2h1puUudNJJWZ63rGXztSRbdjk1kl+isdDdKKE
 r/45652yImtJSiKpfleig3h6H7r4u3uS8mjsirHx7cL48Pq2PqL6i9wA1xlVZ6aivlefnsaU6TF
 ciTuA8xC0usIqUY8CAM/qPBaEDizr/a/RexDeQM9w2NFNg5eA7F2qoFw8MIkMZvy/Mv1WRiQRA2
 q/wr5REqrhLezhgNp86Hz2VaHqPDAqOQvUSGVTbKSFDN4Te+72/36Ucf6ylD/99fdEl+5SmgPFs
 IMtwDVWoI6t1rvoGweQ==
X-Proofpoint-ORIG-GUID: 3BvIvlYe6RXGbt0ATT8NsDEM27CICYuE
X-Authority-Analysis: v=2.4 cv=aOllOr9m c=1 sm=1 tr=0 ts=6afc6e6d cx=c_pps
 a=Q2wBRf3htqysZkxgPItK6Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=f2CidI4en5AAmOwxfd0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 17/11/2026 2:56 pm, Mark Brown wrote:
> On Tue, Nov 17, 2026 at 02:22:28PM +0000, Richard Fitzgerald wrote:
>> On 17/11/2026 1:23 pm, sashiko-bot@kernel.org wrote:
> 
>>> Thank you for your contribution! Sashiko AI review found 1 potential
>>> issue to consider:
> 
>> It's so annoying that Sashiko only mails the review to the author and
>> one mailing list but not the maintainer or anyone else who was on the
>> original email it reviewed.
> 
> This is optional per subsystem, someone could send a PR to get the
> default changed.  I think there was some consensus to do that from the
> in person meeting at LPC, though TBH I don't think it's great for a lot
> of submitters since it's prone to reporting non-issues or just plain
> wrong sometimes.
> 
> b4 will show me anything from Sashiko using API calls so I don't need or
> want emails myself.

Now you mention it, I can see that it makes sense not to be spammed with
every sashiko whinge.

Anyway, this one seems to be genuine so I'll send a V2.
