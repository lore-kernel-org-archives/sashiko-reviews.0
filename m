Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2225B40D583;
	Tue,  9 Jun 2026 20:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037257; cv=fail; b=SyW+DAR8/RkK4jzAFjk2LOnjs5oFhkd7JZkeUUGfs0bol8BLzqRLmjkySJnWm1+dJbdE9qAW9Y130L0W6agH0J/o/FjaKTnyMHOB588PmXdom1qchPnazSvCIsNTSTd523ydwBVmqiy10K5ABLCeRhTAql0gBxUQ9X7b5OEvKtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037257; c=relaxed/simple;
	bh=IoiNpzayw/7E/dxJlKAPcDFiLTAc99scphdqz7le1Fk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IQ5QYDEAXeAk8ZRX2Av+akytvEmCHrRrPpslgEjBFmQyUJ9AnUekR6N1yfvT6WzHImnAh2TDD48qFJB+HIwogAf8Dn79OpeP1DBp2H46RRjxI4Yn2HapT0pDXZmrXeAs81w6Dxzn0YtL3CXIahQ7vpGwGrXqlZJayMLR5plnxuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IMDuqYJv; arc=fail smtp.client-ip=52.101.84.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IMDuqYJv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INcg4fBoBlfbjGvyeW6Vnj05YIPcWCYVENBKerOtv2KiNjA2tk8YKVzD2Sz25FKVb+wo8MVpxQOqLkJsLGZ//sJYEebXsR3+3aqaNxmk94FvftXMS1vuLzb7PsCWwlwaAITnZE+AokemXgwm+dz8cR9ub7QDoVVcOchvenjccqlU/2RxkBI2PV2QKQ3s0qxym7c5gYQEOMneRcrx8RZ7Vu2VSx5Q8bxjNHJ2JoOwF//Jq2KphX8sXXyxPYAM7T06PVaVTnsDt1ivXV0ulJLBJDUK77GcChdysiSQrEDTfbPD9clcfUGqq5vqC/7kjAOUqnhr9lifwUB9Txo5D9qgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1nC9wKvC6xHDfGgaCkPfUvnsToPKcx37S6R1+yKAmI=;
 b=Zxdj3wSIDYj/rUL1cSR2Onb/SGMMwSNXCU9zrg0H8UUZ1pIHq5ajwvke2My8Ng+MQVLpWKZGqik0G3W2Zm+K9LVSQS9fcLh9wm9ZsQW1C6oDwLCDwwdKHzXXO9uSOyZRiBxEgi+XtmMii90DQi5GPhDqwA92XGVpkMQGzhHoanC3Eg2sbTn7GZvPo4Mwfh0OGRmH1XgvAH5o4nLS3NM49qDlYng2BdKDe5ulNQBUtR8td31fnfCOt4fSFKPAsDLtvfp2S1SgWLnoiU8cY4hsWnF5uhAHC1A8f8jgxI9fdaP3YbdE0f90tb2Z0PhC6qZXz4J7FSNRm79kbqtyMZefwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1nC9wKvC6xHDfGgaCkPfUvnsToPKcx37S6R1+yKAmI=;
 b=IMDuqYJvXpXPxkYVmCU/jUMkMHOv3xiWGpE7AdE7DPGq6zKSJSG3jXeFUlLnQckLjqa9jcZgD5r242zSv8i/hL2PCYSWJtKBHwPX/oeoeANEc/9UzvvUj3vP+vCQ0RmidJlejV+sSAnYpFZCa4bJj4DrvaLnleFjfsU8yXeHV1ppygAp+Z45I8s+oSQxbtGhlgVNVzDXaoz+7IvqTMDJ5CntwdKIcP+Upt5mC0AHSghZzEVJxfhMKG5cooZJ9gcOOikhg0fVhv4O6voEHqd1uxlep0Jeonw6pK8EaBf5uk3UH3shqjH+Wpc7jIt2bfBpICakW2vaf56jFNB5Uq5RyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11918.eurprd04.prod.outlook.com (2603:10a6:800:306::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 20:34:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 20:34:06 +0000
Message-ID: <48248207-7b4f-43c9-85e9-64e8440fab10@oss.nxp.com>
Date: Tue, 9 Jun 2026 15:34:00 -0500
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
 <023aa47c-6fbc-486f-b5c7-5145ddf8e8fe@oss.nxp.com>
 <72087d5c-c6f9-4452-b4bd-a9f086700e62@app.fastmail.com>
Content-Language: en-US
From: Frank Li <frank.li@oss.nxp.com>
In-Reply-To: <72087d5c-c6f9-4452-b4bd-a9f086700e62@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P221CA0069.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11918:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af2a60f-f5cf-4974-3e34-08dec66673a2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|11063799006|4143699003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	tTd7hMPdx67zvW/mTKzcJJG8eqN6Gi0DEKwhWWaO+7NPZvxsaj9QJgxQzo8JGdcZQYmsf3P3+siB/Un5+SDRVoiR7bb0n/Xpwqf8abCEBd8HqOy5tiwETQUC3dbuXkEd8JvFRHXyVrTHTH5regalgJh/gdvnQ3bqpTMYhEbvriHvKZVbrAalfAMmhPN28ZHrpApiVcvyQ7vGnlr+mZhM6BueYUvmzg6ZFScDO7UP3Ma5pWxTQhPfoijMsDbBonqWgdKLW3YaBNy2StWNsZqVhKSaEL5Ol/T9yZ9WZqKtotgYoZWxJoJqzwoGOhrdsEcupFYrGVck5yXtFpghzCLeU8pm2SReUkEH58Q8IVfutyJwkvjDSJUK5dmBR/4XgEop4cahJDE0BrMHUg1WmSlIurWQONi3IORL0A2/skSzTJyU1D2w3LVo30VZOV6r75hTBRK+mztd/DbF9BCmrDkmk80qkCCQ4Dz8JPOqVJ17z561+bqRC6rLpTXFTJ60YzAhjREChlJ6DpCMOGD3pVeHhIscyNEdODb4Hx6t0lf4c2jhZskWWd8Xz/yEZWWa3UCZDx4916mteAG04i4VpFzbNuH6eZC3WagncOHFE83g14xv0Z8JUR472ETvY+dce+ZixtnAmT8SvUneN/aGL8gcguJVblYt7CPs2PsGhnBnqKVh0x5Ladd7LyzUjaMNb1qH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZytFcm9XQVlwSk1xNnM4WThGUkJvTDZtZDUxYVBNWkY5ZkhxKzFyak9tZjhV?=
 =?utf-8?B?Zlhqb2RoNmxrMkV1LzRqNlRubjVuUlhOaXUzVjF5dGpUZUI1R2ZvS3NkMS83?=
 =?utf-8?B?eEZXc0JqOG9yMzZEM0k3RjkrR0plK3pmUkJqY3E5bVlSSUJZNWlLV3dQU0Ji?=
 =?utf-8?B?anJSWDNyckNQRzBZK0FVZE8wRXpIaStUTkQvUEx1b3F0clpiRjRUNkI5bVhx?=
 =?utf-8?B?YkFNbVNyRjJhQWFOUFZPNlB3Vy9OSlVRSVcyaW5ldmJxTG9wcFYwNmU3eStF?=
 =?utf-8?B?QWltQVRSUVpua2pUb1FpUG8wc3h6aWZQWk1lYTJtWndBYVJUZTJQc1E3dTJE?=
 =?utf-8?B?M1F3MHF1d3hNV3RHTUhsVFc0YXgzZXNNSVU5b20xY2VzdGMxUjl6Vi9YU0dC?=
 =?utf-8?B?RXBkS1gzb2ViQVBucU5PbHJMUTZFL0h4b1pPMC9uOTZnUk9HdmkxSi9RMVN2?=
 =?utf-8?B?U2lUVXFZNCt4YlphTFVsOGdPS1V6SXdTL0gxT28vem1BYyswQUIwenpqN2hU?=
 =?utf-8?B?Yi9UNkpyZjN6WUNlMllDbzFyTVZvejdkekRZTTJwN3F0c2lFNUU3cTJ0aW5p?=
 =?utf-8?B?NmxXSHlWRXR1aUxsT25LczlCb0FHZ0RrLzcxb2ZNSFo1dmVpcXBTdG9BaTgy?=
 =?utf-8?B?ZzF3WDJmSXkremVaN2tNUHRtN08vYzJzWlZPYjNqYklGMTBYSy9jRkF3YURR?=
 =?utf-8?B?R1BsM3Y5bGFubFYwYnA1c09lU0l2MUhOdENESi96Qy9pSUNwRFFPcjYyRWdt?=
 =?utf-8?B?eFNrTU8vOXFrYnhqQkYrZndLTWUrQzBKYUxCWnVPd3FTT3I4djVOWjNRU3NW?=
 =?utf-8?B?QityaDBkcys1NHZSb2hYNktiNHBxYzZCWlFFTnRjTUtOY3lndVJvcHpDT3Rw?=
 =?utf-8?B?bEhOZ0tHeXVuTk9BQS94cnUySUE0em03SUxuK2g2dE5pdFNLeTRlSXJGbFUv?=
 =?utf-8?B?YVlLSklUSnBUK0JIckVIVXhudXFwT0FUQkg3aUpwMUk1ZU0xaVduUllqUklR?=
 =?utf-8?B?RVQ5UWg2U01JbDZLL0hnemg0OHZZdFIweGxDRElGanJjZ1Z1aWt0ekExUUFO?=
 =?utf-8?B?WVRjRmN6N0RKM3U0OCticEJFTGZHbHJyaVZ1eWhTQWVscnNUNUVxSFVXV3lT?=
 =?utf-8?B?Y1haZHZlc24zNkNhZ1pIM0pMclgvVjEvRTVzU3JmTEoxenBSWlpoVkNueDhZ?=
 =?utf-8?B?Nmt5YnRheHhtTy9DUGhKNWdzbnpxdWJBTi8yZTdIdnpnd0RqcDg0MW82eFV6?=
 =?utf-8?B?Szk0Zm1vQWZNbk14L21rUlZqQ3hBMmtBV2lKQVRQb1JCc1FDbThrbEdEdllE?=
 =?utf-8?B?WjlHbzZxeWJNelY0TTZkRWtTN3RoejBoTFlzTzRkK0MvK3AyY3BqUGE1eWhS?=
 =?utf-8?B?dDBMcWVibFhBdFJpazdiaTUzMGFESVFnSldSVzhaUU1VWDRDeW5WemN5RWFy?=
 =?utf-8?B?eER5ajlTNit6eUNQc0xRQTBPVnkwaHJLRFRxSDVzKzViL2RJaS9uelNVQU1D?=
 =?utf-8?B?dDloeTJ5Z1VnS3dpV2VVd2pKMllsUWh1cGMybkZES3dscTU1TEVpakJyTW9j?=
 =?utf-8?B?KzEwMHVMZUpWQjFXTEVTZGNXTU5HdjRTNzlOUnVsc3VlTFJkNmRiZzN5ZHVL?=
 =?utf-8?B?REZrMUNoSDlqb1RkUytTaFB1MnZoY1ZEMWpxamQzTHlUUXRicXRqa3R3MkpJ?=
 =?utf-8?B?YmFTMmtqWTF4QzFFMmUwQXhmWURuUFU0SDM4VU5JbG8xQU5Kb0JnaUlmOEFa?=
 =?utf-8?B?dTNhYmRZcFkvcHBqYzRoL29HOFNXZ1Q1QldSR2d4WnZuRGgvTExEZ3cxZ0pK?=
 =?utf-8?B?bTdUdXUrT0NaSzU5RmMvMnRuL2JYY2VMZkpmdUc2SzhzS2hWZnlSZ2NiZXJV?=
 =?utf-8?B?STFKT0lRalQvN0NUZ0hjOVFzVjNyQVV4czR5OHpydllWMWlKcldCbVZtOGNv?=
 =?utf-8?B?OUcxM2lvUWc2QjN3MFRQeXc1cHdnUkVlSE5zUVlQQ3haS20yWXk4Q3pnamZy?=
 =?utf-8?B?dnNISmY1YmhoQWFTYTZDaS8rZVB3MGF1TE95Z1ZWSThFZlJxbDFxUjQxUHRp?=
 =?utf-8?B?RjE1ZmMrTVB5WjNXaXN6MytpNjhLUlcxQU5weWJhOHl4NmNvLzBERXAydFhW?=
 =?utf-8?B?SDNTV09DNU41bGo1cE9HNllOM3A4bnZYUTkzb3VkRDBuREtuQnFTaUlSNjk1?=
 =?utf-8?B?b1BZek5VYmgxM3JwVFVXcDJ4RVFQQVR0LytDbVVZS0RXMG1kQ3d0c3I3eUZw?=
 =?utf-8?B?dHMwaXBLdlVNQWVINXN5VlhLWVI3MFN4cktMdHIydm1RVlFpLzFQSVZIaWxj?=
 =?utf-8?B?SnRpYlVIdEJXYi9WWGxFTDlxMks5S01pREFJVUx2bUdoOXRZZE5QUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af2a60f-f5cf-4974-3e34-08dec66673a2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 20:34:06.5307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GdLATQXxNgQGtO11Pu3c3Jv8Xd33qhPxV+HnYePqr5iU93t/Id+DXV9zVpCWXdGzRO48zfb8jipVp7wQXY+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11918



On 6/9/2026 2:36 PM, Arnd Bergmann wrote:
> [You don't often get email from arnd@arndb.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Tue, Jun 9, 2026, at 20:01, Frank Li wrote:
>> On 6/9/2026 12:24 PM, Arnd Bergmann wrote:
>>> [You don't often get email from arnd@arndb.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>> -   ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
>>>>>> -             0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
>>>>>> +   ranges = <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
>>>>>> +            <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
>>>>>> +            <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
>>>>>
>>>>> If a PCIe device requests a large 32-bit BAR, the kernel might allocate it
>>>>> within this 0x40000000-0xffffffff range. This causes the Root Port's
>>>>> downstream bridge Memory Limit register to be programmed to a value >=
>>>>> 0x80000000.
>>>>>
>>>
>>> I noticed the same thing while reading through the pull request
>>> for 7.2, and I think the bot message is correct here. The SMMU
>>> does not help here because addresses on the same bus are routed
>>> inside of the PCIe host bridge rather than directed to the host
>>> side. If the non-prefetchable ranges ever get assigned to an
>>> address 0x80000000, this definitely breaks.
>>
>> The address and size is 64bit,
>>        0x80_40000000..0x80_FFFFFFFF for 32bit non-non-prefetchable
>>           0x84_00000000..0x87_FFFFFFFF for 64bit prefetchable memory
>>
>> AI Bot wrong think it is 32bit address and size.
> 
> No, this is about the bus address, not the CPU address, and this
> is given as '0x82000000 0x00 0x40000000' above. non-prefetchable
> addresses on PCI are by definition 32-bit, so the middle cell
> is zero.
> 
> On the CPU side, this is mapped to physical '0x80 0x40000000',
> which does not overlap with CPUs view of RAM, but the
> bus view of 0x40000000-0xffffffff does overlap with the
> DMA address for the lower 2GB of RAM at 0x80000000-0xffffffff.

This is pci TLP bus address, which will not appear in internal fabric at
all.  That is PCI TLP address, which is totally separated addr space and 
can be any address.


        in SOC                                  |  PCB boards rx/tx
==================================================================
CPU address                 PCI controller     |   PCI bus
80_40000000..0x80_FFFFFFFF    ATU              |    0x4000_0000

writel(80_40000000), PCIe controller will convert to 0x4000_0000 and
sendout TLP package memw addr 0x4000_0000, which already go out SoC. EP 
device like wifi, will decode 0x4000_0000 to do related work.

In side SoC, no one can see tlp:0x4000_0000, which only visual by PCI EP
devices, which means only connect EP device decode this address.

Additional information:
In bound address space (from EP to RC) is not controlled by ranges, but
dma-ranges.

Frank


> 
>       Arnd

