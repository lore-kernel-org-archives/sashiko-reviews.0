Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793811423;
	b=u8iLN8oVsCTPAfyJ068h56pkAXx2pcfOtXrp/EpKfMLzAefg3kKvpfC+iqV3cnH+B234
	 Eu/cY9T0McDHISFj757Aqg38AHpf76dlp9sTEJBqUoH1qfGYiYxgRu3gmlP+5idVePic2
	 l6s8+VrRKgy6SOIEdDel6RajSWO3qMkBuISGQQe/eGAi7gSfOSf5yECKoakcKkxn06oFO
	 hDhGcmOjC0NFxIlLdOZf/goH6DuMrmIm6Y81xLEAFfqJ+pUpMYrKIVhfGOsTcgKIkwPY0
	 XOwQis7V1SC0523awRX9lKcSV1FQMr6JGkdeFBfUbeRv/zl2VwtFZQJ/8WjlC/042ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811423;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=zp5NOqgLPhQYOmzP6/lTOtehqFXh1jWUd8b9Dyowwzg=;
	b=DzRAdgTXPyCPdWTxTupcfYGdnCwOtWuwFifAk1RGxTzqE/WCVi5VPJ+wefLuOY9RLrbY
	 Qux2Izxqm5HhMtoY3calPe6W54DM+BWFkAcQXsRGI1pD24fUJrn+pgZt5qE7Zb6UWRhes
	 hr01iF4ZadNXYBKGo5Sma34Byvl/6fzYKYLRyedtBcwq0eMwf+wsCsGvMxRJ/7I+KYSJY
	 Ilt0yKVRWOn9F2K7d1sKhTgYH1yo2tXyEbAJqphcpK5nsilQvFiRUSnoO0LOzJHLMXBn+
	 z24nzrYCpvLKQKGPGaA5+YIZgPMD5wkdCrlEqFwx5VyU9D3jg94UP9/Nf9KqnF3a+7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b="E2/G4xW5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.92
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021092.outbound.protection.outlook.com [52.101.65.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FA0606D815;
	Wed,  4 Nov 2026 16:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FA0606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=E2/G4xW5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQzcfmw5MiSZqzcn5cMEhCWzqNQhUoH/+BUDNJGAXVF4jqtr0rImEf0/MlKpp970MI6ug34+IJ4Ned17QL0MT22/teIEXd1JBAc6GYAdyq/OxuIhu1g5mOcgcBBtUY0WoO6EAUV5nd3tUi8FI4cv2RajOG6h6hrBYTLUIzTGEbP68YdFvdJeLCUjWN02JjAWomnb1osNFg1Sdcwbkiyf9VaS0/wwXokERIO3isN2TanbKXNyBbd7pJ0uNHjt/4fOgC66jwaKEWDCfqLdccg6yKyZ+sy1IzihdTEUQV8hSVtzIC34CVV8uYZ62VPEIE1sSPItXxtZNBOxTENvwg3hGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp5NOqgLPhQYOmzP6/lTOtehqFXh1jWUd8b9Dyowwzg=;
 b=IdPC7+HZPqWNUiag2+XpTQm5qhi8UsaRLVkp7PUt7n7drirpPnTNtkQOPPmdXkmzNvH+gWkVywurIwu83EQQ0nECwJNtwCjzhDQaHVAxb2VSVapc8kpjEX+3LL7OfwkGDRJWQWEUC32xQOfdqj561Bil+krBKPG5d7lRHsi/QAUhyvxG/i0Nc352S29mIrSc5rlc9MWD3jmV783PyiV/ynozrBtAmCCefMBW8ZYtmmxioso1M5ja9Y3yHozz30Nbb5EgTPBwSoC6sR0Iuooi6HAiny1yNwliBe+EljnChhUG2rpSgrLnLSlUlUMk/UflgH/kac93rQh2mJzBtVcHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp5NOqgLPhQYOmzP6/lTOtehqFXh1jWUd8b9Dyowwzg=;
 b=E2/G4xW5CL6TYMOpNGN6S1A2/D/lxPL7au9KgZxwcVLuDkCeDLcKxrkdcgtuck/H2NtkdQcyyE7o/7Vm/jYcdf8ownsqsRX/R3ze5uzQ6uZyIiuoMLxlVr2Dh/0ZJHW6nztU+pzipCvb3uQiZ4s0Lgg2DTn0d6g0DqTWalDRYajZ2P9ht+0Bu1Ztsenzie3Aimgi9Vn4lV2Gr5mE/1knyvBZAJUYIg4ISnFk936EbTsvhk0ek1DLIzLcNCyZ8YPenQe4pWQFiC5zlo/cuDImIqbRhv2XIK8m+nLB+LUDExASHKvAekM8G5IUFsRMdRyNTvY8UP0eobifFRSOUXwjHw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:159::10)
 by DB9P195MB1730.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:399::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 16:56:58 +0000
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894]) by VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894%7]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 16:56:52 +0000
Message-ID: <cb8f678b-a173-4831-8d89-abed7b4497f2@phytec.de>
Date: Wed, 4 Nov 2026 17:56:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] bindings: remove unused binding from old Libra
 version
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
 <20261030-wip-bhahn-imx95_upstreaming-v1-5-1c1cebb5be99@phytec.de>
 <sashiko-outbox-191081@kernel.org>
