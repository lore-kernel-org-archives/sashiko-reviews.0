Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021134.outbound.protection.outlook.com [52.101.95.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129534A4823
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530738; cv=fail; b=onRVMmYIZlxa1GBcIoYr6zPf+JtldKc//U3CBvapdkUvcsg+n9j5XCYV1jlBvIEf7xAXLEnls/dIZpDA2FgWmuznUPkbJvLbZFzXthhHzb2YMJbxVXE0nJtrzqhJTM8rh9BB2PzcLbubA/fQ3mblNJZkJq/5YGMc4EOcR5gmvrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530738; c=relaxed/simple;
	bh=BGJZQ24fRdu6A5XP71Mhl8fRFpQg1x3ejuK1iHKEl0w=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=YvU6ABFoIhd3x/TbaGPmTBhyLWbTBgHSBbjMN8DSqB7uJiejhA/yA25QoUrIzunlpeHjOpNfelxzXtTR864ygM6tM5Jv43oQZU5K9uS/KLmNW5FGmM+3agiV/hEVy0q14Uik1Ek/v5n272aE3mrE7/lcoCIZTysXfk0XlBzml3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lDM1C/U1; arc=fail smtp.client-ip=52.101.95.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lDM1C/U1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hblRI4ungIcpp1nyBXXfDOJh4sLUeFSZVtPpA4e6OVQefMBIsWVHHosFDZeyiyCNdCJT6dUD5QeEhHgo1Z0ouAnKAUapXM4jCfSaF+m9luO5Juot6HmYq8phx3jHK3gTMOiuMmDxC27oUDJxn3Q2+OstEw21+VNmI0H3+Y9k0QejBIzFeB7haenXrxUI75kqJfG2xLT+lUJTTsTfkywBzXYoe0z+r66kcHV3PDm0waD4hCJDnDT9TuJ0z9pXd3b7DzQw7ex+yCMheDV+YIPx/rsXlL1fbj5qqwI5W+XLS88P56YBFs1cTAfoRon6aytJUuKFkXzfHfsh7oZmgvT/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvLt+01L6nOKsF3GG/X9OvGCF76CBWueOczjFx4grHk=;
 b=uZ9nenM1dbLyOOSIOKlpm/xfgjhgbL8w9FqeKBB5hY2eYH7chEBo6V3nA6fH03d4tv51SS9dZli0uYGxSE2tCnGyqIOtPux9P/WystTOgOAe63BHKc7X0UDRodekKC1Ol1sO2PkC4XQSIf9+ywKvnZunLbey5bWiBYQe8C+1rrLRIuzTvJXpnCnbsHD14aocRUtszW6tgsFZ93mgR9EoUtBhKwofnmmb9LBI1Exn4uj3Bft8PGRHDOrYttC0EPgJeH7GkJLfR7lmtaF4axNI6+P/r9oHmmM/RKFPBAl9XO0h/PjTXh8PQkDYqsAYquvPGR9oaikuKim+AMeD0Dc1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvLt+01L6nOKsF3GG/X9OvGCF76CBWueOczjFx4grHk=;
 b=lDM1C/U1OWzZM34M5gutPrMYtk3+0utfg7U6wnnPX6LnvqCzsxJZQ4crDwvTVvRSxYCoJX5zF3BtgE0bfvjEqUVxdETF6Gymh5bEoEuxBhGhy7JZC9alaEhtS4sTmtp/iDqVKRzmQM/Ds+Vky0vl20rFK5zoMx0CUi7CIfxKePw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB489761.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:602::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:05:32 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:05:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 15:05:31 +0100
Message-Id: <DL6L8B6QAU01.1VCZAOPAUH4LP@garyguo.net>
To: "Andrea della Porta" <andrea.porta@suse.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: <sashiko-reviews@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <conor+dt@kernel.org>, <robh@kernel.org>, <ukleinek@kernel.org>
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com> <20260720100212.BEF1D1F000E9@smtp.kernel.org> <amN-5B5POX3rNb29@apocalypse> <DKY8USKYJJVM.17HQ78YIYZMFV@garyguo.net> <aprNTF0278NuH55k@apocalypse>
In-Reply-To: <aprNTF0278NuH55k@apocalypse>
X-ClientProxiedBy: LO4P123CA0557.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB489761:EE_
X-MS-Office365-Filtering-Correlation-Id: 98315526-fc94-4490-bd3d-08df0a8d9525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|366016|4143699003|5023799004|10067099003|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	OZug51nk6/rsuR9IkLxG8DO9xhXQkhS9cCeOqm+JYsFoJ+/HzGcTkmjIjS6P6aN04WZBr16cez8bXpJsDGJj1Z7VaAS+N7InapojfXsdKAewt+eJP8hap61uMWpxvpLP6gIpW7Hg1nm+XJ8N+HA2RkMH7kNWHZlvTAcyLFgGK0JO+ur6zYgDVIlgnBvv4lR/FHtMz6FmwF8BgcZ1b/9aQSaxW5QxQBDRACeJKo1xlNTlYlv9I2b/XNoOWYTKIxT0imkcZW6OtLHBxt9ZgbJCQnQkWt2Ysed5j1RHOl597Ki80897whcIt2qvH0A5K2wRFuc6YwEgce3ko+DZ957piUoEKAX+QwB0ky4e3QMyQE+iRu8C0wshETLYSIawaqKpiOtW087tX3lgF/3ZK1k+9NElDNjH4zKAsCvZis73IBj8/K4KAeJcKnth5kMV3eMHl8ZN75HP0oYWm4NK1/onr31FpphJT14c2Inqu1jeFTb1w5tSFnqzxfQCgIwS9Snd8jdvC1IJ3lnDk7Kz7YelR8rCbu0tIKZh5yCBYddayi1stBOjG9ZfnHxLKcyPxfcE5A/rdR/1ONb+rQtOaWqgW78U+JhE1c6xCn+57zwhVKoUAZv/uLoamRTETLqj+um7CqX5mcYsQI1SxI7x52RvopcCDCdMDtiQeo5d3E2gzIg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(4143699003)(5023799004)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckZZNXdPWGpDUFBBMXpML2hoYXdQMTFKVGo0RHhOR2J2WDVyMXdjUmpuTGgw?=
 =?utf-8?B?c0ZIa3pnanBIYWp4Z0ZBTGVDcGtYK2JXMmVNaUxZclp1Q1VyUUpOeGZoTVlT?=
 =?utf-8?B?RVZxNHlIbzZWQUNYUjgzbjNqVE9IbmdkT1FGNFZvYVZkWlJIN2JzcFZUTUJL?=
 =?utf-8?B?a0J3cS9xcmpLRVZOTDduUWNnRFZHMkhGNjljR2tLa2FJVmFMS2x5Ym9MZFg1?=
 =?utf-8?B?NWkzaTUyaVhKWHNtSlA5R3U2bW1WdTd5RU1lSXFoVEdjWHFkejlVSG5nYks0?=
 =?utf-8?B?OU1ybU8xZFArQktxSUNZL2VrcHJHbXFDcEJkY2k2UGx6TFRtZGhRTElSTk9S?=
 =?utf-8?B?dVdmWHJwZ05LSFFGbk9xMTZGUXRJV3JZZjRiSUpUUnl2d21yb0pnakZBQUwv?=
 =?utf-8?B?NkRiWDRFemdObXhEUjU3SldnZHArWktPekRDKzBJUWlCU1pNcVA1RVV5SnZZ?=
 =?utf-8?B?K01qdWhzNUI1Z09lcjVvaDhvU2sxd3NrdkZSa2V2amNIMHBVazJlUWd0dmNR?=
 =?utf-8?B?bXFkNCttaERnZ2VkVmtJQ3kwb2RNa1lmQzlndlFRWGxWejZYMVZPU21yKzhl?=
 =?utf-8?B?OVgvcXVVVzBWM0lCSS9SampCTzRQUFd4Y2g0NHF2S3lyNjlTQWZHaWhLZlZ1?=
 =?utf-8?B?aGM3d2s3cE5YVTVKaHpMS2VzRVhFVUgvS01UWE84SW1JU3dTLys5R3BJT3R6?=
 =?utf-8?B?SFhJV0hvczZxdmtZVzlHWVhZVWhDZG01SnJyRk1ZcUhUZEZ5dTZZSFo5b2dB?=
 =?utf-8?B?ODQxc3RldjBTZldCNzA5d2VaMnc2YVk4TTM0VDhHOTIvcHJnbG9pRFRIckxY?=
 =?utf-8?B?R2J6UDJkM1BBaXg5eE1Oa0ZOU3ZvbzNrcmMxOThmL0lVdnpvM29mOW9GdkdZ?=
 =?utf-8?B?UXkxZVJqS0luSFZrL2pKNHdqQ1A0cTFINlg2RFVyM0ZOZ3N4UlQ4YjVaaHh3?=
 =?utf-8?B?RmlwZEdqcE5ybFNvMzNiQU5FaVRVMU01SmFRa0ZlRGVrbnFDNGhlc3B6V0hy?=
 =?utf-8?B?aUV5SkdlNlZTY1lyazEzUDFCdDdXcGgxU2MwU3o1aWVIN294cTRUMitiU1do?=
 =?utf-8?B?aG95MUlLcWtuMmM0KzI3MEpPUWZmdmszWEdyUktpL3FUVTY4V3hSWGxVVXdn?=
 =?utf-8?B?Wk9IbWU4YWRIN1pmQjhncjlYRkRCRmRqZ1BiRTAxUmtxbVJIUXd6Mk1JcEN6?=
 =?utf-8?B?WGRrL1BBTVNUQURXbGVYckYrNGp3NmFGMTFzenVjU0ZNalZsKzE1VVk4VUl5?=
 =?utf-8?B?cmIxSFdKblIrNmRkZi80VHVzaVBFb2YreUVTNURZMkp6ZE5ES1g4U0VYRFUz?=
 =?utf-8?B?WWRYdnhYSUJXNWljbkdPeXN0VFk2dU1malZQcW9BL2ZmQWlYSFNhMERLNGVT?=
 =?utf-8?B?aTBlK3d1cWhGVEFTbGZGdDhPaXJiUk15R01YT3N6S1RScXpQUElNcGNVYXo0?=
 =?utf-8?B?b0R5eXJ2THdZL3BzNFpFMVJyTEtseWhlandTSS95T09NRTJjU3AzNjl4WDVo?=
 =?utf-8?B?ZGdBNVJEaXhncldEc2plOC8ydjNtRE5yNkMvZFZJT3l1S3U0QklKRGpQVGtS?=
 =?utf-8?B?bkx0ckZ2UFNKTHhXcWVCeGlWRnVJNUFPTlUrRGFHaE1oam5KLzdNNGIxSFFt?=
 =?utf-8?B?a214NUllNEtISFlsUFAzMi8xNG9qTkVVY0tLdGtXVnNFYkpuQTVEUHpHYUxJ?=
 =?utf-8?B?bW4vd0p3RlNtWjZSOTA2WUNrOFlRUDdNN1NwQ1N2OUptdHViRU5WRVhWeGlr?=
 =?utf-8?B?dFVET2xzVDVDRExZelJUVzY0MU1EcGxCZ210NzlHRGd4bkVaNDBmMWo3U0Ni?=
 =?utf-8?B?aWxQMStVL05kbG1QejNndE5mVEZNSUgvKy85WDd1aGRlK2had2NZY0VBbGE5?=
 =?utf-8?B?TFQza2tuZW5nLy9mWTRxR3IxUlkxUTd4aCtTM1Q1MHk3TFNFV0JYWk9hRWkz?=
 =?utf-8?B?SDhUSHdjQUJFUFlWNHc5S0lGZ1V0K093a3VXQXljM0JiaVBzVFZzZWFkRjZP?=
 =?utf-8?B?TTVESmRjSzBTajdLb2dWaFBXM0tnTTloKzlqRnFQSUVSNW1IMU1nNnUvWlB0?=
 =?utf-8?B?TElHakdXYXNwbzZlc1pBYlBSemptdXJVVm5GNFRmNW5YWWxXSU55cDdJZlNy?=
 =?utf-8?B?cFVZUS8yalAvNU1UMUJGc3ZONE9wOUwyTC8xVWlnVS94NjFuL1YwdVB6eko5?=
 =?utf-8?B?QkZMUXhYSXB6Vy9UeXB5bFlvc3ArcVFTTmFFenZBNm5pQjJJRk92UnFKZW9u?=
 =?utf-8?B?aWVaQlV0cGkxTGhVTjJzQ0xFVUxIMmkxYTE0NHU1SlNIR29KTG0xNUF6ZXg0?=
 =?utf-8?B?S0cwd2NYSzArMzQzeCtGdk5vUlFXYmVCVmVMZGJndE10UUNPSGxjQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 98315526-fc94-4490-bd3d-08df0a8d9525
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:05:31.9898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M++LEFDd0LcCWyo1XeWc7HgDoDIqRtrQ5En61JJQivCE2BAfmxXksgzSVWBSxZgyCfiaECvT+dHeQuO/0fbDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB489761

On Fri Sep 4, 2026 at 2:53 PM BST, Andrea della Porta wrote:
> Hi Gary,
>
> On 19:42 Tue 25 Aug     , Gary Guo wrote:
>> On Fri Jul 24, 2026 at 4:04 PM BST, Andrea della Porta wrote:
>> > Hi,
>> >
>> > On 10:02 Mon 20 Jul     , sashiko-bot@kernel.org wrote:
>> >> Thank you for your contribution! Sashiko AI review found 3 potential =
issue(s) to consider:
>> >> - [High] Missing `.remove` callback leads to Use-After-Free in the PW=
M and Syscon cores and leaks clock resources on driver unbind.
>> >> - [High] Register context loss on suspend/resume silently breaks PWM =
output.
>> >> - [High] Unclamped hardware duty ticks lead to integer underflow in t=
he PWM core for normal polarity.
>> >> --
>> >>=20
>> >> --- Patch [2]: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver=
 ---
>> >> commit 0c98703d857577902e57d25b42a3d46dfbde5795
>> >> Author: Naushir Patuck <naush@raspberrypi.com>
>> >>=20
>> >> pwm: rp1: Add RP1 PWM controller driver
>> >>=20
>> >> The Raspberry Pi RP1 southbridge features an embedded PWM controller =
with
>> >> 4 output channels, alongside an RPM interface to read the fan speed o=
n the
>> >> Raspberry Pi 5. Add the supporting driver.
>> >=20
>> >> > +static struct platform_driver rp1_pwm_driver =3D {
>> >> > +	.probe =3D rp1_pwm_probe,
>> >> > +	/*
>> >> > +	 * .remove is not needed because this driver cannot be removed/un=
bound
>> >> > +	 * cause it relies on syscon which cannot be removed
>> >> > +	 */
>> >> > +	.driver =3D {
>> >> > +		.name =3D "rp1-pwm",
>> >>=20
>> >> [Severity: High]
>> >> Is it safe to omit the remove callback here?
>> >>=20
>> >> Even with suppress_bind_attrs set on the driver, if the parent RP1 PC=
Ie
>> >> device is removed, reset, or unbound via sysfs, it will forcibly unbi=
nd all
>> >> child devices.
>> >>=20
>> >> Without a remove callback to run cleanup, pwmchip_remove() is never c=
alled
>> >> and the clock is left enabled. Because the backing memory is devm-man=
aged,
>> >> the devres subsystem will eventually free the pwm_chip and regmap mem=
ory.
>> >> This can leave dangling pointers in the core pwm_chips IDR and the gl=
obal
>> >> syscon_list, which could result in a use-after-free.
>> >
>> > This is true. Uwe, I guess I should reintroduce the .remove callback,
>> > what do you think?
>> >
>>=20
>> How is remove going to work with syscon? The previous version seems to j=
ust
>> ignore it completely.
>
> True, unfortunately we have not much choice with syscon because it does n=
ot
> contemplate a corresponding remove function. The best well-behaved code c=
ould
> just deal with clocks and resources that can be released, while syscon is
> unfortunately not among them.
>
> On the other hand, I'd like to emphasize the following:
>
> - the driver could not be unbinded nor unloaded (directly) by the user, a=
nd...
> - ...PWM driver removal as a consequence of the pci bus device being forc=
ibly
>   removed will almost surely leave the system unusable.
>
> As a matter of fact, even though it's not impossible for the remove callb=
ack
> to be called, it seems highly unlikely. So maybe it's not that big deal.
>
>>=20
>> Also, do you actually need syscon here? Given that the pwm fan device is=
 going
>> to depend on the PWM fan device anyway,

Oops, it should have been "PWM fan device depend on PWM device". But you go=
t it.

>> you could just EXPORT_SYMBOL_NS an API
>> from the rp1 driver that returns the tachometer reading when supplied wi=
th a rp1
>> pwm device pointer?
>
> I'm not devoted to syscon so if everyone agrees on the EXPORT_SYMBOL_NS s=
olution
> I'm perfectly fine. It seems to be used throughout several drivers and as=
 long as
> it's not considered to couple the consumer and the PWM producer too much,=
 I think
> it's an easy alternative. Uwe, are you fine with that?

I think that's pretty typical for platform devices, provided that the consu=
mer
and the producer are closely related.

I checked the RPi vendor kernel code and it looks like they're modifying th=
e PWM
fan driver code directly -- in which case the coupling would definitely be
problematic. But I think that modification is problematic itself and not
upstreamable. I suppose you'll add a separate, dedicated RP1 fan driver?

In which case I don't see the coupling being an issue.

Best,
Gary

>
> Many thanks,
> Andrea
>
>>=20
>> Best,
>> Gary
>>=20


