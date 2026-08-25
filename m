Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020132.outbound.protection.outlook.com [52.101.195.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E43334C39
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683346; cv=fail; b=bGvkoFDbrxR5uOZOet8NGj+z5AkHKTECzlxlJbiX8Os/DBsPplyldVuuYRpJw4Rps1YdFwzu4Z3iPM7swkFDrdVyRWa0LrIeBYw8NbPC+Poc6vpS+m54IuIYshNxfV6y0pzwkD5wA1XqjDuoh6DE1r30vvJHnseDbAoMjywF1E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683346; c=relaxed/simple;
	bh=b+LPVPRII167OLUxcv9fc2b9Qg77clDwqodQ2gjnVuY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=buvDKUZU/AaQK90WPqKnR+6QqMMF5P16PHDoXGFQ33d8je4KRDn/mcZj3N2HYEDdec0snMK4T6ENwCFTuw5XxoFUon42AaG6/POVudVE+VzzAEDJhwEpX+MGVFcdu3QBXB+Y/zHfwOJX8r5A1gOEG9PHqFY/4gGNSDqLSf0HLUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=COOXiJic; arc=fail smtp.client-ip=52.101.195.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="COOXiJic"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/WR3lNfOl4iM/K0x6a++xD8YCjpJaFdH/NVvcFvGxGVlY7YYBO3JvMsUqqzQNzlDuWhx5QJVDwSUPycMUD/++O18LxtiTe0s5qqQSV3s6M1ObsEcfUga49x8uqNKCLwwdYrofsy9X8b75ltpjd4uCI7WqxAq5XMX3QU26MFJX2/X1/8kpbznhZ9tdFlGim9qyNPTLJ3QHWorsqtlTu94pk+IWiUXfD1i3uvruR78GndFSHDmWIIKZ0bAPOuZYcTwYF/WyLWZLUwsvr68VeMX/Fa0kVcEbfx2C0rz8QOwN+cm1xmQmt18i9yz4rQ2KTzuA1AootTmbFMDQoxZpiSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQ95RzM53okDdYKUg0AUMtDzTpDAQWjs5WZYSdgFwhQ=;
 b=FCoijbjw1jLQ7AeLBklLoRLkiBajQbcgO8UYdYVog+znPkQNRlkJNNKidlVOQTKJKv1eRR7ZXdx1SmDQGoHbDe7skx3ps4z9o6Kqgzec97vKNDxQVLOfZXYXOjQZNSpffvxCdzes3U7K9m3DOgyd/3FozBAHF2xf+dZPv8uueUsaMNTPB/0ox4VA/YQ33n6mMDV0hLAR2/muR9miG2nYxKs1LHbUhPgpR7BS+O8FikruHUAmRMtz+d/0+OVpSz7Vx63D/zgYlc4ORsxUWI9JCu3yd1w5fk5zn1M7ocbmKHNk/TV43YFEQ7Ls9Bj5mdxcj2yRlogCU+l5ondQqQHKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ95RzM53okDdYKUg0AUMtDzTpDAQWjs5WZYSdgFwhQ=;
 b=COOXiJic1C+AkARZUGgr+q/0BWFKevTksSMU6t82yoxIUdfQ5mEVWNWcmsTX09cte+N4zbPs90+erenEGHLnIc6IebgohjgcRB+wPbbDkf1UjE3GOVgqxiMrqReezaGozfaBJrAC9PcFdDJsAbYUDJV2Okfe6ZuXBWD188sUkhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOBP265MB8753.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:490::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 18:42:20 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 18:42:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 19:42:19 +0100
Message-Id: <DKY8USKYJJVM.17HQ78YIYZMFV@garyguo.net>
Cc: <devicetree@vger.kernel.org>, <conor+dt@kernel.org>, <robh@kernel.org>,
 <ukleinek@kernel.org>
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
From: "Gary Guo" <gary@garyguo.net>
To: "Andrea della Porta" <andrea.porta@suse.com>,
 <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.22.0
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com> <20260720100212.BEF1D1F000E9@smtp.kernel.org> <amN-5B5POX3rNb29@apocalypse>
In-Reply-To: <amN-5B5POX3rNb29@apocalypse>
X-ClientProxiedBy: LO4P123CA0165.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOBP265MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e7c6d5-c75b-43bf-05ee-08df02d89835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|5023799004|56012099006|3023799007|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	FxaKySLIdbFdpqRH3uitXIGuVirnc7KvIfdosa2OZIngOfe7LMVA3ia1T6Z3qg5OgsQUeBrvaSimALpFf/cN3tKTW0jk8MlEsZH9amSKW+27pcmKgX5n/GVC0MczbgcsZS+9h8770MoN3FnLSDG3xYpFUEfGxpqZeEbrxnIzvfV9uHk+5wHZlXrlpY2x+5+obHX66g25GYN8T9ZgRjCHPIb3SswHTIBVr/1Oy1jKx2akJEB33/woe3KFBI+5yR0TmAurRQYzkQV5Lvb4K4eZMtIQMJqwnm/TDsnkUqwuwVfA9O3iTtKziXoyP+GdCMrp1V+zVBS7p16MevT1Pej3nUYul3gI+uTsDZa6EwCAIAFu1yWEQVanU2yIpPhxUbw4gBd8QZGSbFXIO74N+juefpZxW0bO+khO0yagROSmiZqJgRQMTh4adcRjcMT5vlUJwRsZl2xUcxEhW4Lu0f9DvaS+LvlbRUed6Ap5aLZsismfDAXTksjYHr3cItYCiRY96bnuSEsClQbVSu6HinvKCdAbq1qt96hNvPkp3Cs6ACz6a+Wq5LVZf0aLamrhf3I4JYn9srgtRGEXflsA/EogL4gtDZ98G+2dk+kH8+WINFGJkNRLkVEzmw4/r1gx+OjfMaCTeyraJruWkRarAC1YjDTM7nr335BbZ0Q0AoRHFi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(5023799004)(56012099006)(3023799007)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkgvbnpqdUFZZnZOemUzSHRRaHpXYWZPTU9FdXBDc2lXQU9DRzJEbGxMQTdM?=
 =?utf-8?B?bzdYRkduQWdSYm9UNFJRMG1KRVA4akVWb0FkNUtFVENCRGpEd015Rys4SVIw?=
 =?utf-8?B?aE1aZmh3QVF6b29XVDlSM0MxMmF1VjZabDhuc3JaTktHdzNXektSck5XeDRE?=
 =?utf-8?B?bnRSdEs5OEhQMURndklHTGhMMWd2NlB3RUFoZVlWSUpjeXllbUF0WjNpOGZ6?=
 =?utf-8?B?S2E5MFYwUEs3cEhadHJTTkI3ZitabkhxTVErN1h5REFVZmpXQ0Jtem40ajcv?=
 =?utf-8?B?SUx0QkYxUFdXMmg0QjRFU1RuNGtZY1VINVdiSCs0ZzY3K1NNQWtXS1JiWTY4?=
 =?utf-8?B?M3JaT29TcDhDeEU2alg1YXl0ZVJpSXZWYVVrc1Z6N2lkNXlwMVRNY0xXMFdn?=
 =?utf-8?B?V3pDTjBDMlZQT1Rhakd4YjFIaVF6OWZkSUlFbGRLNkFETmE1UU9YK0c0ZVJu?=
 =?utf-8?B?bkp1aW9seVRJSmlEUVdMcWJsb2Q2TTd4RlJMZE5yV2RtZTRrMDE3OEFkdjhV?=
 =?utf-8?B?NXNGbFBpYXBsekVXWWppVDBYTlJsaU9wK2xsTHdLS3V5NHByQ1NtZERaOHUz?=
 =?utf-8?B?RUJoeXRjY1lYbEFDTHdhWjRxdWxNOGQ1d0VSRGRGcUNMNU9uNkFFOU5iTmxa?=
 =?utf-8?B?eVBWbTFPeklnMHUwM2Foa3dtRmk5TWpCQW1vNkxGeWIrNkRwamY4TnRudklh?=
 =?utf-8?B?eVZBVlQ4bnYzVnNQSXcxVlRIeEdEQVhzbGxucVdmajh1blBneUhzVXZFQnZr?=
 =?utf-8?B?WFNzaVJIbDZWWGVSaUFLNGZleVhtOTAxWXAxNkV2Sk00ajFvQWlVWFVlSEYz?=
 =?utf-8?B?VEl2SG1rcVJEL0Z6Kzh4QTdvZ251cFQ4RWZYOXhLQWpPWUQwVVZ5MEpuaUtU?=
 =?utf-8?B?dm9nNDR1RUFmRUVYQnR3RW5sQUhjS1h0ZGoyaEV6YnJkZ1J2UHQrUzVOMzcw?=
 =?utf-8?B?NGpTNFBJeFZqbTB6bE1YSmg1ZHp3NDRXT0ZKSGlhK2dWL1lMWjFCZ1hLUEIy?=
 =?utf-8?B?MFI0Q2JPdUxRZC9ob3JuT2FPamVvb1EyNm5BeWRwREpmRm5sK2FHTjdNREl6?=
 =?utf-8?B?RlBWdE40OVY1N2VkN3kycERLRXdySnJzclE1Ry9sWnhvZnhiT2dUbnlTSlM4?=
 =?utf-8?B?c0FwcjlPR0NYZy91OVMxMlF5SG1OejRoRU43SFB0MlBJQ1U3NjVtWjJzaDJC?=
 =?utf-8?B?V3Y3MXdtR25lcEQvVXNGem15TDZkU3B2L2FqUHBNRkZzQlVndkU2VFhoM2tk?=
 =?utf-8?B?bmxGdTBWQW42RERtdDhmaGVndHhDZ2dLL2ZLMTdjV1lER0FFeDJrRnBicjd2?=
 =?utf-8?B?NjJweGVVcXdLNDg3bnU1UTdzTnZWUWE3SzhNUllqQmFaZWlJaTNyMkJNUUVm?=
 =?utf-8?B?Vlo0dXhnc0RIZXNIYXB1S0tYa0gzNFZxNHMxRDdwVkN1RVhUOTU0TFpKQlRN?=
 =?utf-8?B?TGxwcUM2V0VFQ1A4d2FVenE4ZkFKalZGSVc0eTJUMjd0ajQ5c3FvN0tVbzRv?=
 =?utf-8?B?VXBvRzF3dHBxWkhUbGU5SHhlYnZETURNbUM1ZGhCZ1o1QmM1TUFqQVp0dTRQ?=
 =?utf-8?B?RWJCdUpuQWdMNGttRE04OGxjbVQyREpVT3J4c2cvQmNEbVY5aVFkVmVYU3or?=
 =?utf-8?B?NHlpcUpyNmcza3Y5aDl2TFVxaWxMZnpEOGE4aHB0ajVvKzE1REpVWi8vcXJF?=
 =?utf-8?B?d1E4eS91bXdqaVAwNTliRmVSVFozSVpBUnlvNk0rVUM0bWgxb0pWM29MQVNE?=
 =?utf-8?B?ZEtsQjRJR25kdzhqdDlFT0xzeVNMMndaL0xmem5hWkRVN0ZzSitjNTAvY0kr?=
 =?utf-8?B?K3dhdlJGMElRRkFzSEtIY1cxWmhNTm1JWTAwUlN0cXJPZ21iUWpUUWxGSm9U?=
 =?utf-8?B?YmFJWVlkb0R4T1hMa2NJb2xJZEdCdS80VjYvcThDSUNZY04xQmFCcnZ4S3A0?=
 =?utf-8?B?WGNEalUyUzZYdDg5TnlRYldIZ3c1dmVMdVdNN3Z5VHY0WUpqWUM2RGVGWkFw?=
 =?utf-8?B?bkdVL2dFWWgxQ014ZDRWbW9sNWFUWE85cUEzeWh0eExKTTUrU01EMjhLOENj?=
 =?utf-8?B?NXlLWmZaM3JTTzBtR280ajlpVUlwanhrMDRZdHBMNHQ3dE16aGhXVlJTeEY3?=
 =?utf-8?B?cGY5NGU0NTFIc0lSMnVlVW9WRTk4TDR2OWlSQnJQOWhOQ0VkVitVQkZ2N2Zp?=
 =?utf-8?B?TjQzcE5ObHp2dWZSWVBaMnA3bXYzUjNHRWsrWDhMWXNneXM4REVRbFFlTnRS?=
 =?utf-8?B?MTMydWN2TUcrbTV2TmJJTGw4NGtVRjJDbkU4a1BrRElHdHU1L3JzcnZ5M1Ni?=
 =?utf-8?Q?yvw5zf0zeJmptX6vcz?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e7c6d5-c75b-43bf-05ee-08df02d89835
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:42:20.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fLLYHszumJ/nCqnqqNbM8BK5SjWC74oFzzkyHyMSTO/RDlFs56OFpuwisC27NLh9YU2u4LgBUFS9O1VBXiKpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8753

On Fri Jul 24, 2026 at 4:04 PM BST, Andrea della Porta wrote:
> Hi,
>
> On 10:02 Mon 20 Jul     , sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>> - [High] Missing `.remove` callback leads to Use-After-Free in the PWM a=
nd Syscon cores and leaks clock resources on driver unbind.
>> - [High] Register context loss on suspend/resume silently breaks PWM out=
put.
>> - [High] Unclamped hardware duty ticks lead to integer underflow in the =
PWM core for normal polarity.
>> --
>>=20
>> --- Patch [2]: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver --=
-
>> commit 0c98703d857577902e57d25b42a3d46dfbde5795
>> Author: Naushir Patuck <naush@raspberrypi.com>
>>=20
>> pwm: rp1: Add RP1 PWM controller driver
>>=20
>> The Raspberry Pi RP1 southbridge features an embedded PWM controller wit=
h
>> 4 output channels, alongside an RPM interface to read the fan speed on t=
he
>> Raspberry Pi 5. Add the supporting driver.
>=20
>> > +static struct platform_driver rp1_pwm_driver =3D {
>> > +	.probe =3D rp1_pwm_probe,
>> > +	/*
>> > +	 * .remove is not needed because this driver cannot be removed/unbou=
nd
>> > +	 * cause it relies on syscon which cannot be removed
>> > +	 */
>> > +	.driver =3D {
>> > +		.name =3D "rp1-pwm",
>>=20
>> [Severity: High]
>> Is it safe to omit the remove callback here?
>>=20
>> Even with suppress_bind_attrs set on the driver, if the parent RP1 PCIe
>> device is removed, reset, or unbound via sysfs, it will forcibly unbind =
all
>> child devices.
>>=20
>> Without a remove callback to run cleanup, pwmchip_remove() is never call=
ed
>> and the clock is left enabled. Because the backing memory is devm-manage=
d,
>> the devres subsystem will eventually free the pwm_chip and regmap memory=
.
>> This can leave dangling pointers in the core pwm_chips IDR and the globa=
l
>> syscon_list, which could result in a use-after-free.
>
> This is true. Uwe, I guess I should reintroduce the .remove callback,
> what do you think?
>

How is remove going to work with syscon? The previous version seems to just
ignore it completely.

Also, do you actually need syscon here? Given that the pwm fan device is go=
ing
to depend on the PWM fan device anyway, you could just EXPORT_SYMBOL_NS an =
API
from the rp1 driver that returns the tachometer reading when supplied with =
a rp1
pwm device pointer?

Best,
Gary

