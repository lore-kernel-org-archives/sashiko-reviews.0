Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795155365;
	b=dAjz3aCz7MBykUgtM/nfoj0ntTR41qdx7OKRAMIWG3bE31NvNrFkbPVT1FJDpg04qkAf
	 U1R1c2NtMTY/2UCvNQwq4YAR5nslXQouNl3NR7d0v3ZT71TBurfxvqqZ/1vyajeXg1k+j
	 GZHmlIamAjhjpjL8S58mHAC+eA+aX+mFosjf7rexwRl3YLRB4MWb1+ZUwhRTcCs6sBWDe
	 RUsdc/CpZjLd2448AyVMgF47Q9F6azaRd0uW2giBwV2XuUJb5d2tA2XqWFXMb978mho6N
	 93LsNpxej1rTicwBtdoKH7kv5van9IUkpCbd8qn5jSCPsZ/En9TO9XvWTH9GiGsqPzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155365;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=m4tshxTQDRBAA6fO2TgUWOppJiliCvGjHhGeaxVNjzU=;
	b=Qpy7jvKMQvGjfkUugGHPqpq/LRjcfrLgy7tlCIMj38FTbdV/tL2ux23gEHYqnXy/WKVi
	 EK/sj/jq4Sl8y/TlpXqmO9hpwrsOQxMkUAoDo0NsDdMWDegK/u7v2wUeZUxBiYOzZKFmJ
	 kQG0zqhVkprU0yV/j2IHx5FrAzkPT4ZPRR8KLRZdv5wYpvfm5qJbvB/pQ5m6gfXKpb2EL
	 CEdCzcjPmGqbtKNP13w06tFMwvYFqTd2hKiYOCK8knge0GckF+6WFMwlmqngOG7cwT8Dy
	 yYxEVRfECzH2fAXcb5pDnNAInkiQWPeEwlpfLnzDWKVC85/7WjbkJC3Rbuur7mpWZgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.100
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023100.outbound.protection.outlook.com [40.107.44.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282C3606A513
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 06:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282C3606A513
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duNsLprkBkGoOAiimk8dmfcaOA/ie/nxmBpwGOID4Dd17r73rpCu9BWQ92ZNLWB/SwMR7mz2gT7ChEZ1Eva1zTW9328ppGdkcC/2drRTAPvk5Dv7ty8o9OhkluWeNRpeuFtwD9C8z1ONbko6TAbno0ruoYxq/avXUcPfgZX+eVp0/DfT+aXG7dsZ75I2EtS7xU6xtqljefRnY9KgNr6uN6UAQRZkb6ZT8LjE8YbryBvi8PJd23Lil0mOHcmFtTwbSSdCIm3ql31SiGW2P5/UxlO+M2Ai66TihB/uMOWoOMgj9Q0x/0C7+vAN11w/4hObXFOkXf1H+deAEOzJDwaQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4tshxTQDRBAA6fO2TgUWOppJiliCvGjHhGeaxVNjzU=;
 b=LB/zZCXjNzWqSuX0DRE/TTVwjW82fi80rlTJ3WeE5RRNiWzUUW9cLY0L+YWTjR/vG4u6sj+D9X1eJlP5F/PjVRO03rdPQg0NAzV5rLFdFxMDGlzZ37Kt8Ba7AAAM518XSgTEoSURdrPlFU+c6956brywGglSrhHA7XbAM9TyS0RKpInf5CtEMQgv30ZoR2K8dGzQxnqjw9G61DlZxgmHR5ompjZb8WlJyEleE18ekZ6PRjmjbYQMDeCmD9IhR+y9P2BkRtNqUDPamzzWoBk/f3ajoymjx9B4UdeO05N6njRkxG5V2cZhgHUJT2RQnjAe81e8wEy+NdQ54lLUrEqqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0093.apcprd02.prod.outlook.com (2603:1096:300:5c::33)
 by KUYPR06MB8603.apcprd06.prod.outlook.com (2603:1096:d10:8f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 06:15:59 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::69) by PS2PR02CA0093.outlook.office365.com
 (2603:1096:300:5c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 06:15:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 06:15:58 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 096D5427EFC3;
	Fri, 20 Nov 2026 14:15:57 +0800 (CST)
Date: Fri, 20 Nov 2026 14:15:55 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org,
	conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v7 04/10] dmaengine: arm-dma350: Serialize IRQ and
 termination state
Message-ID: <av/lm+np9hUJlpRm@ubuntu>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
 <20261117094335.1393735-5-Jelly.Jia@cixtech.com>
 <sashiko-outbox-218565@kernel.org>
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
In-Reply-To: <sashiko-outbox-218565@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|KUYPR06MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: bcddbe38-cf75-40de-466b-08df46cdbe29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|22082099003|4143699003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XBZrAiNQwOx6IfQqFouH5I/xM1GngwW8JLIwieEzKuyOGSIHpVoL3IUgeHNvO52T8f4Jgn3r9F7acAuPb2dpPbWkro3LGcyx1AnApbyqJBbtJYU9luq9GsgU068RhxAdjaSneLevKPV4naJlS3yMRBzEvsiCu3ELo6qOsfkBHOmD7+nOzfYyTNPST2KYCOvsnI1P7plvkFaQpBOzdOSTbaoGEOYezETfF2Ud7hVscZAfjYdKsJUL1HgMtXA5TL4KEDDXLIGb0AO1GLg4h0j54Uw0CqEfMBfTMLhk6T1ZhyTW2Lu1qrnitF8OguVaLFLpQQ5+DbaJUXjlWksNy8gmNjeTjSDGvAc5KxsfmYdRpaw4MecfaJ3iCjD11CQgnnbwpYH0PKt6DCNVPSpH0wVjg29LBP1agtbZjPjIECQeBK/LfZU9AuZ7KZk9fq0LFJcNp3Hb9Lvq2rkRVS7UEtKdaaziqxWT+s8Ya+AMp8dOuLL4YUfZn3lxsFOYIETde1x8M+cCzXJD/gAFtfNTz9PakUFPP7O0CcogqGm7Ct+UACq8wxPk7S1KjkMktwG4m1UVAZH7gDspqeh+WWBpnvc0vR6tbPVTTRr5ALvFSCMBjJwIRep4eQQFwNKOxCYAIoIDA/VEn3Zc3k7Mz/xdpIRuzjEhYoGhTKGXO/KSozvvSbfW5+KiYbWW/3qDPkcOI/3L7vgFfsMgV9dC6nWd4cbZ2A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZCQXPRU320bAGzXPiGBDJ/sWWu6vEzcUKJD0+13ojEGRMZlWnkPqCBTuqxJuWt4YoSJtfkpQn2joiO19zi3JJoGJEpvrEE7pCb0YrlDNn8Gn0hOQYf/QTYU9B0Z9M8NXAgQIgxkXDXSkZ/Ddr0zWi42C2+ckrHsGP8vcurtANwB2pVCigYsSuEQ7AqRQRI6VN8bcv2EXK0AWIKqPr8z/mC0blB5/uxeHF0kUcTiYQtvRSgCFsi+7OTxyfEDRy05Vwxr0yJsVaW68TbyivnqNElyVmqAn0eS6puonjZEkL5xgs17p/paTgnB6lX9+m9RNTxAtc9KJey7vaAsB3kd5vbvXfVhfFNE85OzF/v7/YtaBk5n016x8GhlJ/o3x9RBSj01dRwgKjAqxlg43gw4lJG53ImAiuuQya4pgNAaNsWky6ccyTP9W/3M19tJHQ/Vc
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 06:15:58.0314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcddbe38-cf75-40de-466b-08df46cdbe29
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8603

Hi,

> Can clearing CH_INTREN before stopping the channel leave CH_STAT_DONE or
> CH_STAT_ERR latched in CH_STATUS across channel teardown?

The status bits may remain set, but I don't think they can be
misattributed to a newly started descriptor with the current locking.

Both d350_irq() and the call to d350_start_next() hold vc.lock.
The IRQ handler acquires this lock before reading CH_STATUS:

- If the handler runs before the new descriptor is installed,
  dch->desc is NULL after termination. The handler acknowledges the
  old status and returns without completing a descriptor.

- If d350_start_next() runs first, it installs the new descriptor
  and writes ENABLECMD while still holding the lock. The DMA-350
  TRM, section 6.5.1.2, specifies that ENABLECMD automatically clears
  STAT_DONE and STAT_ERR, which also clears the corresponding INTR
  flags. The handler therefore cannot sample the old status against
  the new descriptor.

Also, section 6.5.1.3 states that clearing CH_INTREN does not affect
interrupts that are already pending, so the INTR bits do not simply
become zero when CH_INTREN is cleared.

This reasoning assumes that STOP completes successfully; STOP timeout
recovery is a separate issue.

Best regards,
Jelly
