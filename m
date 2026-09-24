Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED73C37B3;
	Thu, 24 Sep 2026 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261766; cv=fail; b=c1BmXz5/p6cSAVtgY31Rv3MTUeUqQgIjJD2lNfH/Ie3J7ncuX9cJ6wIEMxkMPLGUXCgrVmnJ9cZAlVmDQDPwRXCTkywWeppdlVEP8+oQWVPHoDMdkC3jIq5gjgIbIi+8uoRaHE5G06aLhY+PvCgnftkrtj/RBpe2qB0k7sK2e+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261766; c=relaxed/simple;
	bh=T1k163diXB+KFi/cW1eaR4gUe3q3fOWY0vaa08knYTg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYedHyFnr8kOBFb9HABFGB1WAkz9cuNbYNy1XiJ3VIgpqWFk1Tu4966WTwvkaMa2cvZ6fNGpJ5AemGbyBY6vwkAw7ZZWFuCQimCVkIioDNOUnNeUhJ175hDu5aPou4XMPUW1MoMGPEtXT9ouSD4414DPSS6lnNa+ea6je85Rr6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=g9WRb0za; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jk0A2rK0 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="g9WRb0za";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jk0A2rK0"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68OC65UH537093;
	Thu, 24 Sep 2026 09:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OHGUhJz2AxUah5H1qhr1Wgp54P7Edazt6AYYl1AE2
	5Y=; b=g9WRb0zauEGlx2kdRCpsEEGT5Qz50dfULdGzeT4DUPUXDp36UyiMQk4hR
	EJ4e1ZCB0nPXzBm+Y3ISP9YojMf/WWb0RDkXGf2UMEZLecUo26+XmavMGzf7uBzJ
	QwkIaiNGfH7Z+Oo3lEn8xV3BrrTK9gVcziYEubkENagugP5pN/24xFi2w8GSo3ZK
	1W0SF+y11IDJR1sA7/3c+ucahEwnWBYndgbbJ3gqN2AvAnDDAkfDNQ/jdeAjmnAF
	BAT2HZoi2L0WXbcuPZ1eQNEHQOlMPT01EbxfSNPy5ZnAx43tq9oS5yiv7je1k3Lm
	kc0NiR5bCvri5K7kcEOEAw8rPf7Dw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010001.outbound.protection.outlook.com [52.101.193.1])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gw13thus3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 09:56:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqvcYIMDTK96FNTO114S4lhw1MZEFTcjtlCFg6elBl67esBwjLqL8kYnFBLxVCkio/64ky6zWkP0ojQHk4Z7T/OGm/E8jo99t4jggAoRiwmUUg8FvInifMXyTdTntY8MF5zC+3GE4Vdp8Lb4I0VjihspZBs4aGn8FLuWrc+myuFqu8NwDGaDDWLql5d5rzVpFmrVBwe/WXdaXEtoor2TUVO2tHvKXeuZTwDMOuckw/SZYFyArRsB+8iQ0erv0zGHjvubrTkfosFN9XcVdwMCfiG9TWBgqpeSBJ84Qp26yxxzukqvF3TecGb6xeyEjxmVocO6+4Wuzk+rLQ3rvVZdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArHSa6bEkNfW2fNjcD6NupZQUE/2F65bZCI5/4fl1io=;
 b=y8/TswNEb3JsqB4J/roMx4vuTivjmsebFxzbrR/oSc0nu9Bhlp/i7U1V8YxwNhMmKqGLCzZG4ZcxDgZTk+L+ZCG4CePVLIN+M9mygPOANrp4UXDWgzduXFeUA01Lgwe59gded0mRRi5D/qeL9gkjhChRDkpUDTjkJuiAKYfH2/gn2aICI8RR1pXQsZ9H6CqyxuKYpB3WI7lOaXN8lUOECRnQ9FwHA1+ftTYMJayN+A5i2ocA+udzlc+FZROs4hacaPO8/UEJal/B2VGqG2fqCZRbW3EPkJm8Xv04vR2X2oxwntbTtVWmXGWSHyVTBuOgadhZSXH7ygzHl0Cf+/TKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArHSa6bEkNfW2fNjcD6NupZQUE/2F65bZCI5/4fl1io=;
 b=jk0A2rK0lgT2t/3aiVG6JrIsCS1iWw4QKyc/2PMIvL9F51hccO4ufWGXMO1aA4cSr1QvFxOXvV7V7geup2nSiNOWs6yx7TNwpmBNf+Ho6t9VACPiOJHs08Vb2z188ei0hU+2LtRRwBeRII3Sp6kU/8iT5eHV3mwOMr8iVBMC3EA=
