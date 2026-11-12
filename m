Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.229.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794453610;
	b=RFgTgaZ8dPK9ecMVlBnVxCojRUHR5K9ZR/tLC8zchJZv+XqNTLY7URp+l2eEHVfrhdfu
	 wq7yyItUl0mXKKTkFRGjOvg4X4TyhF9ieFIa3fqsmDtvlaeP/uyjubjtISaVyLna/ieYb
	 Yh7Y+voPwLlPUsDVWz8lCIZNPSUCMzh6SiKLtDIxuweLPumStJMA7Dzk+UDEQY42r3hiH
	 zv1rUzBrk0EaOYahti7FWNX9fSt8bOTX9aJeaFmMjv5Hh/gKfgLw2BMRbhPWjpEoj662X
	 19tFNGv8niCEXl7AFEEySbVQwN0YHBZUqF7qwz3sfE7Pw+6oNfg3nWOGbSqkvEomgZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453610;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rxARY0OkXlDmA9IS+e/TgiLSFsCaXaMoYzj4W9AepGo=;
	b=v1nUotayOLhrDXQIpbQDaRqf6bcSVFkrCIyQ3yVlqpY23MVQtjyERY/NMLkoRiVcPtph
	 P5XClsLmXzLMMLTqu+8dIXt1ZUVXTsGU3SXvzbaoAHLrlg+eqBG1tmYlp+QqU8qxEEGbe
	 94TFB94nf64ZKN07F5Kz0fBVlH91I6RxS4IsbzvPDLhyqvnC6ezGaNWnWJwnVev7dMwuW
	 w6t9ae4qiOSSG4znMXjzgNlHN0oixt2uUPKELqRC1Ts06lLx6wzTht+/wnVwe6eRW7Pvw
	 VXeV0kk1ahNzTA92AuAqEp3MOJCJujmLRBTI29nOMK1UCmNMmUjfntun95+Co0rxPWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=oVldV2Jo;
	arc=fail smtp.remote-ip=52.101.229.59
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45C3606A33B
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 03:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45C3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=oVldV2Jo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDbaUO1IAv7vaLXI48jf8WEEszeb9gSIzC5L40HBpcz6XdXIe3D3a7ZG4fuUjGRcT/qDiAW2pUPSksVLD5k7WE7LUeIWJGGPPTWSgfnkl6V17cixhsEzf264wslJMsvkig54414MDLWzSUnACL+VYqDU6erGkWJNeyw0DgK3jfo5kuMGHzZgRih0ZmP9mxi0DM35hTNU7i76116c9Wts9Qu97PkBp59NHF9iYSrvUjj2hWbhh0uDH3P8+9PvCJ8h4An4jOWkW1RsOY/E2/ubYjA8Q+/Swu2HlagNY4kGiD7BwdFoNbCNRKlyeJvtnX8buds0bLYjMu3VlrvdbM09fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxARY0OkXlDmA9IS+e/TgiLSFsCaXaMoYzj4W9AepGo=;
 b=kl9U/yhm7u2TtW33uCPFC03PQyj2tKIvi0DBwIuTNjvGqKNzydlfV/4F3WhL+TU1iz2L8N+60sDV97frUnuoPi1CGjLj5RaHJSrn9LKf7A8WgpVMs6tBkE12YkTnqoKCzoeH8QkMUMg3KKEvdVIA4qcKxjCNbqDGLu5t9lNj0cKsDP2u+rsgB8aBx8UdIL+/Y+p+HGrUcF/oG45/udgWuIgT6tLg/qLdB+3pxe8M/LbX44HuxP03aKMNjtub+MWiJzBhBT1elYJq7g1fWDy3YkhDip8ebKNzVzoh0I0sj59w8kGYYZh+EUi+3qHeKQrVl3mlXv7iAryWvMrnTfpAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxARY0OkXlDmA9IS+e/TgiLSFsCaXaMoYzj4W9AepGo=;
 b=oVldV2Jo7WGUFo3mv097VYHcpBJHum7Cf+DRwf+Ihkb1DUT/+HLbCv/JutYjTDPbw6pYnlE1muX2E36Of8xk68vpFfTkcelkbywKZrh1qcLEiJ72RR34cwiguUOrg5pC5ivgrvpQUHJ/phSt3TVNwndaLhyRfeVCv51ijUpt/vc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB9617.jpnprd01.prod.outlook.com (2603:1096:400:194::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 03:20:03 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 03:20:03 +0000
Message-ID: <87ik22zqfx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 09/27] ASoC: soc-devres: use snd_soc_component_unregister() for devm_snd_soc_register_component()
In-Reply-To: <sashiko-outbox-210088@kernel.org>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
	<87mrre28kj.wl-kuninori.morimoto.gx@renesas.com>
	<sashiko-outbox-210088@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 03:20:03 +0000
