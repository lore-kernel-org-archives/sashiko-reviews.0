Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.102
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792754762;
	b=4n4ZIzaYheciC4z1uDW3L33prvvssqH/t4FAaWrGbBcas941hEahEZuvPPm/BmekDSKH
	 kOsKFhxR07yXsjLZzyI2lofUQNisHgvgiy+BXQdbmIVnsUCBFQ8BvFh5eQW6TgFTRaCSx
	 GKQJBwxCe5OKb4gQZ4prgVjhtrntCdZ82sQ8+FZQuWY5yv0yd9hALt7wOgMyPIi0TkLtF
	 /ikkyMPBs3lWlSRzhjKmUkT9EkhlcC8vZ3IgOZ/gR5xymq+q+0pjTOqETP5uVaw28QwxN
	 TLofIHwLZgADC6oXnz2PHu3V2fiMzoqjWh99DSYvWofbCjmjSymZ/0CJzd8CAm6Lqfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754762;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=oueL0GvkZ3QXGDIGcVz18tH+U+n21gRuXBnoCrNstUg=;
	b=5BfwKuUmeapR6R5ZqendBJjxPudVndSH1711j9PnDLxdoOdXoTwK7jMQBR7XDJixh8C0
	 nR91QhYff3z3fN6icnki5nxcPar93BAAyJr2kG+0ZwAC14uB35L9Ph0nvV9dtwXjmPy9t
	 pIjEXJNQ4EqQHp6bGsqVVnUvNxrEMWSZW+rzprZ+c/rx75dnWugB4IE9ng4PrPQmSZz89
	 Z4ePgYhmuouczGmKGo+E3eHigEb2zEE3XEAAHQhaxX/GHSeOBisVfyVHXx7qgtsx9Nwgi
	 8y9E1gWxQqBFJ7yFyXwA+saaSccIsrzMVX5SJghGgfEDWmg7iSRNs1QKib88Obxbihw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=kIn87YFQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.102
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022102.outbound.protection.outlook.com [52.101.126.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C65E606A31B
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 11:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C65E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=kIn87YFQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEqZxWA9V30lASiDzN+hoc12a73vZ4l18o1WqBADQiNUgkTh/zguR0lvBl+AstfJ7re9uM8hhrZQrfePIcAz7cj1JpZ8Lrz5zhlMdYLlfrWVMUnfOsGKsX7DsznclLUxxxoBTRlYpRyASPMrPk5KrCAGPBbR73KONUWQSwRohveXT/QB7MKh8jcjH9tZ8O4SYy5vKfb7T78YFgnbIDKwj5EVzNElqm+F0ajTGhafI/16w7DhtzsK8BG9JV5EjaarAXfruB4L+3nWI8f6xECjUBVz/bv6Ddm39R8tOoeRisH1G2dSpTMMGecry8KbybCGM850y/aiiv216FRPejksVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oueL0GvkZ3QXGDIGcVz18tH+U+n21gRuXBnoCrNstUg=;
 b=O1Wh6An3pf0ahxMfXQttvtxwFyiDtBf1nBro0kArvzjRhfANos3u1lGUtdZ+GzZHI3Q5ms7Ia+WsqI2sHDYdtaf01KvRLC7YGqtan8WGHeu6/t4QBtRMudJ1f7vg5/X5tFrZX8jtEPzC1wzPb3/JiXXO/IQMktxzaGtH5zdqYbQmn48lce/mB9Zuv5CbtkKl4p1O2JRg3snBjedA/nrqI4lUuUcopfPu77zoHnQOi9gvGD80ON2D0HqP8o6DJWVOo/D/4dGdUJKwT7UiVyAf74A3QdCZ1/dcOzviPv6TX53mrzrpKFpEGxRh0CodQCdPB7bg7jy005MWknVKGErKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oueL0GvkZ3QXGDIGcVz18tH+U+n21gRuXBnoCrNstUg=;
 b=kIn87YFQ4nnke9F9sROtyTXTlbozuP0FSPKOLJhXnBltLfVCNn7Pe1cvLv+HMAITTFTaSeiF85T5VPPX6AZs3PUsrRbdEyRY7VsbAU2xQjJa8dK5IiSqbHBZ2pLyhHwdOZMp1O11qu5jF4AEBVK59YJRIMHxx7sAsql59srSgEYxXBkzu+XKrWkAsUCNRpJYlhlg7250xJ9blKkIDEIVA/adu+uhJcfXFbvpDQvWC6TeYpn8wASjqa8UAfWSPwTMjooB89wJ7kQ+1N2V1aMVkrzj+va7z8aYcNdZfkf/5DEFbFHmKael8IgmzsC0yUXn+W034buwqwLzZ6fNkNABGg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB8127.apcprd03.prod.outlook.com (2603:1096:101:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 11:25:56 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 11:25:55 +0000
Message-ID: <45fb19ed-3b50-4f78-a559-0eecaa6bc257@amlogic.com>
Date: Fri, 23 Oct 2026 19:25:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 media-ci@linuxtv.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-5-616240978792@amlogic.com>
 <sashiko-outbox-181046@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <sashiko-outbox-181046@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 0266ba65-1e2e-4c99-cdfb-08df30f86724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261021130227099003|56012099006|261022113327099003|261022115727099003|4143699003|5023799004|261021135927099003|11063799006|261009223027099003|261021121427099003|10067099003|22082099003|261021123027099003|18002099003|6133799003|3023799007|261021133027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	HEXUdxjJC5hIdvRwEthyNZdI3v9rFh6LqcD4GrxHKJut+VOCSMFXHqFOYeZEDC18b+yy6MKG9US9vvbmGnbp77AaztKT6bWrMN8p3aUDNGUDBThTUVkE9vNcOQCyMDMMgUS5KCFSW5cLrtaHtzWOXvNg2koA5dNgCxvWTopzo9ic8shpXU0DHWTaABFKaXDwUax43uxYt3y2xmFlOmeZyCgJJtypaOCEC8x3QOFMDDqRCwp7PixieVJj5ooJAkNRdiQ7PTkNjggR/PGkP9OTbKqL3PK1sN7uuqGxn6WrbLPorZyP74KIFrnPDfEllVoAmRceiQWhT567l3Ah7cUql4O70SDRVF7UqzwToNS71yCsTb7CfQB76soQvSCdtwo8j0zHFLn/f8gKu13xIAkTgjhzkwJ/xW4vLKXvGKoWIR1c3eWeVuCuPcsaoPaMvza7q2LRdtXBh7LGpq5IaIqWHSbyc1gVAUT4mVLFWOLS9IcqoJhZBjLR3zhA2UUvBI46lo/5xga59Gz2DPqLhISU7xWT+YhPq0hGAExOvOPKATAmb4d3Qy2yB22kiPNgaar2uFyG/3r2h8LsxM+QdSfjPEscyqsiWDlGiV5vBMOQ8ac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261021130227099003)(56012099006)(261022113327099003)(261022115727099003)(4143699003)(5023799004)(261021135927099003)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(261021123027099003)(18002099003)(6133799003)(3023799007)(261021133027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUpOWFNndTVqTmhVdWhxemxBbzV4dEJuVE1vbnVqNUZsVUVrNEY3QUswbzB2?=
 =?utf-8?B?M0lKeXRjMnlPSHY0ZmVxNXhxcGxwV09NMmVPd3R5WFFzeE4wY3k4TlpjamtJ?=
 =?utf-8?B?ak12d2FDYUpBUi9sUmFrUXcyUTJVTGh5YzYzY0Z2OGVka2szdHZKZ3N3clFV?=
 =?utf-8?B?Nkk5UGlrSHZkSUJNMGVibE1ocENjQlNRMmZEbkFJR2tTME1QQWhrc2NIUlF6?=
 =?utf-8?B?Uy8xWHNkWG1Vd3ZZalk0eFNCSUtlc2c4Ny9Db3BCajRjUHNGTXRid2UwdEFz?=
 =?utf-8?B?SklCb3ZZMFo0Rk81M0NHcjRKc2QzalZOeXBsVEVOOVVPc1dzclpvU3JJaUtF?=
 =?utf-8?B?MEcvb001OWdreUVyZ1p3bmdXaHBiS04wSkE1TE9nTjVEZjFuQnN0c1o3QXgv?=
 =?utf-8?B?WENsK0xyaTBERFEzNzViTzl3US9pSHJ2eE1lWmFhaU1oaFBLdU9xN1djU0tI?=
 =?utf-8?B?MEttWkJBOEhhRHFSRFZtbnBrZFg5ZjZlUEVXa1dibWRFdG13b0lydE9lcTJK?=
 =?utf-8?B?Y3NKYVBGem9jQUhSbEo2Q0svRVJDSVJ6MkZLTmdFNEdHaGQ1YXd1RU0rR1lR?=
 =?utf-8?B?MzhDbjdIN2V3SkxWN1BTK3hsckxvYy9XcFgrOFVJQWFuWkZuL2w1OGNnTVFu?=
 =?utf-8?B?akRhVHJ3MFIwMGQzUVZkU0pOLzNKMU85aWtWVTZnb0o5eDhxUnU5SnIrbkx0?=
 =?utf-8?B?ZFRCbzRZOWlNMUtoeWtkMVJIb0JnVjBLVUhvRkNwQXQ3elZqQlFBbEgvdXV4?=
 =?utf-8?B?NEdhWjVFL1ZRRHZsc2R4RVZnejlyZC9SYmpGQ2JWdXVqd1hxYk5JY1RwQ3pK?=
 =?utf-8?B?d0dheEp6U0lKWEc5NEN3eGgySk9jMnFIOXluai9EWmVOSmtyS0JGc3hIb1ls?=
 =?utf-8?B?NFFlZGtiQzh5Nmp4eVk2d0dWUWFLQVAvZjllU1NYTXF1RTh4OWp0K3IzOFVE?=
 =?utf-8?B?VUJpMmF5aUR4WHQvclBWTGxaR1BYcFdXaXRhbytrWlFNd053SGdhdGhOV2di?=
 =?utf-8?B?dE5KcWg3MVovU1g0UGhjMnlzbnBWWEpRUWZJNFJtN2JlUkhwMzBZK2lseDFR?=
 =?utf-8?B?eUl3MFNFbXk2N0lQbG14MHdqRmRjNzNGUGtJcUpKRzJoUGlLVW92cVEvci9a?=
 =?utf-8?B?MjB3N21HWm5jcHZpbUZZRWdaaG5GOW5hUitqcUM0Z3FvaUZnMDhmdDJLS0tk?=
 =?utf-8?B?TnR6K0tmL3p0WStmTmM3ejd3NGVmRlJ6VHgvaVZLNzJHdEZwNzRyQkNmSS9L?=
 =?utf-8?B?MEZST1FaRjNpTEFRZlJNMlphWXJLdzA2bWRvZWh2Z2xQNlFzYjJaUUVWOG80?=
 =?utf-8?B?eXAyUHkwRS9xUnVtTTE5blpPYnFIdEtMbjZWV080blBGVmorVzU3b2lTZDFl?=
 =?utf-8?B?NUwvWGlxSWMxSTVQem1Cbys5MDVQbDBoRG5zWFhEUDVwbU5CZkdGeklZdXRV?=
 =?utf-8?B?Z084c2NMc2FQZ2syUWJxWUFTVTRRVWlrSG84MnprRi9lcUFseGVUdkJGZTVO?=
 =?utf-8?B?akQ2SDhmV0VsVVNYWGVxRExTeTZTaDNZT0JKYmFxVnU3ZXZ5YmRpRkY0K0w3?=
 =?utf-8?B?Q1VPT3diYU01OG03NUMzTzcvZXVDL1k0bnVab2JieUg5clB1ZHZGU2hpS0wv?=
 =?utf-8?B?TUJBWnk4Q0ZpcXlzc2JGMGFEMTg2QmltWWpTRkZVOGxHTWp5ekl6T2VPSUFP?=
 =?utf-8?B?Um1wV2FNTXMvVDg1N2VmaHpMeHNaTUNsRzNkcjlnS2gyYVM0RGRrUm5pVS9k?=
 =?utf-8?B?YjVzVjIzWVlQRkZlQkRQOXlNdDBxOU51S0lvaUcyRjFKbWMwT2NnREtrZC9l?=
 =?utf-8?B?anZ0djJOVC9odlhIaTB6R3U2dXU1SktxUVplVWlZYzdEUWcwME9lbEYwQmVo?=
 =?utf-8?B?VUEyVWRjTGdIR0NkM3NQMEViQ20vOURqYk1Sdk4vTEhvbU5WQ0JrNzFlNDgv?=
 =?utf-8?B?dFpnVHpwd0QvaTVGYXN2SGhkMEx2bUpuSWZ0VzBoTEtBbFQ2RXA4UU16dXNi?=
 =?utf-8?B?TG5BNTBIU2dPVG01Vjg2SGhQWk15TWpBVzhBRnlBLzY1MklvTnk4Z0h3cG5z?=
 =?utf-8?B?VVQ5aE81T0Y2QllDejRsMGgweFBlWkd3dXhUVldZcE95LzdkSTFUcmlPVGJ3?=
 =?utf-8?B?cjE3R0tHM2NxUjlTcTQ5VTdzZ1J6cWpnUWloRkh2eUdnMmtmL0VPT1hReWVk?=
 =?utf-8?B?Y2kyb1FUSXBKTmk3dXZjUjF1Y1F0N2tSOXc5RnlpUmorU3c0OWVxTy9uVHFv?=
 =?utf-8?B?TVhOZENFWWtzcWt5M1R2cXBiOVErUE9ya20waGxvNTdDNHhuWHZtZytLVnEy?=
 =?utf-8?B?QnlsQktOZXR6TXgrMi91R1NHZmFmTjk3Tk52ODRyVTZNZVZjRWU0UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0266ba65-1e2e-4c99-cdfb-08df30f86724
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 11:25:55.6426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqzPFIh2TgUIpdZHRsXIGdVJh1SEzjYuoirRapspAEhurC3R0PHsGunVXs5mkvFMX0mYDdc/nCRNJ9UGvTb3Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8127

This patch is about dts, but all the sashiko feedbacks are about the 
driver.
> [ EXTERNAL EMAIL ]
>
> Thank you for your contribution! Sashiko AI review found 13 potential issue(s) to consider:
> - [Critical] media: amlogic: vdec: OOB read and canvas leaks in h264 reference list handling
> - [Critical] media: amlogic: vdec: colocate buffer OOB DMA write in h264_config_decode_buf()
> - [High] media: amlogic: vdec: aml_vdec_init_dec_inst() returns -1 on queue restart
> - [High] media: amlogic: vdec: invalid IS_ERR() check on meson_sm_get() in probe
> - [High] media: amlogic: vdec: poc_is_in_dpb() and get_dpb_by_poc() ignore active flag
> - [High] media: amlogic: vdec: dos clock in vdec_clock_gate_init() is never enabled
> - [High] media: amlogic: vdec: ignored power and clock errors in aml_vdec_hw.c
> - [High] media: amlogic: vdec: aml_vdec_drv_remove() powers off hw before unregistering
> - [High] media: amlogic: vdec: broken TEE deferral and error codes in aml_vdec_tee_fw.c
> - [High] media: amlogic: vdec: infinite poll under ctx_mutex in h264_config_decode_buf()
> - [Medium] media: amlogic: vdec: missing REGMAP_MMIO and MEDIA_CONTROLLER selects
> - [Medium] media: amlogic: vdec: aml_vdec_drv_probe() registers video_device too early
> - [Medium] media: amlogic: vdec: missing set_pic_info() in reset_output_fmts()
> --
>
> commit 7d77b0e5560dd6f7c9fdd465c00fffdff91c7e55
> Author: Zhentao Guo <zhentao.guo@amlogic.com>
>
> arm64: dts: amlogic: Add video decoder driver support for S4 SOCs
>
> This series adds the Amlogic S4 V4L2 stateless H.264 video decoder driver in
> commit 18a11b2c70a7ef55c42ed897bc1624397ec3430c ("decoder: Add V4L2 stateless
> H.264 decoder driver") and enables the corresponding vdec, canvas, and optee
> device tree nodes in meson-s4.dtsi.
>
>> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/platform/amlogic/vdec/Kconfig
>> new file mode 100644
>> index 0000000000000..2c5dd84529621
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/Kconfig
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +
>> +config VIDEO_AMLOGIC_VDEC
>> +    tristate "Amlogic Video Decoder Driver"
>> +    depends on ARCH_MESON || COMPILE_TEST
>> +    depends on VIDEO_DEV
>> +    depends on V4L_MEM2MEM_DRIVERS
>> +    depends on TEE
>> +    depends on MESON_SM
>> +    select VIDEOBUF2_DMA_CONTIG
>> +    select V4L2_H264
>> +    select V4L2_MEM2MEM_DEV
>> +    select MESON_CANVAS
> [Severity: Medium]
> Should VIDEO_AMLOGIC_VDEC also select REGMAP_MMIO and MEDIA_CONTROLLER here?
>
> In drivers/media/platform/amlogic/vdec/aml_vdec_hw.c,
> dev_request_hw_resources() calls devm_regmap_init_mmio(), which fails to link
> when CONFIG_REGMAP_MMIO is disabled.
Correct, both selects are should added.
> In addition, aml_vdec_drv_probe() in
> drivers/media/platform/amlogic/vdec/aml_vdec_drv.c registers a media device
> with aml_m2m_media_ops (vb2_request_validate and v4l2_m2m_request_queue) for
> stateless H.264 decoding, which compiles to no-op stubs if
> CONFIG_MEDIA_CONTROLLER is disabled. In
> drivers/media/platform/amlogic/vdec/aml_vdec.c, should aml_vdec_queue_init()
> also set src_vq->requires_requests = true alongside
> src_vq->supports_requests = true so non-request buffers are rejected?
Correct, in statelss decoder, non-request buffers should be rejected.
>
> [ ... ]
>
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
>> new file mode 100644
>> index 0000000000000..e65ebb2ce311f
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
> [ ... ]
>
>> +static int aml_vdec_init_dec_inst(struct aml_vdec_ctx *ctx)
>> +{
>> +     struct aml_vdec_dev *dev = ctx->dev;
>> +     struct aml_video_fmt *fmt_out = &ctx->dec_fmt[AML_FMT_SRC];
>> +     int ret = -1;
>> +
>> +     ctx->codec_ops = &dev->pvdec_data->codec_ops[fmt_out->codec_type];
>> +     /*
>> +      * The codec instance is only released when both queues are
>> +      * streamed off: do not allocate a new one (leaking the previous
>> +      * instance) when the output queue is restarted while the
>> +      * capture queue is still streaming.
>> +      */
>> +     if (ctx->codec_ops->init && !ctx->codec_priv) {
>> +             ret = ctx->codec_ops->init(ctx);
>> +             if (ret < 0)
>> +                     return ret;
>> +     }
>> +     ctx->curr_dec_type = fmt_out->codec_type;
>> +     dev_info(&dev->plat_dev->dev, "%s set curr_dec_type %s\n",
>> +              __func__, dec_type_to_name(ctx->curr_dec_type));
>> +
>> +     return ret;
>> +}
> [Severity: High]
> When the output queue is stopped and restarted while the capture queue remains
> streaming, ctx->codec_priv is already non-NULL, so aml_vdec_init_dec_inst()
> skips ctx->codec_ops->init(ctx) and returns the initial ret = -1.
>
> In vb2ops_vdec_start_streaming():
>
>      if (aml_vdec_init_dec_inst(ctx) < 0) {
>          while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
>              v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_QUEUED);
>          return -EINVAL;
>      }
>
> Won't this cause vb2ops_vdec_start_streaming() to always fail with -EINVAL on
> output queue restart unless ret is initialized to 0 in
> aml_vdec_init_dec_inst()?
The ret in aml_vdec_init_dec_inst should be set to 1 since restarting 
the output queue while capture keeps streaming always failed STREAMON.
>
> [ ... ]
>
>> +static int vdec_try_fmt_mp(struct aml_vdec_ctx *ctx, enum v4l2_buf_type type,
>> +                        struct v4l2_pix_format_mplane *pix_mp,
>> +                        const struct aml_video_fmt *dec_fmt)
>> +{
>> +     int i, align;
>> +
>> +     pix_mp->field = V4L2_FIELD_NONE;
>> +     align = dec_fmt->align;
>> +
>> +     if (V4L2_TYPE_IS_OUTPUT(type)) {
>> +             pix_mp->num_planes = dec_fmt->num_planes;
>> +             pix_mp->pixelformat = dec_fmt->fourcc;
>> +             if (!pix_mp->plane_fmt[0].sizeimage)
>> +                     pix_mp->plane_fmt[0].sizeimage =
>> +                         (pix_mp->height * pix_mp->width * 3) / 2;
>> +             pix_mp->height = ALIGN(pix_mp->height, align);
>> +             pix_mp->width = ALIGN(pix_mp->width, align);
>> +     } else {
>> +             pix_mp->height = ctx->pix_fmt[AML_FMT_SRC].height;
>> +             pix_mp->width = ctx->pix_fmt[AML_FMT_SRC].width;
>> +     }
>> +
>> +     v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
>> +                                    &dec_fmt->stepwise);
> [ ... ]
>
>> +static int vdec_s_fmt_output(struct aml_vdec_ctx *ctx, struct v4l2_format *f)
>> +{
>> +     struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +     struct v4l2_pix_format_mplane *cap_fmt = &ctx->pix_fmt[AML_FMT_DST];
>> +     const struct aml_video_fmt *out_fmt;
>> +     struct vb2_queue *vq, *peer_vq;
>> +     int ret;
>> +
>> +     vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +     if (vb2_is_busy(vq) &&
>> +         pix_mp->pixelformat != ctx->pix_fmt[AML_FMT_SRC].pixelformat)
>> +             return -EBUSY;
>> +
>> +     /*
>> +      * Since s_fmt output will reset the width and height in the capture queue,
>> +      * s_fmt_output with resolution change should not take effect when capture
>> +      * queue is busy.
>> +      */
>> +     peer_vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +     if (vb2_is_busy(peer_vq) &&
>> +         (pix_mp->width != cap_fmt->width ||
>> +         pix_mp->height != cap_fmt->height))
>> +             return -EBUSY;
> [ ... ]
>
>> +static void reset_output_fmts(struct aml_vdec_ctx *ctx)
>> +{
>> +     struct aml_vdec_dev *dev = ctx->dev;
>> +     const struct aml_video_fmt *out_fmt;
>> +     struct v4l2_pix_format_mplane fmt;
>> +
>> +     /* reset default output fmt to V4L2_PIX_FMT_H264_SLICE */
>> +     out_fmt = aml_vdec_get_video_fmt(dev, V4L2_PIX_FMT_H264_SLICE);
>> +     if (!out_fmt)
>> +             return;
>> +
>> +     ctx->dec_fmt[AML_FMT_SRC] = *out_fmt;
>> +
>> +     memset(&fmt, 0, sizeof(struct v4l2_pix_format_mplane));
>> +
>> +     fmt.height = out_fmt->stepwise.min_height;
>> +     fmt.width = out_fmt->stepwise.min_width;
>> +     /* reset bytesperline to 0 for output fmts */
>> +     fmt.plane_fmt[0].bytesperline = 0;
>> +     fmt.colorspace = V4L2_COLORSPACE_DEFAULT;
>> +     fmt.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +     fmt.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +     fmt.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +     vdec_try_fmt_mp(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, &fmt,
>> +                     out_fmt);
>> +
>> +     ctx->pix_fmt[AML_FMT_SRC] = fmt;
>> +}
> [Severity: Medium]
> In fops_vcodec_open() -> aml_vdec_reset_fmts() -> reset_output_fmts(),
> set_pic_info() is not called after vdec_try_fmt_mp(). If userspace starts
> streaming without calling vdec_s_fmt_output(), won't ctx->pic_info.fb_size[0]
> remain 0, causing h264_config_decode_spec() and h264_config_ref_spec() in
> drivers/media/platform/amlogic/vdec/h264.c to set c_dma_addr equal to
> y_dma_addr for single-planar NV12/NV21 capture buffers?
>
> Also in vdec_try_fmt_mp(), pix_mp->plane_fmt[0].sizeimage is calculated from
> pix_mp->height * pix_mp->width before ALIGN() and
> v4l2_apply_frmsize_constraints() clamp the dimensions, and in
> vdec_s_fmt_output(), pix_mp->width and pix_mp->height are compared against the
> 64-aligned cap_fmt dimensions before vdec_try_fmt_mp() aligns them. Should
> sizeimage and the busy resolution check use the aligned and clamped dimensions
> instead?
>
> [ ... ]

The first one is an invalid case, since the decoder instance will not be 
created without calling vdec_s_fmt_output. The codec_priv remains NULL 
without calling vdec_s_fmt_output so neither device_run or isr will take 
effect.

The sizeimage part is a also false positive --vdec_try_fmt_mp() calls 
v4l2_fill_pixfmt_mp() after clamping, whichrecomputes sizeimage from the 
aligned dimensions, so the pre-ALIGN calculation is never the final value.

>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
>> new file mode 100644
>> index 0000000000000..1870d56659cf4
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> [ ... ]
>
>> +     ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
>> +     if (ret) {
>> +             v4l2_err(&dev->v4l2_dev, "Failed to register video device");
>> +             goto err_vid_dev_register;
>> +     }
>> +
>> +     dev->mdev.dev = &pdev->dev;
>> +     strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
>> +     media_device_init(&dev->mdev);
>> +     dev->mdev.ops = &aml_m2m_media_ops;
>> +     dev->v4l2_dev.mdev = &dev->mdev;
>> +
>> +     ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, vfd_dec,
>> +                                              MEDIA_ENT_F_PROC_VIDEO_DECODER);
>> +     if (ret) {
>> +             v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
>> +             goto error_m2m_mc_register;
>> +     }
>> +
>> +     ret = media_device_register(&dev->mdev);
>> +     if (ret) {
>> +             v4l2_err(&dev->v4l2_dev, "Failed to register media device");
>> +             goto err_media_dev_register;
>> +     }
>> +     vdec_enable(dev->dec_hw);
>> +     return 0;
> [Severity: Medium]
> In aml_vdec_drv_probe(), video_register_device() exposes the video node to
> userspace before dev->v4l2_dev.mdev is initialized, before the media
> controller entities are registered, and before vdec_enable(dev->dec_hw) powers
> on the VDEC hardware domain and clock.
>
> Could a userspace process open the video device immediately after
> video_register_device() and race with media controller setup or trigger
> m2mops_vdec_device_run() before vdec_enable() has run?
>
> [ ... ]
I think this is a minor problem, but it's still worth fixing.
>
>> +static void aml_vdec_drv_remove(struct platform_device *pdev)
>> +{
>> +     struct aml_vdec_dev *dev = platform_get_drvdata(pdev);
>> +
>> +     /*
>> +      * The IRQ is devm-managed and only released after remove()
>> +      * returns: mask it and wait for any in-flight threaded handler
>> +      * before powering off the VDEC domain, otherwise the handler
>> +      * could access powered-down registers.
>> +      */
>> +     disable_irq(dev->dec_hw->dec_irq);
>> +     vdec_disable(dev->dec_hw);
>> +     media_device_unregister(&dev->mdev);
>> +     v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
>> +     video_unregister_device(dev->vfd);
>> +     media_device_cleanup(&dev->mdev);
>> +
>> +     v4l2_m2m_release(dev->m2m_dev_dec);
>> +     dev->pvdec_data->destroy_hw_resource(dev);
>> +     v4l2_device_unregister(&dev->v4l2_dev);
>> +}
> [Severity: High]
> In aml_vdec_drv_remove(), disable_irq() and vdec_disable(dev->dec_hw) power
> off the VDEC domain and disable the VDEC clock before unregistering the media
> and video devices or releasing M2M contexts.
>
> If a decode job is in flight in aml_h264_dec_run() or an open file handle is
> subsequently closed via fops_vcodec_release() -> vb2ops_vdec_stop_streaming()
> -> aml_h264_exit(), won't read_dos_reg() and aml_stop_vdec_hw() perform MMIO
> accesses to DOS_BUS registers that have already been powered down and
> unclocked?
Yes, this is a problem.
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
>> new file mode 100644
>> index 0000000000000..043f0bbf32516
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> [ ... ]
>
>> +void dos_enable(struct aml_vdec_hw *hw)
>> +{
>> +     dos_reg_write_bits(hw, DOS_GCLK_EN0, 0x3ff, 0, 10);
>> +
>> +     regmap_write(hw->map[DOS_BUS], GCLK_EN, 0x3ff);
>> +
>> +     regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, (1 << 31), 0);
>> +}
> [ ... ]
>
>> +static int vdec_clock_gate_init(struct aml_vdec_hw *hw)
>> +{
>> +     hw->gates[CLK_DOS].id = "dos";
>> +     hw->gates[CLK_VDEC].id = "vdec";
>> +     hw->gates[CLK_HVDEC].id = "hvdec";
>> +
>> +     return devm_clk_bulk_get(hw->dev, CLK_MAX, hw->gates);
>> +}
> [Severity: High]
> vdec_clock_gate_init() acquires hw->gates[CLK_DOS] ("dos"), but
> pm_vdec_power_domain_power_on() and pm_vdec_power_domain_power_off() only
> enable and disable the "vdec" and "hvdec" clocks, and dos_enable() only writes
> internal DOS registers.
>
> Where is hw->gates[CLK_DOS].clk prepared and enabled before dos_local_config()
> and dos_enable() access DOS_BUS registers? If CLKID_DOS is gated by the
> bootloader or clk_disable_unused, won't these MMIO accesses hang or abort?
The dos_clk is always-on in the chip, so there's no need to enable it 
manually.
>
> [ ... ]
>
>> +static int pm_vdec_power_domain_init(struct aml_vdec_hw *hw)
>> +{
>> +     int i, err;
>> +     const struct power_manager_s *pm = hw->pm;
>> +     struct pm_pd_s *pd = pm->pd_data;
>> +
>> +     mutex_init(&hw->pm_mutex);
>> +
>> +     for (i = 0; i < VDEC_MAX; i++) {
>> +             pd[i].dev = dev_pm_domain_attach_by_name(hw->dev, pd[i].name);
>> +             if (IS_ERR_OR_NULL(pd[i].dev)) {
>> +                     err = PTR_ERR(pd[i].dev);
>> +                     dev_dbg(hw->dev, "Get %s failed, pm-domain: %d\n",
>> +                             pd[i].name, err);
>> +                     pd[i].dev = NULL;
>> +                     continue;
>> +             }
> [ ... ]
>
>> +static void pm_vdec_power_domain_power_on(struct aml_vdec_hw *hw, int id)
>> +{
>> +     const struct power_manager_s *pm = hw->pm;
>> +     struct device *dev = pm->pd_data[id].dev;
>> +     struct clk_bulk_data *gate_node = NULL;
>> +     int ret = 0;
>> +
>> +     if (id == VDEC)
>> +             gate_node = vdec_get_clk_by_name(hw, "vdec");
>> +     else if (id == HVDEC)
>> +             gate_node = vdec_get_clk_by_name(hw, "hvdec");
>> +
>> +     if (gate_node) {
>> +             ret = clk_prepare_enable(gate_node->clk);
>> +             if (ret) {
>> +                     dev_err(hw->dev, "failed to enable %s clock: %d\n",
>> +                             gate_node->id, ret);
>> +             } else {
>> +                     if (id == VDEC) {
>> +                             clk_set_rate(gate_node->clk, 499999992);
>> +                             dev_dbg(hw->dev, "after set, vdec clock is %lu Hz\n",
>> +                                     clk_get_rate(gate_node->clk));
>> +                     }
>> +                     dev_dbg(hw->dev, "the %-15s clock on\n", gate_node->id);
>> +             }
>> +     } else {
>> +             dev_info(hw->dev, "clk %d, unreachable\n", id);
>> +             ret = -ENODEV;
>> +     }
>> +
>> +     if (!ret && dev) {
>> +             ret = pm_runtime_resume_and_get(dev);
>> +             if (ret < 0)
>> +                     dev_err(hw->dev, "failed to power on %s domain: %d\n",
>> +                             pm->pd_data[id].name, ret);
>> +             else
>> +                     dev_dbg(dev, "dev: %p link %p the %-15s power on\n",
>> +                             dev, pm->pd_data[id].link, pm->pd_data[id].name);
>> +     }
>> +
>> +     /*
>> +      * Do not touch the DOS registers when the clock or the power
>> +      * domain could not be enabled, the MMIO access would abort.
>> +      */
>> +     if (!ret)
>> +             dos_local_config(hw, 1, id);
>> +}
>> +
>> +static void pm_vdec_power_domain_power_off(struct aml_vdec_hw *hw, int id)
>> +{
>> +     const struct power_manager_s *pm = hw->pm;
>> +     struct device *dev = pm->pd_data[id].dev;
>> +     struct clk_bulk_data *gate_node = NULL;
>> +
>> +     dos_local_config(hw, 0, id);
>> +
>> +     if (dev) {
>> +             pm_runtime_put_sync(dev);
>> +             dev_dbg(dev, "dev: %p link %p the %-15s power off\n",
>> +                     dev, pm->pd_data[id].link, pm->pd_data[id].name);
>> +     }
>> +
>> +     if (id == VDEC)
>> +             gate_node = vdec_get_clk_by_name(hw, "vdec");
>> +     else if (id == HVDEC)
>> +             gate_node = vdec_get_clk_by_name(hw, "hvdec");
>> +
>> +     if (gate_node) {
>> +             clk_disable_unprepare(gate_node->clk);
>> +             dev_dbg(hw->dev, "the %-15s clock off\n", gate_node->id);
>> +     } else {
>> +             dev_info(hw->dev, "clk %d, unreachable\n", id);
>> +     }
>> +}
>> +
>> +static void vdec_poweron(struct aml_vdec_hw *hw, enum vdec_type_e core)
>> +{
>> +     if (core >= VDEC_MAX)
>> +             return;
>> +
>> +     mutex_lock(&hw->pm_mutex);
>> +     if (!hw->pm->pd_data[core].dev)
>> +             goto out;
>> +
>> +     hw->pm->pd_data[core].ref_count++;
>> +     if (hw->pm->pd_data[core].ref_count > 1)
>> +             goto out;
>> +
>> +     hw->pm->power_on(hw, core);
>> +
>> +out:
>> +     mutex_unlock(&hw->pm_mutex);
>> +}
> [Severity: High]
> There appear to be two error-handling issues in the power domain and clock
> helpers here:
>
> 1. In pm_vdec_power_domain_init(), if dev_pm_domain_attach_by_name() returns
> an error pointer (such as -EPROBE_DEFER) or NULL, pd[i].dev is set to NULL and
> the loop continues while returning 0. Then vdec_poweron() sees
> !hw->pm->pd_data[core].dev and exits without enabling the clock or power
> domain, while vdec_enable() still returns 0. Won't subsequent MMIO writes in
> m2mops_vdec_device_run() -> dos_enable() access unpowered and unclocked DOS
> registers?
>
> 2. In pm_vdec_power_domain_power_on(), if clk_prepare_enable(gate_node->clk)
> succeeds and pm_runtime_resume_and_get(dev) fails, gate_node->clk is left
> enabled and the failure is not propagated to vdec_poweron() or vdec_enable(),
> leaving ref_count at 1. When vdec_disable() -> vdec_poweroff() ->
> pm_vdec_power_domain_power_off() later runs, won't it call
> dos_local_config(hw, 0, id) on the unpowered domain and call
> pm_runtime_put_sync(dev) despite pm_runtime_resume_and_get(dev) having failed?
>
> [ ... ]

Partially acknowledged. The power domains are fixed SoC components 
described in the same dtsi, so dev_pm_domain_attach_by_name() can only 
fail if the device tree itself is broken; the failure is logged.

We keep the tolerant behavior for now.

>> +     hw->canvas = meson_canvas_get(&pdev->dev);
>> +     if (IS_ERR_OR_NULL(hw->canvas))
>> +             return PTR_ERR(hw->canvas);
>> +
>> +     sm_np = of_parse_phandle(pdev->dev.of_node, "amlogic,secure-monitor", 0);
>> +     if (!sm_np)
>> +             return -ENODEV;
>> +
>> +     hw->sec_fw = meson_sm_get(sm_np);
>> +     of_node_put(sm_np);
>> +     if (IS_ERR(hw->sec_fw))
>> +             return PTR_ERR(hw->sec_fw);
> [Severity: High]
> In drivers/firmware/meson/meson_sm.c, meson_sm_get() returns NULL (not an
> ERR_PTR) when the secure-monitor platform device has not probed yet.
>
> Because IS_ERR(NULL) is false, dev_request_hw_resources() succeeds with
> hw->sec_fw == NULL instead of returning -EPROBE_DEFER. When decoding starts in
> m2mops_vdec_device_run() -> load_firmware() -> meson_sm_call(hw->sec_fw, ...),
> won't meson_sm_call() dereference a NULL hw->sec_fw pointer on fw->chip?
>
> Similarly, above that check, if meson_canvas_get() were to return NULL,
> if (IS_ERR_OR_NULL(hw->canvas)) return PTR_ERR(hw->canvas); would return 0.
> Should hw->canvas use IS_ERR(hw->canvas) and hw->sec_fw check !hw->sec_fw and
> return -EPROBE_DEFER?
>
> [ ... ]
Correct: meson_sm_get() returns NULL when the secure monitor is not 
registered yet. Fixed by checking for NULL and returning -EPROBE_DEFER.
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
>> new file mode 100644
>> index 0000000000000..9af9eae88fb89
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> [ ... ]
>
>> +     /* Open session */
>> +     memcpy(sess_arg.uuid, uuid.b, TEE_IOCTL_UUID_LEN);
>> +     sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>> +     sess_arg.num_params = TEE_PARAM_NUM;
>> +     ret = tee_client_open_session(ctx, &sess_arg, param_init);
>> +     if (ret < 0 || sess_arg.ret != TEEC_SUCCESS) {
>> +             dev_info(hw->dev,
>> +                      "%s open session failed, cmd = %u, ret = %d, res = 0x%x, origin = 0x%x\n",
>> +                      __func__, cmd, ret, sess_arg.ret, sess_arg.ret_origin);
>> +             if (!ret)
>> +                     ret = sess_arg.ret;
>> +             goto free_shm;
>> +     }
>> +
>> +     inv_arg.func = cmd;
>> +     inv_arg.session = sess_arg.session;
>> +     inv_arg.num_params = TEE_PARAM_NUM;
>> +
>> +     while (sent_size < fw_size) {
>> +             memset(shm_va, 0, ONCE_SENT_SIZE);
>> +             if (fw_size - sent_size > ONCE_SENT_SIZE) {
>> +                     memcpy(shm_va, (firmware_data + sent_size),
>> +                            ONCE_SENT_SIZE);
>> +                     param_invoke[0].u.memref.size = ONCE_SENT_SIZE;
>> +             } else {
>> +                     memcpy(shm_va, (firmware_data + sent_size),
>> +                            fw_size - sent_size);
>> +                     param_invoke[0].u.memref.size = (fw_size - sent_size);
>> +             }
>> +             param_invoke[0].u.memref.shm = shm;
>> +             ret = tee_client_invoke_func(ctx, &inv_arg, param_invoke);
>> +             if (ret < 0 || (inv_arg.ret != TEEC_SUCCESS && inv_arg.ret != TEEC_ERROR_BUSY)) {
>> +                     dev_info(hw->dev,
>> +                              "%s invoke func failed, cmd = %u, ret= %d, res = 0x%x, origin = 0x%x\n",
>> +                              __func__, cmd, ret, inv_arg.ret,
>> +                              inv_arg.ret_origin);
>> +                     if (!ret)
>> +                             ret = inv_arg.ret;
>> +                     goto close_session;
>> +             }
>> +             sent_size += param_invoke[0].u.memref.size;
>> +     }
> [ ... ]
>
>> +     ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
>> +     if (IS_ERR(ctx)) {
>> +             dev_info(hw->dev, "Failed to open TEE context\n");
>> +             ret = PTR_ERR(ctx);
>> +             goto free_firmware;
>> +     }
> [Severity: High]
> In aml_vdec_drv_probe() -> dev_request_hw_resources() -> aml_tee_fw_preload()
> -> pass_firmware_to_tee():
>
> 1. When the OP-TEE driver has not registered its TEE device yet,
> tee_client_open_context() returns ERR_PTR(-ENOENT). Propagating -ENOENT causes
> aml_vdec_drv_probe() to fail permanently instead of deferring probe with
> -EPROBE_DEFER.
correct, fixed by mapping it to -EPROBE_DEFER
> 2. In tee_pta_invoke_cmd(), when tee_client_open_session() or
> tee_client_invoke_func() returns 0 with sess_arg.ret != TEEC_SUCCESS or
> inv_arg.ret != TEEC_SUCCESS, ret is assigned the raw u32 TEEC status code
> rather than a negative errno (which aml_vdec_drv_probe() only checks for
> ret < 0).
Not a functional bug. TEEC error codes are 0xFFFF00xx values, which are 
negative when stored in an int, so the ret < 0 checks in the probe chain 
do take effect.
>
> 3. In tee_pta_invoke_cmd(), when inv_arg.ret == TEEC_ERROR_BUSY, the error
> branch is skipped and sent_size += param_invoke[0].u.memref.size advances past
> the current 128 KB chunk without retrying it. Won't this silently drop a
> chunk of firmware data?
The err code TEEC_ERROR_BUSY means that the data transfer has not yet 
completed. In fact the whole firmware needs to be separated into three 
parts. If the transfer is incomplete, TEEC_ERROR_BUSY is returned after 
each output packet transfer, so upon detecting TEEC_ERROR_BUSY the 
transfer must continue. This is necessary.
>
> [ ... ]
>
>> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/platform/amlogic/vdec/h264.c
>> new file mode 100644
>> index 0000000000000..7ec7af73d44c7
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/h264.c
> [ ... ]
>
>> +static int poc_is_in_dpb(int poc, const struct v4l2_h264_dpb_entry *dpb)
>> +{
>> +     int i;
>> +     int ret = 0;
>> +
>> +     for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
>> +             if (poc == dpb[i].top_field_order_cnt) {
>> +                     ret = 1;
>> +                     break;
>> +             }
>> +     }
>> +
>> +     return ret;
>> +}
> [Severity: High]
> In poc_is_in_dpb(), dpb[i].top_field_order_cnt is matched across all 16
> entries of dpb[] without checking dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE.
> The same issue also occurs in get_dpb_by_poc() further below:
>
>      static struct v4l2_h264_dpb_entry *
>      get_dpb_by_poc(struct v4l2_ctrl_h264_decode_params *decode, int poc)
>      {
>          int i;
>
>          for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
>              if (decode->dpb[i].top_field_order_cnt == poc)
>                  return &decode->dpb[i];
>          }
>          return NULL;
>      }
>
> Because unused DPB entries have flags == 0 and top_field_order_cnt == 0 (and
> evicted entries may retain their stale top_field_order_cnt with the active
> flag cleared):
>
> 1. In h264_config_decode_spec() -> clear_unused_col_buf(), poc_is_in_dpb()
> matches inactive DPB slots, preventing canvas_pos and colocated_buf slots from
> being released on non-IDR frames and exhausting the 17 canvas_pos slots
> (especially on multi-slice frames where h264_config_decode_spec() is called on
> every slice).
>
> 2. In h264_config_decode_buf(), if an inactive DPB slot with
> top_field_order_cnt == 0 precedes an active reference picture with POC 0,
> get_dpb_by_poc(decode, 0) returns the inactive slot, so
> if (dpb && (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) evaluates to false
> and writes 0 into H264_BUFFER_INFO_DATA for the active reference frame.
>
> Should both poc_is_in_dpb() and get_dpb_by_poc() require
> (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)?
No, if the frame is no longer used as a ref frame but still in DPB, the 
V4L2_H264_DPB_ENTRY_FLAG_ACTIVE probably be 0. If condition is added, 
these frames will missed.
>
> [ ... ]
>
>> +static int get_refidx_by_picnum(struct aml_h264_ctx *h264_ctx, int pic_num,
>> +                             int curr_list)
>> +{
>> +     int i;
>> +     struct h264_decode_buf_spec *ref_list;
>> +
>> +     if (curr_list == 0)
>> +             ref_list = &h264_ctx->ref_list0[0];
>> +     else
>> +             ref_list = &h264_ctx->ref_list1[0];
>> +
>> +     for (i = 0; ref_list[i].dpb; i++) {
>> +             if (pic_num == ref_list[i].dpb->pic_num)
>> +                     return i;
>> +     }
>> +
>> +     return -1;
>> +}
>> +
>> +static struct h264_decode_buf_spec *get_st_refpic_by_num(struct aml_h264_ctx *h264_ctx,
>> +                                                      int pic_num, int curr_list)
>> +{
>> +     int i;
>> +     struct h264_decode_buf_spec *ref_list;
>> +
>> +     if (curr_list == 0)
>> +             ref_list = &h264_ctx->ref_list0_unreordered[0];
>> +     else
>> +             ref_list = &h264_ctx->ref_list1_unreordered[0];
>> +
>> +     for (i = 0; ref_list[i].dpb; i++) {
>> +             if (pic_num == ref_list[i].dpb->pic_num && ref_list[i].long_term_flag == 0)
>> +                     return &ref_list[i];
>> +     }
>> +
>> +     return NULL;
>> +}
>> +
>> +static struct h264_decode_buf_spec *get_lt_refpic_by_num(struct aml_h264_ctx *h264_ctx,
>> +                                                      int pic_num, int curr_list)
>> +{
>> +     int i;
>> +     struct h264_decode_buf_spec *ref_list;
>> +
>> +     if (curr_list == 0)
>> +             ref_list = &h264_ctx->ref_list0_unreordered[0];
>> +     else
>> +             ref_list = &h264_ctx->ref_list1_unreordered[0];
>> +
>> +     for (i = 0; ref_list[i].dpb; i++) {
>> +             if (pic_num == ref_list[i].dpb->pic_num && ref_list[i].long_term_flag == 1)
>> +                     return &ref_list[i];
>> +     }
>> +
>> +     return NULL;
>> +}
>> +
>> +static void reorder_short_term(struct slice *curr_slice, int cur_list,
>> +                            int pic_num_lx, int *ref_idx_lx)
>> +{
> [ ... ]
>
>> +     for (c_idx = num_ref_idx_lx_active; c_idx > *ref_idx_lx; c_idx--)
>> +             memcpy(&ref_list_reordered[c_idx], &ref_list_reordered[c_idx - 1],
>> +                    sizeof(struct h264_decode_buf_spec));
>> +
>> +     memcpy(&ref_list_reordered[*ref_idx_lx], pic_lx, sizeof(struct h264_decode_buf_spec));
>> +     dev_dbg(&ctx->dev->plat_dev->dev, "%s : RefPicListX[%d ] = pic %p pic_num(%d)\n", __func__,
>> +             *ref_idx_lx, pic_lx, ref_list_reordered[*ref_idx_lx].dpb->pic_num);
>> +     *ref_idx_lx = *ref_idx_lx + 1;
>> +
>> +     n_idx = *ref_idx_lx;
>> +     for (c_idx = *ref_idx_lx; c_idx <= num_ref_idx_lx_active; c_idx++) {
>> +             if (ref_list_reordered[c_idx].long_term_flag || !ref_list_reordered[c_idx].dpb ||
>> +                 ref_list_reordered[c_idx].dpb->pic_num != pic_num_lx)
>> +                     memcpy(&ref_list_reordered[n_idx++], &ref_list_reordered[c_idx],
>> +                            sizeof(struct h264_decode_buf_spec));
>> +     }
>> +
>> +     h264_ctx->list_size[cur_list] = num_ref_idx_lx_active;
>> +}
> [Severity: Critical]
> Can reference list reordering and canvas allocation read out of bounds,
> dereference a NULL dpb pointer, and leak hardware canvases?
>
> 1. In reorder_short_term() and reorder_long_term(), when
> num_ref_idx_lx_active == 16 (V4L2_H264_NUM_DPB_ENTRIES), the shift loop copies
> ref_list[15] into ref_list[16] and sets list_size[cur_list] = 16. Because
> h264_release_decode_spec() only clears indices 0 .. list_size[cur_list] - 1,
> ref_list[16].dpb remains non-NULL. On a subsequent call where
> ref_list[0..16].dpb are all non-NULL, the loops in get_refidx_by_picnum(),
> get_st_refpic_by_num(), and get_lt_refpic_by_num() have no upper bound on i
> and read past the end of ref_list0[] / ref_list1[].
>
> 2. When num_ref_idx_lx_active exceeds the number of valid entries built by
> h264_config_ref_lists() (or when h264_config_ref_spec() fails on an entry),
> reorder_short_term() and reorder_long_term() set
> h264_ctx->list_size[cur_list] = num_ref_idx_lx_active. Then get_canvas_index()
> allocates hardware canvases via config_decode_canvas() for every entry up to
> list_size[cur_list] without checking buf->used or buf->valid (also writing DMA
> address 0 to ANC0_CANVAS_ADDR for canvas_pos 0), whereas
> h264_release_decode_spec() only frees canvases when if (buf->used) is true,
> permanently leaking canvases from the meson_canvas pool. In addition, in
> h264_threaded_isr_func(), h264_release_decode_spec() is only called before
> get_canvas_index() when first_mb_in_slice != 0, so a second
> H264_SLICE_HEADER_DONE interrupt with first_mb_in_slice == 0 leaks the
> canvases allocated for the first slice.
>
> 3. In h264_config_decode_buf(), when h264_ctx->list_size[1] > 0,
> colocate_pic = &h264_ctx->ref_list1[0] dereferences
> colocate_pic->dpb->top_field_order_cnt without checking colocate_pic->valid or
> colocate_pic->dpb != NULL.
>
> [ ... ]
The same as patch v12 6/6.
>
>> +     read_poll_timeout(read_dos_reg, reg_val,
>> +                       !(reg_val & 0x800),
>> +                       10, 0, true, hw, H264_CO_MB_RW_CTL);
> [Severity: High]
> In h264_config_decode_buf(), read_poll_timeout() is called with timeout_us = 0
> while vdec_threaded_isr_handler() holds hw->ctx_mutex.
>
> Since timeout_us = 0 polls indefinitely in read_poll_timeout(), if bit 11
> (0x800) of H264_CO_MB_RW_CTL does not clear, won't vdec_threaded_isr_handler()
> spin forever under hw->ctx_mutex and cause aml_h264_dec_run() to deadlock on
> mutex_lock(&dec_hw->ctx_mutex) when wait_event_interruptible_timeout()
> expires?
Yes, the read_poll_timeout should be given a timeout value. If timeout 
happens, just ignore the error register state and continue decoding.
>
>> +
>> +     /* col buf for curr frame */
>> +     colocate_adr_offset = COL_SIZE_FOR_ONE_MB;
>> +     if (use_mode_8x8_flag)
>> +             colocate_adr_offset >>= 2;
>> +     colocate_adr_offset *= curr_slice->first_mb_in_slice;
>> +
>> +     if (h264_ctx->curr_spec.col_buf_index >= 0 &&
>> +         h264_ctx->curr_spec.col_buf_index < h264_ctx->colocated_buf_num) {
>> +         /* collated_cma_addr is limited to 32bit by flag GFP_DMA32 when allocated */
>> +             colocate_wr_adr = (unsigned int)h264_ctx->collated_cma_addr +
>> +                 ((h264_ctx->one_col_buf_size *
>> +                   h264_ctx->curr_spec.col_buf_index) >> (use_mode_8x8_flag ? 2 : 0));
>> +             if (colocate_adr_offset > h264_ctx->one_col_buf_size ||
>> +                 colocate_wr_adr + h264_ctx->one_col_buf_size >
>> +                 (unsigned int)h264_ctx->collated_cma_addr_end) {
>> +                     dev_err(hw->dev,
>> +                             "Error, colocate buf is not enough, index is %d\n",
>> +                             h264_ctx->curr_spec.col_buf_index);
>> +                     return -1;
>> +             }
>> +             regmap_write(hw->map[DOS_BUS], H264_CO_MB_WR_ADDR,
>> +                          (colocate_wr_adr + colocate_adr_offset));
>> +             dev_dbg(hw->dev, "col buffer addr = 0x%x col_buf_index %d\n",
>> +                     (colocate_wr_adr + colocate_adr_offset),
>> +                     h264_ctx->curr_spec.col_buf_index);
>> +     } else {
>> +             regmap_write(hw->map[DOS_BUS], H264_CO_MB_WR_ADDR, 0xffffffff);
>> +             dev_dbg(hw->dev, "col buffer addr = 0xffffffff\n");
>> +     }
>> +
>> +     if (h264_ctx->list_size[1] > 0) {
>> +             struct h264_decode_buf_spec *colocate_pic =
>> +                 &h264_ctx->ref_list1[0];
>> +             struct h264_decode_buf_spec *curr_pic = &h264_ctx->curr_spec;
>> +             int l10_structure = 2;  /* for pic struct == FRAME, default to 2 */
>> +             int cur_colocate_ref_type;
>> +             unsigned int colocate_rd_adr;
>> +             unsigned int colocate_rd_adr_offset = 0;
>> +             unsigned int val;
>> +
>> +             cur_colocate_ref_type =
>> +                 (abs(curr_pic->poc - colocate_pic->dpb->top_field_order_cnt) <
>> +                  abs(curr_pic->poc - colocate_pic->dpb->bottom_field_order_cnt)) ? 0 : 1;
>> +             colocate_rd_adr_offset = COL_SIZE_FOR_ONE_MB;
>> +             if (use_mode_8x8_flag)
>> +                     colocate_rd_adr_offset >>= 2;
>> +
>> +             colocate_rd_adr_offset *= curr_slice->first_mb_in_slice;
>> +             if (colocate_pic->col_buf_index >= 0 &&
>> +                 colocate_pic->col_buf_index < h264_ctx->colocated_buf_num) {
>> +                 /* collated_cma_addr is limited to 32bit by flag GFP_DMA32 when allocated */
>> +                     colocate_rd_adr = (unsigned int)h264_ctx->collated_cma_addr +
>> +                         ((h264_ctx->one_col_buf_size *
>> +                           colocate_pic->col_buf_index) >> (use_mode_8x8_flag
>> +                                                            ? 2 : 0));
>> +                     if (colocate_rd_adr_offset > h264_ctx->one_col_buf_size ||
>> +                         colocate_rd_adr + h264_ctx->one_col_buf_size >
>> +                         (unsigned int)h264_ctx->collated_cma_addr_end) {
>> +                             dev_err(hw->dev,
>> +                                     "Error, colocate rd buf is not enough, index is %d\n",
>> +                                     colocate_pic->col_buf_index);
>> +                             return -1;
>> +                     }
>> +                     val  = ((colocate_rd_adr_offset + colocate_rd_adr) >> 3) |
>> +                             (cur_colocate_ref_type << 29) |
>> +                             (l10_structure << 30);
>> +                     regmap_write(hw->map[DOS_BUS], H264_CO_MB_RD_ADDR, val);
> [Severity: Critical]
> In h264_config_decode_buf(), can a slice with a non-zero first_mb_in_slice
> program H264_CO_MB_WR_ADDR and H264_CO_MB_RD_ADDR to DMA past the end of the
> colocated buffer slot or past h264_ctx->collated_cma_addr_end?
>
> When use_mode_8x8_flag is set, each slot's stride is
> h264_ctx->one_col_buf_size >> 2, but colocate_adr_offset and
> colocate_rd_adr_offset are compared against the unshifted
> h264_ctx->one_col_buf_size, allowing the offset to cross into the next 3
> colocated buffer slots.
>
> Furthermore, the end-address check tests
> colocate_wr_adr + h264_ctx->one_col_buf_size > h264_ctx->collated_cma_addr_end
> without adding colocate_adr_offset (and likewise for colocate_rd_adr without
> colocate_rd_adr_offset), so when col_buf_index is at the end of the buffer and
> colocate_adr_offset > 0, colocate_wr_adr + colocate_adr_offset can point up to
> one_col_buf_size bytes past collated_cma_addr_end.
In fact, every slot of the col buffer is allocated according to the 
maximum possible requirement, so no out-of-bounds access can occur here. 
That said, the point raised is indeed a valid concern, will consider 
fixing it in the next version.
>
> [ ... ]
>
>> +}
> [ ... ]
>
>> --
>> 2.43.0
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com?part=5