Received: from SJ0PR13CA0199.namprd13.prod.outlook.com (2603:10b6:a03:2c3::24)
 by SJ5PPFD796AA27B.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:55:55 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::45) by SJ0PR13CA0199.outlook.office365.com
 (2603:10b6:a03:2c3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 14:55:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 14:55:54 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 09:55:25 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 09:55:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 09:55:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68OEtPRB096216;
	Thu, 24 Sep 2026 09:55:25 -0500
Date: Thu, 24 Sep 2026 09:55:25 -0500
From: Nishanth Menon <nm@ti.com>
To: <sashiko-reviews@lists.linux.dev>
CC: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v9 7/9] arm64: dts: ti: k3-am62a: Split r5f memory region
Message-ID: <20260924145525.2g5ymuwsjwf5ecct@twice>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
 <20260918-topic-am62a-ioddr-dt-v6-19-v9-7-40972ef1f663@baylibre.com>
 <20260918094011.99AE01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918094011.99AE01F000FF@smtp.kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|SJ5PPFD796AA27B:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a49747-e628-4bc2-68ad-08df1a4bef36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7cVACIAu7I8iQLZYyu//pZnO+HgqURj4iztbnnUOfxLPMgcD2uLZj1unTvhCHlB9wU2vexixW0Oj0aa4/dxklLEcVI59QTmIvAJB839AKem90Q5bcTjoU5ejKDJT2EWAcaTJ9MDH2Uygub9NCfIdpeNLtOYFItyN93zaFNlj9Xp20VyXJjReBAuO718xIPBj8iTZZ+I860FRCeAhOPy+9Lc5L9dwRqamqchOG/94EYCmYouM31RV46ifNup3d53UOQ/kU0Ytz5yx12IlmhOgV1j4Nq3V7PVJ7902zKgofaQXkpWXZUrzQtoyf0kP0qKnGR9RDUyuIS2fwp6Qc11mXP7cgA0yojU7ifpfjW4pGMVUHlrrLO7/QEJAvP7Es8dUtwueNNzI5yngfDHughFN0N1GqcbDaL3+ujzWb4bleo3+wSLYbM6eIoQ6PlYCO9/H/4tyBlBuLH3VOSX39BArdgjIbkt9Q8uji32HkMgdtpAjkh0V4y7BN0HpZqekJt8KF5dye49IGqfhakXHGTXQAReWRhPuCUqO39g5XPDr68qrjgprDPSq4tSCoqosYizxj7Uw8FFTu7Gldm6SmkhM248r1R0PDhG2E9QUVc8GmkEkLWgNDKg1yHmtnwQswcfs8lXZlWp4XuZ5R0dgJ3U7cg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rFPPcRJyS5LLUiMgaQmG1sbwzY0a91AOW8e5aDk7hp/bfhRTsUoUBcI+kZ+nB51wfAgw4ptvs04VhUPbgMcJ4XD97/1yNabCgbnFzg4TbjMH5F4exOotDAeOjQfuJu+QowSHRT4wLWDEHXfcVHge0+zBCyfTLIBloQe7WODJeoxTqbqMzEt1h98WH3NSHIj9MHBGn8xmDXPniDxGDt/EJQ3hjzIxL70su915pYPNYTSV6gzC7ZZA+uRz/2oXJqmMZ3cq69LCpLGCNWAQkIsjLdc2ESwvP5+uA8BIZETXhu3/vmee9O+J4Fw2BOh2YTPYz5cURrbHPRravwM8uMDPds2PW4Ul6H0Mu0Z3nQb6IDPWUolKNh5BoAMo/rDA12bpqjwTYp0181MaA3GVOXxs4FTTLNOyPBxPoYSGTaIbft0pIEq2d0r83QTLsTTfTDl4
