Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793186481;
	b=Ykx8VSMKmFOAbcrimZSmh7WrioekNKY3fq3hOBMxXvn0ZLyA+4Rhg9EVlE16GkntudZ5
	 YfS3e9GGio9JeitC2N6GPoMPjKD9fwmcBfamOjv4+qhmVohAMztaeVJJ6jbLjssEf+rDy
	 hvXKUb/42tATYTxVRqALsNq0rBEXWQKXZ0Ooxc4P93Evn0IVlm47dzlDg3RS6s1/lkrts
	 3N5G6tz5azDqwhythWuC040YA4Yv2H1pkaP4AT5ktVP2uy9ydX2owYUBK8w2P25IDeXC8
	 UtPGa4y5SwNkbiX2lEzdzYetZX2uEqqtdm5vAPNgJ2RgJ2BGFrFQadRzX+t2ilr80hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186481;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
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
	bh=TAtBkiV7doHLDYXf5QBbEavBmLn7KzMNxrHaIqE5c7s=;
	b=dpbGSsWofg1yEioOxILvsIBQuNNlt79UDCduhfkpSDoGSBXPd+EqbLyqA/YgpWeTF2JQ
	 6ma9JBcO9TKjYMoLpg/XCSQ7sA5UEX1V09KtN12StTXqxg/fF6wIvxDoeXO6qRQ5+9MHD
	 zg727HbVs3mOJvNz6WUYDiQkNQ53adHGu1AJuJDzfoxmLeiTe+6otrjIPHyQWTM+fQvhs
	 NEHUxESdqRHjLmHP3htoR7vztb4y8DIGpD5GAiQ6psO3fAcwdfEphH/AKJiG0uIpFtP2p
	 k+zLmHozzofzVosdpp6GVn2oGy9SGCoHqWO7imZ8X2SNkwkAQC4hmACujrMmizJp/ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=BtGAy79o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.128
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023128.outbound.protection.outlook.com [40.107.44.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AFF606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 11:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AFF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=BtGAy79o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMY7zFtYp+Y0mUaRrsogxZuAUdbc2DIffSW0yqu5Zs5t/MkTIg1x++SXMSaxeWBuf0kLo8D+U842kl2JMvBiW3Hz/2MbhIwqwSUQ1dNzgJnRS4zYM3idvBumFC5MSLFeH/MBnhc5JfsIl7VYmE/VItGMXd0nu20PYsn6fu1tt3A76hAyHvymY0h9CEVsnDMjPbyE2p8GYFv0fE/bilbD6KOKeddewQ20bTKyIMsoGXn3pocUvs1Nd3Q9crW3eQjTeXpkt+ZxqAFGWiRswu4unegPG/xf3ekV545ykW7Bieca1/7QtMEBYiJa6RM888oEof8C9QkHGSOZiP3J+6jC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAtBkiV7doHLDYXf5QBbEavBmLn7KzMNxrHaIqE5c7s=;
 b=NM530mkpZxt67F38N8tkVIhr2TlB3CJ09nIpI+JpSR6VvnXHnwnMJYdoY3gLJJxtQ4A/owJ2ryLL+6XGdcxG5XE1H0oeQdxi2UYl2AYl5oxEnldzfn+BcyNb+1fYRU3d3MSHWrRSwxTk+67/lefgDae+WQFOB9vR5OvSxlz9R+pD9lgGn00CA3hGH693hv/zseUTv7jOwLuoFjgCBnNahjS4OVfft1FWko8K1qayjc67xueddodDIVq2Yg7eKZ6u2C4ISSHAjkRbCbJUEQpbWZ6IN6f8avSUe4X3oitZ7kAK8DGj08eFON76fTip+iHZCUTbRCnvIbUQh6WBRyWqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAtBkiV7doHLDYXf5QBbEavBmLn7KzMNxrHaIqE5c7s=;
 b=BtGAy79oORRGoC9mqdOySg8HE2by5n39YjDfZx5PTis1W+qyHOJnppy3c6LdtjUsWRU2tC2DGyKJJZtZiG0ARlObb2j2QDW812pL3R5bB++xNmjY4yIYPcGtYz9jzILijCxGMQCxQhB63wYFYnYOZsa1U51TzSrPt0di8ZDxLb1oThe4a1bvK1JPbMvmvnrc9lrREJc7RVjZdlrCXJLUq0RVfJTTcmkF7QLHSidRVtp0OvLM05o/YpGDqYMNLA16+Vczo7wq1U+3xginV8Bil3xW11AMqsYSW/+KaSGU54G1Ly5XPqD44USty5152GiGhbeAHeenPEmrbUq2wxoS0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by OSNPR03MB9654.apcprd03.prod.outlook.com (2603:1096:604:46e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 11:21:16 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 11:21:16 +0000
Message-ID: <7e413e61-9f47-4736-9f60-96616a3cb099@amlogic.com>
Date: Wed, 28 Oct 2026 19:21:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: amlogic: Add Amlogic A9 I2C controller driver
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261022-a9-i2c-v2-0-45e3cef175bf@amlogic.com>
 <20261022-a9-i2c-v2-2-45e3cef175bf@amlogic.com>
 <sashiko-outbox-181284@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <sashiko-outbox-181284@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0008.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::20) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
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
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|OSNPR03MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 1153bbe2-5dd0-48b3-5c3d-08df34e59503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261026140227099003|4143699003|11063799006|56012099006|261021123027099003|261026121527099003|261009223027099003|261022075727099003|261021121427099003|261009221227099003|10067099003|261022105027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	X4WKqQpINH+hEJjdPDDNIh+jumnHL8LaHJyT4ODbPAR2gvg1keEZEI/acBLphT0Dvt4Sqfzq5uz0ofNSKmiStgP4DQeRi/x5LqJCaCAKkUJmncon3YCNfJc1Yj3gG8kwRQ4Db4540uamXzZJsknHxhfuHP9g89kMHUysLMRAgJnzd9lWIy7BOZH4xyXssQamKgbWXuE32RWS9HbyHaDP4TT/wZ5OL4R4JvTwOD/TjpRXl+HtvsAwbl9LftVp3bAlifl/3tC14KwCMadp66eQu/+/XkR/ZoA8rPMUnz0j7Zalt0qNwT8iAAwXpXSNE1rvaxi4XtUQv4aFi0xgvJG2Ie/IORMdLlo5gNGx7FzNlNXvkIvws7X+CoBNoMaBVujZoKxa9FE6xAQy106DP1x2moDnRkD3MyQrjQ5UxeYjJ6QoCBNkCbg/CyuKVts+fzwDevoKK06MdUPJjdpn3BPUDpzAoiz3Z8uCNWDLCqHWJN2LDpgpsNXC/PTdQ1aMT4J3QM9Z1ghdLQHPpx2ogMkq3yspyMp6eWM/3CclpHADMBZkrGsJguOJkOj3HL66S4KpUQuKlZWfnWVkmjqLodBpd/p/fSjQ+T8FhEbFkHq0G3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261026140227099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261026121527099003)(261009223027099003)(261022075727099003)(261021121427099003)(261009221227099003)(10067099003)(261022105027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnNsUzRMY0NEbno4Si93dFA2aVhaa3kwdjhITUV6b1BOYXV4Z1lIME9tTURK?=
 =?utf-8?B?a0VvdlA4VU04T2JBRFpLYUZIbzNnaXE5NzlNL1pWSHEzTXczcFZxZnd1dEZv?=
 =?utf-8?B?cFBSZnVQWkVKY2tTY2RpL1dURjZlSWt3N3NaM1E3dEhsdWYyV2RpRGJJSnNB?=
 =?utf-8?B?OU5PZFBOUm5JNjBCakZ1Z2hyY0dkbHpxcjdBdkJPN2xZckprb0dWWUpuV3I4?=
 =?utf-8?B?b21pemVvejRsUTd1UjVyTW5oUjhyMjZCUWJ2NWRGRTNJRGxxN2MxQnFuRzh4?=
 =?utf-8?B?U00wTzFEbTBSSlhUOWtRMUEzMEdMUUZZZWl6eTMyWFhwSmlpNkRtVjVxVWlW?=
 =?utf-8?B?Z0FrT2tKTFNITFZuK3hiYndGRmdNcFNQY1NMTlFENVZ5NXNZb0xybUFJVG1S?=
 =?utf-8?B?NDlLR2NaNllXbXYvdlQ0clNza1JqNGdNNG1hbDlsZDhiNWdLRHFtQVhIZ1V5?=
 =?utf-8?B?VEtFa0RzZGQ4VE9BdzhUbXpUTm40RVM2NG9FLzNKUWJ5NFE5NktaRVRkQVlq?=
 =?utf-8?B?R3ZRTG5ReUcvcUhYeHhQUHpobk5mSVpvOFVqUGk5TmcvbjV6UmZYQlM1NElT?=
 =?utf-8?B?UEpBUUY5Lzd1ZTVONFJyZVNRV3dnclc2Y2krR09aZGRxSGt4ellqcW9abUdr?=
 =?utf-8?B?YnpHbHlTbHFrNE8vS0lhbjdjS2VtOUxiZ2g2dUQzSnRuSE1PTVFaREw5VGpZ?=
 =?utf-8?B?YWR6aXhlcDhETVB2dGlJWm16SGkrL0MrUVozQWhTRUhnM3k4TXZTc09rVVNT?=
 =?utf-8?B?aExCVkZtVjJSOHpudXNkdE1HMzN1SDFTb1hkZGJKQ09ONnBDamY3Uk9OaHR1?=
 =?utf-8?B?UlFCbHBZYnp4eWdZcjVPWnZJbzlSMXQySEpBeGxQMG01cmlHaDBpaER5N0JO?=
 =?utf-8?B?OTlzK21OTDFsdW9OMDMxMXluSnZBTEFURVNhU1hFNUNVTExKZlFEeGk1aE9R?=
 =?utf-8?B?OUYvenExRFpnWlNvbEpObkh6c25iaXFUMGdPblNPTHkzZUNXS2tIMGNoWXBQ?=
 =?utf-8?B?ZjJkTm5nVDNCQ2lETzlrZGt6VVF6SWgxQXJtbzZmU2djclFXaTZRTlV3cXo5?=
 =?utf-8?B?Z2NUbWxuRmY3WmZFWEJjZ1BzUDJiWFl0dnpocmI0SEtNVHpKOFA4MzVRRDVD?=
 =?utf-8?B?b0JLbEtSYm8vZ0tIL0p4cVZqcHNkYjNueFRIQnRBYUVGakVZUjhVaDJQMUJp?=
 =?utf-8?B?VVBIeEtadVJLWTl4dERnZ2pYMEQwQzVyZkdOaTZQa05peUJlQVpzNlk4WDdP?=
 =?utf-8?B?elMySCtCeEx2NHVqbjR1ZGhYQkI2QmtCYUNrUGwxSG1CcEV5WFNpalQ5SFdq?=
 =?utf-8?B?em1XdnlUOHNLZVBvUmJ2YjFhdWIrRWNiTkFRQmV0b0IxbW1rMGIzVjU5dy9B?=
 =?utf-8?B?MTBKSVluMm9DUnFYeFRpVVBqZjlOZ3FIL3pleUtxL2krOHROUnNNbENycWF4?=
 =?utf-8?B?SytMYTJxbUt0QjBRZ3pJMzF3Ty83R1hTZzVnV0VsNWdxS2xDaE4zZm5Wa2NR?=
 =?utf-8?B?cHBxNktOM0VzOVE2QmlGNDU4U3hJNFIrMGdpbXVSZ3FqcWZHaFZpSFg3OXJD?=
 =?utf-8?B?Unk2bjFtbHdjL2FuamVBT3FYL2tNQ21jUWd0ZXcrWGpGZWo3WnhMY0JmN1hS?=
 =?utf-8?B?Vjh1ZUMvUnNSWlQ3UU9WY21LUzczZmpEMzNCMTNNWldzSWwzZ2xZRmxDSUtx?=
 =?utf-8?B?SDFRRThaV3dkY3FzVDg5d1QzQ1ROUmZFMG1sNksyK05kZkFRMTFHRVIvdzAz?=
 =?utf-8?B?WStkd1hLcXVEOE43bG44ZGo4M1FQUHJyWDZkaTJxdHFXVGVwZ2JPb09vYTNP?=
 =?utf-8?B?ckExUEYxVFlDY3lyTXU0c3hLYk0wMG5HdDdXak15SHNPZGd5a0pvaDBaN1hw?=
 =?utf-8?B?S1RMZmlHd1FKdzFUU3U3MjZyZFlnclNXZG91ek1WMXBKR1lHVTBaU3R2RkpG?=
 =?utf-8?B?dzFjaEVjSHp2K1pkdm1zVFMwR21LeU4xeUVqd2hLbnFuWDdWREczZ0dPK2tq?=
 =?utf-8?B?N09hQTU0RGhIK1p3NWNsSUNTMS9CbnI5eTRZeGhTL3QwMmJ3aW1lbU1rRkds?=
 =?utf-8?B?WnhyT0ZMTkpDb2JoTWdjcC9rek80RHIzOTE1dFdMeUJuMnhKNW05MFZxUmFP?=
 =?utf-8?B?L0xycHdNaE5Hcmwwcnh0UVI3akFkL2h2SE12Ynl4cFpvS01DT1NPNEE5Uno2?=
 =?utf-8?B?QTBWRiszNEphZWtOd0pyL25tZlh6VDBjdFJTZy80UDlLS3k4anBPeUV0bkdl?=
 =?utf-8?B?RTZPTkZwNVh3a2ozRWVwOUNjVGdnc3lwSmZVRnoyZVA4R2ExdTZRV2FqbVFu?=
 =?utf-8?B?WnZrVVBDY1BSUnBRUGRZMGNCZytuVno0c2JSeTg5OXZmaWE2andBZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1153bbe2-5dd0-48b3-5c3d-08df34e59503
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 11:21:16.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9xb+OAIG2MPsgawa/AFF0Ts9xCBwEgfXEiF5ugKViN9PWwAYyved2R3uH2FIHkrFCrktipoKTvc2IyfMa7pcrrW0FqrEQlbuF9Wsw/YPqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB9654



On 2026/10/22 17:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] i2c: amlogic-a9: unlocked state init and late IRQ setup in aml_i2c_do_start()
> - [High] i2c: amlogic-a9: threshold IRQs left enabled on timeout in aml_i2c_xfer_msg()
> - [High] i2c: amlogic-a9: unhandled IRQ and spurious complete() in aml_i2c_irq()
> - [High] i2c: amlogic: missing RX drain in aml_i2c_irq() when A9_PHY_DONE is set
> - [Medium] i2c: amlogic-a9: unmasked msg->addr in aml_i2c_do_start() corrupts START_LEN
> --
> 
> commit 10e276126f680fbcf2e402bbde459a690540ef33
> Author: Junyi Zhao<junyi.zhao@amlogic.com>
> 
> i2c: amlogic: Add Amlogic A9 I2C controller driver
> 
> This commit adds a driver for the I2C controller found on Amlogic A9 SoCs,
> along with the corresponding Kconfig, Makefile, and MAINTAINERS entries.
> 
>> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c-amlogic-a9.c
>> new file mode 100644
>> index 0000000000000..d4954a4fd88ef
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-amlogic-a9.c
>> @@ -0,0 +1,469 @@
> [ ... ]
> 
>> +static irqreturn_t aml_i2c_irq(int irqno, void *dev_id)
>> +{
>> +     struct aml_i2c *i2c = dev_id;
>> +     u8 *buf = NULL;
>> +     int ret;
>> +     u32 rd_len, i;
>> +     u32 rd_val;
>> +
>> +     spin_lock(&i2c->lock);
>> +     ret = controller_is_error(i2c);
>> +     if (ret) {
>> +             i2c->error = ret;
>> +             goto complete_irq_out;
>> +     }
>> +
>> +     switch (i2c->state) {
>> +     case A9_STATE_READ:
>> +             buf = i2c->msg->buf;
>> +             rd_len = min(i2c->msg->len - i2c->pos, A9_I2C_FIFO_DEPTH);
>> +             for (i = 0; i < rd_len; i++) {
>> +                     rd_val = readl(i2c->regs + REG_CFG_RX);
>> +                     buf[i2c->pos++] = rd_val & TX_RX_DATA;
>> +             }
>> +             /* Rx must clear thresh after read fifo */
>> +             clear_irq_status(i2c, A9_RX_THRESH_READ);
>> +             break;
>> +     case A9_STATE_WRITE:
>> +             aml_i2c_prepare_xfer(i2c, A9_FIFO_FILL_HALF);
>> +             if ((i2c->pos + A9_I2C_HALF_FIFO) >= i2c->msg->len)
>> +                     aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_TX_THRESH_WRITE, 0);
>> +             i2c->pos += i2c->count;
>> +             /* Tx must clear thresh after write fifo */
>> +             clear_irq_status(i2c, A9_TX_THRESH_WRITE);
>> +             break;
>> +     case A9_STATE_IDLE:
>> +             dev_warn(i2c->dev, "i2c irq triggered abnormally, irq_state:0x%x,irq_en:0x%x\n",
>> +                      readl(i2c->regs + REG_CFG_IRQ_STATE),
>> +                      readl(i2c->regs + REG_CFG_IRQ_ENABLE));
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     if (!controller_is_done(i2c)) {
>> +             goto irq_trans_out;
>> +     } else {
>> +             if (i2c->state == A9_STATE_READ && (i2c->msg->len - i2c->pos))
>> +                     goto irq_trans_out;
>> +     }
> [Severity: High]
> Can a multi-chunk read (msg->len > A9_I2C_FIFO_DEPTH) hang in
> drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_irq() if the remaining bytes
> finish arriving before A9_RX_THRESH_READ is cleared?
> 
No. According to the code logic, if the data has not been read 
completely, the condition for completing the operation is not met, so 
the interrupt status bit will not be cleared. Once the data transfer is 
complete, the interrupt will immediately be triggered again, allowing 
the handler to continue reading the data. Finally, once the read 
operation is complete and the condition is satisfied, the completion 
interrupt will be cleared.

> In aml_i2c_xfer() -> aml_i2c_xfer_msg() -> aml_i2c_do_start(), a read with
> msg->len > 32 enables A9_RX_THRESH_READ alongside A9_PHY_DONE, with
> I2C_RX_THR configured to 32. When the first 32 bytes arrive, A9_RX_THRESH_READ
> asserts. If interrupt handling is slightly delayed or the remaining tail bytes
> finish arriving while the A9_STATE_READ loop is reading the first 32 bytes
> from REG_CFG_RX, A9_PHY_DONE will already be set in REG_CFG_IRQ_STATE before
> clear_irq_status(i2c, A9_RX_THRESH_READ) runs.
> 
> Because A9_STATE_READ only drains up to A9_I2C_FIFO_DEPTH bytes per call,
> i2c->msg->len - i2c->pos remains non-zero, and the controller_is_done(i2c)
> branch takes goto irq_trans_out without draining the remaining tail bytes or
> completing i2c->done. Since A9_PHY_DONE is already asserted and fewer than 32
> bytes remain to re-trigger A9_RX_THRESH_READ, no new rising edge will occur on
> the interrupt line, leaving wait_for_completion_timeout() in
> aml_i2c_xfer_msg() to time out with -ETIMEDOUT.
> 
> Should aml_i2c_irq() drain the remaining bytes in the RX FIFO when
> controller_is_done(i2c) is true during A9_STATE_READ before completing the
> transfer?
> 

>> +
>> +complete_irq_out:
>> +     reset_fifo_pos(i2c);
>> +     complete(&i2c->done);
>> +     i2c->state = A9_STATE_IDLE;
>> +     aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, 0);
>> +     clear_irq_status(i2c, IRQ_ALL_MASK);
>> +irq_trans_out:
>> +     spin_unlock(&i2c->lock);
>> +
>> +     return IRQ_HANDLED;
>> +}
> [Severity: High]
> What happens in drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_irq() when an
> interrupt arrives while i2c->state is A9_STATE_IDLE?
> 
> First, controller_is_error(i2c) is checked before inspecting i2c->state. If a
> late A9_NCK_ERROR interrupt fires after a transfer has already timed out and
> transitioned to A9_STATE_IDLE, aml_i2c_irq() sets i2c->error = -ENXIO, jumps
> to complete_irq_out, and calls complete(&i2c->done).
> 
> Second, in the switch statement, the A9_STATE_IDLE case logs a warning and
> breaks into the completion checks:
> 
>          if (!controller_is_done(i2c)) {
>                  goto irq_trans_out;
>          }
> 
> If a threshold interrupt fires while in A9_STATE_IDLE and controller_is_done()
> is false, aml_i2c_irq() jumps to irq_trans_out and returns IRQ_HANDLED without
> clearing REG_CFG_IRQ_STATE or masking the threshold interrupt in
> REG_CFG_IRQ_ENABLE, leaving the interrupt asserted. Conversely, if
> controller_is_done() is true (such as a late A9_PHY_DONE), execution falls
> through to complete_irq_out and spuriously signals i2c->done while idle.
> 
> Should aml_i2c_irq() check for A9_STATE_IDLE up front, disable threshold
> interrupts, clear REG_CFG_IRQ_STATE, and return without calling
> complete(&i2c->done)?
> 

