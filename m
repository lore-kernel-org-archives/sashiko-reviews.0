Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795034387;
	b=eMePpCy2ri7BhuZUNOzPSjfxdqXnj2iTNlF+VThPT/USiD+ZoCxnwvNU7Fe837Rc/ntn
	 Xj7956lIZVZfNWpWcwsDD2lLRwj87tiyBq+zFiFxB3Rs8yyHbVcpsGVKdHLPnrpKZIuwo
	 zmY/g1asSv+j+H5niIzvTwaRY8riFzZiYZ3gbituJiDGhHs3/04djUy/OyKryOOMNRTmv
	 O2mIPKiFHtUl2dJ/bMeVaHsGWwKqLTreyR2x/74bplH+aty1RBo8Ob2Gcm53R9Pe4e6dF
	 THya96QvMJqLyZfURb5rSIw7xY/K4LBh61wV8urHpGXSpcS03KQE0lIWy3XBWXh1ZdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034387;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
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
	bh=hySjB2+vGYnOu1w1SAFvJ4Y85LU0TBVrjoGYOShpZtI=;
	b=2x9ZpmA9tDiIsKzhKIaHFII3IBXo3godMjBnJkyGpZiz0Lgum/BtQLZuDEMLmCLqL2E6
	 h1gI7E/EmF/2uHyj1R9E1LVSnZzk1GRez1e4HfaEI6S7UbDl1nt5IYyxoeGJgwjZwDS54
	 otdbXeQ9iKKcunsSFn/ynvsfZKRP5dFxcbuuX7exqVWvjYaaWlBMic/+qm3AGMLAUx03o
	 rwH2NaFOnb1HhOCa/SKqSmLhu8lwq1M9A78hWuJPAIM9zArSNwnnz6btFDJtYotHfFR0t
	 rirFEeS2WPa/KDpLiKbzpicQu1JI2gJGGHUyoohvM9N7dvYcVWRo/uep2FioMgbAC9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=JH1Jeaog;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.86
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020086.outbound.protection.outlook.com [52.101.189.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDC2606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 20:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=JH1Jeaog
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF3T8pK/eslyhTftBstJ0z1VTLJcOTCoKPY3t3t1SfU9LdZB0ToTdQ6tu9IihLYkLNSR5skCwTKMf53IbYCJACjMp6DeohzfL19KNTWujbzBk5g2biKfXv5QmvL7xwxoGxeUxs/DbtCsIGIcxZaF+OWLxWpxL/wLeTLbMOF1IryDiJNTNvGUCxnIOi5IDU0/fVbl+k/Smg7Po5TRVKnBbzIxgUeszvUm+rD77TlyHcA/6za6VKRQXVNnbk3AP1yp9+8tlniwJbJ8QqekopBMSQE0Qkq5GcqIPrMiVC/DP1tRyupofUS4ewS2OmUr5dnQy/cSKFz69OBbR2csYDnmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hySjB2+vGYnOu1w1SAFvJ4Y85LU0TBVrjoGYOShpZtI=;
 b=L6+4m0X2hSgd+QqCbnWV8t1jJzUDwYzyexFXTEO1mAYadntDu7OLE3kAt06/H7a477N3fwJ3aPk1ItLih4agtqEm+N/HmJ4BOoVzRkkCNeeDR3UIGvDHuVIoaNNW+h01LoKhMxI+NzEdcc98UuRpmK6UWK/oKx9KVnILq7/YKd4lOC28sfZj8tWd397J47gP75rOdi4u84fn0KNJ9Ce9SK7fE5fE/mEPHKi2pnBYxJ2kweNhtzqc4BmqCcRMtNVltsQKEuZDpQEJ8ixa+imssNyQ1go+j3+uddwXTol19Imfe4m2oY4tqeOtgCxkQn6GB/+BPwZ3ZVTE0VGBKQNB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hySjB2+vGYnOu1w1SAFvJ4Y85LU0TBVrjoGYOShpZtI=;
 b=JH1JeaoggyTYLoN5Y1ZzTofEuCH+xPkn+o4WBn1uITqxg/rjf/Uvzd3dlRt9Al8mxrLv5ImW0VZFgQfKqmqsHSeG9si2jC6yWHX+DGfjlVlZqw8nozE8TcVuelB7mssqTWJ+d5NGMm4u1Zjf3Wzu17OxsS7sX8aab3vndobpbG5+EfwSzqG+xt/yaMR6FloYlB5WHv/wJ/0/9P1MC+fBOSfcTL5gHu307XGMVThFWBeCIBhMjjGhu6GJ0u4ZoTIOBTKVJaX0PyAME56DAYMgk1mOehKBKNzCZITicNk0JtCJQcQRm8S5buK0CjsJhHJe1Z7AKSPrWvlRReJ0/vNMVA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YT2PR01MB6029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:59::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:39:44 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:39:44 +0000
Message-ID: <27e413f7-5b82-4d7e-bba1-f6eecd1d8c89@efficios.com>
Date: Wed, 18 Nov 2026 15:39:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/17] selftests/rseq: Test the concurrency IDs after the
 affinity is widened
