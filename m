Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023104.outbound.protection.outlook.com [40.107.44.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC6835CB89
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 06:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782109209; cv=fail; b=L7HnOz7xDJXGUIHj7gUXkmGNK+5vOurITEe4AZAFaniVNJP3+QKXAcdDzIzxQNSXAZF5wCGIREVAaO3NK5URsXwmAYubQcgZOVGB6Qlyr0GDAvj3VkwEyfF2IoQ1nbN7hoXdsUFqEHsa3KR/yCcbG0sZBGP4k5pwHphH5yWqoC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782109209; c=relaxed/simple;
	bh=0Jh9QPV67APO4dbhAdqa0ZR9WBTWPRhvXbiczzXiMU0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l7TzazBSJ/gl4hGHcCI9JPxbOKQJz1u1j1bkcYRomi0lZ5tJtPSB3IixGbin25LMbNczQb76yA6X5nM9LHqR2KHbdMJ3UfOHn/PH+RtKMyVMfAzfMvKVeLyjvXwYYF4DTXb8Xip6g+wAXGKJ5seMjOg+rtkf1dyzTqYd/C7bN/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=j6sjG9x6; arc=fail smtp.client-ip=40.107.44.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="j6sjG9x6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbD3OvefVeDb6iBsz11fop91fwju4b2w3FbSkOqlcfJVEqDu2h4ajk4+o7uH5DHBdzRCi/GToZioEbN6HbfAy/TFSGHZvuE4xGlt+ls/eiHtSULxd+HFttfHtV1z9wSH1dfLTj22luGVK9ANRez/uaI82Jsc38gIQZA1OY/pnDiduusoJhhYX+y38ctOrm63fAnwiDNA5ngg1hyhc/82RsaCGUkx934YfdYVGyD5VNLITA5yxVDvx7sUhUbC/Pa7VDAEHBxC8wM3KYa5zq7asuA8uX1XRD85dp6PJpzkjEnr5Ee5VHGyrdmEpUSF2s1OgHX8ZVbdB0Xe2FnuFL+BXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0WQs1J82XrgCVLeRm5Euo1rqVjIttoGQvQGGRH9GV0=;
 b=hycft32HvMMp7oDzTP6FW8Cu5Vd2MhVnOvBIxIy5H6KEI7dHEomsFc3S6Qx6mtcrzTFKO3W+2hKsj7sh3vgTFoaqyJmEDnBxikGKRFtVFYFJDQxeWfD27wmHR1yTgNt6HKflBBEGRtUWns5mGWrwXxafJcpdqXp/dRE8KMu9YES5tfUwm/VuGqtxkBjHedhkm4cdlKfespDuooDny4Wk0vhWZSIaj5hq9u+y98tTAB/tege2eFjaNfaNcn9HVji8vfReUyOI3bAvMyKJmk1ZwneH0KlHRfCc8d8+4Yc0LX0oo3Ej3lfopBDUpK8CuqFcOsG9fbDlpqL8Ouh2JH72vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0WQs1J82XrgCVLeRm5Euo1rqVjIttoGQvQGGRH9GV0=;
 b=j6sjG9x6WedRTnJaxYc2r471Z7I4H3kWjY48jTDI7HGVStjmLOzruoFV9xjfovP1hb75nvmDPoxv1UUYe3TQRJJ1AKudOwcXcxSOfYI/1U39CWAzc/tBuhRjKlcZD503+zwNGwnKpNtRTQAiLTu0dLsnlL3FqMBxGFVfz8Bw44EBZWB8VjFmlxCAxEgVrGwl2r13OvdC/YdypAh12REr2yrex702dQDxo8e0uGPoJYHmxzl/LxPkcXmYGUs79nvAjUORaqqwEnY7Djrty7t+IJgK/tAVZpDzpb8qahsYguZRfHc4k26HXHoC0e+E+PrlWaegqC0H/jP3ImGG1GQUQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SE1PPF73DA7E6F9.apcprd03.prod.outlook.com (2603:1096:108:1::854) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.7; Mon, 22 Jun
 2026 06:20:02 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0159.007; Mon, 22 Jun 2026
 06:20:01 +0000
Message-ID: <167ab529-1588-4f8a-9297-cecdb16fa0c9@amlogic.com>
Date: Mon, 22 Jun 2026 14:19:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,
 sashiko-reviews@lists.linux.dev, linux-amlogic@lists.infradead.org,
 neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
 <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
 <20260618100341.0A42F1F00A3A@smtp.kernel.org>
 <1j33yjc7b9.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j33yjc7b9.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SE1PPF73DA7E6F9:EE_
X-MS-Office365-Filtering-Correlation-Id: 485f5dc8-4a66-4b77-85ff-08ded0264ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|56012099006|5023799004|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	luGxcplGPWdpEWWCUZgVBas4aE7DWju2D2jXeASRLlvYDstrF+FON3WIwTNvNzhL3AuaA/x4qNDq4LNsxd9JFnSmegGm4QpuvJxr/WkLiKLLEH2SdeHpqH5ZQvmoGGrgFL5rRBoI+sTgWKSuu99v4PRTDNNMh187Mb0w66jyaBn9jq6GVLk6WbmP3Bq5Adhzcjb1C9EWI/NjlLX/3qPPkLifIeZwXdoeQ8PrY1ju1puM33LUGZvPwhLFNwABs2ZUOh2UZKikSA4eRs3HEpCge/N16QNNFkLRKALeYJbTVIjGyx4bI7cEiWb9Uk4A7QWydm6rdyyYoGjieK1qCvhPcM5I7ZL6tnOvH5c0Hislyke73O5h8rajQVL15McqcLQZJzZT+WWHMznhCDNjZj4jiGf64z38XkXcn3R5E+OIEVTzEL3X1u4zkdzjKTpv2G1UjLE9jpIu0MU8QtWZ5oy9gaX2cLe13bF4zqO2pJdRCVpMX9Y7UPPHUnBrMI7CU4+CJpV6t344nzKhOpev03a06aFgbftkxtnkfSAWFuGqIhqC1x9wxNNg4/M/QICddlenBMSAiWc1razpAGxm6cWEITV2ZphABp2bfzuTPQieEBjtnL+gzUqdkuHZ7pLRYGqfLvQJijO7E1redmQ4dS/REd30rIviCh4QP/NVHuWKqWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmFucXp4Y1BkK3JLWFhVOEtpZWR1RW9XZVlzTHgvbGpKTE0zY3NWS1dvbEVW?=
 =?utf-8?B?WWlzZVhGK1ZNSUxFb1J5azg1QlFZMmlCa1FzTkJscll0YlJyMmpaSTA5Rmg4?=
 =?utf-8?B?WDFHdmFHVnlWRmQvdDhtTkpNamlCYU44b2ppdzNFQ1B6NDNXL3N5aEQzdTBk?=
 =?utf-8?B?NEFTL0ltYWNxZGdXU044QTVDbmRJNWxmeXdLSUY5V214aFBnbXFGOHBaZWxt?=
 =?utf-8?B?Z3VoUmVtRHhISlVyWEQrd3g4S05nRWtJbllkSThRYzdQY3ROcWxsbVprdTBs?=
 =?utf-8?B?cVhLUUhhWEhZeGxFL0ZVSzlLWHRyWFBteVBVd2ZGUTN5QXNKYjVEN2RvVzdV?=
 =?utf-8?B?Nkozc1o3NTBqRDNLWUIvQ0pIcENFcFkwR1pQWnd0KzdNUWh3WFVoV09HbmpL?=
 =?utf-8?B?L1FxNmorc1dxdEFXQkttTkpNMlVkTWhZNlF5NDhhcndzMk5VVkFmT1FUNzVY?=
 =?utf-8?B?SE13alYzczU1NVkyNTU4dk03dStsaVpjMHN0VHFPdWJ1bXQ2bllXOGJFb1ZM?=
 =?utf-8?B?aElJcUh1KzY3L1cvRlFsUEQ2aTdRQlFNZUg0STAyYWNZOVJMYy9NenE5MjJ0?=
 =?utf-8?B?SWJDTjgzeE9PUjg5TEVVRDdCT3ViL2p6SnB3a1FJN2NLUUlFQW5xMmVJYkpy?=
 =?utf-8?B?YzZhZS9selBwb3d2V3k3ZDdVQnBRdTMxcXpVTjFXcFRkQ2lCTXZvMEhhcktC?=
 =?utf-8?B?RHM0MHl2Z0pBMzgwOTV4c1pZcVdKSk02UmFtTEtIckNhc1RRc2pCenFpMkc0?=
 =?utf-8?B?TnVxbmVCUXp3SHlUZzNSWFlHcWRjelVJNEszdldjK01vMGo1c1JyMEdmOGNI?=
 =?utf-8?B?L2w5SzhBSnVENUxqOWsvUnpsYWFxVVB2UTlBQVQ0MDhYcFVYWGpEY3VEQkxW?=
 =?utf-8?B?YUlnd1JneFVkVGs3Z29saytKckJvV3FMYklZbGo5TG82TFR4aHNzajUvT3pj?=
 =?utf-8?B?ZS94WHQxZDJMVWNraGgyY0JpMW9td3FOUUg2dXJnc1QwaXB5aGlFY0JpZXVx?=
 =?utf-8?B?RDgwODBrWFE2OVZqOTNwcnRrZjFtblN3b082bFFqNzlHRWVsa2lnaDZwUFk2?=
 =?utf-8?B?OXpNWmk1eXQ0REFwaWhPeGplNHpvN2tjekhuMWZlam5Ba1BFMUNvOElCdzVF?=
 =?utf-8?B?a2l1MWpwSUdzZHM0YmRMVlFFTzUrL0kwOGx0Y3JTME5kVk5YeGg5VXhweURM?=
 =?utf-8?B?WEJscm1wVUs1T3NEUTRpOEplM21RYmIrdCthZ3FOdVE2VnBxRklaTkpMNjJN?=
 =?utf-8?B?MXJndHJTNzRGZVpJS2R2alBIWmd4S3VsRVRqZll4SkMrT0JtY1dpTlA2TndB?=
 =?utf-8?B?NDRHNTZXUHMxaGE5R1EyY1JqcDZ3UzJkZXVkd1RsVitJYnFKdHBwWGl0ZkZW?=
 =?utf-8?B?TG5sM0hoWU40eTdpeVF3S05NaGN6dE5GYW5zb0RLYXo4ckc1aEZCc29UWWZs?=
 =?utf-8?B?c1FabUZQNHRCOENKNEFGY2pTL1diVkRVTktpeTdyTjNYRGpyekNzWjY0WmJR?=
 =?utf-8?B?Zkk0ZlhIYm1PNEkyQWQxQ2dZQnVWUmRsQms3WXlvbzMzMzRHT2V0RE1RcUxu?=
 =?utf-8?B?L0x6SmUwNXhnTTZsdkVvTkV4TzFoMTNQRWNxN05ZQUFTWXZmZnk4WHZYclFp?=
 =?utf-8?B?SkFWRnBHWUhraEtwQVEzZ3NTeG5GN1Z1TktxS0Jkall6MmdDcHFkYmVqQ2dG?=
 =?utf-8?B?Mkc2ZmJid2VSNng2RGtaQ3R0RUNNVWthazF0RU9EbmxmcWlncDlSYUdna2dV?=
 =?utf-8?B?RnRIYk1ham1PSHFrMk4wa2xHOFBZdWJOcmpHZ2JJelo3TktPOEx4cG56UkRT?=
 =?utf-8?B?SWVpT2JXZ1NjbDN2WTBqN0wvOXFaUStHaTBpS1BWY3o4eU50ZGZKVE9XclNX?=
 =?utf-8?B?L2dhVmZySzhtWCtIZnlxSWd2RVYwUlU2UU8xWEtpMXNkUE1TQnlqams5RXBm?=
 =?utf-8?B?UEQwckRVNGdnUUwyTnRlOFZZZUpkYmVDaVNaZHlPa1dPR3k5YXYrQjVJaE14?=
 =?utf-8?B?MVZNSXlhbSszNm9qTnRXWnhQTHN3bGVaY0wzUDBtRlBqbEV5dk4wNEtZQXpt?=
 =?utf-8?B?dDJaWkxHSWxnNHVVK201cVgrQ25KQWkvRHkwQ0Z0VnFDcDZyTXJ2cjFHYUNY?=
 =?utf-8?B?cDRjbDhBVHRNSnN1aFEzeXUxRS9xdHloOW83THhvUHhIVHdRY0t2NUtqcW5Q?=
 =?utf-8?B?YVN5aS9mRmlTN3JHTmpLdmNhZHhDZEdSQTBPNHFOMmZJa0RmVnZXOW9mT2JF?=
 =?utf-8?B?RGc2Z2pNTys2SlZHaU9MSlphdkZiS3ZEdHRuVjF1S0poOW1yRjdORGUrc3l5?=
 =?utf-8?B?czlsMTFXVWUrdlJXVC9pNDVuYWZ0SldpWXZCeHNhNEZWZ1F6OHJiUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485f5dc8-4a66-4b77-85ff-08ded0264ae0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 06:20:01.8139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTh9vaqBbpdjQ0mXggKIwNkCjTNC2yzaoyl4ikyMqP/lvEvrcyr5W27Pcz0WGROBW5NTo8CAlMEEwu1hX2X1ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF73DA7E6F9

Hi Jerome,


Thanks for your review.

On 6/19/2026 3:34 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On jeu. 18 juin 2026 at 10:03, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>> - [Medium] The AO PWM clocks are registered without an `ao_` or `a9_ao_`
>> prefix, which will cause global namespace collisions with the main clock
>> controller.
>> - [Low] Typographical error in the clock name string literal for the RTC
>> dualdiv input gate: `ao_rtc_duandiv_in` instead of `ao_rtc_dualdiv_in`.
>> - [Low] Missing `#include <linux/module.h>` for `MODULE_*` macros.
>> --
>>
>> commit ef5998ff087b6faed09d9eed4f59078d2b2f0a60
>> Author: Jian Hu <jian.hu@amlogic.com>
>>
>> clk: amlogic: Add A9 AO clock controller driver
>>
>> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>>
>>> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
>>> new file mode 100644
>>> index 0000000000000..88aa8cf3f5d00
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/a9-aoclk.c
>>> @@ -0,0 +1,488 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>> +/*
>>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>>> + */
>>> +
>>> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/platform_device.h>
>> [Severity: Low]
>> Should this file explicitly include <linux/module.h>?
>>
>> The file relies on several module macros at the end (such as MODULE_DESCRIPTION,
>> MODULE_AUTHOR, and MODULE_LICENSE). Although it currently compiles successfully
>> due to transitive includes from <linux/platform_device.h>, standard kernel
>> practice is to include the header explicitly.
> Yes please fix this


Ok, I will fix it in the next version.

>> [ ... ]
>>
>>> +static const struct clk_parent_data a9_ao_pwm_parents[] = {
>>> +    { .hw = &a9_ao_xtal.hw },
>>> +    { .fw_name = "fdiv5", },
>>> +    { .fw_name = "fdiv4", },
>>> +    { .fw_name = "fdiv3", }
>>> +};
>>> +
>>> +static A9_COMP_SEL(pwm_a, AO_PWM_CLK_A_CTRL, 9, 0x7, a9_ao_pwm_parents);
>> [Severity: Medium]
>> Will this cause a clock name collision with the main clock controller?
>>
>> Because the A9_COMP_SEL macro uses the #_name stringification operator inside
>> MESON_COMP_SEL, this will generate the clock name as exactly "pwm_a_sel"
>> (and similarly "pwm_a_div" and "pwm_a" for the others), without any "ao_" or
>> "a9_ao_" prefix.
> I think AI got it wrong and missed the prefix addition. Unless I missed
> something my self, I think you are fine here


Thanks for confirming. That was my understanding as well,
so I'll keep the current implementation unchanged.

>> If the main clock controller conventionally registers a "pwm_a" clock, failing
>> to prefix the Always-On clocks will lead to global namespace collisions in the
>> Common Clock Framework and debugfs.
>>
>>> +static A9_COMP_DIV(pwm_a, AO_PWM_CLK_A_CTRL, 0, 8);
>>> +static A9_COMP_GATE(pwm_a, AO_PWM_CLK_A_CTRL, 8);
>>> +
>>> +static A9_COMP_SEL(pwm_b, AO_PWM_CLK_B_CTRL, 9, 0x7, a9_ao_pwm_parents);
>> [ ... ]
>>
>>> +static struct clk_regmap a9_ao_rtc_dualdiv_in = {
>>> +    .data = &(struct clk_regmap_gate_data){
>>> +            .offset = AO_RTC_BY_OSCIN_CTRL0,
>>> +            .bit_idx = 31,
>>> +    },
>>> +    .hw.init = &(struct clk_init_data) {
>>> +            .name = "ao_rtc_duandiv_in",
>> [Severity: Low]
>> This isn't a bug, but there's a typo in the clock name literal. Should
>> "ao_rtc_duandiv_in" be "ao_rtc_dualdiv_in"?
> Yes


Ok, I will fix it in the next version.

>>> +            .ops = &clk_regmap_gate_ops,
>>> +            .parent_hws = (const struct clk_hw *[]) {
>>> +                    &a9_ao_xtal.hw
>>> +            },
> --
> Jerome


--

Jian

