Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.130.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793916589;
	b=GJp/TkncIftQEbtPcjd+fKbdo1WEWEL5vL3YwBu3b5IHyNM6QbMDtKDhyxW9Dq7pAK25
	 EY7G6COU6dCI/S8wQzwEiXXLFh+Ps+gZPYpJhQh9VmdwFdUVglbLXbtpEKkKQoUtqj71N
	 gFFUHpsqbCPbFYj7IEUtiPyZUhc2N7fnw8ZqRxCCbkeMGccSrySAzlwcvTUsMdu1xCbCf
	 /nM9tr3GEDRO5ikXvyXk4SKFbU76GrLUV3SngOLa1oXvuHi6lOJDZQ+omX9S26Vi8qe1O
	 XDuqouOwOKpQAiHnwUThaUpZO7BhEZBUH8mTbnY8mGRpytN7ONJtIhD2jYAjlwWNoNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916589;
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
	bh=S1sCkyNDBtgJY0eMiKTL0FKARPNvn6eOrV96p7Sti/s=;
	b=t8NZMmqey7N15lYebzdUQQYasZFp5YhVGm/14j2+U5TyjDWH5yo6l4WapBbJAEKNlvqS
	 Lz8GLMhzzb1jnNpXHYEfwBKnejbKa6J08g+6OerGvV+txXKYRNBOxjd8A7aNuDihRWQbz
	 Dp1HnmtMsXwTe7P2FWcC/WXhjWLSt9Zdk9Wi6bn81bZgug+QVr1WRD27RQ+ChgNIqbCYS
	 QCHVAya62fLwhFBkj0eFRz1I+p+B335wPe6htfSg7K6JOVCaVnftl2HBBv2SivfVyCnGk
	 WvkZTtNZgvdKkIKexKJqdR2mvBbq6FjTmZRhSHoXP/2UMFef4hbS1b6p9lqiu7QUCOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wtPByOwc;
	arc=fail smtp.remote-ip=40.107.130.51
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73210606A326
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 22:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73210606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wtPByOwc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unSgFUwwYWfRRHr+rjTn3NwzDBJZXcl365ASxPY1Sijur7mNYl8k2E3ob3Cyy1Zev/nt8cG4Hz7CoYbppbmwd5JRIJGn1Nc/BbO1kb7pkH87Rqve8XokeWjnAAQ29yrpWffLNBxVVZzgTvCCGgnNink8ePV3BGrBBBifA4uvSk3uTYVc9yQIEWme6mcbKZTIzDVlpX/P3oXa+lc4Nmi9tkvUT7cLu3nPj7yENkjmIhMUuedKgQyZfMxPQtfnDflJZqzS8Ef2WdFqOsuE7rvepgkXi7IhNBm/JUeYRS4HQUtQUQjAiX6PJX2TwGoEmApHs9Mx6QY1fKFm+0/4VknAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpPn3dlP03U9qZLs3oavWGepVCo5I9P0h7xZhsfwANw=;
 b=CukuYfrBMtTsehhWaN5C2718FzNBVDaWPKHohj1uKmfs6SRDnLtgvIDMyE/RDWT7RdIgTrrzOMaD3HoyPyojGtIUSnDRg1HYihmmjxjF0MTYfmmH/jcu8foaNzIFmdJKjP6rjm/sv9WZar9onrhioYJs0nebrLjK9ukC3+UAJerAkUGpZP92EYUwVkUWKeUgM4fVqD8HY/p7SbWsgn/BTFnw9mqfTp9E+E4MLFOetLvtowtHtGzMQtKgIsaXujh13XE5VfYlQHYMvyR8S63W+z7VBJC5b3DxK+ji05wkT5CT25QkCLTqGzk3tpN4Ce8GA76eoU6Uhgy+32/0j4YYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpPn3dlP03U9qZLs3oavWGepVCo5I9P0h7xZhsfwANw=;
 b=wtPByOwcXbJVQW4c4FKHmXv0UMIiP+gf9Xibr8XULtN9k5sFtN5s28KPeqN1jtfgxco+On2mngyygmO9D6qcwXQoCbyRATjBlXJkiMU6bn/t3zLH6nyxyp238l3KCs8NAPQetAIe3G1OFjMmR9NiImFHTfdpd8B4xKBCLP8TbBUqg2NYwwQOW1EK+CPu5Ij0gn9wreyBkQVF4F8qFBsOQFJ7FmwC+6AXyvadcI1BVKE2FKCdPft2idsJxgZWIunjhN0GIaLt8/cd3A8QAR4a4+yC4gPZzQst3OdUujEFMVRIL12IfryRxdj4afllrZKxRPLAaz5mEdD39c4zw0iOeg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8541.eurprd04.prod.outlook.com (2603:10a6:102:214::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 22:09:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 22:09:45 +0000
Date: Thu, 5 Nov 2026 17:09:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 2/3] i3c: dw: Track the transmit and receive buffer
 depths separately
