Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795519522;
	b=lgvCAbYnsv3g3r9lD7z1732Xd58HkpQ3imJ7xebPlULykwdM0MBp2/CcHhL1djwFLB6j
	 WMM/0K7yeOei9lEl5CBY1pLsT1vJ6tA4tUXz6/3ZJQOl1iBEt7GCQMstRn34gFUAo0zmw
	 7/e2GPjAGrY6jM35seFA9J/PfP7xNH+sQs0dlKped4OMOjUFGJs4+sf+fv2DMuhaLNuMV
	 Zkk/Clj9qrVAkIA1G21O0Y1oRDK+g2KOHIqvuyLhiF1u4Px57UAaDC1aos4aJUXdsciU/
	 z0VBYm9IKvvtzEBjiidmkBq9az86CAlY0tjdbHtMcr8zGdrdKIALORwrTahR3qiqn5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519522;
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
	bh=vdav095i/FB+YC1sm59CMpB1weu0102gk62ioHm56N0=;
	b=00dt1pAdlhk0QaWXxQjVcZdiVA1JbTKTflgb1BPOm6erhCt1gGMrQTqm7cRcz2TX8Smm
	 ZFmxrN8YU4XFyCyFv+vqHHbaaHe0pofX3k8ID0m7RYpC4wgGofHayxtKvqGXWx8+9LsIb
	 kwDXTTNjR15akh00NyNSaPjz9DBCqUCKMbAAL7McI9CMidVmjKnCNKEgkN99FSYY3siKz
	 98Bz9l/HB4Om5In8DXON1RFL/CBJmr3kN0AnIOX19tMYGbu/Cclf+A3gc2VAAGeYOTSnl
	 7VTEmzmSypmhfzNPiys1izVvDy6zsUIfTEz4WZCtIU4FBCPRs4eKxYYvwqq5MIKcexg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hbg0Yf7n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.71
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F5E606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 11:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hbg0Yf7n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrbCjzHj/VGE/Ik9CQ0CQeeoT5UIP0ua5SZSsqvPYB0b+gZP7ECRo/P9HQm/2sWE64MI8xJBPn3giHX1C/BJSNEIjpwrlKmffM4LMgZqXXWiwc6BcT3mQncot+xVs+1lSB1Vz1E8B4strcD3kLp7+RVfMGy0uKO9GTMgsyLlf9ACElADFoIc8LsETBmiiaxhRTiHAgcCjUa3oiK5OREB37Xpo7HB1jA0AFVEc1eACyEaNZ/Zz2nKeyKOXd+FhFNf91s0hT/4nzITMMgPACY7h+icNu51sEqLkWafNgpB7SP5uSNu4UOh/BEAHbhMiiRRHKT26e60pozds8BLRiDcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdav095i/FB+YC1sm59CMpB1weu0102gk62ioHm56N0=;
 b=H9rPkot5JNnVCnSB3s/tz/a7hKNK6pB06lJmpnBRARmPAS0pRIZYsDDr5VythLB5n1YnZU2zP+b7ZXfJwSNN+xDBWI67SVlfeKeAWLmHDxvS7yTCYTbqvHS5RbOzYG50lWXAUlTGpqAxPxkF3ck2GVyf2V0Tjzd+PqxQnRVbNBn+8gWNycm01Y8PuxJPivcwfPX1Ce94Thw5XYtiB6Tjlg9IDcNhTcaga/xLuOWYJIkvaAHjdo307LyaXRLCZSAzqmowZKJ27q0+WpyfgHpAOWTkvsm8WmteZ4wwpj6AEDBQlxJ5j0Hq8wNAcybB3EzPdw20V48pBQNDzKBhL3hG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdav095i/FB+YC1sm59CMpB1weu0102gk62ioHm56N0=;
 b=hbg0Yf7nztTdKz1fAWUkLkm3ezrqTQQu2DVmdO/nwFf4ONMYlMEEb+AYcrhRkppoy4xNt8ms1MnP/WVxP/aCU2SmPmQ9cJ2HKyx0VBD+o6i58ALIjRu6vFJm50jaLKYMEflgUbPuJlrecimEUhVo/0/XJZrVklcIb4XsHEIpBgg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by CY8PR12MB8316.namprd12.prod.outlook.com (2603:10b6:930:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 11:25:17 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 11:25:17 +0000
Message-ID: <76a41227-d450-49a0-919f-156da89c43d1@amd.com>
Date: Tue, 24 Nov 2026 16:58:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/24] soundwire: amd: guard IRQ work with
 interrupt_enabled and clear STATUS
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Poojitha.N@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
 <20261124085033.682755-16-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-230818@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-230818@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0266.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::13) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|CY8PR12MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b016d69-d646-4316-f126-08df4a1d9dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261022075727099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|10067099003|11063799006|4143699003|56012099006|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g7daNURjwAGO/D4Dup437+kjWKg2sVb7Ejelr8krFCEGaUZzCjAVE6WOBklnETwm7qZko6VhNte3vJW+NRX2jg8nNMTOCp2tZeMG6f/7Xcy6sbovSfYoqjyVoUt91mpg5hal6vEPKa+OY30kIpu5Rn2mBQJ2XLCoNGpPqOhS/rUr7rxuCL0Zrs6Z0w8TqjOqzfSSllgFh//HcISO1Y+1XRFnF14x3ytOBt/Txz1xWc0z/P5EEygO5+SVBOfHc+fvkQrjEOx9ZWCd92Antp1ugNbRRdolWvFGQY9N91hHXzkAl5UfVfneMrtoLgci8rTJjGyO+xYZVvx5aKMdyHUO/csuWJZdnoYJL3sOhmJpwGkIrM48teUZ+yvSAjr24dFmPkcP1FWJX6OhxeZpeLzNl9LRu1zqhKz/qfbDbnUyropWo7IET8//a1dDaKRqZ8zzjDSGJlujEHXAkBLCQPpCsuWPnhhbWBpCnfBC3ipQunDRSFsdTZxVSlu+EyHw8O92KKEh/5SXSee6Po21aflibm+jenVnUt7ynEhELXySiHzBLmPrCrAOb6i7wmp8deCpOjtCRz2s0qfqK113AcjP5Nzy2DIzfMcT+zS5uBX4KfCyvD3ZQX6cVMBk4DRCe/pH/ryjmUrxSKRQ3ftbNbjY8jTGQPyPzF9tJr8ZeakiK1s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261022075727099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(10067099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1l0MjlYak15dk9YNVhyaDJsNHZ4RUFyM290RmFFVkdPTWk4QlJ3Zm9VODh6?=
 =?utf-8?B?eTNSOG1yZkJUc1FEYnN1MG9lRXR4eFl1Wkcwa0k4QlI3ZmNqMm8xRUQ2cXFq?=
 =?utf-8?B?dnZLdXhaa1Z0cGR2bmFmc3FFTFVvMHFlelEweStvZlZJSThwZVNrSVNTQWVM?=
 =?utf-8?B?TnBnZ1EvWko4aGIzeFlXSXIvYkxUN24zamxRMGw4c1I0VWhkcVVybkl5TkUx?=
 =?utf-8?B?RVF0QTFLeWxaWkVuVFcyeTR2c2g5VmFDRi9GKzB6MzVuWjVpejltcm9CYUhP?=
 =?utf-8?B?UFdvOGdzQTF5SkpUT0tQeGd2WVVhaUx0MHpkVEsxeTlzZDNwNDFPZGlleExB?=
 =?utf-8?B?MnpKU1B5KzlicFR2WTFlZCt3aEdTYlpkWjBNdVkrOStqMmZOOTZFcmdNNE1N?=
 =?utf-8?B?QlBRRjRiSC9GOTMxNkJMWUZybGcyUmJLcllwNzJvSXRHV0JLWFZnM0J2OEQ2?=
 =?utf-8?B?TlUvV0s4YXh5UzlBSHJiSGRmZHh2L00xbXgzZFE5aGROTmtiVm5IUHFSNXhZ?=
 =?utf-8?B?Q3NCYXlncVZQaGVrRGlOc3loclpxekZNbFJKNUtab0dhclo1NVlpYW1pVnl6?=
 =?utf-8?B?U05Za3NXczBiejZzSVFNNW0yZEMzOENRSzcwTVpHaGUrNGRod0JJcFFRUGx3?=
 =?utf-8?B?T0ZOVlBFODZtM01ENThDZURVM2JKM29JcEpFSHUwNjNDd3Ura3JWdmpLL1ZR?=
 =?utf-8?B?d0dYZHRRQ3hiNk84VHNPR3g1TncrTkcwZzlwZFZKRVoxaXhYQ0ZQbnFuZ3da?=
 =?utf-8?B?Mzd5cDhCSmhITy9Ka1hwV0x2VEdKeEQ5LzdwcEU5WjByTFJha2hKaHdSRlI0?=
 =?utf-8?B?UlZrblZlWEhDNnBZaFNHL3Jyc2ljQWwxWENpT3dmUWo1aDdHcWRhdEV6VlRj?=
 =?utf-8?B?QVhZSDJIbStDUy9VZGJTWVBEY0JVeWN2dWR6V2hTYmJmZERNd0x3OUtyRVVk?=
 =?utf-8?B?Y1Q2NDVQYXBLSDJSZCtTbWQ3VzlrTW8zSDNaQzFVTVk5ZzFaMC9XZU9CNHFo?=
 =?utf-8?B?N0JFQ1hoOUYwQjlmVW0rUTZScUp4VXRlNk44KytwUXYvWThQZit5TStnamVq?=
 =?utf-8?B?dTB5Ujh0cFRKU2hkTHNRejU3UUF3NU9xS1ZBQ0E5MlJlUVRVbFc4azVHZUdE?=
 =?utf-8?B?THIwOWZwSHhwMldkc3BWcWxUS3NwWi8vcnBJMjNSS3pON2pZWWlpemFxVVBa?=
 =?utf-8?B?TWI3VE9PaVVEcGRnS1pLVmJHL0lDcGUvN1lKanZlTksxUjJGVTVaakVvcGRO?=
 =?utf-8?B?MFkza29URDBiWWtSMjdFLzJwT3BlY0VIcFQ2NDJOMTdnaGxvOFUvRUpzNURp?=
 =?utf-8?B?NFgxdEtZSld0Z0RiQ2pmUk9tMzJsNXFDNHI2RS9xUHJUMDNpVURyRFhNMEJS?=
 =?utf-8?B?UysyZ3ZZbU1ValFjSXFudG9JR0xqRVBvOCtoSG5kUUJUUm5Bbml4ZzZjN3N5?=
 =?utf-8?B?MzNZNjlnNk10R25RM2NDcG5maHp1Z25KUnpaRnoxMU9GT0NqNVR5aEtqZVcr?=
 =?utf-8?B?dHVyZjIrMG5jQ1VBNmltaXJXeHFNTFU4TTZVMzF5ejYxSFcvb2lNYXdWTVl0?=
 =?utf-8?B?RzJabXhxZnozZDNIajR1MEp0ajRaaGxJVldVZXp2Qnk0TDhlb004TTRNdCtm?=
 =?utf-8?B?MmdadXp0RVBiWFo4VEFPSHBOSWRJQUFHM1p4MmVhOFRzSk9jRGVaTkpFQm1r?=
 =?utf-8?B?SVZWSUNzMlYwNUZCeVF6eis4T3NNMXNUUVYwcFF1WFRESzVTN0pvQXJWWWIw?=
 =?utf-8?B?eUQ5NnBtZFhXY2xzNTM0M011SjlVQU96c0ZOTHVnaHNQaTZ4SEU0OThPelJ4?=
 =?utf-8?B?KzhBVnJBazdDTGRzTWtJSExMRFJ3QXdkdWRpWk92VVh5TGxOVTVCZkVZV01W?=
 =?utf-8?B?aytTV0JaUUwrSWxXZEp4L1JhQTgrZzdJN3hacENST0pHa2JVUWJiSkNYUTdv?=
 =?utf-8?B?M3NWS2thVjJMNUlFYkFrd3UvMlRTVUdoSVNjUnNUaG1OUEhEQXo4TVFGNTNM?=
 =?utf-8?B?TGxIdGozL2ZwOFkxdFBhUnJYRGNaUFdpSW5QR042dVcyQ3h1NEU2YW9UNEs0?=
 =?utf-8?B?b0VFOFl5SjBqRFpqR2ZYaDlqOUZyemJBcGg0ejlWQVdZQStRRGFtYzM5TUcv?=
 =?utf-8?B?WmhnV2dJSDZ0TVBaZVhROEw0a2cwbU0xV1NUMHpYdklBZzFXNisxNEFNaU9j?=
 =?utf-8?B?Q0gweE9BQWljN082b2FvQ3lQMUhjQ2FUSDlWZFlqYTUyekdtSGxoWVJTejZ2?=
 =?utf-8?B?c2gwV05JT0RzRk9lTGhYODJvb2FGUWhjbWR1aWp3aGxmbjlVWm8xektWUkFG?=
 =?utf-8?B?aVVnRTRTVU50VWRQeDBWL2tOdWFHcUxkbWJ0WkNzczZMeW8wZUd1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b016d69-d646-4316-f126-08df4a1d9dda
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 11:25:17.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g72GTwcDHTwrEl2PbqwEUIY54mx0BF4IO7gii4KrmB1f/aKH7oTU/XCVc6lhbTGLskfw7kuYGu+iLijxaWBZgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8316

