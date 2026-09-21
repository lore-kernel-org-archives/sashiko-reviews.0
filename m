Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020111.outbound.protection.outlook.com [52.101.69.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2E466B03
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985772; cv=fail; b=iyCKsoAB2wUlIACIsAJpOOWx9v8p8I+z9oDlrPKV93rFpE9hT9OVur79kb1E0Vi3h1AUBiGh8KtkYPJstkZaGOCg9LTDcJwaM3dP0MLldAB/KfIRQt5SelunRJhYvQ4hxU8/osY5nzixMH7HBKPl1hROgUFVO0oWGlQuGWWscFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985772; c=relaxed/simple;
	bh=OZk11nFhZRIgZeaY0bG48Vep/n/FQKc4VnNN4HLHHO8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R1L//EFJCnWCnysIO1dUfq3vN+ynxOe5suebNgY2eLxjW9/ufeFckoyDtc61CUdwdApH5SEMiIonuWlMRTCZEPEIRnMqz2i5jOBhsNdZQlkL28yjgpVpyw+gYNl25svwpFpWgLowIYt40aD7Rk8UY07ZpNq5qfYnIYvWracJujM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=soeGhemI; arc=fail smtp.client-ip=52.101.69.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="soeGhemI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOJiDEVeeVOewh2NDaNIiK4+VstdKyp/x7nAyMXW14JvF8aNSLARZmzJz/yoQJtqkESp/i3jm8EFrT+xUnTEjyu/8GsfLq/Ikhv/MihQAJRAYk96TJTu0dqTNl4o8QfDdb1IMB5HIVkn6CXdDHgWUdKNGa7M9Q5RSs2O+SjLTARxIWb6qTENhafZrHX2ku8NxE6RIZROVxXT0w5fwg0nPHfG4Wqsp0+YeKPXH+VPL/AHLKrzl6ZBBEVeG3isvWJRy0Ez0G0fcmkT/+yEXDftOOPacykqqqEr6w7reR1K9rugF5nZ2GeG6DIulWhuWR3adnvSSzPUulnCrItUI/W0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybe9Nd0OJW0/wtYoOjE7xGrDHW2zKfeQdGVR4ypQFX8=;
 b=PN+mfammNlv44ZFg3qE9BaxdxdT4HrrQeXI3EOlPgpxxrAkf7sEt8c3lJsQ32sVw4ojTTjA53/EqszAi/MB/+6G3GgqJEWufTEdf00jd1NYd6tjS8q3yUOKorqGt0D7rIkesn0G9avEDGrx4iePkkXJWPbaH1twQ5Xl1LkxuI5Cc8GQy2leHYWJFMfM4IYaGMJ4Ki6fkuhxoe3RLSh931Jkn5pK8nx2M//WYLqqaIeFFfOPRNFhIr3eL9l870njsmcDLphMB4refkktIj7/1RKKrEKk9BTEJR/65/IcDg2L3UfeaQMibCFNtPzkJNTWet2zKrtXWZpfihoy3NAuuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybe9Nd0OJW0/wtYoOjE7xGrDHW2zKfeQdGVR4ypQFX8=;
 b=soeGhemIgGxNgfA7JtvHnGPt8dHiah1vgSm3ELzwgMneHFsGzjRwGljoI5RKLBUfIcjsxTa32h+YyvDZH3q6ZiC2CoMYfmfR/QwPSJ6pyKWZW/N9gwHf6ESmCkuGEyXBCIF3XYODvD9t2QjogxbILGY0Bdpg4Vbe1yYKBGATMRMg2zpAlGHpDi6v+CmSwUB21CnroGBiwqCnTx+cHHstES23koZu+IUzBQivIY87L35SqZ4EO6Ub9dclo+iMw3XF3VzonCzsuo9lXy01dhnO5fJK2alyMd9IgDj4YrYITZzif6rYsvPYXmWd8cHqQSVlBWCbtoAuw1fmoXv9tp3VQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PA4PR10MB5658.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 10:16:00 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:15:59 +0000
Message-ID: <44936d3a-e684-4f74-bd65-6cc683d13792@kontron.de>
Date: Mon, 21 Sep 2026 12:15:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] spi: dw: Use the rx-sample-delay-ns value parsed by
 the core