Later, I will check the status at the very beginning. If an abnormal 
interrupt occurs, I can skip the processing and clear irq state.

>> +
>> +static void aml_i2c_do_start(struct aml_i2c *i2c, struct i2c_msg *msg)
>> +{
>> +     unsigned int reg_val;
>> +     unsigned int trans_len;
>> +
>> +     trans_len = msg->len;
>> +     reg_val = (unsigned int)((msg->addr << START_SADDR_SHIFT) |
>> +                             ((msg->flags & I2C_M_RD) ? START_READ : 0) |
>> +                             ((trans_len & 0xfff) << START_LEN_SHIFT) | START_START);
>> +     aml_i2c_set_mask(i2c, REG_CFG_START,
>> +                      START_START | START_SLAVE_ADDR | START_READ | START_LEN, reg_val);
> [Severity: Medium]
> In drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_do_start(), could upper bits in
> msg->addr corrupt the START_LEN field of REG_CFG_START?
> 
> When userspace submits an I2C_RDWR ioctl on /dev/i2c-*, msg->addr is a u16
> passed through i2cdev_ioctl_rdwr() -> i2c_transfer() -> aml_i2c_xfer() ->
> aml_i2c_xfer_msg() -> aml_i2c_do_start() without masking. Because
> msg->addr << START_SADDR_SHIFT is not masked to 7 bits (or START_SLAVE_ADDR)
> before being ORed with (trans_len & 0xfff) << START_LEN_SHIFT and written via
> aml_i2c_set_mask() under the combined mask START_START | START_SLAVE_ADDR |
> START_READ | START_LEN, any bits set in msg->addr[15:11] shift into
> START_LEN (GENMASK(23, 12)) and alter the hardware transfer length.
> 
> Should msg->addr be masked (for example with 0x7f, since 10-bit addressing is
> not advertised in aml_i2c_func()) before shifting by START_SADDR_SHIFT?
> 

Will add mask for address.

>> +     clear_irq_status(i2c, IRQ_ALL_MASK);
>> +     /* enable thresh mode */
>> +     if (trans_len > A9_I2C_FIFO_DEPTH) {
>> +             reg_val = (msg->flags & I2C_M_RD) ? A9_RX_THRESH_READ : A9_TX_THRESH_WRITE;
>> +             aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
>> +                              A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, reg_val);
>> +     }
>> +}
>> +
>> +static int aml_i2c_xfer_msg(struct aml_i2c *i2c, struct i2c_msg *msg, bool last)
>> +{
>> +     unsigned long time_left, flags;
>> +     int ret = 0;
>> +
>> +     i2c->msg = msg;
>> +     i2c->pos = 0;
>> +     i2c->count = 0;
>> +     i2c->error = 0;
>> +
>> +     i2c->state = (msg->flags & I2C_M_RD) ? A9_STATE_READ : A9_STATE_WRITE;
>> +     spin_lock_irqsave(&i2c->lock, flags);
>> +     aml_i2c_prepare_xfer(i2c, A9_FIFO_FILL_FULL);
>> +     i2c->pos += i2c->count;
>> +     spin_unlock_irqrestore(&i2c->lock, flags);
>> +     reinit_completion(&i2c->done);
>> +
>> +     if (last)
>> +             aml_i2c_set_mask(i2c, REG_CFG_BUS, BUS_NO_STOP, 0);
>> +     else
>> +             aml_i2c_set_mask(i2c, REG_CFG_BUS, BUS_NO_STOP, BUS_NO_STOP);
>> +     /* Start the transfer */
>> +     aml_i2c_do_start(i2c, msg);
> [Severity: High]
> Can starting the hardware transfer before clearing IRQ status and enabling
> threshold interrupts in drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_do_start(),
> without holding i2c->lock across transfer setup in aml_i2c_xfer_msg(), race
> with aml_i2c_irq()?
> 
> In aml_i2c_do_start(), setting START_START in REG_CFG_START kicks off the
> hardware transaction before clear_irq_status(i2c, IRQ_ALL_MASK) and before
> enabling A9_RX_THRESH_READ or A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE:
> 
>          aml_i2c_set_mask(i2c, REG_CFG_START,
>                           START_START | START_SLAVE_ADDR | START_READ | START_LEN, reg_val);
>          clear_irq_status(i2c, IRQ_ALL_MASK);
>          /* enable thresh mode */
>          if (trans_len > A9_I2C_FIFO_DEPTH) {
>                  reg_val = (msg->flags & I2C_M_RD) ? A9_RX_THRESH_READ : A9_TX_THRESH_WRITE;
>                  aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
>                                   A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, reg_val);
>          }
> 
> If the task is preempted or interrupted after writing REG_CFG_START, or if the
> controller quickly asserts A9_NCK_ERROR (such as on an address NACK) or
> A9_PHY_DONE before clear_irq_status() runs, clear_irq_status(i2c, IRQ_ALL_MASK)
> can wipe out the newly asserted IRQ status bits and cause
> wait_for_completion_timeout() to time out. Similarly, if aml_i2c_irq() runs
> and completes on an early NACK before aml_i2c_do_start() updates
> REG_CFG_IRQ_ENABLE, the unlocked read-modify-write in aml_i2c_do_start() can
> re-enable A9_RX_THRESH_READ or A9_TX_THRESH_WRITE after complete_irq_out
> already cleared them.
> 
> In addition, in aml_i2c_xfer_msg(), i2c->msg, i2c->pos, i2c->count,
> i2c->error, and i2c->state are initialized outside i2c->lock, and i2c->lock is
> released before reinit_completion(&i2c->done), REG_CFG_BUS configuration, and
> aml_i2c_do_start(). If a late interrupt from a previous timed-out transfer
> arrives while i2c->state is already set to A9_STATE_READ or A9_STATE_WRITE,
> aml_i2c_irq() can modify i2c->pos and access the new i2c->msg->buf before the
> new transfer begins (and if i2c->pos exceeds the new msg->len in
> A9_STATE_READ, the signed subtraction i2c->msg->len - i2c->pos in
> min(i2c->msg->len - i2c->pos, A9_I2C_FIFO_DEPTH) will wrap to a large u32 in
> rd_len and overflow buf[i2c->pos++]).
> 
> Could the state initialization, reinit_completion(), bus configuration, IRQ
> status clearing, threshold IRQ setup, and START_START trigger all be performed
> under a single spin_lock_irqsave(&i2c->lock, flags) critical section, with
> clear_irq_status() and REG_CFG_IRQ_ENABLE configured before asserting
> START_START?
> 
I will lock start. This way, there will be no conflict that causes 
interruption.