X-Exchange-RoutingPolicyChecked:
	Y3PIvbwbE1x6rt43HKsPP0H7vrg+JyszGCnmcGcp8q2tfbyEgj2hJeFI9VhCJCcyZiGWnpdtiTpm408zWNTinWZ+lKZid4F2Sza8/wWTwCt12ylRC1LCqkotsHWLHaMVdAX9gFiB3ZKHwY2Qu8HwbOGMtacKI2gxJPP/AVnapEx6P4EdrDVrzdOy0MbZiDDfqXkWrr86OYkFs/b9cSoa2Qi0GjPbwtZVIDeOP9FPlMHL7uyjszju7OVMjPTjg5/JtYGRZaEsSqYgn41leNbeEE3CYYoZRhLxtjWFweVCVkaZd2lmQnE5uZsaVas5uZ/YmD7e6FPqyXJL/yCKkN+gPw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:55:54.6692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a49747-e628-4bc2-68ad-08df1a4bef36
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD796AA27B
X-Proofpoint-GUID: -q0kiRWKsnx9kGxDl405GJtqn-HyZRLI
X-Authority-Analysis: v=2.4 cv=YKUKWhGx c=1 sm=1 tr=0 ts=6ab53a01 cx=c_pps
 a=DmgWn/vclFWqUiYYRim7xg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=P-IC7800AAAA:8 a=c92rfblmAAAA:8 a=IpJZQVW2AAAA:8 a=sozttTNsAAAA:8
 a=QTkWtJGXlbzmhja5lWoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2MSBTYWx0ZWRfX0CVBCYJSryU5
 C9SyutrZLkpMMFFLKVsOIw9fIyHGmu5qn08c7FVNjbtbYYTw7XTS9Hh6d6dRVgR4Q14L64btmyk
 Sj7r+XTEWzQqOiMzNGnEuDw3rEarA8w=
X-Proofpoint-ORIG-GUID: -q0kiRWKsnx9kGxDl405GJtqn-HyZRLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2MSBTYWx0ZWRfX4VCRAXbOyJBd
 MXtMb77klFpvGyaVKWLk1ia1tJtqzSVi2IFtp5AhwFAJDPFcOs6v00rV8FrhlILr0bXS+7ipJmv
 Geq4QkeLvjrGhMkoLMgnO/sLF6YTJHRskpjsr8IxsrLY1r5Pmj99nrJHojY+YH6tB4d2KlaOWh+
 POScKIfKSe3KmUBmFUuYs77Wy1Cv0/jL8yjLnOM7Xk0gW3Vc80ZB+g82L3U3DvJ+bpbUTyCmTQg
 HTuV42tSwegKA3kLPEr5zKACpT6uPOHu+KrQNUD6KHa6jH6WpVG6A6StmxxgYPcwUFeY/ef1knl
 J5l9Dp0rirGObwBH14o9sn3F/6VfPc3rMf5j3a6X2wEam9i8RaGGkxxsw/9Bug1GbAEQ9Jshavk
 P8zTzaiuSy3eGyQNL4CJOTj6HMFFxDDBoBs8GVC2UDvM3fuFiZJYMOQJBWE+/x5Lewp/6LIcVXt
 UJpMYQqKWqbh6fc+TPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240061