To: sashiko-reviews@lists.linux.dev, Frieder Schrempf <frieder@fris.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260917-spi-sample-delay-cleanup-v1-0-0e4eddbfb1ce@kontron.de>
 <20260917-spi-sample-delay-cleanup-v1-3-0e4eddbfb1ce@kontron.de>
 <20260917154647.4CEAE1F00899@smtp.kernel.org>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260917154647.4CEAE1F00899@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::17) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PA4PR10MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: bbefa5a2-a510-4360-2d7a-08df17c95459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|10067099003|6133799003|56012099006|3023799007|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4yyvRPr9VLkA4HtG8Su9FO4ONIjy0qMyKs7LYE08ehXLeZo01ZJwQM7WkO1Zjym4J+HYHTGMbWM7STkP8lLeKHl123Y1PCdrb9v/CiBu/D3KNtz4lOq8MyNYm7LlHck+ZxFX80vCOiD1XIwai+2i+iE0CSzS06afCBV4u17muCQSUOLbOVaMCefuUb3XtJ2j0T9nkN/8C5NFMzpRWOe4IXzAMjt4vBivNF6GqonZRfUwCY2xIbtB9xrIpPkgrFkCtqr4rI+E8zl7zTQyC8lChk3aYFZTY+rY/3jrqyazxfO50dPofj0WuqrYZt73xQ+1+oueDJrVoIVjIF+kfBCgQHsprn9DgqxrF3CV/0LG6cjgVZdbgTU1/M9cFgtFq9l0zhKc1R8LnZB93uPsTtx57NMWqyd5iICs1g2aq7XCVh/bR2z0/0ZQtkfoK14zBsGeGsmoQEvBS7PA7oUkKfopckpFmvbdTokBxsJmTwJoith7cF6xqZqtigcj2q/u24UedS0X9ozb1bDpCZvMguv6zVYzOKcTaonD3caojj+A5vzpc3+N0Dq/KAnCcbAoUE9/uvfUB05xFvpHZngqGRQphCpkkskHjiYZiNE6wTsHn6zW4Y1dCWNfETa6urh5RrTQQpwjF9sSO1fQsE2iq9XBa0ZqJV3egx4qFmZlUqkb+Cs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(10067099003)(6133799003)(56012099006)(3023799007)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHBSSmorREZxTVJqL1lBaDZxL3RGSWZnNFAzTExvNFFIVE5XNnJzMEJZNGNK?=
 =?utf-8?B?ZUtnNVloejJKckwxRFV4ZEt1NEk1bUFJR0psdEVqWGhqT0dsTnQ1QjB0MzRz?=
 =?utf-8?B?NWZ4NUpYcTlJbDJCdncybkxRYlZZdVBxeFhDUlFuOUNaUGdNclgwN3NiQlZk?=
 =?utf-8?B?OGl3eWkxcnBiT3d5S3JZeVdFSkdsRmZGTVFGV0ROZ3dxNEVhdFgzdTVidm1T?=
 =?utf-8?B?UG94QStpOVpvVVYyTllnclJZS0Y1QVovNlREcmhVRTgvQ2RwOWtpbVRZdEhx?=
 =?utf-8?B?bnFNYWhTVHhoQThTMTBzTytvcll1VTFEQmtHOW9OVE1BeUJMd0E5RGJWaFcr?=
 =?utf-8?B?TEhQSXIvMVh2QXMxcnNYSlFZV1B2QmQrL0FiSHIybzc0TSs2aExXZURZYVhJ?=
 =?utf-8?B?ek1oRlVzU2FkS1BBTkJvNS8rN1JRNHRVU2R4MnplUU1OTWpLbEMxeWZTVktp?=
 =?utf-8?B?NmRtMG4wY0pVTnROMWkzQ0orL0Q4YzNOVEgwb0lXMVJ3Z0hiWWMyRFN5Z1BX?=
 =?utf-8?B?SEZmT29NOTBXTnlSYUY1NGRUZ3ZpNFUzb3FhblRLL1h1b1RBdHI5ZklKcjh5?=
 =?utf-8?B?Y1B6Vi8vVUx6aEcwdDFHcFZrUElFeUVseWNTNU5WbFhjUkVRbjRvUnFtMlkz?=
 =?utf-8?B?ek81ci9zQUkvL21SWW1tT01EWnBWUXovS3Z3RnNrVTBkVWFqQnpMUHMwNG5P?=
 =?utf-8?B?V2xUMm93c3pYck9YdUZ4dGt0MDVwV2JVNDZadng0M294bFJ5TWRobVZ0TUJu?=
 =?utf-8?B?THVhRlF5a1UzM2Z1eTc1a3JwRERjaUF1dlg0RGh3ZlRwQ0hCL01RWWhXWlNJ?=
 =?utf-8?B?NE1wN0VRRG9GdzNvS0MxemNQWUwvV0laM1JPTG4rMjFrR0pOd3Byc2lLYVlt?=
 =?utf-8?B?M2pHUW52WHVzK1dZTHJBMVROQ3FjMTlOQU9MemxQNE5MaWk3dVdzV2toSlBM?=
 =?utf-8?B?RHN5UVljaHc1SHpacnBKWFpBcnlFM2tsdEtDT0ErNVdxd2xucDRWVEp3dUtE?=
 =?utf-8?B?akpNY0pqTE9udkMxUy91QmtkL0FlUnJBZDJ2OE1JckNOcVhaSUlZeHRTek81?=
 =?utf-8?B?Z3JhVEhrdG1ubEZ6Rkk1eFA5b0NjZkNWVGt3djNudWNycjBDdmx4OFhxNWpk?=
 =?utf-8?B?UHdWTW5CK3J3bGo5WExoREdIdUNnaE0wZGhzcWkwY2JqSVB5RzV2MkFZdUVE?=
 =?utf-8?B?ZUlScFNvd1U5NklHUDluT1M4NzRoalhscDhidkdVS3A1ZUxDdy9TTkwrMUs0?=
 =?utf-8?B?Nkd3dUVxaE9KK0VYZVUybFJWNlF6cC9Ma1RVK0tPQUhKNWx0YUZUN091R2xo?=
 =?utf-8?B?VGlQNk9kQkplOUVzS003ZW1SRkpUSXpMNlVlM2l4eHM5YjFoOFkyVjJXdG4x?=
 =?utf-8?B?TVo5d1pHMWNpMHEwYVJEM2JCNWVLUDNLclAydDVuc2g5S2ZxQU84d1pBeXdR?=
 =?utf-8?B?cmhFMng1dnpMaTFZQm4zME9IWWJwcXBrTzlPcXUrbzRUYUVBalBFT0h6VWgx?=
 =?utf-8?B?OUdtQ281U2xMQlhNWkF6MWVmNGtPNEhodjk3WFg5OXlGTGZ4djlZZ3E5U1JS?=
 =?utf-8?B?R0pNam9PT3ZJSmp2Vm5hRFYrWWVVdCtoNXNPbTAxQ1BQdi9rK1FjYjRkOWhx?=
 =?utf-8?B?V1J5UnE0UVJrUzhjTkhndFBnNERBczRGc05XTEFpMlppcFUyVXVvUUxOSHdy?=
 =?utf-8?B?b3g5bC91OVo4YVZuVEoyMEhOQ2cvL2JjNHNTQnQrTm1sM1BVWjlhMmgwV2VY?=
 =?utf-8?B?WW1aOGpSbmk3VThoUTNrYWVFd0NobnpMTm03TGpsb04wRkgyRjBLZ3VIb1VY?=
 =?utf-8?B?TitnbEdkR005Rm94ZVpZdWJTSXZrSjluTE50U2hnWkJKaVArNWp4NHJqNUs3?=
 =?utf-8?B?SGhNZ3A4bTd6bHNuODQwYzRmeVE2Z3FuYytveFJyS3lJbzlneTlXaGllZzFw?=
 =?utf-8?B?U3dabFRoajM0ZWl3YVRUdHp0WFU5SlQ2YUtYclh0cEh4L0phRzJHZWVlSlA3?=
 =?utf-8?B?L1JDTDUrTUhNMkFCM29ORUtXQnNnS3ZBL1VFRm0wWGsxcXJZSW04MGhrSGs3?=
 =?utf-8?B?QldnMm1YalU0M1J3NGxxN2tITUJHengvUm9XVGhrSlR3emQvWnA3WitucDlL?=
 =?utf-8?B?RGNLNjdScFVxclJrN3BRRjk4QU1BbDRHcUErc3ZDZFdtalRNYXZ5NjBNblFV?=
 =?utf-8?B?MDVIUm9vVCtSY3VpMXBnWmJqTHpVYVZCSjhScVJ2SnVNV3ErdS9wOUdadjI4?=
 =?utf-8?B?WjdzNnZ0L3RTSTNrcUh0YWpOSHFnVFVvUDRBZEo1enlUV2J3VzQvVnowVDEz?=
 =?utf-8?B?bE8zemJKdWNNRHcyY2hSZi9BZGdrcW04bFFnaWFYSzR6MEhnUFNneDJqSURX?=
 =?utf-8?Q?CButo58ws53m1DEw=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bbefa5a2-a510-4360-2d7a-08df17c95459
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:15:59.1274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/7KAUSlwLzSNC25rjzX59UPGTJxoYY5zoKwOUJukyDB07Pnm5rTeiC4hJWDBZvsGAqdSQv4ePMo9bCLaXY4FnWtZqFaL/tZ0JSkj6l5b+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5658

