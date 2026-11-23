Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795468118;
	b=HwR+x2tr1LoET/ANafCp4S6Vo2H0hooH9vMMtuy94u5t8i2Xq21U8BVnozjKlSsVfmek
	 EISE2Pi45Rb87oWQTExbD+l4ZMgUhfYNkP1u5ZTKzcXlVT0wWJFsMB5BOUfPzt0m1W3+3
	 celuZC93wx90IbjD76pxagihwEf+HB+aj7N37WpGzAyscP07GV9a3v2ErHO1vt52oJG3O
	 4c7kcrOUneuhF6odpoQUnWiTyC4MJOhkV/8DQOIh6y+zEwGibii8Eq8G94lqeHrlrqZ71
	 Ax6HAfdbNN2DXB34Mht6pBoeGcNmEXxrIP3dvp0mYGKQOp0Y+fq8U0wCt9y3sYa1Tww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468118;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=mUsk6ga2A0LuLtSKShOo87KUf9jQHqg/us3z4PJcPok=;
	b=divbfGgZQCqMXl7HEUigRSRMjbQpFaTratLFMBLqhwppIfRqhneXvGQEIfCgMNuk7Qaq
	 JIlqkyxvnRjzdS30WBrvyHQzuGIXWNA39fYIlwLayXncu5wN8dXc+VqYq6rVxv2MUnR/7
	 8KBboySRqxHlbEioSqLDpiTXPG3TiY2nbo14OUbb7eyZM07zMmJffn75i5j5w8KbNHvp+
	 QhDACYN4Ge6ZyhSl8ijNn/qGrTXxdq4nsDYQ/AZFgVhEm554Mily7sjSV8yK6wW7u9csK
	 AlU8UipsFjVmZ+2Au7ybIbsHD5BfvMxx+A3VCWbgzJbrFJNsYPIk9g9bk8TkCf1Ya4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oUtgq1hw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.3
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F594606A32A;
	Mon, 23 Nov 2026 21:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F594606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oUtgq1hw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kw7DoMQErzcUnXUgVHgabxX6vpAfc+QA5Owxp5xS2CnNQq4BCCaodvg9qJg8QOThvpgqK6YUEizJy2KDuBBIuOQc2q4qoUVyalYh/alkDoXQhbp6m07BGHJUqP2yiLlFBqSZWEHXPiBJK/ZaJDxQgA4UwfGJAYZRL5WfcWssHz6wKDFZlyQofV1eI1FvZwhD5Z7V8+M1xGURkUZOhnroF7sr15wxbj/i//p9kYnwtPGAA74IDQ33YgP2cDGK7ivoW3dp50PgT6RzsvM3du8I34uRcqRoINVb0rYqw6rR/Q+DzhFZUDBXAQ5g3TvlvOzWAvMLrz0ZHk3hDgL8hV46Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUsk6ga2A0LuLtSKShOo87KUf9jQHqg/us3z4PJcPok=;
 b=y+Z4hbQEvIW7v1leJpCAfQeLW1wSV/dIzptOJsmtRDMuVH75kqhImRqJFREb/gfuuVKz3sFK2VofrroBImJtSmhqS+i13wbrcJcect4RTp4x4+sW9tPTiGqvhOPxfBs2hodKGxDXjPYNuZqzzUUtHQbQqjgD8UJcy+U7akrWxVA56V6mCKiIquYpxGUBST0vzpjMf6SNMp/C18vvCJP4rHB0fn5SwQOxXX33qXSK36W8T0jojOM1ZX7mPBxDrVyFfQcmhhejAWxk4a/ZtWiIHfbZqhG3gOKsSbU/zWl2c1w5GEYPMz5REN7myPKmN1NDa3r9LLdXxhdxZi8iYaAtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUsk6ga2A0LuLtSKShOo87KUf9jQHqg/us3z4PJcPok=;
 b=oUtgq1hwfE96ooYNxNb2v44vg45J4zD2vhjdtjfdAXRU2Z+Fyjc6R0T9wHhrOjPL3HERgmFSW0L8j8uTZAjXE4CP3KEnWOBcgcTF5wXKH0Q/TvPbXkZBB6qRJb63TeAnOR22IK0ghIe4AHf5RQUIuKoAb1dYuBKm/0AakDoc8Lp6USGYxXZAGgbSK9xd0xFgEI3x4q6jwIJWkU+v0nLoWZLLFMfw4eydS61dEf7f0sjKxregSpRhdEQRck+boFBt+zeAQ0LtCtKLZdQCM6b8BUwT4s0yXg5ItbGQ+Bw/r6RZYIf2KT6KmXlwSTumq/Zl67hxYZKmsDoD1ee777f8Kg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB7136.eurprd04.prod.outlook.com (2603:10a6:800:122::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 21:08:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:08:34 +0000
Date: Mon, 23 Nov 2026 16:08:27 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Max Merchel <max.merchel@ew.tq-group.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH] ARM: dts: imx6qdl-mba6: Add EEPROM nvmem cell for all
 board information
