Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020079.outbound.protection.outlook.com [52.101.201.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E15351C2F
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 07:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275089; cv=fail; b=PNgk56EKKVe0F28AYvE+RA6TbZZwOuBxVpPp3+mbbD2gHUPCxzplXIYmLR1eZyvd7iXutVB/nGTZLKN8wp9iZbcAPCLQDUiPOIpsnlwH0oBaww+8A5+i2Armb86C3yknbVfzzGz7bqaBrmlkdN5P7TY9gRPMhsRNkkAnqLUVR4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275089; c=relaxed/simple;
	bh=0fxfPfDHKV/K+Rt1TbWQAmjQPqFpbBoQkQaA7KHQWzA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nohvo0bowQ1nziWQUkVFb6u9SC9ieGI2sU7gsJ9QbMl3/ROkj2aq+Yc6sOSayVfGsLw+GX5sG9RSaFvzowNlT1bfMkF8ay1OHFsmjln8xp7NpgmukD6N2SIi4xilvAZfRv8Vnxolq+cUzYBIQfuGDl9LMDbEG22vCsMjjALKRLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=HSa1udIC; arc=fail smtp.client-ip=52.101.201.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="HSa1udIC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEbNfGRd0Aa/R4Y8D+R0/qzXaD5UXY2Zz5ncWzD6WfWEfd0P7HUiQ8xKLKUgNIJNndcWRywuy7zoBx7+doWvVXZ5kIF1Pn0wNiDSGAEDbzCtAuyRmoLih03WhxLrlnkEShVSKIZ8xgOqX5gyqSRyyxohlZn295cLLiYrWaiOQU9Aa+i3zjc1AKZDqvcrcuyB9EQXE7wj4FcQJ3cUs0phbXYpckfdYm/R2EG14sbjepL1iOpWZzu4McLtfPpokdivR2/NxtA9kc+K+sFxxH8rFZ43r3g/Ak1WqHZNBkleLTIPTXqKMpnyG6W9iMK/BpYXCQJ+ePogdyU9tRhZfEKF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fxfPfDHKV/K+Rt1TbWQAmjQPqFpbBoQkQaA7KHQWzA=;
 b=Jn+Kq/zuQIAa2jbfXlrrWxyYO1jrf3pHekXrUpQSq3VWrDF0TAUKX5SFjvBsm9V6sscEU/W3K2PXPQgr0diBPLCN/jDanzF2hla7vALs5en4kkJ/b7Rug54yFS+o7rGg0c96dViHXOGg2yvIxDdiUmCQffEkRWPAMFGw82dPneb7FdnEelCB56pmQY8B2UmsDduMga2MNQIQQA661tl6Zx8wVZXQhX/aRkHWLSO7yLN6rzCr/9CJTPkXXyAAtbQW6wwz0YwxEdz9pWuto/wgW9pIgEKzpi+G1uAuHpU7nEbDri2de4zHHiZ4IMIgDMCngzd7kwImcjnjt7uDFzweZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fxfPfDHKV/K+Rt1TbWQAmjQPqFpbBoQkQaA7KHQWzA=;
 b=HSa1udICvhkmK9tXYcnxHxSrsV4JA1Khh8r0NNunNEdqSRAnXxnQTPzNgn3BkcMAFgH+eHw/pcQyyL9fWv9vri3R21vWfbgrx4sk2poiFEg0qNq5NN8lyhTfEAgnp3B9zkCavKVsbZ3Hbl2U6QCCFYynP+iX9bOvAiVG5Ypw6sgOXtKXCRaX054oFH4HBYo1G2WPj0HG1gzwjzpvruYnOp/3Zg6btP7SoXWf6ihB0ySKMABPH0nsq5pwI8nmtNhFrQJcqQfzAu9ZMhpEoe68qb5AQQ5hrOA1rl7tME0qiX6saPovGAUgVNfzemI0R1mZhUzcVNZc4NGI2Hgk7RK+Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c) by LV3PR18MB5592.namprd18.prod.outlook.com
 (2603:10b6:408:19e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 07:57:54 +0000
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::8726:2e55:848b:39e]) by BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::8726:2e55:848b:39e%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 07:57:54 +0000
Message-ID: <c2cef6dc-fa0f-4c43-aa97-6c5952c9bc4d@axiado.com>
Date: Fri, 17 Jul 2026 15:57:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO
 variant
To: sashiko-reviews@lists.linux.dev
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org,
 Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
 <20260717040056.6BA971F000E9@smtp.kernel.org>