On 17.09.26 17:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] spi: dw: unable to override controller rx-sample-delay-ns to 0
> --
> 
> commit 32c003f916e2933421d0880f812a21d5785775b7
> Author: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> spi: dw: Use the rx-sample-delay-ns value parsed by the core
> 
> This commit drops the private parsing of the rx-sample-delay-ns property
> and uses the value parsed by the core into spi_device.rx_sample_delay_ns.
> It falls back to the controller-wide default when the device does not ask
> for a delay of its own.
> 
>> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
>> index 206d3f9dd83d4..b86b607cc8179 100644
>> --- a/drivers/spi/spi-dw-core.c
>> +++ b/drivers/spi/spi-dw-core.c
>> @@ -1104,12 +1104,13 @@ static int dw_spi_setup(struct spi_device *spi)
> [ ... ]
>> -		/* Get specific / default rx-sample-delay */
>> -		if (device_property_read_u32(&spi->dev,
>> -					     "rx-sample-delay-ns",
>> -					     &rx_sample_dly_ns) != 0)
>> -			/* Use default controller value */
>> -			rx_sample_dly_ns = dws->def_rx_sample_dly_ns;
>> +		/*
>> +		 * Use the per-device value the core parsed from the peripheral
>> +		 * node, and fall back to the controller-wide default when the
>> +		 * device does not ask for a delay of its own.
>> +		 */
>> +		rx_sample_dly_ns = spi->rx_sample_delay_ns ?:
>> +				   dws->def_rx_sample_dly_ns;
> 
> [Severity: Medium]
> Does this ?: operator prevent configuring an explicit 0 ns delay?
> 
> The previous code used device_property_read_u32() in dw_spi_setup(),
> which allowed an explicit value of 0 to override the controller default:
> 
>     if (device_property_read_u32(...) != 0)
>         rx_sample_dly_ns = dws->def_rx_sample_dly_ns;
> 
> By using the ?: operator, a parsed value of 0 is treated as falsy,
> meaning an explicit rx-sample-delay-ns = <0> in the device tree will
> now fall back to the controller's default instead of overriding it to 0.
> 
> Although the commit message states there are no in-tree users relying
> on this behavior, Device Tree is a stable ABI. Does ignoring the explicit
> override of <0> break backward compatibility for out-of-tree configurations,
> potentially causing SPI RX data corruption on boards that require a 0 ns
> delay?
It is highly unlikely that anyone has an out-of-tree DT with a
controller-level rx-sample-delay-ns set and a chip-level
rx-sample-delay-ns set to zero. I don't think we should continue to
support this configuration that was probably never meant to work like
this, is undocumented and doesn't make sense.
