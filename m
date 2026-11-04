Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801835;
	b=xls3J3d9afLfZdbv0uJ5zrHRhzKT+871AhSWT5zBj9wItORkhTMNf7cHoIyqGXS31iHG
	 AMf5AwSz/pIG+D/RzBzkAxbwfyokKOkhlzD4dMiYa80AMttD0LpuW6o6vMyQvFeK/gpNs
	 A0GY+Kz3X+tFPmK1C9l60fKWF2LXjvFc6PySh/1ybOJ+rbM3wZTfo+x5ZXf+FwcR87mf4
	 0Ob2kTZ9I9KJyRSBWz64ZI5wu0tKD/vu9U7inhMTeomYXdE6ePn8zwXu71qZ24HuotSdN
	 UkGtaGIbVvtM1RaPk6Q0HBrvtTuDDYWIU398EI+6ONXnESp9zFRdNbo70akC7/5IZlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801835;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=x6eOE5HgDH7HMZUvFew1+c5kaVLU+8xGzayinkHjdB0=;
	b=WyqUQCCkVed/LK7ssMl0p16LykpInWLHndv3Ax/Ii4ZX1+hgQC33GJLrfSnqcr3qi7ZV
	 3fyIiXzkCxWd8LNSAMe0nEVmqyV58Vm5wrs5IMWb3vtdkiutHw+nWZ6YvvmK4+tvLPFFi
	 kul1XpwJUpLYFPxbHyfUBzkLDUl9RnzgY6cex4p/h8DKRGtKKNSsx70K+t03mX7wMGjj4
	 +RxnljN4HI4AgyzHRkiC938hdnPO9nPUMsIz/SIxjCEbpSDGbFMIkTupkYIf5Ub33dOJ+
	 29cOD6aHqYl4eDLTprrDwgrPWZwIPab01koN5a9Ja6WNI1u/bDLOr1wD4bHMQNKS5hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qzs3qkLi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.18
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010018.outbound.protection.outlook.com [40.93.198.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA26A606A330
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 14:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA26A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qzs3qkLi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMCTD5utsmKmewtjiVrqSuDOdFCFfZNBj2ry9BD/7ZnpcsPfAX0lvRTTkl+5dIMg1bIHAl3cU589zi2kiMqBwxaoMWzhuJMKsWJw+O6BJP1Aq/aYIuZWNI0jNI5e2jrSXCL6kdhZKCcRFXydeLhEqIxb+FTiEY2VamFP8vnozMdwWPXRz7TswDIlBN3evH8WLEJz+lcDdkJX0OTFQ7JriqRC07hA6XLMkisdJHx9FrRFGxV5LQiNiWD+uWCvA3hFekhGnep9Wzsz0u2bLy2jJSqNwcJB6XJVfx4cwQF6NUq//06XfE/Est13xnwouhqjYA8gfaAet/gu7W4i6jwL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6eOE5HgDH7HMZUvFew1+c5kaVLU+8xGzayinkHjdB0=;
 b=QjDRLbCsBvGWKfh1HgOghg5zLUZQVnmDwF7XF1gHnKS3IThe/jijtxpUs4sx4qvZpRY+PI/qyFcnOnLXUAujp7zFzQg1q94dwR8Nwa0Dkx8Al2ep6g7xs6SKJS46BKBTMi/Dz1YSqnRUKHL3fCbMDyz9fbXWtw70LHA4qy2NutBAP5D1YEOUVVvMk5gv1+8lhkDmWwuKH2FrX/eCePhDBeHqUilJGJ9BkT1faQMd7LtNQ4MOZMNV+bfk9+cqGMNyB+QsAJ+FAEcrJmNrEQPYKxRB6sQ02hKrwqLZiwikhHoStTeCA6RivQRJkAWo8fKcKtlVsaKj1w0lK8S5mtCuWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6eOE5HgDH7HMZUvFew1+c5kaVLU+8xGzayinkHjdB0=;
 b=Qzs3qkLixeHE77rIYxjHhcrUqTJ7vcfaSGS9aR46QK7cHZwanfoG/X49lP5nZB//Cw7km13We+QyD05ITrI5wCk9Pmc5Wl2CxQA/bSq8/zQzSvvSUuBIIqm0wGinoJsYu5frtDtmaOn0TsogpDvrCR9j7GwhET46WPZCSL4THDwjzpQJ9rVW+wFBddtAYBarSezVoJcjZhel7GCxNlSL64AHp7kCRB+4wKt+4mjUoK9RG346kDYiAwdtTClUzTH3croE8o5CFbwEQ0GASA+C0sTzJt3oa6woUeVu2I7rTMuupnfXjoxNwl3dAkEkCPA1TUUwbnv5lX9x+MqLhlvo0Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.10; Wed, 4 Nov 2026 14:15:06 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 14:15:05 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 7/7] gpiolib: let the character device free its IRQs first on chip removal
Date: Wed,  4 Nov 2026 16:15:01 +0200
Message-ID: <20261104141501.15473-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <qabqccchlj6rz5tki6z3h7py36btm6nepdvlcz6vgbq37enfnl@ez2jmldpo5mz>
References: <20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com> <20261103-gpiolib-chip-removal-v5-7-aambrozewicz@nvidia.com> <sashiko-outbox-195211@kernel.org> <qabqccchlj6rz5tki6z3h7py36btm6nepdvlcz6vgbq37enfnl@ez2jmldpo5mz>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0204.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::20) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|DM4PR12MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 8956eac6-147e-48fe-6b06-08df3a7e05e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|4143699003|56012099006|261026121527099003|261028144727099003|261026140227099003|261022105027099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	kL9D48+cxgJHuKRR0S69vMD0LYoo5Bo3PIy8Tv1LapoavNLco+npNOWrHLy/0dPrKj5vz4ub0ytfZa0qWjB7fX5cno/WE6op8HHuEXlg6Ge7e8/JgBuE7V9a7LAy8Z7QAx12bT5dl4ketSdiPu5xvAps7kP6fvZRsJJ8Z5cMO9njWXn2rbbz/Zm8WDBBhmVLxCPPOl/zPWrCZFFq7v50FIzVsjnPtvKv6vGjyGzNK1DwoatnLhTrNxx7KYt2asQUO9UCOcG6pSBX/FoXCaeiI060Q65An06wsr+pLQo2Va4i5vyUqUGPL03115hypkAp9FY85zLzlTaaojFzu7Pgq+tKS8qc1HaDSP7YBS3oWck1Pj34C+JXVLSxTwBGre2rRScNWNTuic8mYPp7LPRCPEXfQG+rP149eFFomlMXVkp8pZ3MBzQEYYTJcUVKahyb6aTht/hgvemjJC4mq17spJNKBmqUPcb9sLHsZNB9dZNM0f+vnGWgWlH3vzhe4LOW1OgLFHGNRiznse3t5vWJ1PkKzO0XqpdMBNG7v+NlR4Qc78En828W1m+p6wHMZd71Z92HpHQpd0XX5AcN+qDBA5xLSxd8X6UIm7g0mWfOt/J44XTWGsnh+UvfzD3usam7yNAXh5K+LqnJ622cyYGxVhJE5AdEkfaRTFLJfMIyoZ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CUsdkcRU+YBDenAp4DEP3hMLWxheeLk0GkR9W5yoscHjvTv/jPeGcnVAuM56?=
 =?us-ascii?Q?A/Lsd+vguyJAIbEm1oHBT56OxjvBQUDdEbNg7i+SeQye9RNhfEaYsyIdakNw?=
 =?us-ascii?Q?+jmjyxMkLzzw8hdvHRSQf/h/2mPzR4NP+ueMgCkinNPvZfOFDOPaLIJJb93L?=
 =?us-ascii?Q?2z4OjCMX9XVFUAnotSL6jCVdnrthrY7o7E9vTqMofCjyuKW2bc9PuNFMc0UC?=
 =?us-ascii?Q?yQD51MRNAa2ZftORp6jgjhyirnbAKEP6RTGQ+Pdxmnuwp8HuX3a7Z5m1x+xg?=
 =?us-ascii?Q?qzSA6QycjMgWRCa85cpeRC/wnuATDPf6GI47aP2owmYQ+W/1bQXe58vv3tF8?=
 =?us-ascii?Q?6DGkaH2sex36eSfEM9lvzX8h0zuH/+PUxcwtMs4fXqRlYnfXXCNBg9sEvDV1?=
 =?us-ascii?Q?eY//Tu+IwLrSvrRVo7u7Y8qRICvXoBoTKDLJUH2Y/hJwxMsmJIPdINg4+Jl3?=
 =?us-ascii?Q?i8RsoZtdAqF9s3TRJVLz1NOxuRj6BdfWruJo5TcaWyt6Sm21UZSZOucRzzbv?=
 =?us-ascii?Q?ab2055/fNrewpDLV7GgIRVf4XYdzrxsVmi/xkPTA1gqDqsShdc3Vk45yRtOh?=
 =?us-ascii?Q?npXiKZIG9i2zf8Y+2Ca47Lg1pdbFqmfmpGwpA7S+SBRtsMgVXyMO9k29h6cb?=
 =?us-ascii?Q?/iHWweDS5rsx2gxZYB51lCj9nqCscGcJJjk8QmlRwfQY+Fwma3KAtl6QghGy?=
 =?us-ascii?Q?gEQu7o3UwdLRQ51nZj/YREVBrDtDSgj4rH9eDcDjC3ShXZ+38W1XCKud2Akw?=
 =?us-ascii?Q?TWQgSoChyRpJQcWt1zEWWLVBmkb/0iN7dfpRkHFsrC85GBhAZ6kg/UXdpZ32?=
 =?us-ascii?Q?VUoRbC738D3Ab1QuX0l9XAHq7qkJOPVFri53BI8tkkAsPcy/cMr5Qzum4cwJ?=
 =?us-ascii?Q?KiRUhifahc231bIppxSGNoCZUcJ+wuVijOLnr4H15TwBSCY5XvHVATVwoQ8i?=
 =?us-ascii?Q?R1iKz8qb2jnaeu5lNIE6YE7jaVetHaWpq/qtBwsrHpfM7eYc9fHZwdgeZQZ4?=
 =?us-ascii?Q?nWX5DTns08XET8z4fbCf5qvTH4FpswZ8tGdrAFYSiJ663SLBeQ2Y40AODv1V?=
 =?us-ascii?Q?iJVvrIssO5iw1OHoifVXtUvcmGOIA4FrUZLf6zdMU/Oplznku5uDo4AuDPeS?=
 =?us-ascii?Q?jwUEccWNl1cifMuGPqifQSWt0BaB3Nh+vPchawSY6uW1OOm7JYYxtEJ+R1ly?=
 =?us-ascii?Q?UPxW1/py4abVhtpVilVJng0Z5SfyFwNalA+bPc3TlglrWosKrsg9J9Yc2w9v?=
 =?us-ascii?Q?ICeNHqk81yXRxHNzilm5DAp1owWMjr/S0EwDlf8e0XDQZloIx1Zxk+PslrCR?=
 =?us-ascii?Q?7xamBbp3gz/7FmeHOQtxWimCBwR2oC2tKoOA16vQXDLScCQzoIqQ8nDeqnGl?=
 =?us-ascii?Q?2H7ZepebHhuR/Lws5xRgat4gkN3bO2xvClGdOI6onoD+OdfIofzMSPrlb+WU?=
 =?us-ascii?Q?nEjfkDi3L5bVwYngDN6ZHzvVm2FehxkfhrR/fg8WPCt31XVIowViSVtZLIKc?=
 =?us-ascii?Q?CXLi6KmfIo5zI31Dj47wr2G0+uuSfAXZhJtBqSuYEDIG1c8MT+cO/d8iuSWt?=
 =?us-ascii?Q?0LTXLGw6p9tHuhJSUZidJNIuYKtZ+8poWn0DTmo4uAlNEOpUI4k1o1qjrU20?=
 =?us-ascii?Q?EZoHSTRQDfF8nMr+cufAqR6fJ+ZIQEIltwUfbjliX8u/dlSkS3wUolnOHtdM?=
 =?us-ascii?Q?PKgcII1d7Z2w7IS+vk1pxyqdkNETZAIHs3wXkERNDr0Ig1Vtm33MlkJWAW05?=
 =?us-ascii?Q?j5Yog0vsxQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8956eac6-147e-48fe-6b06-08df3a7e05e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:15:04.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trSGBgPhYL3dRjg7beW6n35E0Udo4w8KADPj5GCb9jrKPwfQBfp7EDKauHTrTMtULWa075LyYeLdK3/DlhNH9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892

On Wed, Nov 04, 2026 at 03:00:31PM +0100, Bartosz Golaszewski wrote:
> Will you address this in v6? I think it's good to go otherwise.

Yes. For v6 I plan to have gpiochip_remove() tear down the shared
proxies, so their character devices free their IRQs, before it
force-frees the remaining ones, and to test it with shared GPIOs on a
device tree guest first.