Content-Language: en-US
From: Benjamin Hahn <B.Hahn@phytec.de>
In-Reply-To: <sashiko-outbox-191081@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:159::10)
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
X-MS-TrafficTypeDiagnostic: VI1P195MB0623:EE_|DB9P195MB1730:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3c6949-2610-4a7d-47ba-08df3a94a037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261022105027099003|4143699003|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	omuslpNiNTSsCkzLQ0W5NyXkqOKQVQgc9ytCGjVEd0hFHgb+QnIwNqXQm84ZLD+ZqLV3HTrymjhVE3WrDFVCaIwMmZMXAf1FMPUPG8Rv5xgDn+pL/abP4JbuKeMa1U7iHG1QecSO04+ajHGE8OUZYBFJKaj9wTH330uGZMjbtVAAw8oqWNNz8JL5t9/ECzkmbK+c5aJmXLX1P/UKXeqnLk2PscVS6R4REKbQoYfE9AiC5GmYQTmetUIKqDVyI1y6+d2zOaXZtCuC7El72bTURJYsAicfY6O0lQ9NWygz7e9BetVrSsWBZOguHtfaEMJl/89MZkENSIRnLLkh2RL8Hnf9U2okWe7zVNcMc9w5dMSiC9Gxs0qYFeYj9MIn5LzPWgNpCKAzqzBM7cOR5/kSPBPjgZVV7yCuUSBw5UZ7d9NRDBldM6fguRv9/jvO4y6nnnl8TAuz4npHyzb3da03ft9SMLS2cn7VzFQG3kdiRpj6jiw2vxJS58o741asEOB34iujqkGKxlg4qAyeCJNGPU4xnE9ORCeohTlcpSkWgsB7p0g4MEhQcrQW+/mrBR9aoZw0HbwpqTkz1pFjuK/jAzknNFZXx1sxFOWtEo/EBvT5KG3yfYnpTkck8Qyaj1D5nP6U/Q1CfudOpbkBw0N4IFGojDESV7k2eW4O/16APUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P195MB0623.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261022105027099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWNUR2t3UW1kZElTMGg4RU9OVFpHQTVTSjJwVTd3dHp2YmpralVlUmdYcmxT?=
 =?utf-8?B?MVJXS1JvZFVDb2NyYjBydTcxTXhDQ1dnK1JwYUFneUQvSk5nYzI5YzFhNFBM?=
 =?utf-8?B?SnRGY1pFOXBUWkJlMUE0K2MrbFA0c3dyS1dXT1N2T0NDQXlYK2t3emZ3Vmd5?=
 =?utf-8?B?dmhtdkZxSGc5UzhhcWFTemNGTEFXd1NadFNCYm53MXNoNmI2aGdBM0FDT0xv?=
 =?utf-8?B?ZkVkWjVrdlFHSjVWZy9aVURYRFhnOUlvaitaRUxDdk1iWm16THNEVzFUUTcr?=
 =?utf-8?B?dkY2cTZyUWJHaXd2aUNWc2tqMkRPQXRZZGlORytFdkNzZHNJUTdTbjVvcDRB?=
 =?utf-8?B?Ty9PWjRTRk4zcGxzZCtSZHhsdTA1ZkQvY0RNYkxRVklDQndiMW15QngvUEdW?=
 =?utf-8?B?VGtWak5ZeTdleEJGdlVJbnFmWlRJQXdocmFFZDRpcDhnaDZCblVJZ2hEdzNy?=
 =?utf-8?B?VG9KTVZOOEZlbDhlL1kvQkVveWxDTFhJaGIzbHoreHpHbEtSY1BnUVJMamg5?=
 =?utf-8?B?bWxxa0thVVFhWVp5eUlMZEhZWjlxcDBKZ1NRRGQ4NVpoMzkvSnRZb0hJelBH?=
 =?utf-8?B?dmVJQk1NUVgvZmZOVks4OHZhZlJ4OVI4REFuVFZzNTUzWUh3azM0dkFROEZx?=
 =?utf-8?B?cDJxaWlwU3p5UjdCam5BQyt5SnUyMTRMOG9zbHdCRVJ4L0I4SkZDdTEzdk95?=
 =?utf-8?B?Y1RHa0pkVkJSbVJCQ1lQZSsxTXpEandmWU9JNmFhL3lKYTcxWFdKTHRkNXJY?=
 =?utf-8?B?SU5zSmhET01ONXJoMUtKdHg1c3lkakVXSlRvYkovQjZlSTE3TzgwZVJST1ds?=
 =?utf-8?B?d3ZpeU5HN29oU0x3eGVrTkFHTU1WMktyeGZ6aUpveHNsTUVTV3R1eTB6MzJV?=
 =?utf-8?B?NmY3WGdnTHpybkgranlkK1dtTHRnZ1hxRzNRZkdNREorY3RxUys5MFJCcHN1?=
 =?utf-8?B?MW1JOHFOR0lCVS84djBvdzhxbmd0RzEwQVlvZUJqa3ZKbHc4bnhBeE00ZW5Q?=
 =?utf-8?B?cFNXUEFzMktacUk0K1JFQ1dtcytIUm1CRGNZYjVkQTFmY290ZTZoVjhJaEk3?=
 =?utf-8?B?UHpqaE92MTFMcHZ3dEJocmdMcTBsV3NyZlVBSzdnT2tpLzk2MHJyd1pNVms2?=
 =?utf-8?B?eHdZRUpIWU5mc2xjdklUcElpUG56ckd6SEtraHNBV1JBUStkait4TU9RbnFL?=
 =?utf-8?B?SFFkdVJiSzhpeVhPQVBxYmlVWnlUT0I1Z05qaDRibC9maUFDZitIUFZpTHVR?=
 =?utf-8?B?K1A4cWt4RitBRW14Y1FMbTZKQkFINytNdnFreU8rTHdYR1dtRGl4T2Jza2Jm?=
 =?utf-8?B?R2JEQ0d0MVBQOVl6dnh3YnRXYWxLWVVkNjVlZGhveXVXS3lNSkpLdVcrY0hP?=
 =?utf-8?B?dmVQWnVVa3J1eE5XeHFoY0RDUXBNeE8rMVlqazBmRVFreXlldzBncG9KcHZ1?=
 =?utf-8?B?WitTcm5hZ3ZKeUtuWHF0WDZ4ZkhVM084OGI0TS92R3RSaGVobXY3a2RPTFky?=
 =?utf-8?B?TXJucXdNK1piSVhPWWs1OEFqODl0VElKZFNnU21qeXlVUWlNZUhYOTFRVFN5?=
 =?utf-8?B?aXI2d0hDSmJPeGo3ZmZuY2pXVXAxa3IxZzJtWEhEbUdPVXJPWEtRUUJRRWxw?=
 =?utf-8?B?Mms3TjAzK1FMNVUzTE9rSEp5NU5DbkY0aS8rNW5HY2FDMHhuMk9ST0syRDFL?=
 =?utf-8?B?MjFDdXZHV2lxYk5LSFdvSHRUUHlsbGdPZE5DT2xMR2pLWk9CZWVNVS9VUjFM?=
 =?utf-8?B?V2prVXRIV3dOUVkrM0ZNTXZid3pOUEsrSGhGMSt0THh1KzJvY2c3cGpBa21I?=
 =?utf-8?B?aHBTRzg1Qmp1QW5BT1E3WTdXRk5zcmY1ODR0MmxMa0FidFpiVE1HSCtiNkFL?=
 =?utf-8?B?UXNxVjQwdXJZUTAzZE45d3VpS3AzbVk1TldIWnAxSUlDelYvTTl6K0o2S1FO?=
 =?utf-8?B?aHRVN2RrOE1xczFWWXk3UnBhaUY2eFFDL1g0OHJ2TXg4SFNpZitobnduRXhE?=
 =?utf-8?B?WEdmVDl2ejcveFVjMU81Zk9yZzZrNFlPc3Uwd0F2TzFkMzlXeFdzQ3d5Um05?=
 =?utf-8?B?TkpuUXR4d2h2bFpzeDMveW9GdUV4SWVQZnh6eWNOd2gweFJianhyN2EreHNK?=
 =?utf-8?B?OGRrK3lCQm5WdE03bDBtak1LRXNIaHdLc2o0S0hsWXE1TXkwa0hMNy9TME9Q?=
 =?utf-8?B?bEs0eElQSENIQnNucEVWejdKRUcyL1g1bGxqR2dTc3hjYmZEd0d5WXFTaVRt?=
 =?utf-8?B?b0dMOW5rTmkrOTJxaGFFd1ZDVGswQ2cwZXhTYVk5SStTcEl0U2FUdUlVc2Nz?=
 =?utf-8?Q?Vr5FWvP/nL9AJu0rFY?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3c6949-2610-4a7d-47ba-08df3a94a037
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:56:52.8504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVfVOQIY93BYykugsrZJAD6j3N/s9nRUqaGPryGt1A3WtwHlY14ZHvJAU55Yk48qrypgo/T3w3W84gztT62fnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1730

