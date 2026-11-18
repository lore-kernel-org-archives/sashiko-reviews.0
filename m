Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.78
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795034366;
	b=NXBbaEpV2MgJoOydHituu+24MgnL/w1QxvP0otRaiDaf3H99/nPxYf3zLMv84rsK9bd+
	 PBj0XpMNDytG+THnXOMxM2E9eeGKkmYeq9uDuuXDRqjO2RawGeudsZPdYVNKOstKs/UL+
	 UOJAJB7yDRPGAOtp+G+xTF1cYULWmcg8D3TuhM83OtmJYf4YVlTQNiAl/dLcXTsvhiSUz
	 DEWK4Cx0QS8Mzl/GpzRUBlAZtfjCEt8++tovaWv+sYwtW2HgOyU3res4jiXvuhsinl7WH
	 ljlXV/AQv2+4A0fPu/lDGBL9TV4k6c7kKGrBYAfIQjwbsjoLrV68DNQWJCRauP8veDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034366;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=83j/H/J+rxmrbgD1SJLO3bS/KgKSsHR/yi8Cj5l/W08=;
	b=RML3qu70YQl37Eks8kh9eDCRyUWE1K09+7ZyvQS1SLbH/r6VVQeF19NLOBaHCTPMHbBo
	 o0ZoYALFXWTX1la3Gf8SULiTzT1Kx+b1ocpx82U71K+Jc/5BX3yFqrNeAlro+jYqydvou
	 j+Nj8hpMESAhsccspBdarN9JAzievD3HQpJ2rXjJb8yrmPA6FEa4ZU+YKjt31RwtmNQ6s
	 qXqyqq9Uz6MfNzzcFjkxJzof+9hJWkHJEaO7l6NYPKICjuw3buDjoPfIxPtfhANOQD8z8
	 6RJH+PSPH7Bjkgu2pITAt7G5gPCBiGmOdiZhCPrutBL88QEsy+XUBjuA6OfqHNoJJRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b="KY8BO/JJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.78
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020078.outbound.protection.outlook.com [52.101.189.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEF606A320
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 20:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDCEF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=KY8BO/JJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTpliteXFwBhRmYajvNqUVkyf2tJBH1nDeGdR91fjTt/5FwK+Femz2bVSiYsoVQPmG2nnMoD8CeVtYGck1nEHZqu4s2aEDglk9aM/0rNk93cBR1nniikpff9c9ck9qGGyTKaaBQ9uYPD7hofLUIqu4j6JGSgMosAwOnRYljUtZM4pye0Xe0a//p+txPvoF779U3Xk3XKOuNGcUWGGCE4BBIvQSqEz6niYZU4/wls3I5/9D0REQQZs6awBVYsyncT1oaLGr34lh3GqTJeFJ0TZ61zJX1Ssm5Q+B+nlIYmO6qXY1HlvHNlepunkAbQ9PnZ3z47A6g6gye32KemJ+oioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83j/H/J+rxmrbgD1SJLO3bS/KgKSsHR/yi8Cj5l/W08=;
 b=GEdBNs8hTP1OOJNHrj77HUyW37nGwzeQZsi2ToJxINoQVPjtE0BwWpOguooDiaFMS9pWIJz+AYBKXCoX/ic8+nGk+DlOze4Gf8E3JdAu3X6qP4375dnRN0Qe/kR8KHJxOhrRVpnkH4UVjU1BZzPRbSjbL6vG/ksxh2rgK2lDmd2wfBsJw790rtfxjR3+fpePiFNBC6SibGAWPv+x2J5OjDUU3KMmuGfrAtqWm8JJQPKZN9TaDjUmM1Kcy+r1FrO4uxv4rrTtmNA6eyVOaXMvI6aEr+sKjLTm7Y3smB9zoxSr1t4va4bV89t9+9odK6Nw0aYJgb2yPnqoUlQ4GZPeDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83j/H/J+rxmrbgD1SJLO3bS/KgKSsHR/yi8Cj5l/W08=;
 b=KY8BO/JJCV37nnf7Wt6BEGF41xiClwE9JdWC1yLrDIf7dya5jzUxO38NacHbKvjJ8qQA76vOfJYZ5qemKzcqsnSSps+dxCCCCnrFQWWb+HiD2OlnhO1w3vt1brxkbcs4AxCve83F8SQsjnjhlJA0ojccZc+wpGoPuGzlkHgSYGxsklHYEFjC9Enct52dhLHXUSelmd35ZWdtCbdCjhaPWXvMfHij4zbWqjbw99PSTz60O4S907bvFE0aIEElL49+mrMitsVGBHGMXrzdv8eB+fWXi2NqpPAHPNdoniDAoz4vpdPiMjSZ37+AjVhlHEF/y2L/5m6VLFFp7DhZloWlqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YQBPR0101MB8941.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:59::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:39:17 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:39:17 +0000
Message-ID: <63327912-e751-4f72-b894-f9b4079844b4@efficios.com>
Date: Wed, 18 Nov 2026 15:39:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] sched/mmcid: Give no concurrency ID to user workers
To: sashiko-reviews@lists.linux.dev, tglx@kernel.org, peterz@infradead.org
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 paulmck@kernel.org, boqun@kernel.org, shuah@kernel.org, kees@kernel.org,
 viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, oleg@redhat.com,
 bestswngs@gmail.com, xmei5@asu.edu, xujiakai24@mails.ucas.ac.cn,
 linux-mm@kvack.org
