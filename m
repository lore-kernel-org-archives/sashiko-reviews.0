Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.83.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794843925;
	b=bHjIsjI8OJf7SvKQR9yFK9eotJI+oZgwerde+Le+nq+XTBXk1JGAcjc71uLblmRPXfKu
	 ++9bVjC5LZDeUcP9FaP0jEyLRu2uJPjIRrScLPmxxmUcOGKw8ks1O9oDFXJnSjG9N8/r1
	 a/36vB4ybKW7M5IKeG39kVE1+3Zw+AbgiXRl21KBsF8x2+a4V8V/nM8EY1n3YT9VwUIlk
	 rg4exJ/rFjDTx1i7MPifBuqKwHIKl354cJvrA6y9M9nx52GUWWnmb7k8SFAywroyi8uEb
	 knimBfpM5ZrC1tQuNL9M9+JxU6/ph8mHkl6JDLqzX2VgMIavk+F9floTc+GNed6FlvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843925;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=CBcsPqd2/PXv/5LXbrThVtNK8U0r8fvQdYI3xsnniao=;
	b=ATdzunxZGEaOvM7yPXLbh55V+azsvBYnG8E5Uc6X5UFsVfhlyxoJa1mQeL7xZGrlAIgC
	 RshCV46kjy04pLdmnZRN8LX53pldQaQBssNujMl9oCe4JFAdnyNkcwMzlN7NV4g7xNUdh
	 6R+bOi1RO98Kg/OW5xy/mA5QNBO4UwThUWSDUrU1q4q4uZDCvcjUDs/36P7d7jiPfrpRp
	 fd7Pf+XHYAlHoNKjjIVM/L5CGrhJ4+xXhIDiWAMjW+be04Z5jBhm87v70aNaV6hu6cRfz
	 DY/tdK8rp2iSsju8ecqbeehkZUHy4hmUecOfPZmeMBqjTKTpZCrp7tUFFuyI+heAAxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pgvwaD1k;
	arc=fail smtp.remote-ip=52.101.83.18
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED98A606A322;
	Mon, 16 Nov 2026 15:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED98A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pgvwaD1k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQXDUDFTw2NjzaZnzbBS/B9XoxYmkRrESj4cqjN/9Zum/1VrjMSP3DmYV9ml7EO3+wIXaZh75Mr1PuAyarF43ZZipsD7W3BB3eWOapZpfKZtFbmjnMOjLPjrvMtC9s3dQCfbrk6HWITfULkjhoTK+sbgfB78rWm+DZwx31qPncHIsPirB2yWxISAZf/AKY4O0GJUsWDqBdbnQkjAcK6gH1/Pr+i8ZcclsMZeBMOf5JjmwR5j+9ZOe58+StNGAl/UJBl+8zfF+Yh0BtJVLbxbhO5hfx4Iv61pID+q8oixUWWp3rXHYDSVJ+P5rmEUHuNRIyZUvAyT+NRtgzNoFEXfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMWB4jtlgoDv+la2UYIYALsqDtwbTwbZPG59uxT5PA8=;
 b=sJ8b4dxuQ8U0qYMaJA9zMLCMOJI8ixN8TI5k2Ky0Z+xF4/Q+HUaiv6yRw4HrhBSDFY6Ybuu9AMf86uSGNSeAAXPgCTtSfmKomX6ob5jLbXAaORE1blrAaOwllrlqZ7hnuqgvb2DuKdwDxAEWloz0OCA+SotD4/ib7dgcP5w8kXFVBGIZVfbE1ha97Qhmqr8JjOd86KJ45H8RtUUnsEqNKpaWgB9IZdn9aCyH6SEGfOlDl6TiKwV+fT8OTdKuNiTpLgBILuCzNX5V1TnUMOW/9ZMjb03vMz1/k2Dfki64qfcF/ux0LhxRiwESTxALDXinA9e7Beuya3X/qBDDeUUvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMWB4jtlgoDv+la2UYIYALsqDtwbTwbZPG59uxT5PA8=;
 b=pgvwaD1kAeBGbHB3LT4uRttQ6FI2IJB02UkJyrDzKFbcWuyEP2k/iPVrxYyP9NQNq9rMs3zzHLg3udN/ZjyQv7Oif4K2V0/aKJw4iGtEOAOkfguiWIH7OQmrxce9hgk0UrikwnKsN5OSnGLsBJUvApffdzX2Cv3zwQP49d867qGLUCSrVG3jGgbABFMBh1h4llqLihpBK+24nQl8f1912fPsl3POpqvawApk6cuqpuI9s65bIgkD/bsSreVzuFs0Xo1OCkj1QOvHuTrgJL3v9eXoI4oLmw2qDuRHfmleowdn9MUwGmwD6d5maHWe8K98qDG9/wIrM1nCtmVl1JE5rQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB7041.eurprd04.prod.outlook.com (2603:10a6:208:19a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:45:21 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 15:45:21 +0000
Date: Mon, 16 Nov 2026 09:45:05 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: sashiko-bot@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Han Xu <han.xu@nxp.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rosen Penev <rosenp@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Wentao Liang <vulab@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chen Ni <nichen@iscas.ac.cn>, Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Triet Hoang <triet.hoang.dev@gmail.com>, open list: 
	HYPERBUS SUPPORT <linux-mtd@lists.infradead.org>;,
	FREESCALE GPMI NAND DRIVER <imx@lists.linux.dev>, moderated list: 
	ARM/STM32 ARCHITECTURE <linux-stm32@st-md-mailman.stormreply.com>,
	sashiko-reviews@lists.linux.dev, vkoul@kernel.org,
	Frank.Li@kernel.org;
Subject: Re: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
Message-ID: <avslAXoa_LSuFNrP@SMW015318>
References: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
 <sashiko-outbox-193928@kernel.org>
 <87wlqcrg0u.fsf@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wlqcrg0u.fsf@bootlin.com>
X-ClientProxiedBy: PH7P220CA0127.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: 43fc282f-510a-4e8f-3347-08df43f89f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|23010399003|366016|18002099003|22082099003|261009223027099003|4143699003|56012099006|11063799006|261028144727099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	URQzRkn8pPheGkVHrFH6O5oBelRCLX5puwKDsq4C1BPLcvK7S3q5KRZfDU9TMLCeOZFgqP2haNzpL7lzpzZkUzdoVv8sHuqfuS8QZzcMLUnw9fAjvlAuVERlEi9UpfBD1i7zlPcq/xMWvFMFyekHyp6QrDtl/7JzPZlFYUgllGCLGf4pGixpy5uVsVijYJbuypUsTPKnSOnH40IV33BgqrEkrMWhrhG2WnnwzBX6a3ino823LXqr/WDiXpwlV/H8Gsvs7WlCXCIkh9gBJw435mORFpF4+fPknstCSw3CuSuvc5emtxO80k9fYVFCzQ3vRMWh7svhYqQUmv0K+Afpf0iQAifD5QYgrG7Nn5OOWajhgbxvMV8tNcOEx22bamRQGRorMnTDnT0/7tz6Wq/gs0KpOoDVvraZ4+GnW7/Tf8adTppDJ2Hgj1zhU2c6sj8eD7H3nvIGrUBl2QlESczGuSXhjPjjnOex28hk15R8ojJxSZ5p9RZ/5q6HjAgG3Jl1mszyKDCqhtTbpUZorWHvRWNmNeDW5lITmzbiz7H7rK4vbZX3RzQAKoF/sTaXKFsDWWHu4SXdgTTZ8bIuhCF2iYIVLBlIL1ju19vVkn6jFbyOcNwbq5pAZ4ZTu3zI8xNfdruPQh8m25B0RqvHe9oIQV1qqI1AXOH7TeGfcXhEt+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?UbNdDa+3P9WtKmScMArnJJrZGRFKt9GITSf3+GceQ8YPZTjjetts6sBx6M?=
 =?iso-8859-1?Q?Pbt5sW8gZcGjvna8QuF/CpqcZfhK66K1MJlRkOzbL/WRiCbwmQ4/2mxPRd?=
 =?iso-8859-1?Q?tDKstm2KwJC/Ns48esC5PBs9iDNUEhwN3daMcbwWeiqlo3mmaHnsFWI7IH?=
 =?iso-8859-1?Q?oXCy3A5zPt/72uC+u1TswmpOe8vbzlvSevSMiZ61GOUfWnyKDCIXA/qwZU?=
 =?iso-8859-1?Q?Er9ydP7IQ17X1i9f1o14ZeOB5VntVF0ydj8PSORSBt+4unoH4ewfeIIK5x?=
 =?iso-8859-1?Q?U1hOUBhzLWBoLY7vzmNBuxOwF/hCnxut49qHoWpop+II7atsqk+hKkwGdh?=
 =?iso-8859-1?Q?RqgoE4u64fANuT64MvekCMAVCWkKoFlCgof7kADQa7qTs4P70I//hFhDQM?=
 =?iso-8859-1?Q?Hqr1wd/hK65sv2+1A9qLtFh0xxBoigLQzIwAH4HBypOGyY3t391PG7o+5K?=
 =?iso-8859-1?Q?M3LsLMlZjJkztzwH1aRANgQehJWN2dnPAmtlanVTO2FWsL92w0IPj/ta60?=
 =?iso-8859-1?Q?iVbZkvcqIxuF3xdqd+DLEI4ZfdmM+vAjJs6a8g7t0QXFoj85jlXU98BZcP?=
 =?iso-8859-1?Q?3KRhfBFnmjng5+9lGkZiCUBqzdqgrwN5iWVW7ksHS/g/mbkIUdoBRJtabB?=
 =?iso-8859-1?Q?WNNhWPoPRQ4oaWDBkl6iBvBS19AXyRB6S+a1ssqcPPDSLmxgpmNBlEtM5k?=
 =?iso-8859-1?Q?pGZiT2hwan8gp2oO3oNX0wbXGoYoU/xJBaiUgR3PeCWsg8VnpXZsYjm/gS?=
 =?iso-8859-1?Q?jsXCqb1JMnOIa0NfV53Z85Vnuzd8jyDJtRHCiH50bLK2qeZxfGNQffb2ag?=
 =?iso-8859-1?Q?XEU15VHP4jgeY64FFW+fvALZT6t+nL59thjv6KSksNzQ1tp27ILmhKVnRD?=
 =?iso-8859-1?Q?B0djkDjmDRi4P6VDGbLfQrE3jYr4cjSe4yDw0Ngl6gvAHJruwhQugWm7z+?=
 =?iso-8859-1?Q?9zUOl7L9E0T7dSHYuzKZ7wjB7gbsetBSFiSChRxoFYc1Ra0/I/134Q7nB3?=
 =?iso-8859-1?Q?DbjMZxJciZeg/cpz1rF47KgVj+RbRkKvDCab380Pu78ahgI7Wmf7ssTWbt?=
 =?iso-8859-1?Q?oPmu6NtxkEGDloTyMnZYsdbWmgx+RmHDyERaE9mqf1prG3oTHnvRKyfgY5?=
 =?iso-8859-1?Q?HIkQTpTTUlOaQJHvOdxZTgMwRiLnyG8YbRNB2z4uf2wz9Kij5PQohnSbst?=
 =?iso-8859-1?Q?LGptLibIR84pjLD/7InCpwHREdRucBCQbWkQX+Wx2vyNfcydeRFLnmbvWt?=
 =?iso-8859-1?Q?wiMb4KMqKvh6xQONWtx+2XRCYnsOznKU55DyagmJF85FolZEZGkjYCYete?=
 =?iso-8859-1?Q?xALCwGNVh8e9FscX97fb7MjMJeoqxJ2Ltl11afLUQARrA+ugdsSKI47JEi?=
 =?iso-8859-1?Q?eWYbi9BOYpPAwL7rFyVpAGtei41984dLhyDBD8JbWaBeWYGvMYw+ANl2ZU?=
 =?iso-8859-1?Q?WRJzv24rKJfMLutCTiOk2BubHMrZKXoDK46k77cZqCXdv7pDbOnu5VG0J8?=
 =?iso-8859-1?Q?llMNwsgOJq/zDWCfPKkz6VmrNIP226rbU/3oRO/XCoxtOyThhEB1Cj/lx4?=
 =?iso-8859-1?Q?p90n9ba5SLzknm/5p+LKEIEATvhWykUaYc3Y6admu3vGvNO6XWZOWBojbz?=
 =?iso-8859-1?Q?qlPHpK2fbCBvx0kk6088R148e/zPEtHf8w4nyjc/lcx7oRRtak1/QKkwSe?=
 =?iso-8859-1?Q?sq1nvOhWLuTENDqWIZ4pTVXaMVn9W8IQpMAX824Pik4mvVW9L2RCuqPXm8?=
 =?iso-8859-1?Q?zh06bwUwpiG/a3Neo4tVOz5/rAbWlExfHIi4MHvwBNL3h+gaKKmXpPP3sd?=
 =?iso-8859-1?Q?4JAoyL9qk54Hl7iCYCDpxwvwNvSf3yfYRO0r9i0Ui8oD5TY5Ovbr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fc282f-510a-4e8f-3347-08df43f89f51
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:45:21.6012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNtJDjq3qFYUV1hWrQqtb8xr9ExJJYAN/sf+bhAPNucBCHorhoYH44uL+gghrM3Xyy/+VviRgOHQZnuJNx0kcnfxOJZnvXPd4F6a8K6qcRRFXR2ba9vlefyRda6jCHH4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7041

On Mon, Nov 16, 2026 at 03:45:53PM +0100, Miquel Raynal wrote:
> Hello Frank!
>
> On 02/11/2026 at 18:21:00 GMT, sashiko-bot@kernel.org wrote:
>
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [High] mtd: implicit declaration of dmaengine_desc_set_callback()
> > breaks build
>
> Should this land after DMA core changes have been merged? I have too
> many patches in my inbox atm, so I will drop this one, please re-send it
> whenever it can be applied and I will happily take it (with the commit
> log fixed).

Sashiko should be wrong. dmaengine_desc_set_callback() already in v7.4-rc1.

Frank

>
> > - [Low] mtd: commit message inaccurately states change is across sound
> > drivers
>
> :-)
>
> Cheers,
> Miquèl
