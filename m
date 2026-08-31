Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC42377A8B;
	Mon, 31 Aug 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204961; cv=fail; b=H3k+pS2NGyH4uubdt8K8747GxRI7eWFhE6oJlKxo+bWpHpA3NoJx7rvXvfL/1yi4OTPp2N7qASkRQczgwgaAfJdjgiKhyj4vU6dzoosVCyWb2wggjh7EiUqw+3rhm3ic3+cT+BrhQFeWZVq0PaXzNTSr0uOzzfg2cWpYg8M1T1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204961; c=relaxed/simple;
	bh=FnTZdNVbHiqZux6j8/ZUZ0mhDzcXaUhq38ZVIQeVta8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SnLD0pDMz4P1XzgnlmYCqihRKHg/8QBrCiutZ6ATpVMAnJc4harh/kYpr0/oeZqJJpvsqvVgpvPG/loqlYNSiYc+qUIsxWme2TE4cCZaYVVEOTzwpo3KVUAHsVkexh+lWaxVJCEyHBMkWrlUautIFcTSPdpJ/NOTFTTAqWn2bnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=YzmkDMAy; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=FHzHwZWJ; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="YzmkDMAy";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="FHzHwZWJ"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VISYYL4057783;
	Mon, 31 Aug 2026 14:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=3OBLsHCRSaQJUO/bZL17GXUrgCwUNbA3dFyxF+HlDUw=; b=YzmkDMAy7ahV
	QxFasc81OHGHwvRXzGK9IRFWexLD+IkTc7p8G/bOTkedoEDR65lkJTZ5PxkVSESk
	awANfCb9fyDQoGdTLnbh6Stkb4L2tLhIN0aIp3bJczWe4K+GdJXCSiJeMWc/1i1Q
	MQmsUyzNT7E0U9jdtne1ApfWVDjffwGI29McERIEUqjjVjaXvHijyiC+rNfHSk6g
	L9u5nUv2Pg1Y3mFjr0ntO06dv0WB4hB+TDHRE/4Iv6sMXWBHcmu5vdsw2pnW6Vct
	qPykXytNt0Zd/1dJjuiH/mipLB6+EF5j0jtUDyddoLidloHWxAqpn6BPTvdXBVBY
	+8MyS57kag==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020127.outbound.protection.outlook.com [52.101.56.127])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4gbur6me0n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 14:35:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxtU8NoVnXgkzqKkW5EOCyltp/R6Wfx8TJB0XKQmXx+JdjWkCeUJRc7pw1rsAqDQdsH1RSA1KfvpzFLZoF7pYbk981pe3tMHgcLzGcuGZCIRDC2CywkF8YzIg4ytcVtMoxYfl8XTVs0QpwFotci3NUjZtcnRT91WUY1HlpwJJzxfWGC/hEmXqwfGpPUv2Zpc+fny8kZ7xHMCjDWiFh18NGTyOdVK8TyGgGEVKmQ0PM5Tx1diafSatOe/9vqnNUJ6341rrSYaH3WHxPA19i+C6ERkxhD/i7tW3wHfmelcxSd1QiOCewBMRT7KinmkIihn+hkSpESoEgQuDA3REDKR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OBLsHCRSaQJUO/bZL17GXUrgCwUNbA3dFyxF+HlDUw=;
 b=YEzQgsDdRly5VNIKq9mCBRmJDGmjVT5/PKEawEwBaKgQ53iT3ZWwobIuF54GpzaMsTifqJ/oRLAoFmmiBZYQEKMGf9x+h/U0SlLhMpbeVoVXhz+XOcNvqA2/CFlPRsjUh0nCmwKvfubJFZEXe96JUAgdOMRmuF8fBLPvSxXiBWRX2XLkMo6+hC1ZKxQ4CJGLot7uSf4By6j/IdLAUoB1gbC6wPHie8LGojFC8E0f4JEU5sLfnlwC27UWrxx6w13fNr8P746bRfbCGNUM+c4JCSoGPJZloi528zma1enOBIeyb5F4WMZ+oT1PrwcMMLlPLRA0paah7CNOj+LkDeYJ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OBLsHCRSaQJUO/bZL17GXUrgCwUNbA3dFyxF+HlDUw=;
 b=FHzHwZWJGaFF3Vuf4o7Euc0+81sOMKFnqetPhc7zZ459WOemINlRUM6BmkE3v8dR2QBEvYEtM/RtURA5VAVt7PtwL3by602f05Dn5ql9yBRixjaLk++AAAcqJ9mxIFTJ0I8GPJjOZnAShCu5XJ7g3RSVK7cL2GNsAgCowwg7Qeg=