Message-ID: <awSrS1rX359EgDZu@lizhi-Precision-Tower-5810>
References: <20261119102531.2995127-1-Max.Merchel@ew.tq-group.com>
 <sashiko-outbox-222965@kernel.org>
 <327196f2-9063-4164-a556-3093a649b5e0@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <327196f2-9063-4164-a556-3093a649b5e0@ew.tq-group.com>
X-ClientProxiedBy: PH8P221CA0060.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c4fbd1-0882-49c3-6198-08df49a5ef93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|261026140227099003|4143699003|10067099003|56012099006|11063799006|261028144727099003|261026121527099003|261021123027099003|261102123227099003|261022075727099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	mPXayKNhc/oqnednTKZhdY/bZUZXSroKZjZ6DhrAmmQq4OZtdoDcYp5uoVZ8YUWVBIzPAZXH6WIpKBgEq25zmzAXjOMf78acLlVXvU+cLwgp4jCOBFhxblly7uLXpEpws2GFnsZiXgxzPvrYd+uOw+FRbsIFQpRA/v70ZIVnAmQ2FwoaTT5MhinrRqJ5BHm3jaw/zcfZDwl8PmBYxbUfXK4iVUOk+e19nzgx5DlTWPF8BDErN6JyIUKOXN+pc2hggAIhUBCOmkPLnjU62CESxVgn2PlbCEK1QUSVvSzdB89UjZTxmSfUO8+0c9gaYgDtm9vHIbZess4xSj/Yy58V6BGsh07MtB7KI+0eheakfjgmPisErqerIBu6pLoUd0itLrOdUTguTm8MSjWwz0tDSmcdS7lE4blwyKHlhqSOJfy3u/3mFUUYaV7i20+/i2g9wfwd8ADpsdNgUpe5STcyMPOVT1BlxdXW34jaIxc1kGzPTqrn61SXTOw6uyb/6Ta+umdf0s+/o4TR1OlDhvohZcewi3S3/cKZWKO27S3lsyuqPGcf6pTk2A/T+AaZIgC7VZvm8YP1iNRhARSrEANTCVx8LEIH4pP55bsWuNI557k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(261026140227099003)(4143699003)(10067099003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261021123027099003)(261102123227099003)(261022075727099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVpyS29CYUlkamZFVXdPMG9rSGk4STFvbmlXME8wY1l5cmRLVzdHdEU5MXNk?=
 =?utf-8?B?UVk4aXJTOUFJUWcyZ1kvVzlPdkFuOTdyVzVCeHVtYnJVZ0kxaEkyZEJKcXdJ?=
 =?utf-8?B?SXlNTHd4OTdYSmhteFN6QkZybFU4eDRMM2lDbjA1WlJOZVNSS2RRYkVOY0Ry?=
 =?utf-8?B?M1pEakFxbUwrM1h3a2dtb0VDZytTR1NJOE52N3M2ODRBUVFKaVFITHRUcnE4?=
 =?utf-8?B?Z0ZNN0hFMzgxZVh5WTRMK2x6UC9FekpXUEdYSEp1dE9VYy9KN2RsVzJnYjJF?=
 =?utf-8?B?VUlTSGF0K2hGWnpFdjhMQTlUb3RQcllmQXl4dk1VU251Wm5hb1RIUnlDTHBZ?=
 =?utf-8?B?RlFQUW42YWlMa3J4QkttcngzL1I1SlovL29ob2FtWHE2RGxQeG9Fc0V1Nk9x?=
 =?utf-8?B?NjBFc2c5Tzg5V2xGOUJvaUlCWDhiamFXTjVtSlNaWmxvQ0c2NmhaTEt6YlBo?=
 =?utf-8?B?UDlDZkJLay9pSTBBZE4vOWxPZktMM1ZSZS9VZExvTHpES1VTMy9FeW9kQ0ov?=
 =?utf-8?B?YUx4VXYvYzMycjdPWXNhTXdibHN5MGlwb1JGcWE1SWxwcUxGRk1HeTBaTXl0?=
 =?utf-8?B?K29DVmZkVCtnTHcwQ2JNSFBzZDNIbXZENjJyL2V0RTBuclFNdTBzbTBlUFZu?=
 =?utf-8?B?Qk1idUd0QWFVMW5uUkpaUDV1MFd2VE40R3NSZkJuTHVnUmNiaHdFbE13T0lQ?=
 =?utf-8?B?SVZYRVdCdDlNaG9KdU9EdHJKNnJjb21NUVBFUC9kK0JOZnp6dklTU1Aydi9P?=
 =?utf-8?B?YlhTWHBVWWxOZ2RZR2E5M2RobnVYY0lXcm4vazBlcTduOUJjMi9LOHF3NHFq?=
 =?utf-8?B?WU54dVRSbkhlRDZrMjhaa0x5aDZObk5KckZiLzNZdmg2T3Z2NGFCVGZ0Mkda?=
 =?utf-8?B?SlQxYmJJWEcrVXoyc2xja2p1V1FDSWk5cEhQOHBFU0JhTDVNMldqcHRsNWxr?=
 =?utf-8?B?c2hLRER6RVNnbk9udUFXa3RHNUE4TFV3cjFsbXZlajNqZllZN0NydWZvZDZL?=
 =?utf-8?B?aTFwcGVGMXIydUl4VnJyM0Rzd1hFR1RjaXluWGJKQWgzWkRGNDZ0VCtYaS9N?=
 =?utf-8?B?OWRPY0RhcldKS3dMZXQ5VEZ1ZkJ3RllwVTllQ2N4Z2dmZkIzNFZaT0p0Tnhs?=
 =?utf-8?B?OGE0MXZSemFJT2M2aHM1cnlqMVZDODZncVluUTdUbndZdzZaTDFBTlNpdHVM?=
 =?utf-8?B?WVVzL1BmVjEvTDFyUEgxeW8waDJFOFFrOWxlRHpNb0lGRXEzVWdzZVZ0Vy9y?=
 =?utf-8?B?U0RJL05ld3pScVp0R1kwcWpaRzhuVGdDMjRabzlxSTB4T0JMOGZxZWEzTHRu?=
 =?utf-8?B?VTlGNE1Ya3J3VG5sN3U0ZDdTQ1JEVHlSVjBDaTNPOFNlMTVpS05NS2JQbXVO?=
 =?utf-8?B?ZXNDVTRVUmNFK1ljK3pUMS9SVGs5d2ROM0w4cDBOM0dvYlI1aloyUGtwREJh?=
 =?utf-8?B?N3RTSHRJQzQ4NHZIT2tyQWdRemYxUEJHa0FrdGUraUhxWVFrWXpTcWpDU29B?=
 =?utf-8?B?WnRWMVR4MTdxdFRlL3FmYzVKNUdHV2xqb1BHeFBRc1EvM0h4NVhmdVo2WTJz?=
 =?utf-8?B?QUFtL3publNKeHNwSUgyN0NkWmNCcG5mbHQ2eExoOGl6eW5ubU8yUFdIb0o5?=
 =?utf-8?B?Q0tzU2R0b1JncmE2Y1ovVThNZFVUVG1YQzRoY2VHeXdaTkZtNVNEUmZiTDk4?=
 =?utf-8?B?alB5bHJlSXUzbk9oeG05R1dJRUVsZE5zWEFXTnBaMUtIS0lLUEVjdTY5dTRD?=
 =?utf-8?B?UENVMjY3a1MweUgxanFtOEh2SFdzekJ1THZCb3NUNjRWaS93aHdqcm44cE1j?=
 =?utf-8?B?azVlRlpWSWZObDhURTAxYjJoNS95aHdQVnpsUndLdHNkNmFyRHEwTXpFRFh2?=
 =?utf-8?B?bGYxUkZDSjFXRFRFU3hiZmNLV0o5dVREU1YyTmNkd2ZCZzR2MWZYU2UxMFhB?=
 =?utf-8?B?U1orK3p3ZXViYmxneFh6eG9zYlhINUxWT0NkRTZ4Rll6YnJEK25ZZDJ3YzNL?=
 =?utf-8?B?RUNZclMyL1paQmRCN1BNMG80d1MwRjhnZys4cG1vU1VpWHpBS2FhdHVnRkg0?=
 =?utf-8?B?d29IV3JIVmR2ZmJEYnhrS1hMaVhMUXpEN294N3kyTGhsV3ZhRm9WTk5tT0Vj?=
 =?utf-8?B?NzhrUjdZdlZpTFNJV2d3VkhLemt0YTd3eXZOUWNOSDZZV3E2M1BoR0lRbDJu?=
 =?utf-8?B?TDBvK3UvWUtqNVVkcGxMc1A2TDVHR2VVQ29kZFZCYVpQQlBJQkNkUFJCRGVT?=
 =?utf-8?B?MGRLUTVRQnA4UFNzQ2ZZYmlqb2xyZmZNQjVrTWZ4cW1sMDZsaHRlZUtVZFlq?=
 =?utf-8?B?aXF6VzVJVXZQQkFlUVY3NFdOUWJtSHBybVpqVVI3UDBoakEwZ1dUNXBQa29n?=
 =?utf-8?Q?J8vfu7cBZyyMatjxePr3x/2WJByBZZFtmX/O4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c4fbd1-0882-49c3-6198-08df49a5ef93
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:08:34.8522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wsk16yePn/WBjiUGMwI0aNqW0dnftK/luz3BUKxzRI38eHgl9XsrqcBSyGMwqIT0KHBZnu6PTuqUb6fyGA6fbSTnkC2+m9Gd7lWiL3r1Rsver7lguzH+NpXGoBGlXr3x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7136

On Thu, Nov 19, 2026 at 01:13:05PM +0100, Max Merchel wrote:
>
> On 11/19/26 11:37, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Low] ARM: dts: imx6qdl-mba6: duplicate @20 unit-address in
> >    nvmem-layout
> > --
> >
> > commit b5a0ac272fe3356ca3f0ff5cbf739f7f5d760dab
> > Author: Max Merchel <Max.Merchel@ew.tq-group.com>
> >
> > ARM: dts: imx6qdl-mba6: Add EEPROM nvmem cell for all board information
> >
> > This commit adds an EEPROM fixed-layout nvmem cell at offset 0x20 covering
> > board information on MBa6a and MBa6b carrier boards.
> >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
> > > index aca320ee8f476..9b199b277c220 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
> > > @@ -29,6 +29,10 @@ nvmem-layout {
> > >   			#address-cells = <1>;
> > >   			#size-cells = <1>;
> > > +			board_info: board-info@20 {
> > > +				reg = <0x20 0x60>;
> > > +			};
> > > +
> > >   			mba_mac_address: mac-address@20 {
> > >   				reg = <0x20 0x6>;
> > >   			};
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
> > > index c7bbd6195fef1..517913abbc66d 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
> > > @@ -39,6 +39,10 @@ nvmem-layout {
> > >   			#address-cells = <1>;
> > >   			#size-cells = <1>;
> > > +			board_info: board-info@20 {
> > > +				reg = <0x20 0x60>;
> > > +			};
> > > +
> > >   			mba_mac_address: mac-address@20 {
> > >   				reg = <0x20 0x6>;
> > >   			};
> > [Severity: Low]
> > Does adding board-info@20 alongside mac-address@20 under the same
> > nvmem-layout parent in both dtsi files cause duplicate unit-address dtc
> > warnings?
> >
> > Because both enabled sibling nodes share the @20 unit-address and overlap
> > at offset 0x20, building the MBa6x DTBs with W=1 or W=2 triggers
> > unique_unit_address_if_enabled and unique_unit_address warnings.  Could the
> > fields be defined as non-overlapping cells at their respective offsets, or
> > exposed through a dedicated nvmem layout?
> >
> Hello,
>
> the MAC address is the first part of the TQ-EEPROM structure for
> module/board data (MAC, serial number, type).
>
> The function “nvmem_get_mac_address” in “net/ethernet/eth.c” retrieves an
> nvmem cell containing the MAC address and compares its length to ETH_ALEN.

Can you create patch to >= ETH_ALEN? Adding new warning is not good. and it
also doesn't make sense to use overlap range.

Frank

> Therefore, it is not possible to use the same nvmem layout.
>
> Consequently, two nvmem layouts are required, both starting at the same
> offset.
>
> I have not found a way to use only the first part of an “nvmem layout” or to
> create sub layouts for sections of an existing layout.
>
>
> --
> Best regards,
> Max
>
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
