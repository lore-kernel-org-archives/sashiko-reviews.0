Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810330;
	b=LzB9dN70cvEql1ezHIgQ/VdzIO8CrbkUpCQzD4tfLAg6zxTKPIOfIbZaL1L1GNdAZP7y
	 NxHdtJml97QJ1U1xFA6YVLmrFEKs7AMnUq7iTlcrR62wjDClfnWT924nMhhQN1KflnZPV
	 /pyl67WYu85ECWPG4ZUn41LB/cJ0/pH/IFyYd1GA7N5nBWX6DXHnlmW4ZCc4GW1CalMjp
	 D6qnrAvCrua0Mlt5Yqa+yScGuWMkumSxU0Vb/kwMZqGskg8yb6aM+g90X6SnT5cJQLpJd
	 QbkzSku9kYU2F5XZZIgEnadOJ+18SIIoSa3i+CgVsGMZuAOIJnUoT+7LwlTn5Ux27xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810330;
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
	bh=M0aoeKpwFlDVUfix0hsz+ARJFtYG/eUi+3bjIRsuZ/M=;
	b=hDEIWpgNXS63hMoOhPoUL3afIy04+VCXQVYhRP9JVSl1XX7KAVpqDOI5AHjJ7hnOLXim
	 XEAPc8aeSzQB44pAISWlit4XqfSK4TRO6qqhKTieab6/Czvyz7RX5gNwCnJLxCJ9I5X5s
	 E8F9h7cmNtop1gDAyZqID4Dp5vHiLcQ+ebBmjIz+d5t0XjXVvfj2zmI0KivxUS3QbnrMX
	 YWQQBy7LDYO6nSnt8SfubPQlFkC5+7M4JyIgsn9Qfom2BlAYh0n1dHdOQ1s6NmgcyOib/
	 UKuwiuDYBNdebYS+otXlmLqzq5oORmNTP2d7yKaIbwotmuKDZTYOyflAtcMfdsU4Uuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=AZw0hUPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.143
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020143.outbound.protection.outlook.com [52.101.69.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5EB606A31B;
	Wed,  4 Nov 2026 16:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5EB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=AZw0hUPz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfxh8D8jmUkwPJMla7ar/95GS9/mcYgXyFwRWBc7Ybtp1TYOiBk6e1nf5DY7vRe9zr8Q/wlYN5ebHo5dTRQB7wzwS3pD4lZC20GQ5OvCT8dtMF6fW/sHUV/cA3BGGDp3Psjf8Uj1ZXFqpiZnOHmwe0M7cU4PKwwH+DiP5bddD5qLh7/w8DK0ih9LmBCPVYQekKJjqOqDihaR/wn0rd5AFVNAf5kfF1Ec+QuZGmusQLjCj1PgTZreCzImb/4ZF79jUyFFnbSFtPXhLoxto40aJCRdg/W7F25sYK030YaQkenN3F9OipKBak8ERDvUxUXheoKT2rigwdmRMcQACja10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0aoeKpwFlDVUfix0hsz+ARJFtYG/eUi+3bjIRsuZ/M=;
 b=AzoMDnPAcuPfryZsdts1lLj+H2+6Gd6RGjG4pdg5lnohXn3nksbejkNdyo7aZD3ntxijRYQB/ZPFjSZcN7wi2pUFeVAnYAPTXjTuY1sSeCXGP6Pm56HTmD5n0XO6CAUNyoq5wRo8Jm5Ux0O9Rb4zBfg1JX7e2aA1dF0BMESxd1atDkX+5pU93VuDAIzck1xZO29Bav9S4rh+1to+mRN5F/NcazOWOKOdhrqIGWIIGLPTEHrMRXmwMguFzLpb1dCEws43SbnyAN25Ci2YomM9okr778EdKZK54MyQFKefNCLzQs4Qo4xLXjO2zFytVkPAV8FeVYp3AlSVLjDUDLhPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0aoeKpwFlDVUfix0hsz+ARJFtYG/eUi+3bjIRsuZ/M=;
 b=AZw0hUPzGzD5RURsUe2+rB2XucQaOv7R5+ure7rWkeldN/jNfT06NtQ0SQq8aUIwImznfxXEyozW4VHIay0UwJqzVB983AxM69SAZ5jK+JDva7XXnRwYG7LFeoLPH0+Cv3177ZIXvEzLnR63k4pMQ0CzVba55vUq4BK/8Ka4Ut5q5Nq8uTh8zfQ0lJHWvGx/G/BUKTzNJExIwfZOKxGPSZT4jFIvnQWpe931UMfkukq8IdXG8j9yfD5KJzBqlxz9tTND81M2oNtmao1LdlJ9XA0xkQxgVaUTitXC7b6a3aoFSeJe1LTweoG/1Xt7+ZgkkL2CHNHdSIp/uCEIx5DGoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:159::10)
 by PAWP195MB2227.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:341::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 16:38:45 +0000
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894]) by VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894%7]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 16:38:45 +0000
Message-ID: <5b546ff3-f887-4de8-b5d7-ea252e8c2d62@phytec.de>
Date: Wed, 4 Nov 2026 17:38:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bindings: Add devicetree bindings for new
 phyFLEX-i.MX 95 Libra RDK
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
 <20261030-wip-bhahn-imx95_upstreaming-v1-1-1c1cebb5be99@phytec.de>
 <sashiko-outbox-191073@kernel.org>
