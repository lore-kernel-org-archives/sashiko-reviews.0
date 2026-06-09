Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B79835203D;
	Tue,  9 Jun 2026 22:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043209; cv=fail; b=ooGoiNTC+hqOcjzjmkaLOk+qnXmVHLTwbsWtVC6OKqVhSxPDnP1ydkfU825LEohpN1XLsRuILvOezwIkOBZ4AYVsHsTEwuV1RLNu8ZG5Z84fzr9UruhACpga7QK0zld8d6xiCITv7hIcO+CwOBji8IBCejdB2cR95vI/sSm9ycA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043209; c=relaxed/simple;
	bh=akUf0dhoZRTtl6oR6uOwFRU32RHQ0NOnYm6TeDtRE+w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pKLal37Vqjr1L7oh89YOuEqR4OZ3rwNhtEG+2qiBve3X5o8Bels5Lbwp5XKyYbPwKzyil7UlLjK6w/QeHXlK77uApx6MafC7VNBuDmJn6xt9owZq8Cpd5GTujdX+mcSw4RSSZ/LEL4p+frBH3Sm4r3YyXBmHIF25aeV/HXK5QdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rYUYcKaf; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rYUYcKaf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzG/AeQl9KRYQA81wrkrOQz42c+bvygnxWAvQxNREK+pKnCpTr0wWgxCh7r47UEae1E4LHb1LKyh5uiPvAz+4/PikEDpXVyx74hlP/CgnmWWYIghGU47MnyvY72h0DH6MmIUOLPsP9vjGmsXIchSKcTIN13a/Qxf1ZEz9VUoQP4He4Qc09O8GzmJfbpN7IhL3SF7jiOoEMJewg0jksh5tpSanOMc4qGv6hIK4wH2ERq/Y7Cm+4I82WcsvVmdGQ84gQBwOpCxGU0/3ixKUmVPMmXyQZ6YeQYKREaMAtuYm/dNu11uvJ5oOOwHxC8YKaqishG8fzk8BT+jpUEmDqN9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhmKUsEIHAMObA876HQ6FKpEIrTLBWzY7HntlU7GJjo=;
 b=k6sSUIrqVbTV0X6fQGqAcNnHvDjk5lJvoA+xLfVN+kd+Yx6ffImtDC99ZwT5kaAVghNER3O9jWlEAUUHxOdXhbY7NXbK2/bTEbH0aW/YCP+M5jnw8wI4Eb74WQgVj5cZekru0pYcQJK2rkCOFwwpk9eW0cIsdfO2RrWPn3ACc8Zyvcrl+Ai7RIiuijVBUVQttULgsWK43GHW02wsGzmiFwM5ZsrnIMEeN5B339/et3EVo7T2bEr2DmEq2biJdb5d2CjIkrRgusAaYMM1DcSIkywXNcGZRAEbRTj3b5uO4S3YZy9gM/L6PmNE22d2YReP65V5O+ayTjig5Daml9e4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhmKUsEIHAMObA876HQ6FKpEIrTLBWzY7HntlU7GJjo=;
 b=rYUYcKafAZZc8DrwpqZSoipHnFEzaf7Qmh8x2TPpwYISubyXOP0dsAoxe0FyiPyHEiGLK9J9Af+jovsvhi3B0Y/OWKGb7nMFsiCJ73rcLG5F2gv0k1ONM9UnS+WpuBfStCNEZs8sqZwgW3vuBzi5LZA4qDOyRTw4sBR9kk8nOZ0TUbA80gAYsNMXhMD+V6sLTzHRcsvT+tQWh6/vTTOm2kJ4fToaC2vd+e6oT94sbGGCnWtgWYqC0KEyCJS75b7mGPLouBnNqjq5PBCWmjZ1VQKQYpPj5ZG9eL/OdIntjJnwPxQz8oaRJMWTFsF1U9dDCkWMJsmH62mZLDF89UUAQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 22:13:24 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 22:13:23 +0000
Message-ID: <177431ea-c4ba-4424-b17e-9d2e2884d466@oss.nxp.com>
Date: Tue, 9 Jun 2026 17:13:17 -0500
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
 <48248207-7b4f-43c9-85e9-64e8440fab10@oss.nxp.com>
 <753fca23-c3eb-45e3-aeac-b7b248fa723a@app.fastmail.com>
