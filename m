Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794925503;
	b=IC49OSRIgAjTpa1jZfF/5gtjqH9BNUYUWl5zWK09Qi3Aw+cvQkN2doh2HiVC3pSPtBe1
	 opFMk9pe/AqHJZSHeMhGzbEAK+IRvElA2MzOOYx+vzxzivjOcp9M74dtpPBdxmbO0BxhT
	 HHrkxckrwhHFLszzmQJRX0NynCXxhzXNJLbevw+yz9E2ztO/T3PeR3DtX9Tl4Sow3+xHa
	 EQHn2QcWI5tl0sawDMB6wvQqgYLrnBLqw5rGf4+Y4WebjyU+bqA2K3szG+bNVQaurDov1
	 Vp2nYFauuGFOHWQFyaTanGJ+d+mANA9CI3Dul6giPCwHD5aKmv9vvU4IWqFapac+BIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925503;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=cQ6FBl4ypDq0rtGBHE6uqWWdLQ+arjhypU6AVGkJvSo=;
	b=V4NGWnh2bCUg/r1rq5y2PETBNX2S8fs1FmFyjQofAfXRmQM7r4k9FBdPMjZBaXzFYatE
	 bi9ophP8Mf89QNTH9pOBZ53lVpjqdhSmKPxbFocSS74AFbUMW/E28aqKfn5b1a/4QBfWD
	 /xZwFOf8XhMdHJnQqcU/MT4AD9mgFhykWPQj/+qH/ZODTPsqmWGFdk4xy50xbBSSGyw4i
	 316HisEsuc+SiiX07GxdtrZeZ+rFQjRUvcta+uecfb7sUPWMdVAn8/MzUEqy68nZMvwHl
	 gQOnvK+c2lXw53/xYjhCEB/O8QxQG1/VKggW7ZZPH8aEsCbASY668NZ+aAdjnj8ux0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=YvJJR65w;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=NG1h0efi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A26606A31C;
	Tue, 17 Nov 2026 14:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=YvJJR65w;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=NG1h0efi
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHDV2021664858;
	Tue, 17 Nov 2026 08:24:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cQ6FBl4ypDq0rtGBHE6uqWWdLQ+arjhypU6AVGkJvSo=; b=
	YvJJR65w2jJaC34I6noIo3HGZ62usfqzVqnw3tCz7Gz9AO+u11j04IW9n8EaCMVy
	aAOhHdNK1IODIxrIlL1/VZWfTRdMTVMFBa+teecBBCz5x74iOC6m0aIyS72v/zpf
	J9aQHSJM3px5TtGv8GryMEt5TScJ7exBQIRWWQNX0jYxNw3j354PlH+6Ig1rgd8u
	9CI6tmxVxJGAaAxdDeAJA1sjiTqdo3yGMu+xExyhvDkz+8typ9ucdWUpSOw1bjVk
	9S/KedegtZMvwel1vVr2JNXUqHHkvMtrfe3XCjlK1hcFQj1xD2SmvWJkxNicAzZ/
	re/cALcL1xuUqSFP2/1bFw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022134.outbound.protection.outlook.com [52.101.48.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hxmxs4a9a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 08:24:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+w4cB/EspsUtGpGSAxcEig5Jvyih6d+vgLoohOYHo6YLersxu29mjQ4rbM9xNKq6myjFRwuYCqZwXijTGcY8qf4x7tJo0VYxvnvWT0Ifa57SBMXjMzlugKbSx9jPnELomXA2YahKQRjnavQvU+67nnM62ea/qb9j52uEOf97SFpwcudvVwzcbf1XM4RN4B+V8C/tbZuZlmgLsRnkZtaU/s+V+rk0IR5fE+qcbXe4/GTwhRblVC4ZyTrHrBPpXlJu5WXNMn/se5CVSlPfwTL+BuhECS+tzchppLml1tSrKScBr54EhW70WyruwaBH3IUpAmE7dUObcnBUNqdYg0W5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQ6FBl4ypDq0rtGBHE6uqWWdLQ+arjhypU6AVGkJvSo=;
 b=N8kyVy4ssjZ0mq5Hnd7p4G15t2tDIsewxe1uM+sLz+77tY+yGVXAuxzvv7XSpR3EdBFw/1fFQjwZn3IwUxEYpaSdv2X6BKRyI5/0jElCheZyPjiwCRTCG5DBCF2pEOd9Tak+5j09Aps1XrcGwnK42FAkAajias+MGseJAvn93DwG7cEBxRwvtLXPvp1DoM9u0VY+ARqhq3r8a8Fluhf3szB5lUdggm+QkAhPQOEWhplAqwDyTnl+CUe+rX8QLnTvGiCzY3iJ30Cf/GnK5pbc7BbUjUXoTNrX74tpIqg5ZmuvI5t5NaFA6FgeKakWEyLfGfqY2rvwCaenDmlLaHipnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ6FBl4ypDq0rtGBHE6uqWWdLQ+arjhypU6AVGkJvSo=;
 b=NG1h0efiqxe9l6/luNDQWGMZlyVxlVEnV56g5wV6RpV0w4ufWU7sCZup+7K63GgxFXKPrnMhyHVHt1hNCk+64diCM+Czu4HY9N4hE2+iG0Wx4RUmRTHmZ+zvrOgCqSIZ6bW+nSzb+Ya70YMZzEgR3m1qA0wflTps9iFUosngT+M=
Received: from SJ0PR03CA0112.namprd03.prod.outlook.com (2603:10b6:a03:333::27)
 by SJ4PPF946DFAC0B.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 14:22:30 +0000
Received: from SJ1PEPF000037AE.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::1e) by SJ0PR03CA0112.outlook.office365.com
 (2603:10b6:a03:333::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Tue, 17
 Nov 2026 14:22:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000037AE.mail.protection.outlook.com (10.167.244.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 14:22:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 73113406540;
	Tue, 17 Nov 2026 14:22:28 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 623C9822542;
	Tue, 17 Nov 2026 14:22:28 +0000 (UTC)
Message-ID: <aa8c43bd-d55c-48fb-a022-060bdfac97ff@opensource.cirrus.com>
Date: Tue, 17 Nov 2026 14:22:28 +0000
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
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <20261117125937.658976-1-rf@opensource.cirrus.com>
 <20261117125937.658976-2-rf@opensource.cirrus.com>
 <sashiko-outbox-218869@kernel.org>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <sashiko-outbox-218869@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AE:EE_|SJ4PPF946DFAC0B:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f8a62c-94e0-455b-72aa-08df44b636a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|61400799027|18002099003|16102099003|6133799003|22082099003|261009223027099003|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5+yKOQ1hAfrVzccTwlA6RTo8v4fuiAa8ficrZSMOaocEdMQC3IQirDjjvAeMJB8RF9LvLBhRhUzz03EKB9i7IQFtTsYj5E4iQaWlYDKlDROEv24ml+heZNuopda1upqYhAHU7lfwOjuj51paUKBbi+CGm0jX1qcEs61TyV1Bzs78W47Q8Q1NKnPtKt4m3hg0vokx4wmZrWbKeu1Icz7FxlLqM32IsasJnq51WzAmEHTZCUfvLu9kjE6lbfoTZrMlQ9qIdjW+dbzoqmMCBNlslHIawDAbPuHGAIvYZ8Ph0SKedjaJYNmfdhG/nWKqMyyHZr4g24h7/Qw+lvEIAFHLagGJkJo/Ew7mR0WCyQlKvTHnhjD1s7SqU22rTZVdwhbze1xM19pnPIex6CUTj2tpKHuA890NNt1xxYjwQ5Zf2ODS4opH6g8QCdfh/cJxfdVx2Wt0GOts5NW1neZPt5kwfI6pFqHnczWVlzwyrCkxOrLS/a9EKkZy9j0IGXWw6Z7vyLBVZRM3XZ9NFz1UhOO4gt2DqF6+tci6Q/EOGi6Q6ibvXGtR3BKZbuF8dBhYyPU/SK10BkaXzc9tPna9T2qDLA5nNPEJCcGZBwPeAaN7LGqigZJ0X6Y1a/21gDyoIO8DsTflyCqu06xyzBZOncuhAd5wkOAF6LnQKV0wP2E5zYFtlcxodsKowhqyodiWfV1S9+HrjF6uKFyFBKjBWhpopg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(61400799027)(18002099003)(16102099003)(6133799003)(22082099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gMI9snif7yn4ohCUIex758Zj+sRJwKBpVBCvZ8bxNZlwRetZERrqkRyGcyVlLQ7nnogzWqfSwy8AxmgVJcffN4sHRn1TcMaFQbV10gNNoRVv32W8IgQ/HFKZOwPyF2Dwj3RXqFbO1Z7IrGVrWbxbLXVpDY90JjB9VXFZSRVNx2xLmFaJrE7UZW4mVHa1RwkNhUOLDaF9NpZgk71reitnAhbIpHop6OAcHXTz+fMFGIpPKYnefskhn5UFduu7MmAUA9gfiSu/idYRYeKfUi9i8L6YI+CxpK5yC+Ws0eZ+KHSh9Bnx7g23uFA8jGoCxCthPIsS0EBEQDqjRUIumtzMeh5RzlU7DfSVDYh9e1FnK0SBUmfJ8//tJTt8uCLVJGjJASHpAISTMldZtGCQ/USMloMfBMnYstZrinw3Jc0M05z3r30DC2G9e6PRTIJQAhyV
X-Exchange-RoutingPolicyChecked:
	ih5llYPqXIq7cMghkJbFRTp9hoBeBngClZQN8L3KjpExZs7+BGXUfER8yUZE/AUYQVZV806h1Rroc7k906I7tgARIBVFDEBOgK+8WRthC+euYTeewzPEaPjVahSMFANaarOyMvDH2y9qiiiSUbNmB2FaHbv/ZGOxklm2BmT9n7QxniMLDEh0apydrBWrFM7sTtlGsQUGRmYdGnqKK6oKMMYcEY3Sy1UCagmQ+Fk/MnQQ+NNUc9WJgp+zpbchxriQQOGRUYgwZ+00xQfTzMECnoitc9QmjFWX7B2NZCOEjUQ7hJjRtgCsWlfNgqzbjzCY56ifWmAwUMjwC1laFvNQxQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:22:29.8287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f8a62c-94e0-455b-72aa-08df44b636a6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000037AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF946DFAC0B
X-Authority-Analysis: v=2.4 cv=bbX+w+PB c=1 sm=1 tr=0 ts=6afc63b0 cx=c_pps
 a=xo3zWrN9qLO3Lphhql2lSw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=3PsRYpzg5fDOaCU__R0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NyBTYWx0ZWRfX/uquvMCaHxWG
 RaHiERSOhSSHzSpDF/hTIDHDGb6DVJw4L8KI/+0pKgg5FaExMjPGvt+IhEgG9fVunWokAmcH3n8
 3EKIUF38kvsNJxEdFk1u07M+H/XcICs=
X-Proofpoint-ORIG-GUID: AqOb5AeJXB3MXbAgbqGX9HGQCSo93B0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NyBTYWx0ZWRfX+ywEv+sHRDPY
 77Vh+fLhIY//cmIxRVPxeKIFFuyZwgbVHj44UFguFisGnVaP92+268QXIr7MKAMc7oJwAwhaZHn
 KHuzmszmzbmDMepSuOyw1CZtl0oqlcjdrxlhpuDsSalkF+IEEj+sHqbEK1OXe0/93hDvoSovDjg
 J3o9o+WjPCk9+I4A3bgyvqGWxJF7+QImoUSn/knkRcWqXSaUmYdzorbAJnr4H3vM/fZT2UFlQqV
 hKRbBC8AsEGcWXOiNKcXEwPSuiGIlIRv8V1ue5T71FyRdnKJHL6Yx7KC4Q8Ibz4nms7dpetC7kb
 mUkK4zWiKgQ+bdsm5rK44gpur6TUw+aicY2m6gcVHUox+gcXLzclixPUSsmq7VKCfbc9X6D7QN2
 OciyjcGynpXGAHxxs6UtP5yxJZ29FUJfwnQmg+4wo1ctBtukEl6D/vtO9Y1Pu+UOtq5rwmy6o3A
 KyMjpYRcJnA66SvmXWA==
X-Proofpoint-GUID: AqOb5AeJXB3MXbAgbqGX9HGQCSo93B0h
X-Proofpoint-Spam-Reason: safe

On 17/11/2026 1:23 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:

It's so annoying that Sashiko only mails the review to the author and
one mailing list but not the maintainer or anyone else who was on the
original email it reviewed.

[...]

> [Severity: Medium]
> Can cs35l56_test_mock_registers_read() ever succeed on an unwritten ASP
> config or ASP mixer register when priv->registers is in cache-only mode and
> cs35l56_test_mock_reg_defaults has no entries for those ranges?
> 
> When the driver reads an uncached ASP register through cs35l56->base.regmap
> (for example during DAPM widget initialization), regmap_read(priv->registers,
> reg, &val) returns -EBUSY.  Because _regmap_read() only calls
> regcache_write() when map->reg_read() returns 0, the read fails to populate
> cs35l56->base.regmap's cache (and dapm_read() ignores the error), so the
> subsequent regcache_sync() calls in cs35l56_test_component_probe_omits_asp()
> will never flush those registers or set priv->asp_config_regs_written or
> priv->asp_mixer_regs_written.  Unchecked regmap_update_bits() calls on ASP
> registers also fail at the initial read before reaching
> cs35l56_test_mock_registers_write().

I _think_ this could be valid, but Gemini has a superhuman ability to
favour verbosity over clarity.