Message-ID: <auz-oTwusjUDhgh3@lizhi-Precision-Tower-5810>
References: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
 <20261105085425.3418230-3-shubhamsanjay.patil@amd.com>
 <sashiko-outbox-198746@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-198746@kernel.org>
X-ClientProxiedBy: PH3PEPF0000409A.namprd05.prod.outlook.com
 (2603:10b6:518:1::46) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: f28d61fd-1463-4e0e-c64a-08df3b897fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|19092799006|261022105027099003|11063799006|56012099006|4143699003|261028144727099003|261009223027099003|261021121427099003|261026121527099003|261026140227099003|261102123227099003|10067099003|22082099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	7EyulDLTPSvvXTftVGYoFV6Uf/HkX2GqzJpb3mv4XsbAIcp1prLEUj0xfTDJJy4wv5M60YYdajbYvhBQ/w4iKaTCPTEuGkOzJFO5OPPtv77O05BVIkRk32DrCJRAeco+ITnXc88oh7AADMRyoyLBXzn+lOj70PUNdKi22eOAvtnifdcdUSSEjn7PAYVJafqhNDM3qKMbSgG5PWBw1ZQlBFPbB7h1KxuEg8iJGojCb+rZddtjQ07cpenxjMJBNjh5l6nC/9wTKNANsTx2Tg/WFTOFLnub07j4ndOly5UQMQFnv+qRjTW/H5pJNo9ACan4fVy/R4EhDQFv6zlSm48lp0GiBkUxrsGY4q+3um768vXU3ERPHSVyK3BeRU84ubZfHIgk4AzlxyT9S1lbakQKrno0EIoTpeeiNDFlcH29CDGlzoXGCXNbCJ+JkcesEfHoVn15rBf2ydWiDVbYBrN6WUESSiFcXe1SDFtpmZYNkIDnuUjGF5DpJi9Hi/cK5lEDXTGj8DEAQobqGL6GP8ctcN8H7PaLRnCoTviAoaOzfSwsuMRW+U5E5UW7WzFLWhUpKasSD/kVA0o8gCLZbsMR/Gvw4hnyynZInWMV4nmIQBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(19092799006)(261022105027099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261009223027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261102123227099003)(10067099003)(22082099003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ip4brVsZ9Yx7M4THJoLa5Dc2EisKwWzdwOV5OmiWjamvadwAI13TLkOX+8?=
 =?iso-8859-1?Q?nWZsnO74TNGMHimeKgGjAKYN01RarhPO7abcpXk0JGk/1m/cNBhKnHZdph?=
 =?iso-8859-1?Q?SinOvtqam2Gc3u7gz35QpNVCdAKUTB50ewKot1A64t2ynTHcqZIuYBF08i?=
 =?iso-8859-1?Q?s+NJKSpMA9zsfuvHDrdwh0pkOa1X1F+ebUz/nWBeXxoYJnl5rK+TPmOGwX?=
 =?iso-8859-1?Q?j4/KviSXD+wInIaMnAng2swjQ7mV9mMRRT4j611rU+OIY+cBvYvB54e1gc?=
 =?iso-8859-1?Q?5yEp3rcDBKI9Y64k/O/E9IPkoVFMaoLUWSMaw/BVyVPgFsNFLC/mb0H6m3?=
 =?iso-8859-1?Q?oacUQbB/c1VtPcIsptMamx0BHiOKz26SGH53Lfxb4z5H5a6LyiUlA9f6UB?=
 =?iso-8859-1?Q?CDP+/RC5JtuCg8sDRpG0DMNTK37hcAmuJr6Pi+IjmYtrYHNpTAg39veWMc?=
 =?iso-8859-1?Q?rcCIj+zbE59BDLV0WhQ96uxA3mtejgAjlZ5xYhazG2kP2ycP5v4EKUVZXn?=
 =?iso-8859-1?Q?CDjOvLjBhngYAnE6CnPV2jeuQHteiuLGw9qex8YNiewSrfnqCfU4b9CVD/?=
 =?iso-8859-1?Q?5cOLpgsQcHTrN9b3iqj13GxVqsz+BwT/XRoCOlbCcKuiC0QIs18vJqqr8y?=
 =?iso-8859-1?Q?07JS6kyOvHZ4BYw/RHMdq2J+nnwUBYFDRcaAM29gylh2wRhviz+tqHeIFX?=
 =?iso-8859-1?Q?AI9AT59rpbhrupIUjAOZ1NS/KUfGS1NiSipDo0xqLQxpbncUu4yplzyqYq?=
 =?iso-8859-1?Q?HeXaLeGRKfvOCiXkpnTUatw/y+CKt7y1eByhgx3vS0r+A/j7D6+KX1xMt0?=
 =?iso-8859-1?Q?fahZ7TZxfoyDJvIGgL6B/lc4fWA3HXNo36MKfk8nT3Bm74cLuq9ErVMc7c?=
 =?iso-8859-1?Q?awAbHY9rE4sgE87ZL5MWKmKP6ZpEkIjXpkeA4HXwZ7ySJwrDqPc8dDnhj7?=
 =?iso-8859-1?Q?RMOrJJOAy/ocob+pwtaqGFfEWdo8D3pb2YOwVeM/M2HILucsYvqm3zAFEQ?=
 =?iso-8859-1?Q?XmiqMP32EAWjJy6OahmgZ5sKqPX35x+xFuJC5BUXYy6eI2aP0Jk1Nmf0hi?=
 =?iso-8859-1?Q?OABHllJtpbNnoMw39tGK/gYOnlShqy0KwewfxvIJWR2Ecyk7H04xO76qZE?=
 =?iso-8859-1?Q?7ZgEinSfagvpfddvzVEM4BvIwgKCegCM52YtR5OFj5o5sFLfcgTMyRQVV4?=
 =?iso-8859-1?Q?0+AZRXMISPq+/kHsqyBSRyiweUAwLSz6srldijKPOcyqktgIgrK8u50z4o?=
 =?iso-8859-1?Q?xN2Uqqzg2L8lZJ4NxrraXS5XPEgExl3gI1Bzw5fNpuR0pMNt+30vC4VsPI?=
 =?iso-8859-1?Q?cEPFlj4WpoBZpoWjnZO4rZhEmMu+HKotabCHSOb5RX01uxTFQAj76gWp6N?=
 =?iso-8859-1?Q?tQgFNae4pnzBqc+iSdDu5Q20Ul5MhpRdbcTCruH438XP+hklATTXA7eELr?=
 =?iso-8859-1?Q?B4Bilo09MWU74OWoiMu78C3Xn2ssC+HcgC2amHFa8kfUjOe+Al9bVxw+tc?=
 =?iso-8859-1?Q?P0xIt2b2SNUugcr3BlJ3RrzQ2ZEZGYuxCVW+R3H6Q6fQMbi6BREejl60yI?=
 =?iso-8859-1?Q?QSzgqYzTUelux0lCUq2D8GtZyjR4jJ+u4DUbpdC/QE0iINPcKnpO+gbw34?=
 =?iso-8859-1?Q?WpThi/sCA+mL8GhtYFVtANDWaZtHqXVKXo0E20G6G+Wk2fkDUO/E+3DlA+?=
 =?iso-8859-1?Q?OUqFBqSmSqniE+P4aOgyKbuLsJS3Z8HB7UrT+5OXb6YJUYgIDi7S7ftQMU?=
 =?iso-8859-1?Q?+5t5W+GPYFcjNyTzO2LPCrsEk6KHAAALFB6X7Y7jKpuzuEql1EsPca+/it?=
 =?iso-8859-1?Q?8GwklIz6CRZUBInPMqtulz1Vb96euCKzLfEkWTjpTCrApaIWCGkq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28d61fd-1463-4e0e-c64a-08df3b897fce
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 22:09:45.1376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fPbfDm4bwBLQKSvL6rRxhijdDyPBirWH8yDE1o6DVfnW8Q2K9IyXZlYzBNg7FH3lbR3tCFhm/lYoRbvB+odsG6UPxKQVv4nj6xbX/4jWzlM3st+bENFCR3BRoi8xo03
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8541

On Thu, Nov 05, 2026 at 09:01:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] i3c: dw: u8 truncation of rxfifodepth in dw_i3c_common_probe()
> --
>
> commit c93cc6843b57993d053db03cc3f7cee25dbd4371
> Author: Shubham Patil <shubhamsanjay.patil@amd.com>
>
> i3c: dw: Track the transmit and receive buffer depths separately
>
> This commit splits caps.datafifodepth into caps.txfifodepth and
> caps.rxfifodepth, populates caps.rxfifodepth from the QUEUE_SIZE_CAPABILITY
> register, and exposes the FIFO capacities via base.tx_fifo_bytes and
> base.rx_fifo_bytes.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index d1119f203d1b6..dd5462b129514 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -203,7 +203,10 @@
> >  #define BUS_IDLE_TIMING			0xd8
> >  #define I3C_VER_ID			0xe0
> >  #define I3C_VER_TYPE			0xe4
> > -#define EXTENDED_CAPABILITY		0xe8
> > +#define QUEUE_SIZE_CAPABILITY		0xe8
> > +#define QUEUE_SIZE_CAPABILITY_RX_BUF(x)	(((x) & GENMASK(7, 4)) >> 4)
> > +/* Sizes are encoded, 0 meaning 2 DWORDs and every further step doubling it. */
> > +#define QUEUE_SIZE_TO_DWORDS(x)		(2U << (x))
> >  #define SLAVE_CONFIG			0xec
> >
> >  #define DYN_ADDR_LO_MASK GENMASK(4, 0)
> > @@ -978,8 +981,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
> >  			ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
> >  	}
> >
> > -	if (ntxwords > master->caps.datafifodepth ||
> > -	    nrxwords > master->caps.datafifodepth)
> > +	if (ntxwords > master->caps.txfifodepth ||
> > +	    nrxwords > master->caps.rxfifodepth)
> >  		return -EOPNOTSUPP;
> >
> >  	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
> > @@ -1136,8 +1139,8 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> >  			ntxwords += DIV_ROUND_UP(i2c_xfers[i].len, 4);
> >  	}
> >
> > -	if (ntxwords > master->caps.datafifodepth ||
> > -	    nrxwords > master->caps.datafifodepth)
> > +	if (ntxwords > master->caps.txfifodepth ||
> > +	    nrxwords > master->caps.rxfifodepth)
> >  		return -EOPNOTSUPP;
> >
> >  	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
> > @@ -1738,7 +1741,14 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> >  	master->caps.cmdfifodepth = QUEUE_STATUS_LEVEL_CMD(ret);
> >
> >  	ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
> > -	master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
> > +	master->caps.txfifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
> > +
> > +	ret = readl(master->regs + QUEUE_SIZE_CAPABILITY);
> > +	master->caps.rxfifodepth =
> > +		QUEUE_SIZE_TO_DWORDS(QUEUE_SIZE_CAPABILITY_RX_BUF(ret));
> > +
> > +	master->base.tx_fifo_bytes = master->caps.txfifodepth * 4;
> > +	master->base.rx_fifo_bytes = master->caps.rxfifodepth * 4;
> >
> >  	ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
> >  	master->datstartaddr = ret;
> > diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> > index f5b4491b247a0..e23554bfc5e49 100644
> > --- a/drivers/i3c/master/dw-i3c-master.h
> > +++ b/drivers/i3c/master/dw-i3c-master.h
> > @@ -14,7 +14,8 @@
> >
> >  struct dw_i3c_master_caps {
> >  	u8 cmdfifodepth;
> > -	u8 datafifodepth;
> > +	u8 txfifodepth;
> > +	u8 rxfifodepth;
>
> [Severity: High]
> Can master->caps.rxfifodepth overflow u8 and truncate to 0 in
> dw_i3c_common_probe()?
>
> In the DesignWare I3C controller, QUEUE_SIZE_CAPABILITY_RX_BUF(ret) can
> return up to 0x7 (256 32-bit words, or 1024 bytes). When that happens,
> QUEUE_SIZE_TO_DWORDS(7) evaluates to 256 (0x100), which truncates to 0 when
> stored into the u8 rxfifodepth field in struct dw_i3c_master_caps.
>
> With master->caps.rxfifodepth set to 0, master->base.rx_fifo_bytes also
> becomes 0 in dw_i3c_common_probe(), and the nrxwords >
> master->caps.rxfifodepth check in both dw_i3c_master_i3c_xfers() and
> dw_i3c_master_i2c_xfers() will reject every non-empty read transfer with
> -EOPNOTSUPP.
>
> Should rxfifodepth (and txfifodepth) in struct dw_i3c_master_caps be u16
> instead of u8?

Make sense, please fix it.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261105085425.3418230-1-shubhamsanjay.patil@amd.com?part=2
