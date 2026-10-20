Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792504285;
	b=gUlHI8JO8TixdLVxDezrRmQ6nWlpV2IJrRyJDqQfGjpZ4gYWoWSK6GnSmBMOEAgFPcZ0
	 u5+yODtl94C8SzTIkUxoxNR6w1jY/X8pbRJnVAs2O++5Gl96J/GLM9G4ZQMAMaA7Id//5
	 mkV3tGED3nWJZoOBsh6XPTF/4GPlgk5bfSUdHdf3GVP8md3QAak4IcxrFwPYgqpdhZIaL
	 Z2pqBhC0783XebR64QTFHFm+QmGE6geCZeF0wTl0c9e4kBtWhyvw6ca4gS9iSA2pNwchq
	 bMZrlNarR7G+ogQjwsxwrB0OCY2V4A4EyqtJnrR4oLdCXY4YNafnTfXURGyWR2DuC3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=EHqg258BWZntflF5po3NCq8BH9DfpoXvHDrvd3fq70w=;
	b=P1KBeCJk4xnpfpmSXk7ipW8luQFvFprb8xAHg/oHBsTeArUleZzrUXDisVRvmZwU7axR
	 Lap3slGkyuDPRPtbu1qcqS9dMU9UhAn4cu5ElYeBM+fUsYsNcz+JTapQoTEDD1Vg9cu4G
	 1FgawnJ/oSF98RBLM4EjIGzOHj4peUS+faN8Y/xLxH4XcSvFgBEIqmnBYw3LU3nmWWG7h
	 hpxh7yDyYOrGc7s341I6ab/H7UjDSAjYFcp6hMWMJyUt2oayQ9M43mIUBi0o1NLGki6Gq
	 SNbehDdIDhRQfUDXrIGgomsA3w5DDK27pKh8sRxVoLCUloVjkaMaqvoFudc7ZA/dchg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=H+drq3Uw;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LS0bQn3r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4822A606A320;
	Tue, 20 Oct 2026 13:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4822A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=H+drq3Uw;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LS0bQn3r
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDijOq2128558;
	Tue, 20 Oct 2026 08:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=EHqg258BWZntflF5po
	3NCq8BH9DfpoXvHDrvd3fq70w=; b=H+drq3UwKxf2heXPUILvNoLsPtI5jYyaTv
	Gi5Cut4up8h2LWNf1NYXF6L/Mk84jnvaA9Bm8eH5olDzcbq63iJlqzq7kOu9iE5+
	mR+PaNAgD6i82RPoUoMEWiK8jcoQWj8icvsVW1QrI5Xmg/8EydXidq4u56JjNRyK
	u0mD46vETJGmpKPQ3AwrVEQQ9vlcX8ftNODdYxtGIpI+Bt98yUM9CyRaKCAdx2kM
	ENVoL/eYs4TrTjwENq+M+9H3R5Nseul2E9h6P8Iep3HcKwTVjo8KAEtTRB3LNes6
	qtACcVkyRXG9b8fxkrNvuXw0T1wO66Pm/pHoIjERERsqyg4gAi+Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020096.outbound.protection.outlook.com [40.93.198.96])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hdw5b0x5r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 08:51:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGQVK+C6gztpWl+r3CFisSryjo8ZfXdOwM9QUHW1e9DvFU3twSNkl6orH1LEI8dHXxwgtzM0KTwJam8QEthZO7HzFQsG66/RZnL67qv8v4Ej2nYlyJTVbEIHNfIpJILOn5CM9LxZnBjbiYieu/Ut0xDDZtGJmGjtAf9VIO+pUTTDIiZpyEJlugaGMw5CCqjYi7oOYkK/O0Mab3cheuUZpndcpoBrFPWmrapteAbFaNB9y6NSVzeCtMNwpCD5Y5qf+YLNBUng/cXYXaxKzMaDpCvmZdSLT4sr2nig1nYbTjdzp6o8DJYE9eunSFtVSMCr7quLk3xuKLEkWnvsj+9uEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHqg258BWZntflF5po3NCq8BH9DfpoXvHDrvd3fq70w=;
 b=DIYSVujHjWxXPxtDarolWEdM0h9Z61gSFYhIz8vXd5EFN4WkrTVHmmCcJdr8bAHRr2dnqXsykCUcP/amf7+Fx/lJbYteSv3fBLAKddhpFv2DrjySE+P/hORWP/nGckYSc01abmq92vSaNpyRhie/jZAsBw/+AgTD8pO/012l6NcK9qjMdI48gKdEI4FX/7hpOZGDhYAs/+V4aINsdvHy3zHT24PAuMps7hrHxN3nTfqnfgt5ovWrwKZCUN0fgMtfa3G+WR97eWWhydQJvkKiTZ9LZQtwfDX/SCvtXWKhI7R19ibJ/H5SuH7ANMjBQ+SKtddHbJo2fjkCX9x/3/esyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHqg258BWZntflF5po3NCq8BH9DfpoXvHDrvd3fq70w=;
 b=LS0bQn3r2VOma+Di4ASbpLUndy0Qz1jCV9TVzwk/NSUjHqq3xGdoFyN5whSvyitAlZkDxtsRU6CLECRog63+qB9tvqrUleZ5GF5HSeEqmYbpZRN7KVuCKAnpIzs6JpyiWE0c4ql3M4EiuA8TSKnOvqNGDwmBzxJLOv9ybFERF/k=