Received: from IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 by PH7PR11MB7497.namprd11.prod.outlook.com (2603:10b6:510:270::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 19:35:52 +0000
Received: from IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4]) by IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 19:35:52 +0000
From: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject:
 Re: [PATCH wireless-next 1/2] wifi: wfx: fix possible device hang during init
Date: Mon, 31 Aug 2026 21:35:45 +0200
Message-ID: <6025474.DvuYhMxLoT@nb0018864>
Organization: Silicon Labs
In-Reply-To: <20260831192342.2360E1F000E9@smtp.kernel.org>
References:
 <20260831164056.47683-1-jerome.pouiller@silabs.com>
 <20260831164056.47683-2-jerome.pouiller@silabs.com>
 <20260831192342.2360E1F000E9@smtp.kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PR3P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::18) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7773:EE_|PH7PR11MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: 746eb6b4-6311-4ca0-f2d0-08df0797117d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|52116014|1800799024|10070799003|18002099003|22082099003|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	2FNSLu/sx4Zc2INjpjbDGMAsPEhgdpVd9IR1o4Mv5+cbRHKRN2Gxv7Zsn7RzZgt5TBM5b6E2WFkcKMPfmsA4TGSH+3nLbQs4LoKIcpyy963nO86AyK6YOSF43S6RB8+zge6XOKEcejthCpHmeln7cYuZiaEtxs7YTKga8M4EpYpNX92gH9ySHZCWYyXKiq80e2CNLOaTOXvjdDQSZzOM223TsC3WmPILbgtVYHQdpTlDBGK6NUySXCtgPbpS70qQJMpw/gbKaxWcQUjZ/Irp3QKzljgJPBFCR5uO7R5zJaU4gSSDoS9adgEIN49l8FdvAIL9xtyh/Q5cFY82sMgqrYewk3u1yYv4JKU67P/Er0WF81gquUwahCtkyUent79sN2H0PlBDO7Im6LW9iO/bej1AETEPiXczhMvU5ghxgndP1zewuRTuLEZpAjjl3AySyNbovaynrMWnqTk1pWRR8DfJnxh8yeoHpt2MRgSgc9dg3QRBsmo+8i/8tOhrJh840oq9Vzze41+yBC7bfkZLsRssuWQ9gzELOXHM7ZQ4L0JPMJ8PYFk7oDKY+KDAjvfuWjH5OVP0+a19Co7OZ/QFSeO9PUO2TP70xq7avJT4X1Zw8gMsXv5h6QYpGkRGDec2mxNNFjYU6zmrWWNOHZ4Dnb3SFEVI14StNa8Fgu2xLnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(52116014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099006)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUUva0hXNWV5cXJBcm5weGpTVGcrV1J2UUwzRmV5dVdqaDdUbkJrbDgzQWRH?=
 =?utf-8?B?T2ZEZHI3dnEyNnIxamVNSnh5cWYwYXRaaW0zOE5Ldi83WFI2Y3h2WEc3V2l2?=
 =?utf-8?B?VWN1WGxFVEw2VkE3WnhaOEZHeFJZS29EVW1sSXBoK245RUtObmhWbEFYdTdN?=
 =?utf-8?B?NE9WeUFsY3BsQWxRbG90cUxBVytMOEVUam5OOWRpODUvZThOTmMyK1lodUg0?=
 =?utf-8?B?OFQzMlpxVU1NUFJKVFdiT0Y2d21FNkRUUnNISzBwTGVBbmtIdlZleFlTT2J5?=
 =?utf-8?B?VXFiWUhFeGVyWWU4dUJIMmt1SzhYckN1ZXZzY1NNMVBuQ1pETEtqaTBSVUtv?=
 =?utf-8?B?eWFwTElBbUNJUlZUVWU4dWx6QktpVngvb3o2MkN4RmVpRzJITkxNMXVsaDdl?=
 =?utf-8?B?cE9kbENiaFUwbVdNLzYvYUpjZ0ZqQ2xUWWtYRUY1ZVNxcUpDeitXV2l4Mko0?=
 =?utf-8?B?U3pYUU9tdHE1aGpMaGFRSDRYWmlmNUgveXlnQTdPMmJKQnhTZzM2bzN0RE83?=
 =?utf-8?B?eE9aMVJqN3c1S2hsMVNQdnBxY1czS05qWk1Sb2R3NC9QQW1XZ3pUcXdEYXJC?=
 =?utf-8?B?R29hQTdzOVFvWGxMQkU2Y3FKVDVjS1d5eTBrdlRUaGIwejRPR0NURER2UFhq?=
 =?utf-8?B?eHhLbnp3cDJNanpuM04wMzJCLy9BMXZ5UlluOUt4L0NPeDM5aXFlY2ZXSWoz?=
 =?utf-8?B?Y3FwZHBvV1ROM1JPQ0xybnVPQ0JTdmZ1bS8weHlFUG1LRWMvYmNud2RYSTJz?=
 =?utf-8?B?LzR3S0Ntd2lpVFV2NTlVQVV6dFlNSFBXcjlWc2ptMVFWK0xwaStyWFBnZ1M2?=
 =?utf-8?B?clJ3QmVncSt1RW5FMHZobUpPUGc0LzdqM3g2YTFGM2RXSTFnbUpZUXlLTGlB?=
 =?utf-8?B?THV6SDRlSUhPeVpseC9sWXRiNnhnVzZnOEY2anl4eStyZjVtbU4vTlRzWXpX?=
 =?utf-8?B?V2wvT2FQT0JOMDBqRU00SFNRcjN4aUxYdXlxUHhYY1NXbUNONWdtRXB1VUlT?=
 =?utf-8?B?QnB6NlQwdzlTMWcrNk1tbG8yNlNVWmdpeHpWY1IzQXcweEhSTkRqSEtMMnpa?=
 =?utf-8?B?OGNyK1RIMWJMU2xCNGUvQUtBcEZ2eTlqWWZva05FSDNlR0lOZG1Ja3cvdEpG?=
 =?utf-8?B?NEVrN2Y5bnM3VVdFTGVvRW5KRnJhVWZjVmZ3TDlUM09FU1VyL2Y0NDRMK0xa?=
 =?utf-8?B?aDlvemhVcXhKdG5hRm9ybkpKNnREdDNsWnkrTkNYbzdhN2JLbDhtcHNpaFNW?=
 =?utf-8?B?NXByV05rTldleEZ5NWsyZlRVTklyS2RmYSs5ZXQybGRyWUVnNWJBZ2hGT1Mz?=
 =?utf-8?B?VHRXY2hEYWc3VkF6WGhrNGd6Q3lnYmRjRk9UaUp3TGdjRmttc0pEM05ObmtC?=
 =?utf-8?B?clRzM0tuY2xML3Myc2NjR3MrWHB1QmNHMGlER1FaeWllaDN0RU15dXpETlNo?=
 =?utf-8?B?Nkl2cXhoQnNEV01Sa2w4d0xIN1RGK2dQd3pHV3JHMGw1UFNHTkYzNTRqdDBV?=
 =?utf-8?B?Z1NuNjZJb3NaM3M1QmxDOFo1SGhHWmx0L3ZtN1FaL0RORVJmeFdLckRpVkFl?=
 =?utf-8?B?UFNkSWNOU3pZMXJrUUhWUDNtQSthWENEeWJDaUd3alNndHlYRTBZVGh6QU9a?=
 =?utf-8?B?Y011M3RoK0UxM2U1dGFtaUJoUFhuRmptT2pYSTRZcWxBZFNnTHVLbmZRNUFs?=
 =?utf-8?B?UDFqUjlIRGdIWFJEajV0QTNwb05oWXdkeHhlb3hWeG1VOVhTYllsekhuOXo0?=
 =?utf-8?B?NmVUK2Mza1pzVHBLSmI1bnA4N3ZYK2Y4bjBVbzA1R1pSdTJYTDBNd3hlcFo5?=
 =?utf-8?B?QVFWK2tTVEJvemJXaGlBTnd3NGRta3RYUGxVVU1yRjlXb2wxc2xmcE1LR2Zo?=
 =?utf-8?B?T0svMUpSenNuSk1lQ3QzeHpUQWxkWld3SHFuMU5PU1dvakxWbGFWcDZ4VVNn?=
 =?utf-8?B?U0NRNTIrQ0ZTRSsrcTRnelllb283dHRWZHVlYlZCRDJCQk5uMG5Gc3dudThs?=
 =?utf-8?B?Tm5ucDhSVTcrcy9BRjRhQmg3a2Y3cVBTQy9HZkJkb1FFQkJVNGJnMXhVc0lL?=
 =?utf-8?B?Wk5vaXpNbE11eGp3ZW5yL0JXdTZVWDZCWHRUYU9VRzd4RU12QmVNNmV4U1Fy?=
 =?utf-8?B?N24zVStXUzVEanBqREZVTndTK09IYm1VME51RnREMUpTdW5MTjIxdXBTYjVH?=
 =?utf-8?B?amYvRlFmM2ppeFNxMk5xMVdzMXV0ZkpQUG5IQk1RbVZ4ME91RVBrcXVsTDM4?=
 =?utf-8?B?aWZnWjlnYVU1ZElRdGlrWTNQZmJCQVdrM0I4S2hpTkpZVmpCN211Z3oxZHd4?=
 =?utf-8?B?a3BCc0NhL1EyQVljSjh5QWhlUTdyRFV3aDdqajhIazM3YjlLUHhoa1VtOGVF?=
 =?utf-8?Q?gjrJzmSusHST6V+vH6j4FonFgP/WE3LlFWkGIDUE0QTeU?=