X-ClientProxiedBy: OS7PR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:604:24c::16) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB9617:EE_
X-MS-Office365-Filtering-Correlation-Id: 6251b16c-c879-4f90-d181-08df406bd7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|52116014|18002099003|22082099003|6133799003|261009223027099003|5023799004|11063799006|56012099006|4143699003|261021121427099003|261102123227099003|10067099003|261021123027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	T60O6kz6KGBMhsetLNBOcpvrOZ6gsNpyMMZGsAvwbvBqrIAl4rlN5u5dATfa6p6f4plTAh2T0qgIW4reSJK7lz5Gcsk8CJTfoEAYEiCKFNVUeYmWGJ7t6iiNO/QgddsP4slV0rElyQzeJOxxUUQaZ2ZT82oqmTeV9Mfpp8JGerPvUFh3oFflkQKk1q6SsFy86T7gkHqieJkzKS/vDljygZ6XdjOcEqMswAcFUB7efa2SsGflF0zFJcTterD5xSXaL00UnbcR3Sts8VoB/FIWTjMWW9O1JZrsllXpijS5jusBS5Ze5F7zzJMD1gDIAkXq4pCgd/xBUC2fvdRWlj5A6mKVO65oum0VdCVAiOnpD1nrDQWPhV+wS3LQAET0zTTfpBxz2O6NoJctWJuBdXPp/b5+3tO04nBryP5m/SBksxRhLmDFU0CGZtyLl/Xm6lnqSjRdPkpnwfnT01sTqMD7yjk+GAXmQ/e++W2bw2IbchC4XO9qfITUgLE6JLh9oBNInRt8srbxJ2/AQFQJ+Kb220g5WDgenwNDHwSLfl9RTb/Kxc+Kmucoqi9QUizuCOr1s2c/TLpREz69WGGbynuiDY0RdXqlkgVTX42Q4iscAS7MmxyrYT1ubBN5b2lcnyhAmstZoVNkNcvDO1sffNWDrcVqey0LQfV6qOFCAZo+TAV7Uy55DqDGndPzhG99UV6UUK4PZDdDQ5aCcMEyN1JRN4y4+JU2OyanFgxjTCF6P1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(52116014)(18002099003)(22082099003)(6133799003)(261009223027099003)(5023799004)(11063799006)(56012099006)(4143699003)(261021121427099003)(261102123227099003)(10067099003)(261021123027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Lj6KTsyG02zeQxyK5A9aLZgUWpmDvW47gWPcwuoWKZlHV0GKIBs09MlB9QE?=
 =?us-ascii?Q?zt9/JYV36y30+7XYCVBqxIsiXUnMeC+uNDe9MLgeaaxJff+BpaAypy6Q+sfV?=
 =?us-ascii?Q?eG/RwOntXzSPfgyBUlSmExokvZ/DmxDU2aYJC5/ez9yV9FDGMPQmrkdWGgq7?=
 =?us-ascii?Q?FDKXL5/HoydcW1jY/6E4JwkGUPS0IXFaGJq1O4IcGZzg8EBEahKgMhYADqJZ?=
 =?us-ascii?Q?cdvssC4LXua7oO8HVklMC6JFxW0MUM13J5120wJv9/dcS3X6TXZIeL0DcbVN?=
 =?us-ascii?Q?jYSEg6Gj7Mcx73A/XcUPTHJJ0W8cgcvCyK8Jc/2Di38f7bqsgVzw05fMH/H+?=
 =?us-ascii?Q?4uYmpitzF9xRoFOZjwmxPteQlCf8w+Z2iGM1rMiVME0eyoBwDgTKLlymPJ64?=
 =?us-ascii?Q?o/5WvIXBYK4twxIfNJEvVZAQI/za8fSFkgoT+ndjfFLvscC4EnDyriJCtDwW?=
 =?us-ascii?Q?TKEbvBb8bLGE5lMO9t/obkr5t+Vq4SXaqPZG4ij2YhEskZobU8Qzb2dQcv7o?=
 =?us-ascii?Q?T2OyRgkQ9RKo3fu5nv5kNgHBw3d4h6txu++gTF4csSdnVv01szUfgjsp+1nm?=
 =?us-ascii?Q?49KMXdzQ7C1y9hzF8JSqs2Wx8usX5BKVZQRzHrhLOAIXdTqBU2nhuFGbTp/h?=
 =?us-ascii?Q?LFJ8J7OF6FNSA/x6mTtcfMQSY2h6Ps/sdegsX/MDMBoc90guA4k3QgkRf5m/?=
 =?us-ascii?Q?0vqmuhukZkq7liBc+6Dm5upDe/vSp17LHiwtdQnyhRwh0X2fxANSG0xD9B0M?=
 =?us-ascii?Q?4O+Y0Hpd2AUujvWAxQOQkdOIFBV+IUukDrB0GypCUH9CZJ53LYcqY00qDRaI?=
 =?us-ascii?Q?8iub9JbvtG4uesFuTtRs9jAzJQD0DRXQTq2F9OH3jjsNYdGYRYHUm/oHoO47?=
 =?us-ascii?Q?qsnay5UwMmL59RjgFiBFQyBVZkThBM1hFLC0kphD7qbaWnbsnR9qK393YZIv?=
 =?us-ascii?Q?3xIUEM6pKCf3sRys5HyI5unzTgye7VvJwONXpupUw6t50f+pR51Uyzj+2YfO?=
 =?us-ascii?Q?aWr7SMx9KbnH2Y1rNL3itFQqG3y4WQjU6guB6lpvEXDpbinTlePqreH2l+cg?=
 =?us-ascii?Q?NsLb2K/0cECbYH31bo0PL6Jm94aKeVLA1OSXlps7yTJggoiJPFgyHZRLacqn?=
 =?us-ascii?Q?HKu4K4mMkxKO1DBpBR3goWDPIU6ubjRPMjJg0pxRJVsG9fvJ46DtLeysTKrP?=
 =?us-ascii?Q?e0iBgb/a33MxFsu3bUwU85oDaHdbCmFUTPN8NZpoI/5dLEo+C57FFOSZN9NI?=
 =?us-ascii?Q?sTk6q+RJ1FMkYFK7CoTsUPhGxSGypWVnK2ykGgfUYj4hhY/yzPCgUkcFbeja?=
 =?us-ascii?Q?5jFHeggLQ5Rb2trar3TA+zXadxzPf2J3SikZwK/i84KFyYKA1em7YV6G09Ww?=
 =?us-ascii?Q?/P5p02UScvup7DZ2L6+6+U/yh8LBoOP5GptLDI4Em4XYcc7BLQoLY6nEaJmv?=
 =?us-ascii?Q?v1ZaIFj91i1Oghi2iSV4pkfgz8aJVM0cYQ5De38R71h9cR73oG78rLAbm94J?=
 =?us-ascii?Q?/2T2nUom/wzkD99X5Kp40Cybztx4/ArlTWtCc/Do2bFD3/fEULHlvG7g7Q+1?=
 =?us-ascii?Q?AdhvZDoIVHS5l6ZrEVq9tLOg1AynyLkyHZ6PZ3RVMB4KSbzYZ7Vp08MbIrS2?=
 =?us-ascii?Q?OC5WYxuYORNlA2nzWCZAN/8KmfJ9HEzpQcykT7AEUL99b9GauuqHgowEPKU5?=
 =?us-ascii?Q?a56H7SJr4JWEXhwZ3UL/qe6d46J40SUQ30u+fMuE6Dn4WoCcgIdd/GPvRNvF?=
 =?us-ascii?Q?14f7LwyP2gZBe37MlYR+oU+J+jBCygYZ7f6m35bE8FZNnf7gstBq?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6251b16c-c879-4f90-d181-08df406bd7a1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 03:20:03.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsBao/92O3LJvvYtDYilc0lp0V7fDKW4CHhiyrT1+0caHhoq14g3cY5Q5acEx3EqSoVtD4nTzKcZ26zQt6M8Yk9SnBdCKB2sHgBkpND97nU8iQ++jurhVLlBL2d8s248
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9617


Hi ALSA ML

> [Severity: High]
> Can devm_component_release() call list_del(&component->list) a second
> time if the driver already called snd_soc_unregister_component(dev)?
> 
> Previously, snd_soc_unregister_component_by_driver() looked up the
> component on component_list first, making devm_component_release() a
> no-op if it had already been removed.  Now, calling
> snd_soc_component_unregister(*component) directly invokes
> snd_soc_component_unregister_unlocked(), which unconditionally runs
> list_del(&component->list) without checking whether the component is
> still linked.

Ah, good cache.
I will fixup it in v3


Thank you for your help !!

Best regards
---
Kuninori Morimoto
