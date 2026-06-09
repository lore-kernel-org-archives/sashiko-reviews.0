Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013023.outbound.protection.outlook.com [52.101.83.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E44337268F;
	Tue,  9 Jun 2026 18:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781028104; cv=fail; b=d2+dmuSr/322W/y47xOnBj53QR2RPrC5xDCu+MoAGsOIm5X9PAfYAG11RAR/t3tSf3vPE/SpRn6QQfs2XDw4/k19HmYc+yacIeIZcWXaHaCfV+qbEtG22U0Rn0EAwQVRnNeTLfkA28w4T78WoU/44gDpp6kZ5+g9jyM45BY/Lrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781028104; c=relaxed/simple;
	bh=P0HhobPclxx+ew8tMKMHRNQDPBQQ2CEcsDad4RvNum8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M2Sibn6rCagv2isEbl+X0cB4KCRV5/53Jalcad0AjJT7zDB3H4UzkB0ajaf4ZODFfRvEqPn7WRi9Yx4wlCNrXrxc2gQuwwbURVAvN0r0QsMYAohP9sRJxj/TR11X76qqiq21bYbOEh7M9W0Xp9KYmQkeoAygZL7JH7Jj/IJjAag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O8iDQpNb; arc=fail smtp.client-ip=52.101.83.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O8iDQpNb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVnhCVlHgQPCPjbwRIDtPpY88CLcyyWWcgsvw7BYeBJjuYlVc0jsCUceueaAGNpDYzHTUfD5zW/fvftQvOdhhn5r4hpqHS8coKk2Z5wSoVynXRX40NrVt2d3JxQ78so1XstqpU+DOdAl43kcyLqt8Qd0FRj/AfbEsytczHIDAQ6wku2p4tdSm7stTIOFEWlQiuwvQOqHgjsshqLo8eEEp8/nDgacnCnzfgXCk1ZvzjrG8Bn1cN/ViTh91zDeeV5yfLkjvJD+Dq0jPRaeTz552BDTATZYUojZCyKJIrmRy8Mn+6PHrA8QyaGz6b2dUdUSpkfqIer8Noy+n/2uaEFBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSZM2/W7lbKnOUMpin316bC3MUh/sdg7bJeoCRNO4SM=;
 b=IwHjXftqc4GibcvFX1vX1uNu3mb+edJoLBH0VPdF5KUmxiCNDTMtdyenCf6fK+LuZnmQ/QOnejKNoRIldzJZV5ENVZfNRfpN47iIOOMrCFxALUngMtWyQ1rYQP3K+/Ak25hbgu3xrS18z+VMz4OEoaVdM4EciLJoR17k1mrcc2hIoZaBVEpD8HBruC/Wkp8BsyzlYb7d+W19JNA40Doe7edDFsBngFE2D6pFjNO3vV0mCcPZlwfB2kyC/695epVEia7Wy5yAq4bMypFhDdngfIRKxd1KBnK0Qo3/J0TYbotu/KCXLN8Zu7qmpFRt0PrsjR2xsYOp9dAHMBYFFSgvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSZM2/W7lbKnOUMpin316bC3MUh/sdg7bJeoCRNO4SM=;
 b=O8iDQpNb90kWIlVqGOPXkX2YFBLGD/xxGhj9BOPVmKmBT2c56JsvUFHf41eLgaIEkfEbW5c+BEUkFzzSl4NI+a3oRMwlzxIPukwnIUvBnPmDZAEZVD6leAAMW6X0C1QjQQbd5mh7ZhL/9hUWwoDO8tVm/U+Su5lwewOqI7TDwCKAXHZ6nto9syPsU7z+Cr4QzB//Dxqo+Jksm3h3tSCuLyrgeuDsOS675JDu7/RbpaOwgaq/WJeZJrWhjkIoiZI2KCiArsLxTweTQfUbWHhJykuAhpwrbmIrnE0oMoVBLtf0WkPzU37xfsgnP5MFu0BaIzbIZJdqDtm6dOdJbr61MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8475.eurprd04.prod.outlook.com (2603:10a6:102:1de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 18:01:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 18:01:39 +0000
Message-ID: <023aa47c-6fbc-486f-b5c7-5145ddf8e8fe@oss.nxp.com>
Date: Tue, 9 Jun 2026 13:01:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add
 64-bit pci regions
To: Arnd Bergmann <arnd@arndb.de>, Josua Mayer <josua@solid-run.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
 <20260524151347.BD92A1F000E9@smtp.kernel.org>
 <3528dc91-1ffc-42f9-94ea-a27c6c1d6a50@solid-run.com>
 <9e6326f6-dad1-4169-a63c-e62ee5b341f2@app.fastmail.com>
Content-Language: en-US
From: Frank Li <frank.li@oss.nxp.com>
In-Reply-To: <9e6326f6-dad1-4169-a63c-e62ee5b341f2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:806:d0::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0f05bc-3434-47e1-725c-08dec65127a2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nz15QzuA15mmIBhRdoCjlgA3oWA5RaNV4XqYb6h/PhlGI0lnucrJ7TS7MO1/qBETO23K7wQfrJjwjTmQYJt5YHHBXXEACAy1ecck0aX3CqMD6dLSTVnDURfopPyb0tEp5Sx05GHPxAXmsrnDhQavYl2bMtu+xzHxg25Hb6zvm9Zh/NcNRkRIckleFMCyrZ/GjPsap9bplqG9iw+ks9PD+movE22T1Ute20q/c9Vq+yfOXr8K9dJuyT/HHm7MafLqt67TEDzG6dcfz2zxF9E6igJSRuHIG9pPVXGI+XLwvXcy/5KnpeJp9JjWxl/4Bn+JDoJsjX5Y06mkXOckQW/WHGAnb2zGj2v4V/IYFH5WuVHBukIrWYFbYI2dlY4k6F4SAy6IQXb4hAKyIZLVowIW79E7VW/o0YUcKQvhsgrviFMEmy/aXSMwHu2P5WifQ0Q5btAJ4qIJ6Fx3nCOZL+9IRhQc7IoP52QgV3MUnkv5F8jlmKy+9Okj7G6wkRXSQBgyKzsHCvucOs+UoNHqza63buDjsrNQouRzFHmihH7ZDYEY2me17/Ab8iKcKin1Hj2f2onDCK94DlB2InHwPY8NMMkMU2T0tz8PG9YEnd745cS0XnwzueoZrEz96aEgDrS4TtUzC6mjVS53DUig1wtQ7L28mTjN1W7MX854wzR5nlW9UEhVsCmclTDEIs4zKCqb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm84V3JTSGJubEVBRWFQQ25DWjMyQ2RZODJHSGsyTGF2eU1vd1hEeFlrQkhF?=
 =?utf-8?B?RlhiMERBMUZ4enVVUDl6ZnlVbUJ5T2c1QzhBcXB4bTNtV2xjSTdqTk9xbldr?=
 =?utf-8?B?aml6N0J6UzVrdXVxK0NzYnBMcHZQb2pyRDFmblpCcnQ5QmVVZExKTllYZWFQ?=
 =?utf-8?B?TnFWK25RcTVmSDhYOXpYeVZ6ZTMyWjRrSkZ3TzJLTWF5aTlJaytxYnhoQjZM?=
 =?utf-8?B?L2hTTzBQTzBhY2lhVnQ4RGtDTDBIRnYwNi9XVFhGWm1raHZaTDZWL2NPMkp2?=
 =?utf-8?B?YnlSejJZUzJMNzB2aGpTd3J2cGhhSG43UDkveFUzWWtDUFE1ZkUyQVRQQlRN?=
 =?utf-8?B?SkQ3VStMWkVSbnV2enR6SmtSRjVycWZ6T28vblVvNk1SaWNFTU1ZVVd1OFJq?=
 =?utf-8?B?N21PZDJ3VGlZY3M2YWF5Tjh2R09udUhaaXlhOXdMK0k1S2ZidjZDWE1pdDlF?=
 =?utf-8?B?VGxBTjNCbis4Nll5MmFBVllFblBNRERkdXJXOVJNTlAzaU5KRE1UYzZCZU1U?=
 =?utf-8?B?aDZnWGZ6Zzl1alZOOW8xYWdZMW1HRWVIQ3BldlNyaXBvSXVKaVZOM1I4LzNB?=
 =?utf-8?B?dXhsdmo5ajV1SndXWm5lbE1acUpoeHRrU3ZFYlhVRXdrMFJ1TEQrOFU3S0l2?=
 =?utf-8?B?dnlTQWV4cVB3Z2xjcVM2K25IRjY1WkhXV1lhV1NwanFjUkFYekl0ZUZiQ2N1?=
 =?utf-8?B?akI0akh2bVZWekpKaXRTN0NsV0M0cSs0MnF2M01GN3dWMTlWdGk5azZiZDV5?=
 =?utf-8?B?N2pjRGxONTZyUWhORS9BLzVZcUFrbHNzWmhsMk1MNDhveWZFN0YzajgweDdF?=
 =?utf-8?B?UzhtT1JrL0UyUXVFbmFhK1NsSXFCeURvYjFvZFF1ODNQUHJtY1NzTkVGY3ox?=
 =?utf-8?B?ck42YVpwcEQ1bFl5TURSSitXMUZKK0dMM2NiMXZkVkg3QnBMNUtTL2RmMEky?=
 =?utf-8?B?TnBXMWNSV0FpZGxHV1plalVnejc2MHhwNUtyYWlRejA0bjNLTjM5ZFAxSGpU?=
 =?utf-8?B?TWhPdWZhMkNMVEt2ZVRxU0FSUy9MMGRVZXhkR3ZXUTlxck1uWVpoOTFYVC9C?=
 =?utf-8?B?NjBDUnc1OWQxbzNCcUpoYnVERWlINVRIalNGWDB0Z3E1MFh4dkVKaFZjR1FN?=
 =?utf-8?B?YVhEZmdObkRGR0dqUjJ1ZTlQN0Q1N05KSDYyREQ3ZFA4UisxYi9iNWlkaEVV?=
 =?utf-8?B?a0dEb0N5QnA1eUFLU0lBdTEzSUlYUHl3blYveG44T1FyTGFXbUdCdnJGTmtK?=
 =?utf-8?B?aXZaQ0I2dUg4b05vaVRJMHRiSjBqL1R1L3ZBeVFlclBpM0t5MFFIL1hEVmo1?=
 =?utf-8?B?YjI2N2Nad3dERXBpcUVpQ2lhUDZuRTBPL2ErL2NldWFEWDl4dDJvZllqSFZp?=
 =?utf-8?B?YjhaUGxISVVNbUc0Q2pseTFkamZEdXNrc1pHYUgxMW1KRnU5cm41ZkFQdnNk?=
 =?utf-8?B?aTM3TEFOdmZ2N0syV2huaktGeUhmSVlESGRRR3A5SHVWcXZtbkVCdHhlUWIw?=
 =?utf-8?B?Zk9aTG9PWWRuckZkZXcvMnVqQlRJeFNRSk1meWlFRi9zRlFrT2VsT2JRZlBi?=
 =?utf-8?B?NmJQOFd2WU9PdjZYUlQ2ckNqVUl2L01oWVMwZHdXUDA1S2piWjFGZm1IcUJn?=
 =?utf-8?B?UDFaSkJMZm1LK28xbE1ZWk9WK2hsR2Rmc20rZ05vZWNpUWVKQTJCZE9jWEJ6?=
 =?utf-8?B?cE1PeThRUnQ5OGtPTHZkZzhZZ1pGdEpkbnNaYStRQ256TS9yMWJtc1Qxandl?=
 =?utf-8?B?RnF5ZXhHUmZqcE9WVWRTL0E3MjNvMXlJYmE3ZmhkUzRlVjgwcUdSQWxPQlN0?=
 =?utf-8?B?dXdFaFRUSWZLZTJPK0xJOXJTRDZOb0NXWE5aeTQxWERwbXl0Ry9hamxwL0M4?=
 =?utf-8?B?dDdzeXhTL2xXaU9xa3BNRTFjd1JDcG4yaHZkRXhiZzNxVkNKdCtDUnhjMWRn?=
 =?utf-8?B?QU1zSXNwR3l0dzFobVBwR01JY3hnQWtvMDduS0FMYVJhOTQ4Y1RyV2VNMi81?=
 =?utf-8?B?YXBSN0pqQXhxcExlMUpNRndBVjJtODJzMUJJYUdLczYvaDRRTHA0ME5yRnEx?=
 =?utf-8?B?WTVxSmxCT2tyRlRvVlZjdmF6WjdhNWV1U2F4ZE1aeno4UVNMM3hqcWI3Qnp5?=
 =?utf-8?B?TW5DWWVwaDQ1Q3Q3L3NVTjhyWFN5N0pKYmJLWFJLaWJMYTNCSjhvWk5SYU1y?=
 =?utf-8?B?YksrZnlCdnl6Rm5INyszL3E1YVFOaUtXczlidFpPWHZ2WVIzVDM2QVV3bmV0?=
 =?utf-8?B?WkZPWm5tU0xNTHNwRitRZXA3WU4yMFJxZ2I1TW1VNVRmSjdNY083MW5Hc2xE?=
 =?utf-8?B?RXJOTWtlT2RtR0k3SzNpY3dpc3hxa2xWMFoxc09ER244eEFqUlk3UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0f05bc-3434-47e1-725c-08dec65127a2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 18:01:39.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgusSPT0hgJ+TCia8mZhagE2vg+8NdTga5RkJEE5b9mUECEEDxgpFPAoezqEAUKmq4J/caMR1VLmKNR9F7vRPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8475



On 6/9/2026 12:24 PM, Arnd Bergmann wrote:
> [You don't often get email from arnd@arndb.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Sun, May 24, 2026, at 19:12, Josua Mayer wrote:
>> Am 24.05.26 um 17:13 schrieb sashiko-bot@kernel.org:
> 
>>>> -   ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
>>>> -             0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
>>>> +   ranges = <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
>>>> +            <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
>>>> +            <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
>>> [Severity: High]
>>> Does expanding the 32-bit PCI outbound window to 3GB (0xc0000000) cause it to
>>> overlap with inbound system memory?
>>>
>>> System memory starts at physical address 0x80000000. Since there isn't a
>>> dma-ranges property mapping inbound DMA to a different bus address, system
>>> memory uses a 1:1 mapping, meaning inbound DMA targets 0x80000000 and above.
>>>
>>> If a PCIe device requests a large 32-bit BAR, the kernel might allocate it
>>> within this 0x40000000-0xffffffff range. This causes the Root Port's
>>> downstream bridge Memory Limit register to be programmed to a value >=
>>> 0x80000000.
>>>
>>> A Root Port won't forward upstream memory transactions if the address falls
>>> within its programmed downstream window, as it assumes it is peer-to-peer
>>> traffic.
>>>
>>> Could this intercept endpoint DMA targeting system memory in the overlapped
>>> range and cause system hangs?
>> This configuration was tested with NVMe and GPUs,
>> the SMMU should ensure isolation pci bus addresses do not overlap with
>> physical ram base address.
> 
> I noticed the same thing while reading through the pull request
> for 7.2, and I think the bot message is correct here. The SMMU
> does not help here because addresses on the same bus are routed
> inside of the PCIe host bridge rather than directed to the host
> side. If the non-prefetchable ranges ever get assigned to an
> address 0x80000000, this definitely breaks.

The address and size is 64bit,
	0x80_40000000..0x80_FFFFFFFF for 32bit non-non-prefetchable
         0x84_00000000..0x87_FFFFFFFF for 64bit prefetchable memory

AI Bot wrong think it is 32bit address and size.

Frank

> 
> You will not hit this in most tests, because large MMIO windows
> are likely to be 64-bit capable and will end up in the
> prefetchable range and addresses are usually assigned from
> the lowest address. You can try to force the bug by starting the
> non-prefetchable window just below the start of RAM for testing,
> which will assign some of the devices to the RAM area.
> 
>          Arnd