Received: from CY5PR17CA0042.namprd17.prod.outlook.com (2603:10b6:930:12::29)
 by DS7PR19MB6045.namprd19.prod.outlook.com (2603:10b6:8:80::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Tue, 20 Oct 2026 13:51:09 +0000
Received: from CY6PEPF00000047.namprd03.prod.outlook.com
 (2603:10b6:930:12:cafe::5c) by CY5PR17CA0042.outlook.office365.com
 (2603:10b6:930:12::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 13:51:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY6PEPF00000047.mail.protection.outlook.com (10.167.247.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Tue, 20 Oct 2026 13:51:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BB81D406540;
	Tue, 20 Oct 2026 13:51:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9DA7382024C;
	Tue, 20 Oct 2026 13:51:06 +0000 (UTC)
Date: Tue, 20 Oct 2026 14:51:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev
Subject: Re: [PATCH v2 RESEND 1/2] soundwire: Add a helper function to
 indicate a device will detach
Message-ID: <atdxyai2dFfkbLUj@opensource.cirrus.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
 <20260924120520.2511081-2-ckeepax@opensource.cirrus.com>
 <20260924121706.432811F000FF@smtp.kernel.org>
 <20261020112658.GB1795367@google.com>
 <atdZte6J62k0QCEC@opensource.cirrus.com>
 <20261020122252.GD1795367@google.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020122252.GD1795367@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF00000047:EE_|DS7PR19MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b83cd0c-607d-4470-38c7-08df2eb13172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|61400799027|22082099003|18002099003|16102099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	H4l8JxG2D/xsvQ8fb9FmAYT/5c4tYdNw+OK02SnkClvTxn1f833IRe//Ma7v0ifBjkhoiOn5cdHd9p/F1D5zgqKW8MpdEOoOhjhtiky7rqc9TSXRU2k7Lb8J30eo2q9PwnfGyxEGpTXGgGSnZU3uhp0p8HhmzAkQ0m0emqiHDJvF/1F8HZsLFWzaHCGpDGpPVr69gIyNyosZAzZMmYTG4mCE4d9Qk7h96LW86rsKppkEMmqoZ9bQVaJevLbCrLp2EX0ctlYCyYPiX/ZdReuO2U1cEKrkyviGPTgoSVMggX81tymny2nSzAaAkqPJiNWr2zs9yPIOG3A4n/0WYiLyUKR/O/tPsToKpae+CxkWmAZDvaEN8d7PtaNxOnf3z3tv7w4iKZ0NvQp17aTUrztZwuVhSuK1ulJEMldnzScFUQgtoV32XaPotWOpoBqxvQDjug6WtcFlp8H3zg70wuRLKMwg8ishRHJ6kvhA3knKHKTbqVA8JMqvfywERryNsg6E3A0YrvVF1oOWRkVw4G50rFQ+KP2M4W1byqwonoC1twx6NyBZbhh4gQ3yYbFnmvkYtSIWUz7VVOu7Gq6OmzwFln+3FU7gEdgz4wfDz6CegyrA34J4G8yLK0gBbHwHVPlKXNszUFWKLl2As2I98Dcw+X43Y+XDsA5ZAUhgprfw/5JlQm7aMAhf2iOdd7TdWWZ5mJHqOMiDaECWZuPyLN7iKg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(61400799027)(22082099003)(18002099003)(16102099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Let5+Hl3uXjf294Atluigo5xns5iygsRCszUM8bMYPHPsrqqDMKLAMRTS+iwoYfjou/ua16+yj1GaHFeWYWyS3/qTiXPuMQTlDt3QaHTmu29iEiJZ5meASU0AkMAW193gJZrI6QMkWaO5aR7zAFIOkVORvODI1XrWhtVs+bhSaLASbNdxnCNauO6q/PNYERN6ZCtoyOhU0epum1Snr2tYTXLEK99tcL2HRwpsdgKxhuIyM5Gu3kEF2vhJFnRuhS5Rg1nAKQ24Iv315DX33mvz+MjaAvYUf9OQSiOXZyswdvwa59dFhi+FtEl8LRbZnTZMg6XY5FEVgFXOj+uTBSnp9PEoyc2Vx0F9ItgU4CaGk4ux/BifFiGMOsR2sIhIDtDd1bSC1+qfp5LYCtLf65Bg5uMxGs1+YWnq/yANW2hD4aT9k37jxh0M0I5tfb11R/p
X-Exchange-RoutingPolicyChecked:
	nYdtDh1G21z0mQvrDU6p3JRDvlKW3uU5KNcO6yPjj63eSgvOTt0/ggK9S//14yuemBIwxMv0pMhxZE4kwT76QIaZI07toONsKybrg6xFLyG+iNqgqNQOSuCV1AuxxD3NTix4FX9BJldxFmBN4boxeQKq8RIVddLoR1e/pP2xvsdrLR77Ir7b5qOovI+rlwq6idX8JgyLiKR/m1tGM8QXfxKpeNyJEHeIamG095NVO5KdotCm0QGWZiTKu56aOZJMwzZdZ4EhEIziLeRoejFuUkDBrzXFZjISeV9Yq+f8z6DyHrWqaspg9gAIBDy+1Xx72z9nwzFi/n41yvIw8pM7YA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:51:08.0614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b83cd0c-607d-4470-38c7-08df2eb13172
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY6PEPF00000047.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6045
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX54dP6sc6soet
 lC9i34x1l9NK1gjRq67RhZIy2U2QkdRZxy7xI7X4rs8T0Jvtvtf2cMbvSSSTr/M/G5ySPH3rxvZ
 ItQWLN16VVawnHlbvM3R2UczLiz4/HM=
X-Proofpoint-GUID: a2vfh59zGl5pjWmAIv046nSNpUKkFNkD
X-Authority-Analysis: v=2.4 cv=HOlWhYtv c=1 sm=1 tr=0 ts=6ad771d4 cx=c_pps
 a=X+KnjQQYfwFy+jvgOSkpsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=vfYWI2cJcXnOhAht2KIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: a2vfh59zGl5pjWmAIv046nSNpUKkFNkD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfXxhkopRgEtxCG
 FLsbgz15m8YJdjzHX2tN3UA14dRdUhhoUjiwUEk2SDqkNNtHxzgpsDnZZ6e7EqgD7OhQZ1HiHwi
 vRYoRneL0jWNlW/indZHZNH5/CJSX15tN5FBJa3MSXw2wEiHdPQ8WAIRDm+0QdXcZU38YhUoiM+
 QVgep7syZY4+/pM3xwcZsmShWNuKzj33nEROg9wpigmygfGVQgIqd4eFzD2etLNGboScjfpsn0c
 GtfkFmfrXKjav+5Kh7HPc5BqJlZo50fTUR4zJya58mt1E+ri8pNJdYH2yorRbRPnLluGBypxPBd
 N9KExRUy0OtFSW8eL27PYVtT2/sWb0c5itPCdv5gM151ztjGFFNH+pzwA/b9DBm3cFP09R6SdV5
 p8Xqe2DXRDLUfJ4vnV2J1I7pET+WGq10l/ptwQoZQ0GZSUvXfXi9bgq2ppyuthz01captxsxNCc
 h2JImeeg5C9HnuFFa9A==
X-Proofpoint-Spam-Reason: safe

On Tue, Oct 20, 2026 at 01:22:52PM +0100, Lee Jones wrote:
> On Tue, 20 Oct 2026, Charles Keepax wrote:
> > On Tue, Oct 20, 2026 at 12:26:58PM +0100, Lee Jones wrote:
> > > On Thu, 24 Sep 2026, sashiko-bot@kernel.org wrote:
> > I can do another resend carrying the ack if that is helpful?
> 
> Yes please.

Cool yeah can do, I will wait until the merge window closes then
do a resend.

Thanks,
Charles
