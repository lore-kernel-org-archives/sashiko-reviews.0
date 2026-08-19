Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F52748A2DF;
	Wed, 19 Aug 2026 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157038; cv=fail; b=Wh+QVqVoFtyN1KNodHEMZ3lZHmurJt9XwFuyTuYMYmLqofzHIKVF6ru7u2fr6krMyPKpgDksk5ozibgw7wuzpSuNYC9szqIwHVj/+8ZW93aada8Itf4raq+IzuO/vqQGO0UF0txDNZO6C8lvqZ30EXY1NedQ5XUR1EbWPhWQbDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157038; c=relaxed/simple;
	bh=M6Q6ZerM4PNX3/I5XDJPVf+CqqVwODaA4WqpvtRceOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IxVNmrMvHAJYwxFfT7iJnZaFUH7kOZ/SyskkJgj4MVGptTPfCkt0vgqV3FrtLKyqY8SdbkkmkXX2U+RRi53l/MPUYgy/R7VKNpqNjlyM2/ohBCbHx6n1hIgdbgYDuKUwIE9MIUA2dypyTA/becs2PRT5BLvJC5bCwNNexm6z1Js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s+Lxiflv; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s+Lxiflv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGFY9YkA3ZMafdX7CTh9WPtokTh25mFbNONaBu9N8pdrsHRboOW8b0KIKTNI0eMQgXRtHIQdi2k83f3L0FK06za/YUFg/gIKtEPsgj7mqEM57ztqNKipIprD0QH6yKt+eKdSCkg6F2P1Zb4j2jR/4d6vKbLlwkibLDrt5qJXjgzgX7GdH1ElGWUUGmHd2BAE0v8aNtL+3MdtAZlqiWsvsNy3ofVq4dBuGeHOMWGfUnCHvyiVPGvuc0KhQbtAw1cOTeTTq3m8kl1tZWByzxt9O9zvJB+BF5lsAdx6aveHts7QQGhl5+YMDCSCd7P2sbk+f377vx5hovPdVTXDcoG5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVph234GqMcoMzGkqvX5J5kIaY4OKYsYxCveDkEZGq4=;
 b=JKGi6dEBP2XRm4e3mJQaNu1IcjT/tSwYbXG8/fEDL2BbxpcFymrSCxZefL38C0wLRtI44T+gYtTEHSPeKfelILOMY8guKzgyryYEf9FnsqrzhZCgBC/PlCcg8zbdT7+xZSqt120+hCnTfUgl3JfJ5kH+NhUj3bfTobAGG61DAiBh5yRpYjLRrRsGyw3xTzdoXEBSAJRXfz5nvFjn4xzIfuFT+DH2WYeKjS7xpz0qYB23ExTU7aW6utsftSZoSz2eJlvCbz1jl19DBUWo80TTGrFcG9o1DvpKSu7YctCYd+kywlrC82JtDmx2gfQgw5iYMlyKS7yVrZzP2XRX0VTERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVph234GqMcoMzGkqvX5J5kIaY4OKYsYxCveDkEZGq4=;
 b=s+LxiflvrWUuLIwo77fAyw1TnQdf9vPKKsCil1qkz4gRJYPzv40vKponKRHY6KXylS82wlapfkjCOl82gey6wUEMV2B7Rl8jOWEF3asSV3WySt9MJDT0qP65/pIAxpJRAC86f4xeCm6Xafy1jdeFQjjL6tn2V/yjqZdhCnMvaQYvfxoYCmNSWYjq3HsKzC7kPs17tHsKHLex2EgTUJaWuEJVh4EuKzkCslXfslfZIadBcd4DKtvnA8SDU8eKU924HkEPsNuXWsT1AtI2wQKgvMdYyo0OMoSGI0gaFTSgCTtn6Nbq6JM3VgZoYx3zvkbmh2hjVbBYMek/VkCS9BenhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10821.eurprd04.prod.outlook.com (2603:10a6:150:200::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 16:30:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 16:30:32 +0000
Date: Wed, 19 Aug 2026 11:30:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, Zhipeng.wang_1@oss.nxp.com,
	Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in
 probe()
Message-ID: <aoXaIc5bX14esW4I@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-5-Zhipeng.wang_1@oss.nxp.com>
 <20260819092506.832631F000E9@smtp.kernel.org>
 <aoXAXFI3kRWh98R7@SMW015318>
 <CAOMZO5DT63sfGdUXiKNK=ihMs=rXbA6kBUUO4TmE1o=e6dkxkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DT63sfGdUXiKNK=ihMs=rXbA6kBUUO4TmE1o=e6dkxkg@mail.gmail.com>
X-ClientProxiedBy: PH7P220CA0128.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10821:EE_
X-MS-Office365-Filtering-Correlation-Id: 1696904d-0415-4a7d-d65b-08defe0f3040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	eBPTj1Ua/R5m/SsgZ/8OWodUmU43oGP6T5XGCACM+e0KPPSTU8zkTfJPmBQkY+hStQ+uqoLuIpd75BAp4VtTBF0HE1f4WeM+ee7XOVkXB8FDsfqCFl/KiUDs2DdsQBHN9WqXi0f7YTxbfSeD69Xzvf1I8RoXpwzZrRy3u++Tl/uHItZ37ZPTRL32BAEFOWWlQoJ10mg7PE0sddyUvSfIxKS/D874n04Zddl3LmRtwVRzte3lo2dxJHwq+arpeHS/ei3DnJoobC/CT7HribMO4omUMhBauFkCNrMqZMp/k8PQ1k5eJkdnK2l5/YKar7/uTYlkrFfBUbP4zwPvdEt3aKnP2UkIfBpkrBt7AYlLBD1/4f6gpHVNU+7xRe58eWx69bmNR4uTeyscv4jUzMAeBuLEhkk5eD8/A13a0+Pv3eAaq4XnieT9U08yOWrjvfxGjVSnO/fdsXzvwmJftNPFKFvDMVQWkP01zSNVi04soWce4BzAygR5YkgFvomCv28IFNzQdtL4Fr+z7g+YbRCS5XqmMSLIHrUwPt7hmoDjlWmUMKIt2UdWNHfuxm/TdDWOp2+MKYEaCLwwlJoeVcGQ1M9ip/b0CQPecsQ7wj9n59D2Q+KZ5C2IwlP0Flat3tUJ/lxXvMH6f3vEgShYp6yLLL+cym7uBM8UjooJVNv51GM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amIreHRrcTl5UndoM2NVT2cxd2VYdlFhS09GRlFmZkphd0REdHBtZFNwdjhn?=
 =?utf-8?B?emZOVzQxN3ZOR3Y5UXJ1N0FONzJLMDc0TVlsbDhFY1duZHF1b3BGWDU5QU54?=
 =?utf-8?B?Tmo4S04zTUZ6VVNCM0dpMnJkN2FQMTJzSnpJa0lIRVdlMlQxZkgzemY5bjZC?=
 =?utf-8?B?cU1CMTF2Wm9hSFEya2F1cG80dFd1OTVxdjJFSVlWVjFuYlhNMDBFdlAwek9K?=
 =?utf-8?B?VEZWcERES2RFVnRibHgyK3FoV1JJK3RDNjhxeUlrK0pra0dYZmY3WXo0bEVI?=
 =?utf-8?B?cTh6M2U1TlBhckNOVTh0K0UwaGgxTTh3V1pudnZmUVFYZ3ExMWlLMnZyeVlX?=
 =?utf-8?B?WkdEVlowSjFtUnN2WmxnMDRZeFltUi9HVHBtSDk3ZWFnbmYvcjB0MS9kNHND?=
 =?utf-8?B?V2t0Uis0ckVLZThXN3U3V3R3YjdSRkYyY2Nnc3M1RVNkeXdjbE1PZ0t0UmxK?=
 =?utf-8?B?SHFJUVhiMUE1NDdmSUZXQ1BocGdCa2M3KzdUY25OVloyMkYzUTlJalFUSlJE?=
 =?utf-8?B?bnM0a1YyVG9hVjNBNWo1bFNrWWo2TGt3Ny9Yc09DWlJtdDE5L1VQWDJUTURY?=
 =?utf-8?B?Y0lQS3RseUVhQXUwYUdIREx2clZqSisyNmNpbC90aktmSlNBdEZrTzFLZk9D?=
 =?utf-8?B?ZXFKU3ErTVArNWJxTGV3WFJIS2hZakFEZjEwMmVVTFpraUVTY3dEQTNML0lq?=
 =?utf-8?B?M24wdnUrWDFYYkIzSE1RakxXSFJaTklBR21VS3JRNWcrR1BJcUFJOXlXc0Fi?=
 =?utf-8?B?SUJIQjJ2SFZtL2g5MC9UanhVS3ZxMndPUEFMTFloTFBWNlFrTlphYzJWYlY0?=
 =?utf-8?B?YW9YOW4ydDFTZHZrZ25oNkQ0YW5xdEJrRFVqZjVsdEJ5dU44OEo0VGFHdFpY?=
 =?utf-8?B?NkhsSldCUXllNmNxd1hqRTdyZkJ1NFR5Y3lzMkwwSm5FbnNPa1VmeGVrZmUw?=
 =?utf-8?B?bzdsRlQ3SnNQODR4cERVTDFHUWtFTDB4bTVkemdDcXNrZDY0NTZVU3E5aEZU?=
 =?utf-8?B?WmNVbzdpWk9Wek50VStWT0h3ZzE0bFJCMTZhZ3hXeDA5SWtNUlRUdkg1THp5?=
 =?utf-8?B?Q0M1aEFseGFLUW1QU0NxUWx1V0Q2K1VpVS9iNUY2ZE9PZTBlaFQ1OU4vT2JW?=
 =?utf-8?B?N2kycUtqMVcyVmttTlhEUS9peVc2Y1h2UFZac1B3SGN6U0hxdk5uYzNSWEpV?=
 =?utf-8?B?bEpxTXR5VmNQRUZXeTdBSEJwNDVJUXRTTm4rWVpWcG1BK05xTmt3TEdkQ2NB?=
 =?utf-8?B?MUFJTXF5ZGN4a2M0VTBPTnY3VmJRYWh4eVg4NVlYejMrSnFoRm1NTEwwcEdP?=
 =?utf-8?B?SytOQlR0WithWkpPOVBQN1NSSUF2KzJiaTRxS0ZLRnMwbll0WHpocGRlK245?=
 =?utf-8?B?SlNpemhnZEs4T0tpWUI3aHNXTmNOUTc2dVg3cUVUWlJFZUgzVzBpVENVREFx?=
 =?utf-8?B?eHNVZG8velhKNDlpOFZnRUwwb3owcXFIWkY4dGtteCtEZWRaTG9RR1o2UG4w?=
 =?utf-8?B?dGpwM3BobFpjVzE0b29oOUZGU1VvYmg5c05DVkk5VjV1eGxTQ29mVHpjM0Y1?=
 =?utf-8?B?S0NaWTJuL3k0UFF2bE1md3kxb25pVnhvR1BOdGdLVC9hSUo4OFRTTG84Y0xR?=
 =?utf-8?B?YXRWV2dpcFFScFlYWTZndTRzc2lENlIvSHVlQS8zOFRrdDQySzVTNW1XRGNl?=
 =?utf-8?B?czdnVThwaFNIbXZ3RFVKSGdGZE1HZ1B5d0NPVHBQVThRbTd3cHRvbTAreGtx?=
 =?utf-8?B?NGZuVnBOR242U093M09mUGxYUkEwS2MvTyt6Tm5WRnZiaWpKQk5JdmYxM1Zs?=
 =?utf-8?B?TlB4MlBuY3dWS0o1aW85UmU3UU9Dd2RwSDlndWRyQitKc3BsT1VkMmFHelk5?=
 =?utf-8?B?bS9QdjNBb0RBMDNNSkZaK1JpeEdkbVJmQVRaNWV0UVUrMm5uQ2FBL25YSVdD?=
 =?utf-8?B?dHo2bnRxZXBFMmhGb3JLd3FLRmFIK1kwOWpOLy9KdXFSS1ZrdGg0b0dUTEtB?=
 =?utf-8?B?UzJXU0hZTHNjVkprQkF3SWsxYXFBcVhONnFhZGRodVN4K0lEOTlBMmc0YVBU?=
 =?utf-8?B?Z2lXQ3FTTEpwM1hkeE4waHFhcHpjMTByQm9ZY2x5WUo5RXk3M1lWTlBvNmln?=
 =?utf-8?B?VVdXYmR1NkJmZjlaWDRyc200OXp2bzNBNGh0U1UvdEpGZVhiRWM4dFE2a0tm?=
 =?utf-8?B?YVpGazlRdGZEcW9GYVZPNitHOTVNNHgyS2VkZkVLTU9KT0VYT0dhTCs1cW9E?=
 =?utf-8?B?UVEvTzdMbHNQeTVVM294MnI5aFR2RHBBVzdnSXdNQjVaVXNhcmtPUkpHZXBY?=
 =?utf-8?B?c0llNkxSbUxKclRKcTJYamdmcHp4Y1pidmNHMUIwd0NuRExyS25aVHdUa3Vw?=
 =?utf-8?Q?Gy/BEgIZ65+05BMmVUkhtO1/Pm3spwtAUWdDx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1696904d-0415-4a7d-d65b-08defe0f3040
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 16:30:32.2158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raPFfYlnQzfmkt4xhJ9bLWB61dqtE33JKKlIiNVFdZVpu4ry2Q7Dnr+lGB9sqQiKSOhBWvOwafBB7LyQkKkfgEtNx70rnfuNa5cS9xnGMmyxkloi02Mqh/OdPC6c7pa+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10821

On Wed, Aug 19, 2026 at 12:02:02PM -0300, Fabio Estevam wrote:
> On Wed, Aug 19, 2026 at 11:43 AM Frank Li <Frank.li@oss.nxp.com> wrote:
>
> > Make sense, this check should just after
> >
> >         data->irq_count = DIV_ROUND_UP(irqs_num, 64);
> >         data->reg_num = irqs_num / 32;
>
> This is what I did at:
>
> https://lore.kernel.org/lkml/20260817190621.335492-2-festevam@gmail.com/
>
> Zhipeng, feel free to include my two patches in your series.
>
> You also forgot to CC the drivers/irqchip maintainer.

Thanks

Fabio:
	Is it okay to let zhipeng to pick your patch to make a serial to
avoid conflict at maintainer side?

Frank