Content-Language: en-US
From: Frank Li <frank.li@oss.nxp.com>
In-Reply-To: <753fca23-c3eb-45e3-aeac-b7b248fa723a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:510:4::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: a58bed1f-5572-4916-dfee-08dec6745280
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399002|1800799024|19092799006|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yrAUAgOhGdP8EQY+UFaIBgUxmsci2/eTqaP94VM2JVuiFLJ0agUcHma0YqdcwYhRBAwVWjbd5zYdTSq4FPmvPfk5U3Bosz03LYFEuHy0djAYSi6ys7y/NcErpXMYm/VjjzOPVnloMERMcV+q8EoraToHI8dclu7TSzZtZz43C91m1wKon2OJ4zusS9hP5ndivkGP9WBqqaPO1NKj8ISl8r3oYPG+lYMdYyoT/vvIjhDDZ1guiX8bMKpKcnr2fYBVVjfLzS/BlZDo7VbXIyPdEzPm3r90V9oncQtv1wmUNjsApxyRUfjFBO33dOX2XCRJtlXxVGgzn/C5u/YTG6SaOJ3pUdoaHl2swnJwNa5Lwso1TBkCszCePw0rtbu8eFXG/ERhV4U2QlBwMEtBDe2JgWJOP2K62NZP/1BaKIEw4aGa5G5Ch7YdaviDoM9m88LY516gCt2FKRvETHtc492tWg7iFnwcMrZDFAign+CYbBA/465j8M5MJ9SPUXfl/pnLmFN/yDyZhBR/Jof0JacX7lbwzd9SPt/2Ck4TcOroukTwGPtWoyuBtmHiQd2Ykg+vZ4JrQHIjMWqej9HfXB3LQsiUmvjHZIXml6WpSj35+YGwVKviMKXasq/RU+oaCZ/CoHt3+ZMX39iBlZEinsI9dKnrHyIh1M7R2kYvDuFCmGMXPrLl7Bvqi97TEdB6+aev
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399002)(1800799024)(19092799006)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXE5MGtQVndqcFlaT0o2ODM0WHpTSmw3TmRiY1dUNUdNMm9aWGVFWW1ocFA5?=
 =?utf-8?B?K25KcWpUSkJ5SHQ3OWpSdWxyK2RrRzFUVmJrRFI5UDBScFpIeE5peEh5UGdE?=
 =?utf-8?B?THV3UmJSQ3lvZ1kxZVFsWjR3WStxTWh0UlErL3VYZmx5TnpWYkU1YUR1eHNx?=
 =?utf-8?B?Sk9HV0o4M0RVUTcvTUxnL09FNmthUHl2OXk5YWRibUlXalFLVFJXcXJKSTZO?=
 =?utf-8?B?bkRCcStiRmFRV0JHb0hYZWFHZE1oaDFkcmJta0g1RVdRTlBmbmVEeGlNUE04?=
 =?utf-8?B?RHZqWkRPRDBrTWVnMVpKMXFpRExTV3B3dldSWjVLZTJJT0J5bEMvdVpWVGR3?=
 =?utf-8?B?clJYUEdaR0wxRWRFSXRaMlVtaHA0ZktUUlNEbFR4Rm9tcUZVZXpnblhhbjZ1?=
 =?utf-8?B?T1E5MHhEYUUvYXJGeEtWN3BTN1Z1VmtNSm5SYTAxMk42Tlo0QU54Y3dKSjl3?=
 =?utf-8?B?QkJGM25iQjUvREFhYmhJdmJMc1lJODJNRXhoYUlHYWVKK25na1dFRVB3ZVM1?=
 =?utf-8?B?dE1XMDNLNUJCdU9Qby81TjlieDBRQ2dUMm4xNlpNWThyb3dGK2VxL2ViNGN2?=
 =?utf-8?B?OTU2TDZUV3M1cFVOamZNdnhPdUpYZWlRc0ZtUVowTkM2M2t1Q2VseDlJU0NT?=
 =?utf-8?B?ZFRDMmZGYU1mZ0g5aitHaEdycENEMDdqOWQ2Tno1VVNveUx4RkpEbUpMS2ZI?=
 =?utf-8?B?U3R6UTAvbVczSm11UXZvcHlPbDIzVjFnS0FDNkYxTEVQU3k4a0FUZi8vR0pW?=
 =?utf-8?B?b2JoclUwNVJoZW9ERjdSSmNrZ1NuVEJHcWtJOFZyaE55YkdMbE91QXQ4bE50?=
 =?utf-8?B?SmtPNkZwb0UzL2FENWF4bXlEcE9HbUtzN1Izc1ZKVXk1VzhRdW9QZWRyQlYv?=
 =?utf-8?B?MldzMlpRNmdvckRPZGxrelFCSVY0L1JUYjc0ZGxhUkdNSFFUMDNoU2MwR2tT?=
 =?utf-8?B?Z0pCbWkwNTVSUStkQit5ai8wdDBmaHJBS1B4RmxUaVhQTHFESlI5cjJFWmZ0?=
 =?utf-8?B?M3pCYnpPRlRYQVdlVWgyQWlJcWZmV2MwaFZ0TEdKTFhhY0w3MDR3MUpzalh5?=
 =?utf-8?B?WTFseHVva2ZudDR4NDB2VnBieGtCY3V3cW5RRFZuK1R3ZWtCZEt6ay9XVkhj?=
 =?utf-8?B?UVU5OFB2cUxFYUp6Wm0wNG8xNU9ud1FNaXNqM2srK1l5NHZrOWVXTXBFV1pY?=
 =?utf-8?B?MmRxelNHNmxIZjVPemYwOVY0NmtPY0pmWEY5a1dYOWc4MEgwTkdCU25pVUtp?=
 =?utf-8?B?VXZNOElPd1ZxZDlJd0dFRVJUdmpsSnpxMGZLTFNvZmJIVmJmdmtLNjZWWFdh?=
 =?utf-8?B?ZUU0aDlsakJkeWtxK2RFZTF1QkVEeVAxdVk3VzdrQ1ZmV3E1TGErREhhbnNR?=
 =?utf-8?B?dkxzT21iUlA5eE8randibHJpUHBpUXVzalhITi83TUpXRXNLcWdhWUNQdU53?=
 =?utf-8?B?YzFyMUQxSzN2U0dhRmNUeWovRGVCenNzTHlTS3RWanB0dGttR1lBMlVvY0Y2?=
 =?utf-8?B?SnptWm9yOW10ZU12UlZ6bmxmbjNFTGJWUS9NcTVER2ljZ3BjVUlleEVPelIx?=
 =?utf-8?B?cDBJbVV5SFVBL2g1MHU1bC82djltTlFwQnVZa3RzRW5rWGpWRXNFUHdIY3VP?=
 =?utf-8?B?WjVGWHBDRlFMUEFvcWpjcVdBNm5rTUI4YXU2NzM3QzR5RkN5UzdRU3YxWkNs?=
 =?utf-8?B?UjAwT3VBTXF0azY3aTRJQnc5eGY3WVlYbmw5V2E1aExLS1ZUZEdYQWNmRU5E?=
 =?utf-8?B?V0E4a0ZhVFA4cXhPL0JzaEQ2bzBmcnpvY2RlemROYU1NMnNLRlNiaDVlRzhD?=
 =?utf-8?B?cWpSNm5GaUFudFRTY3lmaUVYSGNwZE5yei9OakJTWWhsRXhNQ0g0NGVDMjFX?=
 =?utf-8?B?Y2I5YzBNVnFwdVZhM254dDlSQmVuK2FtT0tsT2tPbldESS9palJ3L1Jaajln?=
 =?utf-8?B?RSs4WEk1L2FSYzlTd2YvY0xENnoxbm5wWHhQdDlEZlVOSjNROVQrdTJuWjZl?=
 =?utf-8?B?Z1BLNXo3cXNXSnpaY0dGSEtnN1MzLzRHcjNmMmw4Z1pLcHhhQXJKVmpsdng2?=
 =?utf-8?B?cVdOaHhPSDB0cE9HRi94aUQ0RzNSdXYwNXlubko5bEpQWVBxZVhtTHVwVUdH?=
 =?utf-8?B?U3NVZXVpZTdqejd0RzFMSjl4Sks3VGYrUFFZajNGLzNYVXdhMkh4NXQ2WXNs?=
 =?utf-8?B?WG5pMlZoWmR4K3VzVzZjanh4aUJyQ1EweTdHMzYwSDlBaFJOYmJlc2lmakpu?=
 =?utf-8?B?R0dBTThoYjFuKzV6M1ZwYlY1MW1FTGhNdXU1dk81eXBoMHA0bFhITXk5OXRZ?=
 =?utf-8?B?QndOcjNGdHBncHVVc2RwMDhJYlZqZGNkM2Q1eWVHN1RmWTkwN1FvZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58bed1f-5572-4916-dfee-08dec6745280
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 22:13:23.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RexCOxpzsXO0izjGN0HIm5pcihqtc7EZL7qYrlIwREj00woBT2PRJAU8p6bmUKEv+OkvjvHRB0vXarMkgJL8Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462