On 24/11/26 14:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] soundwire: amd: race re-enabling IRQ masks in
>   amd_disable_sdw_interrupts()
> --
>
> commit 4a620e80f932c593cc068162973ef08fa381e1c4
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: guard IRQ work with interrupt_enabled and clear STATUS
>
> This commit adds an interrupt_enabled flag to struct amd_sdw_manager to
> prevent queued IRQ work from executing while interrupts are being disabled,
> and clears stale status registers before enabling interrupts or re-arming
> ACP6.3 wake delivery.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index f3e9614b9ac82..9f6b3366abbed 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
> [ ... ]
>> @@ -135,6 +138,26 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
>>  {
>>  	u32 irq_mask;
>>  
>> +	/*
>> +	 * Clear the flag before updating hardware masks. Work items already
>> +	 * queued but not yet started will see the flag false at entry and
>> +	 * return early; work items already running will complete their current
>> +	 * invocation. Callers that need to ensure no instance of
>> +	 * amd_sdw_irq_thread() is executing on return must follow this call
>> +	 * with cancel_work_sync(&amd_manager->amd_sdw_irq_thread). Once the
>> +	 * mask registers are written, the ACP hardware will not assert any new
>> +	 * SDW interrupt.
>> +	 *
>> +	 * ACP_EXTERNAL_INTR_CNTL is the top-level gate: clearing it here
>> +	 * stops interrupt delivery to the CPU. An in-flight
>> +	 * amd_sdw_update_slave_status_work() on the SDW_SLAVE_ATTACHED path
>> +	 * may re-write ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and _MASK_8TO11
>> +	 * after this function returns, but that work never touches
>> +	 * ACP_EXTERNAL_INTR_CNTL, so the gate remains closed and no interrupt
>> +	 * can reach the CPU.
>> +	 */
>> +	WRITE_ONCE(amd_manager->interrupt_enabled, false);
>> +
>>  	mutex_lock(amd_manager->acp_sdw_lock);
>>  	irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
>>  	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
> [ ... ]
>> @@ -1481,6 +1516,9 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
>>  				return ret;
>>  		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
>>  			   amd_manager->wake_en_mask) {
>> +			writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
>> +			writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
>> +			WRITE_ONCE(amd_manager->interrupt_enabled, true);
>>  			mutex_lock(amd_manager->acp_sdw_lock);
>>  			val = sdw_manager_reg_mask_array[amd_manager->instance];
>>  			amd_updatel(amd_manager->acp_mmio,
> [Severity: Medium]
> Can an in-flight amd_sdw_update_slave_status_work() re-enable
> ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and _MASK_8TO11 right before
> amd_suspend_runtime() re-opens ACP_EXTERNAL_INTR_CNTL for ACP6.3 wake?

No code change required; marking as false positive.

The amd_deinit_sdw_manager() call shown in the reviewer's trace is
removed by patch 18 of this series ("soundwire: amd: drop
amd_deinit_sdw_manager() in POWER_OFF suspend"). With the full series
applied, the AMD_SDW_POWER_OFF_MODE path in
amd_acp63_sdw_suspend_runtime() is:

acp_disable_sdw_interrupts(amd_manager);               // close gate, MASK = 0
cancel_work_sync(&amd_manager->amd_sdw_irq_thread);   // drain irq_thread
cancel_work_sync(&amd_manager->amd_sdw_work);          // drain sdw_work
amd_sdw_clock_stop(amd_manager);                       // stop clock
acp_disable_sdw_manager(amd_manager);
acp_sdw_wake_enable(amd_manager, true);                // set wake bit only
 ...
 /* ACP6.3 wake reopen: */
 writel(0x00, STATUS_8TO11);
 writel(0x00, STATUS_0TO7);
 WRITE_ONCE(interrupt_enabled, true);
 ACP_EXTERNAL_INTR_CNTL |= mask;

cancel_work_sync(&amd_sdw_work) at line 1466 waits for any running
amd_sdw_update_slave_status_work() to complete and cancels any pending
instance. After it returns, no kworker can overwrite the MASK registers.
The two-step drain (irq_thread first, then sdw_work) also covers the
chain case where a running irq_thread schedules amd_sdw_work just before
completing.

When the gate reopens, MASK_0TO7 = 0 and MASK_8TO11 = AMD_SDW_WAKE_INTR_MASK
only (set by acp_sdw_wake_enable()). The clock is stopped before gate-open
so no STATUS bits can be set by hardware, and STATUS registers are
explicitly cleared to zero immediately before gate-open.

As additional defenses: the SoundWire clock is stopped before the
gate reopens, so no PING frames are sent and STATUS bits cannot be
set by hardware after gate-open; and STATUS_0TO7 and STATUS_8TO11
are explicitly cleared to zero immediately before the gate reopens,
removing any stale bits from before the suspend.

>
> The comment in amd_disable_sdw_interrupts() notes that an in-flight
> amd_sdw_update_slave_status_work() on the SDW_SLAVE_ATTACHED path may
> overwrite ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and _MASK_8TO11 after
> amd_disable_sdw_interrupts() clears them, and relies on
> ACP_EXTERNAL_INTR_CNTL staying closed.  However, in AMD_SDW_POWER_OFF_MODE
> on ACP6.3 with wake_en_mask set, amd_suspend_runtime() then preserves
> those mask bits and re-opens the top-level gate:
>
> CPU0                                  kworker
> amd_suspend_runtime()
>   ...
>   amd_deinit_sdw_manager()
>     amd_disable_sdw_interrupts()
>       interrupt_enabled = false
>       ACP_EXTERNAL_INTR_CNTL &= ~mask
>       MASK_0TO7 = 0
>       MASK_8TO11 = 0
>                                       amd_sdw_update_slave_status_work()
>                                         MASK_0TO7 = AMD_SDW_IRQ_MASK_0TO7
>                                         MASK_8TO11 = AMD_SDW_IRQ_MASK_8TO11
>   amd_sdw_wake_enable(..., true)
>     MASK_8TO11 |= AMD_SDW_WAKE_INTR_MASK
>   interrupt_enabled = true
>   ACP_EXTERNAL_INTR_CNTL |= mask  <-- non-wake IRQs unmasked while suspended
>
> Because amd_sdw_wake_enable() performs a read-modify-write on
> ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11, the non-wake state-change and PREQ
> interrupt masks written by the worker remain enabled once
> amd_suspend_runtime() sets interrupt_enabled back to true and re-enables
> ACP_EXTERNAL_INTR_CNTL, allowing amd_sdw_irq_thread() to process non-wake
> interrupts while the manager is disabled and clock-stopped.
>
> Checking READ_ONCE(amd_manager->interrupt_enabled) in
> amd_sdw_update_slave_status_work() before unmasking, or draining
> amd_sdw_work before clearing the mask registers in
> amd_disable_sdw_interrupts(), would avoid this race.
>