X-MS-Exchange-AntiSpam-MessageData-1: T39+csRmTuiPgw==
X-Exchange-RoutingPolicyChecked:
	44JII/BoCXsQYFjfeP1YeCVu5eHdTbxGlljd+zAnz0wxOybDbPPfseR6Zh0ukSfnM3Y05aCe8Vden0Q6c8tdFr8p8l1iXsk22RbvZs8JessbBCgeivI9R0TIZoS7eTFwF9Iz4pAv1UcYV5e3OeudGQ/MWBZBAqBQ91CpCeV0B0cqFgcN9kuifHkTizdVQjqYIotPMra5gUWTZ7vdeAFHrgmxtB7A1n/y4ffRfjQlrSvNoRMiSySMmbv47OXBMr/0codkcORc2WAayBlfqMfcnmWEFcW9B6j6uhjUrbp1kBjqf4ivlYW3h2/CpCtNcfnuoDdenW7ncE3siNqLjMro2w==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746eb6b4-6311-4ca0-f2d0-08df0797117d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 19:35:52.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aMBCCLCrnSI01JUIZCRTKMJS4AKtFBLZVJPa5T8QEf9SmiVGo7sdfpHJbagoQ487lq+wbjOetH8rY7DAwsW3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7497
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE2OSBTYWx0ZWRfX8fxxRwSp4LsV
 CVcDs0ob770uilbhGVeacy+lbK/uVXaHvKWMWZ26mewEpDHlxB3BgiXAZ8130qojP/r/hICET8L
 D28gHH4mcweGsJOA+wje9ZJxpQseb9A=