References: <cover.1794932121.git.mathieu.desnoyers@efficios.com>
 <11039c504295ef6ee0eef55981993d8f5d1f40ce.1794932121.git.mathieu.desnoyers@efficios.com>
 <sashiko-outbox-221445@kernel.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-221445@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0001.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::8) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YQBPR0101MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: d89124b0-fff6-435f-2037-08df45b403ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|22082099003|18002099003|4143699003|56012099006|261026121527099003|261022113327099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JXGBARTwtFJsb+JGOXTIdtaKV6Ra3TjIRLzgiZ0VnktrXaG5NuQwKDBsSgJpVeJffsQv8olWklnI+xHi+5seiHGZDk2rcK2xA+AOSlHrcZ6mK6bun6pT2Twj3zjhs5edyYYVFImTrymzT3XTryrCbJ9g3JAtZwQw9RjqF2HRbLpXsOr1KFd+toiGac5bOo2S3byekAON0qnfCRB5KvQhl44Gh3GgyoO1D95ePqfiapiVt2lftrmTogZxkai0DQ+QSR2wPq+91YYspDvcyNt7V4l4/KKro+vDxo0+HL4lPwMWFx3i8FcfAyb/6zewvZWwRzRfQGYh1Sk/6yctMTcKBHusUCYGhMOHv4sc+AQnLhrxIraZq8QhnhJ2coMZfguonR0+XGtvchRP0FX3D/iVvRvzZxPpv7ncO4ldU2Yg5+1x6eveBMt1bCgahBirVCc1AO/zFtjCZNyUDAMONu0Sz7YNM7t5cUW8Wh5FXO7yz360JfhlS8SeAtDGsR4zAX66t1BNAjLKc3wi8ykxG5/iGRg7KUKj+t1MXobt+uH4EExr1xRp3qOcXAZnzUrnCTuBTJ/yuJnct/rVdY8itv3t8dU8lgK3utMh59Oc/Be3RSg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(261026121527099003)(261022113327099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck5HQmcyVzhKaEhTSS8zYlZRQVRoQnQyLzJTdTk4eDVreGpSODREWlAvcEJP?=
 =?utf-8?B?b2kxbkZBc2kxd3dxZ1RiVEZtMFRuU1hQSnBkOVdlRjJ2aWdGMnpybzl6Q2E5?=
 =?utf-8?B?emtOSUZDTlFndmMyNGVOUnJFbEJJR3U1TytaSVhVeFdWTFFqTndFdTR5YXlG?=
 =?utf-8?B?dXVPNlFFSEQwbHZSUlVRYW5CS0Z0NG1aV1FBOXJhazJtTDJ2R2I5MW9hSU51?=
 =?utf-8?B?S0dQekZnVDZNSzlCZy9mK1JCRW9jM0FPd3gwWUFIeU9EdnJwR0tqWDZRc2Rq?=
 =?utf-8?B?MFhDRVVZNnZ4aVVCQ0JKNEkvVnJyRklxRjdpZVJsUmU4YmtaSkVsWGs4c2hI?=
 =?utf-8?B?K3BoMDBUWGJGSG1Ycm11RVFDWEpmL2ZobkhNU21aOXJqN2dkZi8vWEZPRDFi?=
 =?utf-8?B?SFFGeCtiVkppd3U2Mi9kcjVqWjh5OE1iOXpXL0lRS1pOTDEwQTBXYXNvbm1C?=
 =?utf-8?B?bldpaSs5WkRLZmdrTGVqSUVnSEo3QWV4cnVCSERRM3dEcU5KRmZzbmZPdE9y?=
 =?utf-8?B?QUhiQnhvWjRQeDN6Y2ErdHR5bEF4MWY1NTVpS0xUd2dRYllMNGk3VW9FV0lG?=
 =?utf-8?B?Y1k2dzZCY3EzN2xKL2JnakhvS3FUcFphQUMvK092ajJPQ0dHVDlvbitRQllZ?=
 =?utf-8?B?WThQU2ZJUXg1bWxCTTZpRGQzdnpoQ3BzS2ZZTGYybWFieHU1dlc3YlJiWGdj?=
 =?utf-8?B?b0JBTFIySURvVmFiYUVsc0M2bmlCMHNQdmZQd0sxU0hicnV2ODdUSEsydnJv?=
 =?utf-8?B?emFERGdIUzl5MFcrdlZWLzhNS0ZSQlk0ck1nVVFrMDNmbFg3d3BjSldWOTNk?=
 =?utf-8?B?TVBWNG12Z3JwVEY0dlpmWHBsYTNBQTBFUTY5amw5NS9iWW5hMXFCenExVGNs?=
 =?utf-8?B?MzY0cUhhKy92cG9zU3ZCNTA3d3llclhFK1pvMWNsbHB2R1p1cko1NVRSY2xO?=
 =?utf-8?B?VzFDZWVIbGpBL1FNckI2WE96dFJDZ0o2S0dxT2pLMnFaMzdmcUFxVlEvRGRK?=
 =?utf-8?B?QTJsVDJVaXFKc3BCcS9McGFvblRmR0pFczNLQTlXL090NHpzK0I3Nk1JN2pp?=
 =?utf-8?B?R05zWC9rNW1wTjBTcS9EQ05qM095TmRpN2dNckhGNDl5VERSekpkOHNHaTlM?=
 =?utf-8?B?eFJlbDhkWVgyS01Sc2hSOFhYNUNSSkp1eWN6dDZ3WHlwdXJhVVY3TnBzWjZT?=
 =?utf-8?B?bXBaUWl4NEg5Z2Mxd3p5eUtnOTZMOGVMZXBGeHQ0R0pka0g2amhqb1RocEov?=
 =?utf-8?B?TXo3SXNpNUJJRU5uL3NxS2FKN3A2cld6cXp0d0hwdG9UQ1I2Szh4VGJkNXhh?=
 =?utf-8?B?ek55MDM2cVB5ODc3TE4vZEx2aVZuZE9XamdaVkxUNUdtR1ViRFVrdXN5TFdV?=
 =?utf-8?B?NFpaZXpDQ1E4azdpR3I5MkluQTN4azcwSWlRazdJRW5ic0dzZjZySHpiYkxN?=
 =?utf-8?B?cFBCTTdLeFdmT3oxcFR1SThBQ2Q4MUJ4NmdWK0pnVGZzdVI5S2lIWTRsbVp5?=
 =?utf-8?B?OXI1NXRCSVlOU09EMjZZRG1KMUNmbGxPekFHT2Zmb1A4SXFaVi9GVDJpVzdv?=
 =?utf-8?B?N2FYcWs2SWtvOTNzVkU4UmdFQWNhdXRNNW1JMGlka2JJU2pQOTUvZS9ISGtW?=
 =?utf-8?B?RkpyM1ozQ05yeDQ5Q2dJek1KVDlCS3MyVVFqclZPRDBXdUdZMnpvZFE5QTFw?=
 =?utf-8?B?SkNVY083UEJxV3pkN1laL1hNMUs0TC96bTRIZTR4NGJ2bVROdjJXdlUza2tN?=
 =?utf-8?B?UFQvTncxT01FajVuSFEwTlJXZTZWRDNTNUwxRmd0dnFMMDE1M00rMk4zWkMy?=
 =?utf-8?B?ZGdWYm1OVTg2bmR5OHRpV3NDaUpGWDdHMXpEZ2k1ckp6UXhXa1h1ZTdSZnc0?=
 =?utf-8?B?K043OGpDY2lmNXN0ZEV5MlNDMG9FKzNNN2JEL3dIaTFZejBKZmlBczBtMC9C?=
 =?utf-8?B?NldETnZ5K01MSW82UklITUVOdmt2VXl1V3VRcWMvYTYzbEFXZmk3WUxFZ2hF?=
 =?utf-8?B?MHdqck9LREwwYkxuWXhseGlaeGlxcUJTcGx5Mng3czIycHJoYW5hNElXT0pE?=
 =?utf-8?B?ZlAzb1l3UXhvTUpZdFc1YnhqNml5b3BxV01CckxHUmhEc0s5Wk95d1hENlNi?=
 =?utf-8?B?QUdISWVYai9jclFMUWc4cnRoZmR0RE1sWVpFZ2tQZFVjSTYxRHBZUERSYi9l?=
 =?utf-8?B?Q01JU21UZ2VUL3ZPcy95S0gzeXZnQ1ZBd2x6T3I5cEt5WWhIUm5WdFM2UnY2?=
 =?utf-8?B?L204dHU3eTJNdndlSjhRTFJsUmp4VkFhRldNU1ZUMjVwaVVRVzkzZnhtSFU0?=
 =?utf-8?B?aTFRUWFxRXlJYS9HWWJORFk5akZiSkcxVFUrMzZUSmpUVHFSVEI0ZjAyanFa?=
 =?utf-8?Q?3R6Q4VgnSAKasIHEbpC3r64QVaNox7W9/dLaQ?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89124b0-fff6-435f-2037-08df45b403ef
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:39:17.3250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiXFxRZk73nYVJNFrHYFsi/x9sVImW6l2KjLhCvJDbNPA8Yp/X/CEdwHv5SaKEGFFrZ4XGqKd4/TUSH9g+w6IomIDRalLzcCawVNdRoJ1BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB8941

> Should set_cpus_allowed_common() skip mm_update_cpus_allowed() when
> p->flags & PF_USER_WORKER (or when !p->mm_cid.active)?

Yes. The next version skips it for a PF_USER_WORKER task. Testing
!p->mm_cid.active would also skip a normal task that has not joined the
mm yet.

The widening needs a process that a cpuset limits. Every new task
copies user_cpus_ptr from its parent, and that mask clips the
cpu_online_mask of the SQPOLL thread. So the widening does not happen
in a process limited by sched_setaffinity(). It does not happen either
when the thread that creates the ring called sched_setaffinity().

A new case of mm_cid_bound_test reproduces it. A process forked in a
cpuset of two CPUs creates a ring with an SQPOLL thread, then starts
three threads. In 8-CPU VMs, without the fix, they read an mm_cid of 2
in 4 runs of 4. With it, they read at most 1.

The widening is older than this patch. Before it, the worker took a
CID, so counting its CPUs was consistent.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