On 6/9/2026 4:31 PM, Arnd Bergmann wrote:
> On Tue, Jun 9, 2026, at 22:34, Frank Li wrote:
>> On 6/9/2026 2:36 PM, Arnd Bergmann wrote:
>>> On Tue, Jun 9, 2026, at 20:01, Frank Li wrote:
>>>> On 6/9/2026 12:24 PM, Arnd Bergmann wrote:
>>>>> [You don't often get email from arnd@arndb.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>>>> -   ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
>>>>>>>> -             0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
>>>>>>>> +   ranges = <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>, /* 16-Bit IO Window */
>>>>>>>> +            <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
>>>>>>>> +            <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>; /* 64-Bit - prefetchable - 16GB */
>>>>>>>
>>>>>>> If a PCIe device requests a large 32-bit BAR, the kernel might allocate it
>>>>>>> within this 0x40000000-0xffffffff range. This causes the Root Port's
>>>>>>> downstream bridge Memory Limit register to be programmed to a value >=
>>>>>>> 0x80000000.
>>>>>>>
>>>>>
>>>>> I noticed the same thing while reading through the pull request
>>>>> for 7.2, and I think the bot message is correct here. The SMMU
>>>>> does not help here because addresses on the same bus are routed
>>>>> inside of the PCIe host bridge rather than directed to the host
>>>>> side. If the non-prefetchable ranges ever get assigned to an
>>>>> address 0x80000000, this definitely breaks.
>>>>
>>>> The address and size is 64bit,
>>>>         0x80_40000000..0x80_FFFFFFFF for 32bit non-non-prefetchable
>>>>            0x84_00000000..0x87_FFFFFFFF for 64bit prefetchable memory
>>>>
>>>> AI Bot wrong think it is 32bit address and size.
>>>
>>> No, this is about the bus address, not the CPU address, and this
>>> is given as '0x82000000 0x00 0x40000000' above. non-prefetchable
>>> addresses on PCI are by definition 32-bit, so the middle cell
>>> is zero.
>>>
>>> On the CPU side, this is mapped to physical '0x80 0x40000000',
>>> which does not overlap with CPUs view of RAM, but the
>>> bus view of 0x40000000-0xffffffff does overlap with the
>>> DMA address for the lower 2GB of RAM at 0x80000000-0xffffffff.
>>
>> This is pci TLP bus address, which will not appear in internal fabric at
>> all.  That is PCI TLP address, which is totally separated addr space and
>> can be any address.
>>
>>
>>          in SOC                                  |  PCB boards rx/tx
>> ==================================================================
>> CPU address                 PCI controller     |   PCI bus
>> 80_40000000..0x80_FFFFFFFF    ATU              |    0x4000_0000
>>
>> writel(80_40000000), PCIe controller will convert to 0x4000_0000 and
>> sendout TLP package memw addr 0x4000_0000, which already go out SoC. EP
>> device like wifi, will decode 0x4000_0000 to do related work.
>>
>> In side SoC, no one can see tlp:0x4000_0000, which only visual by PCI EP
>> devices, which means only connect EP device decode this address.
>>
>> Additional information:
>> In bound address space (from EP to RC) is not controlled by ranges, but
>> dma-ranges.
> 
> The scenario I'm describing is a device initiated TLP that is directed
> at memory in the first 4GiB of addresses, e.g. 0x8000_0000.  If any
> PCIe function on the same host bridge has a non-prefetchable BAR
> assigned to 0x8000_0000, the transfer should normally hit this
> BAR as a P2P transfer, unless ACS forces the transfer out towards
> the IOMMU.

Finally I understand your means. This dwc controller actually only
have ONE port. All inbound transfer will go though internal bus fabric.

inbound transfer -> PCIE controller -> bus fabric -> ddr/other pcie 
controller.

If fabric allow this kinds route (I am not sure configuration for this
SOC), the address must be 8x_40000000 to route to another PCIe controller.

If EP itself is PCIe bridge, it may be problem. It'd better to
keep 32bit range unchange.

Do you need rework pull request?  Or you can drop this patch.

Frank
> 
> If ACS is guaranteed to always be enabled on this machine, it's
> probably fine, as that would route (intentional) P2P transfers through
> the IOMMU, which can remap the destination BAR to an available
> bus address.
> 
>      Arnd