Content-Language: en-US
From: Swark Yang <syang@axiado.com>
In-Reply-To: <20260717040056.6BA971F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0039.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::8)
 To BL1PPF1B62FD55C.namprd18.prod.outlook.com (2603:10b6:20f:fc04::d8c)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PPF1B62FD55C:EE_|LV3PR18MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 660ade65-3607-4499-e454-08dee3d91b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	Csio3TUf5chu+mHY491lU4kK4XANk/pBUzC9QfBxJUMsqQM+FfCDprjvzmr/foDeQmLytjFWGLXYnIF0beVJBRUIl/vikBz5as41t7kA8IjRmICze3z8zC5KFMc1OFUzR2nt9YCuXt1n51eknsC1Rw/IIKCBv+h6JMyg5GiAXifI0HTcmgr6gNff43DB4TwfbNc6HLQAtDfDXgfXkSw/9rch3TdGLRZSXv8ZYpr72elgMg1k2BFxv/+K6JkdYrTyNkIRObK1ID5Cs+AqD7WUb2MkQAUhgG62VvL9VJhKJx1TXjp/cFUxV0uHUDQLwBP3YQ7xTVRybZ8NloxMnIwcHZvCRFJmImcC3CciYpprPcwMf6e90hJoAhrvMdpHw+S/qAURz4hAeCmWvb4qjCdms5tCqE/D+VYp8IDuVtz6ZxSO8WoM+1w18JIiIIIJayr6gI3QB+xp3kisJ9xWabMQ0cfJJpGDxU0dn8fuvU9I2A+lUhy9zCo6qybtGHuZREksFWKNpwKxfoDIdY8w2/XBXpF095X4ALwsyEUq1TgzKzorQ4LY+e3bkeBVWEnQNiQGG9qwhUvFUSd7h+w4yIka/7ZVRjQuo6rfRwDdfy89q/DzDipBPOL/BYo2qHtpYqlOJIONOKEnBDVwM72Jp4YQS8N1kUklkJSxSs838Us0XiY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPF1B62FD55C.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE8vSnJBTHNxd3E0MkxUbXMzTkJDVGlLLzduSytZUm84RE0ycjdUYW45TmlH?=
 =?utf-8?B?aVY3TUcrLzlhMVdVdW05ZGR6aFVEOGRaOHVJaHo0cEpCNmhCWTJVUG5QdTdM?=
 =?utf-8?B?eWxBNzE5aXlhS0dENzJ3MGxZZGFkeFJWbEYvelh6VlUzQWNhSk1RVldVb0Ez?=
 =?utf-8?B?amtBVUh1R3E3UjF6dXU2WW01ZVQvZDRGN09OdXFXVU0rQnFwMlB0OEo0dFBE?=
 =?utf-8?B?a2M4TkFyK2d6V296N0J5RWVYamZ6Q2Nwak1lRHA2cGlGNldzQjlIaGJEVEx2?=
 =?utf-8?B?Und5SXYwbEJnTHlsWVpNZFBrZE14bGdnS0hrMTErNkFBb2V6cU9saEEzN29R?=
 =?utf-8?B?NXVSVjNlWTMwN3JncCtUUnF4aGlrYzZrNjd2bmwwdnVUUG4zTkxRQ1FZNmhC?=
 =?utf-8?B?Y0psTFpLdjlmeUpaS0NvM20yYUJaOTg5czVnSkhzOG04U0RkMFJPT3FqT1c0?=
 =?utf-8?B?RnBaRVhCT2M3eXN4UmJTMDRMY1YwaHVRYUliQUxqN0Q3MWpUSklBalJnb3F4?=
 =?utf-8?B?d25rSkI0QnRtTURsdmdXUExLNXNIMWlOUlprTGpYb29qUXlLMjlPdXhmOFZz?=
 =?utf-8?B?Q25Sd0JxU3g5S01kWldoa2NTVGNMWlJpZ1VYVUNzWGpTTzE5a2lmeHp2a0pU?=
 =?utf-8?B?aWFjSGhueXg3Ny9NZG16LzAvQmFjTUlNVEd5V1BQMS9Xdi96ZlMyYzlzSkJ5?=
 =?utf-8?B?a292bWYzWlhmV1JrZUs2Qzdib2dTYnRHVE5pcDNZT3J0K3Yva1BEcFZqN3BV?=
 =?utf-8?B?a1NMVTd5WHJZVUd4V2V3TzNQa1B1TDRHSDk0NzVGT2dMb0pqZTdmN2MxZSs3?=
 =?utf-8?B?NlJhVHFjQUQvL1laY05LWCtFZlVNbG9lZmJpOUFFOTd3dngvZ2g3eHcxUkMy?=
 =?utf-8?B?MkdJanJORi9ZYzJCNWtFM2YwZWw1blc3M0RFSU9nbWFUUHB1dnlzOStwZ0xF?=
 =?utf-8?B?V3FYd1pUazN5ZHAwNGNHaVlES0ttN3VDb1BsY1BWOEpHQ2NTRjh5bGJVYndk?=
 =?utf-8?B?aGVyalY0TGlDTnBHRnNyMlpJbVEzZ1NNSytmbXc1WTlSS2ludjVKQkZyUnFl?=
 =?utf-8?B?R1ZoQU1ycjNzd0J3OXB0dy9pT0ZPZlhIQS9YcTl6MG43ZlhHdGxvS2Z1MVJl?=
 =?utf-8?B?SytpWXBxREtLb1lGYmJ6ZGo5TDE3bGNpR0hqWEtEK2k4c08wTEo0Z0hxTkNl?=
 =?utf-8?B?U3lraXlQOUdQUjlndTFYTExvODNQZkx6dWEwMW43YkRndUIvQW5xQjA4ZU52?=
 =?utf-8?B?Y240SzMwMk1PbVoramJjZTBZOWVUZGFPYllEVnhkR0EybStNeTR3VFo4ZlFi?=
 =?utf-8?B?UHJtdndwMnBEc2QxSnFSaWpqcjhBdjc5SWphRkpWUUxPZ3E2bWZxK01zMmlk?=
 =?utf-8?B?L1RPMVJwbjhSL0V4RDFPTlRFLzZ6U3pmSXpCbnpCYUFidUw0clZiTDRvQ0tn?=
 =?utf-8?B?dGFVWDBEUVRFYVBJZ205b0QzOWUzOXhWbkk3ZUZTRVg5TmJtYmwwY3l3MW9Q?=
 =?utf-8?B?ZitBLy9nUDBqWit3Q1BFVkgwUFovbzFPSU1MckFXb3JPZ1ltQjRkL1cyazB1?=
 =?utf-8?B?Wm5wNkt2UTdCWnJqS1ZwQ1RMMVhIK1N4aVFjRk5PUWE0dVV1cW9CeExSNXVJ?=
 =?utf-8?B?RUVqZXRpRHpTb2tmNitzZmZqaDdJZWk5Mk5PUFUwc3dUVmwzZXFObFQwOGdr?=
 =?utf-8?B?OVZUc29ZeXJnUlJKRERicURvTlBsL1h5SHdhT0Z0cXpydDloOGFjU0tWazcr?=
 =?utf-8?B?d0NxNHBhRk1nc3VNUTQzVlUvdWpUbktlU0RLME11VmNmMEwzYlIvcVJiQWpp?=
 =?utf-8?B?YzlKTk82NWs0bDY5dW5YNSttWDFXdjI5ZjkzTHUvaGVqQTZPZDMvc2dCU2dE?=
 =?utf-8?B?bnl0cEJ2aFlUNlphM3NMN3hWZHRqWjhKaXFLT0RNT2xyTGtKbC9ZQ01Bc1Vm?=
 =?utf-8?B?blZKczB5bEtMN0k1QjFoaE45NWRkWU4wN0gvVnhVcm1iNi92Wko5MmxOV0tM?=
 =?utf-8?B?NzI3UXArMGhNd0kyYUJuTENjaXhhWld1SGJDQUdRUnVZWHhoQWl5VllxVGky?=
 =?utf-8?B?NS9aeUg0N2pXOE9laHphRG40MlIveksxU0N2a1VnQi9TbWx2YWZOanFCYnE1?=
 =?utf-8?B?alBUZi93cVZVak1sNU8rL3ZIVVVpOWpRZXVOcFl5bDh6WGh6YU1mNHM5bmhG?=
 =?utf-8?B?MFkyN3BIK2tCVERESHhqL1VpRUJ0ZEVsU1FMbXNiNk9jSVYreVIvWVRFblJ3?=
 =?utf-8?B?WmxuSFdtdXhpTHA0WTF3RExFVmJpNlJoMEpWMnQyajlYTUdqOWVSWE5CNHJT?=
 =?utf-8?B?bVRkRFRicWIxZUFOYmRwc2RLVWR2RXM3UUQvazJTNnBNTmdFSE15Zz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660ade65-3607-4499-e454-08dee3d91b28