On 09:40-20260918, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] remoteproc: ti_k3: k3_rproc_da_to_va() rejects segments spanning split memory regions
> - [High] arm64: dts: ti: missing bootph-pre-ram breaks SPL DM firmware loading
> - [Medium] arm64: dts: ti: hardcoding volatile firmware layout into Device Tree
> --
> 
> commit 33643294863f45f1ac37617eafcfc525d230effc
> Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> 
> arm64: dts: ti: k3-am62a: Split r5f memory region
> 
> Split the firmware memory region in more specific parts so it is better
> described where to find which information. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data.
> 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> > index 06d4e815b1670..94c1d60d8d7a1 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> > @@ -65,8 +65,14 @@ &wkup_r5fss0 {
> >  &wkup_r5fss0_core0 {
> >  	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
> >  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> > -			<&wkup_r5fss0_core0_memory_region>;
> > -	memory-region-names = "dma", "firmware";
> > +			<&wkup_r5fss0_core0_ipc_region>,
> > +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
> > +			<&wkup_r5fss0_core0_lpm_metadata_region>,
> > +			<&wkup_r5fss0_core0_lpm_rest_region>,
> > +			<&wkup_r5fss0_core0_dm_region>;
> 
> [Severity: High]
> Does this multi-region split cause a regression when loading a monolithic
> firmware ELF whose segments span across the new chunk boundaries?
> 
> Looking at k3_rproc_da_to_va() in drivers/remoteproc/ti_k3_common.c, it
> evaluates segments against each reserved memory region individually and
> lacks logic to aggregate sequential chunks:
> 
> drivers/remoteproc/ti_k3_common.c:k3_rproc_da_to_va() {
>     ...
>     if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
>         offset = da - dev_addr;
>         va = kproc->rmem[i].cpu_addr + offset;
>         return (__force void *)va;
>     }
>     ...
> }
> 
> Will this bounds check fail and abort the boot sequence for any system using
> standard firmware linked under the assumption of a single contiguous memory
> block?


Do we need to protect with something on the lines of
https://lore.kernel.org/all/20260921145325.300025-3-richard.genoud@bootlin.com/

Could you please add in diffstat any comments if the sashiko reviews
are'nt accurate from previous feedback?

> 
> > +	memory-region-names = "dma", "ipc", "lpm-stub",
> > +			      "lpm-metadata", "lpm-context",
> > +			      "dm-firmware";
> 
> [ ... ]
> 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> > index a8c794d073431..7cba3ff99e6a3 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> > +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> > @@ -65,13 +65,37 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
> [ ... ]
> > +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x9ca00000 0x00 0x8000>;
> > +			no-map;
> > +		};
> 
> [Severity: Medium]
> Does this create a regression by hardcoding a software-defined volatile
> firmware layout directly into the Device Tree?
> 
> If a subsequent firmware build increases the size of lpm_fs_stub beyond the
> 32KB hardcoded here, will this crash or require a lockstep DT update to
> function properly?
> 
> > +
> > +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x9ca08000 0x00 0x1000>;
> >  			no-map;
> >  			bootph-pre-ram;
> >  		};
> >  
> > +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x9ca09000 0x00 0x97000>;
> > +			no-map;
> > +		};
> > +
> > +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
> > +			no-map;
> > +		};
> 
> [Severity: High]
> Does the omission of the bootph-pre-ram tag on this new DM region create a
> regression for SPL DM firmware loading?
> 
> Since U-Boot fdtgrep processes the SPL DTB by keeping only nodes tagged
> with bootph-pre-ram, these split regions will be stripped.
> 
> Will this result in the no-map protections being lost, causing U-Boot's
> remoteproc driver to error out parsing dangling phandles when attempting
> to load the Device Manager (DM) firmware?

Is'nt this valid? why would we let R5 SPL or U-boot SPL think it has
memory access? Adding a comment is probably worth in the code.

> 
> > +
> >  		secure_ddr: optee@9e800000 {
> >  			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
> >  			no-map;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com?part=7

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