Content-Language: en-US
From: Benjamin Hahn <B.Hahn@phytec.de>
In-Reply-To: <sashiko-outbox-191073@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::17) To VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: VI1P195MB0623:EE_|PAWP195MB2227:EE_
X-MS-Office365-Filtering-Correlation-Id: 4314624b-d306-4c2a-62d4-08df3a9217ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|18002099003|22082099003|261028144727099003|56012099006|4143699003|11063799006|261026121527099003|261009223027099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	XPjcJobqtPiLkjaUzqbak9ezVYp28I/9ggyXO0fCYnbRv/F9ruKmQQePrAhO1fERdSxGlUPyHmqtWUSJ0ZpuyzOr2F8mz1hRZZ8TCPj/4AfFtZ9gFcG6FjxZxaqN2bx60ba9g69RR5YOQWaUg1jEyW4OGq6iNo0fHMUyEPwRgNewVKyho8IPCn7AQ/wfPDSJx5TrBW7QTmfas5jsI4kpDM3m3ZEb1FAPbXjC+GFPfL+h1S1BMBND/ft5JbCNsABrqAT4jaWGsiH+rGNSbg2tYJ6L1IufGk/O4XXV1vjQwOGSbnFGP7E1PucB+SS0l/69AaYGl6HcosWZ1w7+iMJAtbnwYnL8JfOZq7v8yHpaVuA3n7h+fIbJ3rPfdMdplV594sZfpmuZ8o/1ZpQ6byRnVZH+1nJHvhNSAa2QX6+WOMNo48ebyCicr+TPdPqzsoPBk3a0PZ/6HPNV4M2POIQlRRWPPm+se7pa40kNJCYbm3O1HqGfrTKoDkLza+5QYw1n2JEy62bxVCDOETQt73GXwypjN1RM8BQ/qsl3yqQM9ZsAMiAWc2cisKAZfeWs2JYW25xBGfbDa+7ZiKOd+sbBxf8nM7RrBfT1rBnfRakFQ7hDjYglN7Qt9BILcNdxElRjhZruO6QrLr5upKt3ERLGOOTynwO5b2GQPI+K1GT5VLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P195MB0623.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(261028144727099003)(56012099006)(4143699003)(11063799006)(261026121527099003)(261009223027099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFhjR3c1aWxocU5PSzJxTHhhQUFRN3d5L05uUHl5VXFJMTMyb2xmVW82d2xJ?=
 =?utf-8?B?T2hzNjNFbndEdC9TbGhyenB0T0E5V2hjenZGV3NjZnlSRHlTTi9TNTAyNHFx?=
 =?utf-8?B?YVpXN0NuZHJ5ZFJMbmlMSTVnQWZDNmVxODdJVVNRWGZUNG5mNUcwS1JmR3Fm?=
 =?utf-8?B?YWpSUFNCR0JteDF6R1JyaHpZWTFxQUpObWFzR2xTMHkxODJXUHFWSjRORGdG?=
 =?utf-8?B?OUVNbmRkVnVOaWs5aGsvMGM0TWJoRjd0V3Jwbnp3a1R1K1FIZHhqVThwL1N5?=
 =?utf-8?B?RzNCN2xRQXVMVmNrRU9sdUJOYktaUVpmdVdmYmF5Uk1YYXIwK2RoOXQwU2d6?=
 =?utf-8?B?VmxvK0U5RFpxaG51TmdsQ0hnQVZ4WWswOGxoWjlVU0JxbGphRmFiZHhFcDZ3?=
 =?utf-8?B?NWRFOE9aVCtsSktWdUNKazhmck1iQ3pZT3QwalNMU1V1bjUvYzFqcFRQSU96?=
 =?utf-8?B?WTFxbjRCY1l2RlRpc3pTL3BPUDlVN3pBTG8rb3UwMVVsM0R4YWZhK3ZlUGQ3?=
 =?utf-8?B?REViZFgzYkRTVGtlNGM1VlBxNDQxZlo5Mk8zVkwrSVEyWHpmQ08yTUEwQ1NX?=
 =?utf-8?B?TUltOGJLWEY4VmRjWUE1UXAveSsxRm9qUGY3a2RiNU85YnZjRTZhaGZDR1lO?=
 =?utf-8?B?d2hnNUFIOEFSY0VFazRaZVlONS9PL2ZLaExqZWJWdTU2K1dpU2tsSDlEd2Z5?=
 =?utf-8?B?TzFuTnJUZ3dKZjFmckFzbkRQdDkyZ2FPektFOEtPK1cxcXNVMjFEYndDcDN4?=
 =?utf-8?B?bkNZdmtCMGlYY2R3eHBkVjBLcGxCTzVFelh2YjFiamxGZERXcTdBNHVaRUl1?=
 =?utf-8?B?bjZrVlVYRVhIR01JOGxKU0h1VG9weDVuWWI0d0F3WDVENTVnY3pwMk5xQVQ2?=
 =?utf-8?B?eWRMeWk0dGhheWlGa2MvK1BmVzF0ZGhoWXoxNHpna0JYME0vMm9GZmQ1K1l6?=
 =?utf-8?B?S1l2bHdlWTU2WWwzRUZoY0huV2EzTUc1WHNla25FZkE5QSt6M3daVWxxY0tI?=
 =?utf-8?B?WTI1blZTZlBtOFlGVFlUNmtnN0owd2swc1JiSTdQb0pycmtxMnlsS0pVemt5?=
 =?utf-8?B?bXYyZFA4bm5ONS81dytnaXczUjJhVWhEcGx6Y25ORUduSGVkT04wSXgvejNr?=
 =?utf-8?B?U280NVN2bmU0MUR1Unh4MVh6Nm5oNFc0MTBTS3Q4NWR4ZDRleStYQ2ZpczN5?=
 =?utf-8?B?SGRBZkxKZ21HbGJPdnRDWmd2enNHb0JsTGV5bWxSQnQraWdDbVkybEt0aytF?=
 =?utf-8?B?a1VmWjNCQ0R6ajVEUytzTy83VjU4ajBLNk1qb1F5c0xnd1lRNUdMZzV2MXFa?=
 =?utf-8?B?MnhibGJaQXB4UUZCdWEyc043cmp3bzJKVUFJRGJPQzdZVlBOZEJNaFRWRzBy?=
 =?utf-8?B?Rm9EMVpCNjRrMlVhZ2FKSXk1Q2FFSXZPb0xnZ0NUZi9RdzE4V0hGampJeis3?=
 =?utf-8?B?bllsUTAzV3pZY0Z4dm5lOXMzbzlnZ3RxcG5oVmxmUklBR0VRcWdoeldKVmNP?=
 =?utf-8?B?aTVyaUdCTlBDcElxZ1FmOGErSE5IbmIyUll0MllRelBsb2l1bG1PN2d6aUlw?=
 =?utf-8?B?WUVKWHRmdElhVnYzZVpNd1A5WVZHOExEVW9vT3JvOVRKd0dIMGhzNVgyOGln?=
 =?utf-8?B?azZlZCt2TEFSNFpkY0c3aG1Qc0Jib1lveHpYbmN0b00rR0JmU2Q2TEZsb0NP?=
 =?utf-8?B?RS9rbm8rcFJ5RlRLRUJ2U3ZmM0NEYWZCSWllQUd3VVRHVWlJZkFnbVhvaXJl?=
 =?utf-8?B?YzIxZU8vUHF3V3ZyS05uL00vb2EzdldTeHUyUlVMbXJ1Z3liaWk0U3gxTXdt?=
 =?utf-8?B?Vnl2N2JXSnpnV2xyOThwOVVmUldjTVZGYlFTcDBtZ1FJZmMwSHd2RFU4TlRt?=
 =?utf-8?B?UUg3SjB6azhLOWFremZPNHdnaENHZVFQMDRsL3RRK0RsOTgwRDBLTHpDZWNx?=
 =?utf-8?B?Rm5VNUlQV0dzSzF1Q0VLemVxMWJKYk9KdVgyaFhkOUhOMUNkTjFIUFlwYjFF?=
 =?utf-8?B?SjB0WXUvLzVpWlBDMngvcmRsRUJzSXdSTkIvUlBDZVRuNGZsbFlNWnpsTFJO?=
 =?utf-8?B?akxiZEJNa1Rmdk1VWnA2VVpvUTdHV2ZUaXFob2RDdHl5a3AwWGhOSVkza3ZR?=
 =?utf-8?B?TGlVSkhnY0pCdTVpRDZ6SXZlWEw2OGRlQ2ZRQ3FvZXlTNXZxWFNRVTh0N2ZI?=
 =?utf-8?B?UHVkT3ZiQURWeFBIUGFyWlJ6UDlJODd6SklCekgxUG9udDYxck9vcmllUzlX?=
 =?utf-8?B?ZFZ2aSt0cWNPQzFwN0hwNURvWHZ5QVhKT3BlQTZQajFaNTNlTGlQK0dNczhR?=
 =?utf-8?Q?7wt3DqAGY9dYIUp9e7?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4314624b-d306-4c2a-62d4-08df3a9217ee
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:38:45.2409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umEharj1l0mgfJeOg3ZC/LwRCPWgeNPSy0zjzD/I1E5LD43d4ceY3/ZzIDN4XllDlblE7B102VfJL1jsvRaBhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2227

Am 30.10.26 um 14:37 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: arm: fsl: wrong enum sequence indentation breaks yamllint
> --

will update for v2.

Benjamin

>
> commit 46ee5c7fdee02b781beb27b96a47fddb125b6299
> Author: Benjamin Hahn <B.Hahn@phytec.de>
>
> bindings: Add devicetree bindings for new phyFLEX-i.MX 95 Libra RDK
>
> This commit adds devicetree bindings for the phyFLEX-i.MX 95 Libra RDK board
> and the phyFLEX-i.MX 95 FPSC Gamma SoM to fsl.yaml.
>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index 656f2596e1d53..f917ae7202e96 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -1551,6 +1551,13 @@ properties:
>>             - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
>>             - const: fsl,imx95
>>   
>> +      - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
>> +        items:
>> +          - enum:
>> +            - phytec,imx95-phyflex-libra-rdk    # i.MX 95 phyFLEX Libra RDK
> [Severity: Low]
> In Documentation/devicetree/bindings/arm/fsl.yaml under
> properties.compatible, the sequence entry phytec,imx95-phyflex-libra-rdk
> under enum is indented with 12 spaces instead of 14 spaces.
>
> Because Documentation/devicetree/bindings/.yamllint configures the
> indentation rule with:
>
>    indentation:
>      spaces: 2
>      indent-sequences: true
>
> does this cause yamllint and make dt_binding_check to fail with an
> indentation error?
>
> Should it be indented by two more spaces to match the surrounding compatible
> entries:
>
>            - enum:
>                - phytec,imx95-phyflex-libra-rdk    # i.MX 95 phyFLEX Libra RDK
>