X-MS-Exchange-CrossTenant-AuthSource: BL1PPF1B62FD55C.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 07:57:54.1745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0OUaPyQeCF3STSHJpOISVHSXTXfadAXvsQJ/lXaSxqDXgTpSis9nW247dYAPGLpycAUWE8PboIZZRArGAc8Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5592

On 7/17/2026 12:00 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The schema enforces a 3-item compatible string chain that unintentionally forces AX3005 devices to inherit an AX3000-specific driver quirk, contradicting the commit message.
> --

Thanks for the report.

To clarify, the 3-item fallback in the code is intentional and correct.
The AX3005 GPIO block is fully compatible with the AX3000 implementation
and indeed requires the exact same driver quirks (such as the specific
direction mode and output enable handling).

The issue is just a poor description in my commit message. It should
have been worded as follows:
"Add binding for the Axiado AX3005 GPIO controller. The AX3005 GPIO
block is fully compatible with the AX3000 implementation and requires
the same driver quirks. Therefore, it is added with a fallback to the
'axiado,ax3000-gpio' compatible string, which in turn falls back to the
generic 'cdns,gpio-r1p02'."

I will hold off on sending a v4 just for this commit message update to
avoid unnecessary noise on the list. I'll wait for further review
comments on the rest of the series and will include this updated message
if a v4 re-roll is needed.

Best Regards,
Swark