>> +
>> +     time_left = msecs_to_jiffies(I2C_TIMEOUT_MS);
>> +     time_left = wait_for_completion_timeout(&i2c->done, time_left);
>> +
>> +     /*
>> +      * Protect access to i2c struct and registers from interrupt
>> +      * handlers triggered by a transfer terminated after the
>> +      * timeout period
>> +      */
>> +
>> +     spin_lock_irqsave(&i2c->lock, flags);
>> +     if (!time_left) {
>> +             i2c->state = A9_STATE_IDLE;
>> +             clear_irq_status(i2c, IRQ_ALL_MASK);
>> +             reset_fifo_pos(i2c);
>> +             ret = -ETIMEDOUT;
>> +     }
> [Severity: High]
> When a transfer with msg->len > A9_I2C_FIFO_DEPTH times out in
> drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_xfer_msg(), aren't the threshold
> interrupts in REG_CFG_IRQ_ENABLE and the active transfer in REG_CFG_START left
> enabled?
> 
> In aml_i2c_do_start(), transfers with trans_len > A9_I2C_FIFO_DEPTH enable
> A9_RX_THRESH_READ or A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE, and only
> update REG_CFG_IRQ_ENABLE when trans_len > A9_I2C_FIFO_DEPTH. On normal
> completion in aml_i2c_irq(), complete_irq_out clears A9_RX_THRESH_READ |
> A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE, but the !time_left timeout path in
> aml_i2c_xfer_msg() does not disable those threshold IRQ bits or stop the
> transfer in REG_CFG_START.
> 
> If a >32-byte write times out and the next transfer is a short read with
> msg->len <= 32, wouldn't A9_TX_THRESH_WRITE remain enabled and fire during
> A9_STATE_READ, causing aml_i2c_irq() to read from an empty REG_CFG_RX FIFO
> into msg->buf?
> 

I will take corresponding measures to prevent this from happening.

> [ ... ]
> 
>> +MODULE_DESCRIPTION("Amlogic I2C Bus driver");
>> +MODULE_AUTHOR("Junyi Zhao<junyi.zhao@amlogic.com>");
>> +MODULE_LICENSE("GPL");
> --
> Sashiko AI review ·https://sashiko.dev/#/patchset/20261022-a9-i2c-v2-0-45e3cef175bf@amlogic.com?part=2