To: sashiko-reviews@lists.linux.dev, tglx@kernel.org, peterz@infradead.org
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 paulmck@kernel.org, boqun@kernel.org, shuah@kernel.org, kees@kernel.org,
 viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, oleg@redhat.com,
 bestswngs@gmail.com, xmei5@asu.edu, xujiakai24@mails.ucas.ac.cn,
 linux-mm@kvack.org
References: <cover.1794932121.git.mathieu.desnoyers@efficios.com>
 <05781fc46cb63b548588e58b356ab08b10619aac.1794932121.git.mathieu.desnoyers@efficios.com>
 <sashiko-outbox-221457@kernel.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-221457@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0017.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::28) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YT2PR01MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 978cee59-251a-46ed-5b8f-08df45b413d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|22082099003|18002099003|56012099006|4143699003|261026121527099003|10067099003|261028144727099003|261026140227099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	WDJ5ZLKVMOq6ba6luwVE19i/3QY5MF8wnHYs9I+ZTuXdLqpKJyLVC9hS9QHiElqG134cIOGe4Jkp4rWg0IFc72gJbBBxm2BoqFJWJLPATk77L8+HU07Jr5qMkLwD9QjZf2s1c3F5GYqz2ZL8/sD4o8MYqq8LXNwFUlEi3Sr2BvZJsXqh0HWpQmnjMPtFIa2GbTwVDkWssukIc7uH93u0cOpOVhT9GcbtLR9nv2NZaaRPlYaKoBZHOQcwvGzhERcY15OXk5sPtB6EMZ8WX2kcL8W094RcWJ+7z3o/PTYgsbWQl+WUWlTTu0o910PKtEcfsBFtc+ksesSzK6Jn4bLFxKMdcsGBlbNnOOMv8YB/DL4Pgii1qoZVwlVe03ueuIBVRwtGtLbgRZxF5D+e8OCsnCUIZxiyqjV+N80LfdoV8vGVLquPGtAHs6kv6x/+VjOFQtlEGae2jVLl2KLy6cEfOxnAMNGCBz7vCfsEEnLbJQ3zwmhjxTaaXWUy22Zm16YzC8SQZlxt0VvopRV+yNAatfqGszjBfv/wv9nRGtPLWAEk34MA2apJdp8F9NS9dsKsnUZN6SK5BFbjBzdxhrOZwv34CJvqw2NrU77BpeGhVsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(261026121527099003)(10067099003)(261028144727099003)(261026140227099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1dhbnRGQzBmTXFubEVaclpLZlVGTkJvZndNdGp0SFlSeENidzhWVENJYUFW?=
 =?utf-8?B?dkFLd0VwNExUVlZiMEtmcm8zMmVsT2tOSlArQ09UaXltU0oya0Z5cFBQSXJ4?=
 =?utf-8?B?RU54S3FvK2V2WVpyZy9Kc2dKVDVJMzY4MjExdzBSakRnOXVIUkdkWmg3VGVy?=
 =?utf-8?B?M1lVYWtQbGd5Sjc2bkdJMEs0T094MmpjTFdoR3U5ZXhBdzQzZmNwbmtQQmFx?=
 =?utf-8?B?bCtHSFN3bXJaeGYzMm9PeFljYVNoWmp6YThydkRucU1BbjV2aE1EMzBpSGdG?=
 =?utf-8?B?cnoxRVQxN0t3L09NNXFJbVhlNEM3S1A2MS85bWhxdUNYRkhTN1Z2c1k5ejlT?=
 =?utf-8?B?WW5GWUFYMTZrd2hzTlFZVmJOeE0vSlZqRmtiTnBYb244cU9haWNnWVJndDRk?=
 =?utf-8?B?NGNRajdLOWx2RkJDaFhnZnNCc1p5RS9pbUZzcmRnMmhCdWY3NVRRRWN6bVV0?=
 =?utf-8?B?M2lWbE03SEJDb3QyWVJha0o3S29jZnNtaGVDV1dsMjJncFA0bkV1M3V3V3BR?=
 =?utf-8?B?VXd5a0J3MXF2bjNUeHlyNlNrcnJWMW53cEtPTmgxYVZ5S2xTTXNCK0dOQ0Zr?=
 =?utf-8?B?TnFPdFkxOGRsNGJmU1lwOFp4RVovaWdpNTJSQUlDWFVEaW85M3VsYnRTbzhJ?=
 =?utf-8?B?U2RQU0I2Q1R3bWpKRVdEZDRubzE1bUFtYWZNSnBQSGNIaVI1MXZQVnlaMnRW?=
 =?utf-8?B?OTVJYUNZUXJRVHFibjY3Y2VjSGN2Vm5TQ1lrcXNmVXRRM0tZZVpuVXNaQkRY?=
 =?utf-8?B?TFNvVDBTRk5BZE9zdjFwalV1Mlo1MXVSWWVPdkFqN1BDdFRXZGxvaDVCYjEr?=
 =?utf-8?B?bVlITTQzQUZiNERydElWVkc0a2NnQVlmNFgrVzNHalRMYy9YdTduR3NzUm95?=
 =?utf-8?B?TTZ6RC9UbmVsSXl3UUUvY0lKclY1UmJGQ3FUYmM4UTd0MWo1ckJ4b2pzOE9T?=
 =?utf-8?B?ZldYSEMvampFTG5FUmc0bUNRSkQ4NEI5SjdycDdGenRWYUhGWWUxNU85bk9j?=
 =?utf-8?B?RUhUR2wza2JhZjVBdmU0aDlsUDlhR2NBcHpHZnJGK09teTNnU1k5TU11dk50?=
 =?utf-8?B?N09xNUNOL0JFb01uVy9hc3VoSERqcmE5VlRaUEpkSUtuUWR3TWwvb3JpUmtK?=
 =?utf-8?B?Z1RiVEtnVWlVdndmRHhhQWZXOHh3S3dNR25HektWdjloeUxDRWo1eVVOYmFG?=
 =?utf-8?B?am96QzVxYkNDSE1yMitPR2pMYS8xa1VHTllnbjNzMW5xL3ZMOTBpbTJmTjVn?=
 =?utf-8?B?Y0hCelk3dE5YWG9JVTdLc2NUWmZuaC9IZ3N3alVrcFV3cjJOTHdEOS8vdmJP?=
 =?utf-8?B?T0grN0F2b2sxaENFc0c4MVdUemIrSm8xSjJCYytrbEQ5OXJQeng3KzJMVjk3?=
 =?utf-8?B?MWlsejZ2UHNqMmxDZDlRclNzbWdWWmNaWDFoaVF3ZWVxYlI4VWZCMW0reDBk?=
 =?utf-8?B?TXNMZmhuaEF2eTB3dTYxT0ViVzRacnI4Nnk5MExCV2xnUjFSd21JSFVBYWlr?=
 =?utf-8?B?Nk9KK0ZLNWhCeThGUTJGVFJjb0RQQ1RITm5wWVhBaUY4R2lOdm5tZExuWG4x?=
 =?utf-8?B?cU1EUzlzRWtvNmNacHA5UEtpckhoNDJPRTlydjBMVjh3K3kycHFDTTlaSkp2?=
 =?utf-8?B?RkxoeEs1VXBPOVBqUjQvL3JaMEZPVVozazV4VVhJT0hYNVZsYVNJM3hwUjdw?=
 =?utf-8?B?YWZ3UWpDL3ExTDZGYlRaZnBFZ2J5c3A2eThQSjVFN01ZM2pNRXBoMjBaQmlh?=
 =?utf-8?B?SUNPZEQ3dVEySjRZUG81ZHZOMXlBN3hoSFd2WkFQalBINzBzd3ZqZnhLc3Ju?=
 =?utf-8?B?ZGsyQnFHb3ZwNHhRaGdiNVowWTVpTVU5bDAvT0JpcEQ5aEhwdTd3RjBxY3Jw?=
 =?utf-8?B?OWFkSDdXQ2tMdFQrS2hiU2ZualljOFd2NjZ3ajI5YXUvaVlhSkpQMUhuVWE5?=
 =?utf-8?B?bEZOdnduMzRZT0RiSU0wVElaZWhGNStiYTFYWk83VUIrMkxJang0RWsxbmZp?=
 =?utf-8?B?OVRBWDNudEV5OVl4SzZEZ2dwNWlJWXE4Tkl5dFdpaGYrblBsQTArVWV5ZEQ5?=
 =?utf-8?B?NGRhZTZuQ1JUVVJUQWtEeGVXZnhrbndpM3ZLN05NSVBmVEhUbVc2SGdETWlO?=
 =?utf-8?B?UHpHK3JVdExWODh6VncvbnhXRDhtOHFESXdBMkhmRmxlUnNWTDhrNzAvYWw4?=
 =?utf-8?B?SlFKODdOYVFtdUhhMUh2ZDJsUXJtODBnRFl6YXZya2dhaEFXWW01SXRCOHUv?=
 =?utf-8?B?MUtJb1lHdWRRLzJRdC8vWDlXWkRTZCtrNndKRmh4UmNuRTZ2aUdvSWNWNlV3?=
 =?utf-8?B?ZGhCRHNaaitDTUN6QU9qd0ErQ0RGeGMwRUhCcEVOQ3VTUklRM2VocWNXdytl?=
 =?utf-8?Q?d24VGON0s+kD13k+eQYJzUvlFgvY8Z+hwbW3C?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978cee59-251a-46ed-5b8f-08df45b413d4
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:39:43.9781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlnUF2q6+sDWEEyBZ81qLyrSa/1hvRhdIKgIQ+vt5vSkuXCAfTn0/GSpGnHXr1eQ2SqDKbZrQmq80RHPm7e2HHb5k6cR+3Sb4l8HloTHqtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB6029

> Without rseq_smp_store_release(&epoch, e) in measure() paired with
> rseq_smp_load_acquire(&epoch) in worker_fn(), either the compiler or a
> weakly-ordered CPU can reorder the non-volatile reads of allowed in tour()
> ahead of the load of epoch, leaving the workers pinned to the initial two
> CPUs during the widening tour.

Right. This case is the only one that changes allowed while the workers
run. The next version publishes epoch with rseq_smp_store_release() and
reads it with rseq_smp_load_acquire(), as you suggest.

This was found by reading. The runs were on x86, which does not reorder
these loads.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