X-Proofpoint-ORIG-GUID: LeF202GfmP7ONMphy0w2JVFeB9UkKZ4C
X-Proofpoint-GUID: LeF202GfmP7ONMphy0w2JVFeB9UkKZ4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE2OSBTYWx0ZWRfX0vWI6QxfSy0l
 ybQaEO/B9WrpE4La3zucrK2V95K+xKsIYw+kRY1m4Jz/rOSQZ4p/DhquXIBJ4fS3FxPmvxJnEz6
 i85HEeDiZe4413CK9K4Vjxe+Ot62Y+giBxfrNiHTyEYoAru5s3zYWmL6EJqNT1M5iOjvhoGYpvu
 4Rw9VkWOduwKSayRgxngxv9bLikqZsFSJ10xFFiDH1QSmuDAwyY3wmPU+gDVcKGT/pQGV0BPMqT
 HeOncZDZ1rM+mP7LhlOAU0O931zkZincjFfCsgHwhKMo8F7DMzP4CxIIJWG8V7B1zmHLS7nGBie
 sZH9kHcoGtZ6a2GuIVXpLjvUZgzodJaec1qnH/eJk2JeytQQnSd1didgdcheAw8/2e1/Rq2rHHn
 3aDwz5K8a8fYlOalGC9kC4kUNe3BazoBW5+TuksxYD3sLa3mW6QPMByu7iKnuh1ouewMhmuUBL/
 0wPVuX8OR5EeUfnQfrw==