Am 30.10.26 um 14:47 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: arm: fsl: missing ABI removal rationale in commit message
> --

Will update commit description with more detailed description for v2.

Benjamin

>
> commit 59deabe3729dc9f9716dfd3c6cfdb69f11310abd
> Author: Benjamin Hahn <B.Hahn@phytec.de>
>
> bindings: remove unused binding from old Libra version
>
> This commit removes the PHYTEC i.MX 95 FPSC board and SoM compatible entries
> from the Freescale/NXP arm devicetree binding schema.
>
>>      bindings: remove unused binding from old Libra version
>>      
>>      Remove unused devicetree binding from old Libra board version.
>>      
>>      Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index f917ae7202e96..dec6e22719b5d 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -1544,13 +1544,6 @@ properties:
>>                 - fsl,imx952-evk            # i.MX952 EVK Board
>>             - const: fsl,imx952
>>   
>> -      - description: PHYTEC i.MX 95 FPSC based Boards
>> -        items:
>> -          - enum:
>> -              - phytec,imx95-libra-rdk-fpsc   # Libra-i.MX 95 FPSC
>> -          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
>> -          - const: fsl,imx95
>> -
>>         - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
>>           items:
>>             - enum:
> [Severity: Medium]
> This isn't a bug in the schema syntax, but since devicetree bindings form an
> external ABI (Documentation/devicetree/bindings/ABI.rst and
> Documentation/devicetree/bindings/submitting-patches.rst section I.9), is
> being unused in the kernel tree sufficient justification on its own for
> removing phytec,imx95-libra-rdk-fpsc and phytec,imx95-phycore-fpsc from
> properties.compatible in Documentation/devicetree/bindings/arm/fsl.yaml?
>
> The current commit message only restates the subject line without explaining
> why breaking or removing this binding ABI is acceptable. In the companion DTS
> commits 4a096b093cf5 ("dts: imx95-libra-rdk-fpsc: remove devicetree for old
> Libra") and 01cb871eca78, it is explained that the old baseboard (1618.0) and
> SoM (1620.1) were alpha-only hardware based on i.MX95 silicon revision A1 that
> are no longer available, built, or supported, and have been superseded by
> hardware revisions 1618.2 and 1620.3 using phytec,imx95-phyflex-libra-rdk and
> phytec,imx95-phyflex-fpsc-g.
>
> Because devicetree binding patches and DTS patches are often reviewed and
> applied through separate trees, could the commit message be expanded to
> include this hardware rationale, mention both the i.MX95 SoC family context
> (as fsl.yaml also documents phytec,imx8mp-libra-rdk-fpsc) and the removed
> phytec,imx95-phycore-fpsc SoM compatible, and use the standard
> "dt-bindings: arm: fsl:" subject prefix?
>