X-Authority-Analysis: v=2.4 cv=UIHt2ify c=1 sm=1 tr=0 ts=6a95d79d cx=c_pps
 a=I+QdrI45u/umTjhn/cS8vg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=VwQbUJbxAAAA:8 a=2AEO0YjSAAAA:8
 a=cn9Dg90Xes271rM5JIUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1011 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310169

On Monday 31 August 2026 21:23:41 Central European Summer Time sashiko-bot@=
kernel.org wrote:
[...]
>=20
> commit b2aaae6022fa921df221babdf79ea3e5f12e766f
> Author: J=C3=A9r=C3=B4me Pouiller <jerome.pouiller@silabs.com>
>=20
> wifi: wfx: fix possible device hang during init
>=20
> This patch modifies the device initialization sequence to limit data
> polling to out-of-band IRQ setups. It attempts to prevent a hardware lock=
up
> that occurs if an IRQ fires while the host is reading the control registe=
r.
>=20
> > diff --git a/drivers/net/wireless/silabs/wfx/main.c b/drivers/net/wirel=
ess/silabs/wfx/main.c
> > index dda36e41eed13..da30e8f481ada 100644
> > --- a/drivers/net/wireless/silabs/wfx/main.c
> > +++ b/drivers/net/wireless/silabs/wfx/main.c
>=20
> [ ... ]
>=20
> > @@ -374,12 +373,19 @@ int wfx_probe(struct wfx_dev *wdev)
> >       if (err)
> >               goto bh_unregister;
> >
> > -     wfx_bh_poll_irq(wdev);
> > +     if (wdev->poll_irq) {
> > +             wfx_bh_poll_irq(wdev);
> > +     } else {
> > +             err =3D wdev->hwbus_ops->irq_subscribe(wdev->hwbus_priv);
> > +             if (err)
> > +                     goto bh_unregister;
> > +     }
> > +
> >       err =3D wait_for_completion_timeout(&wdev->firmware_ready, 1 * HZ=
);
>=20
> [Severity: High]
> The commit message states that the IRQ is subscribed before the first
> exchange with the device. However, looking at wfx_probe(), the code just
> above this snippet calls wfx_init_device(), which conducts the first
> exchanges and unmasks device-side interrupts.
>=20
> Since irq_subscribe() is only called after wfx_init_device() finishes, is
> there a race window here?
>=20
> If the device asserts the firmware-ready interrupt during this gap before
> the host OS registers the IRQ handler, could the edge be permanently lost
> (e.g., on SPI platforms using edge-triggered interrupts)? This seems like=
 it
> could cause the subsequent wait_for_completion_timeout() to timeout and
> hang the initialization.

hmm... Indeed, maybe. I will sent a v2.



--=20
J=C3=A9r=C3=B4me Pouiller


