Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794082813;
	b=5F9Qm83QXMKKmLqaLKOo7tyPe7JZgZpz/oVp8XTi1MyksApMYi0I5LdArr1PLErp2oE2
	 DVX5PpkhJKWNdypVl0neP46oHhO+GtmedK4CPtE0j+i8dfTgeA/aCwiTZP68x1NXHAVh+
	 OG3yIc90NNisInMw6fkkQXluCrVfhNVHvWAVBZiVrpFKanws57lhK7aasUvfTX6fjt60a
	 OCzwdKcFxoufcD2M9o79b88YZfjCC7NfC6/39rL3PuKKU9KCvZ6HgfsPQRBZJjo1HQYQE
	 hvEZzfk4yi7iJV0NF8OLStxNcDoOoRjBSEOUfSOuzdP2PgaO024wUHpy85AVfpIdArQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082813;
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
	bh=a/lvfpxjMR4IflsEXExkEyyxznwyt2i8KFA2n1B4fcc=;
	b=Zua4C/DWP731ZlbBRuFz1KJ3pXRLj5sfBaeY5S+dWVx67ZIu4ecj0b8Zix4Plszx1O/W
	 q0PJHZ6Xu3xp1FWy5G1c13tB7OfdCkErltjC8wS4WxCgr7SN4m7XvlLXOsvi7IFzrTd6Q
	 OYOjzLKqhXBvswR2vwxkpBx8NWPy4vLsu2LrhF+jZuMJsp1ghDvhIVPQe8aKbsJVhUaG3
	 OOgFspzNC+wsIXsNFCA8Taxl7oWvZAEngpC4n9q5g5MiIenzrjf7D5Mp+BCseM8GhzMm8
	 aJeQ70nNtqjhfQOsoK635Iwor4EbDpQmIaDjeRM3LMka9XdCQEfwc6GObym9dFFc7ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wcjw09ct;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.38
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013038.outbound.protection.outlook.com [40.93.196.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0B0606A336
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 20:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0B0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wcjw09ct
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otuhvZ25pRKP5Ley++mcvbpZQbfQTcMLtoRk5wJ/dei+VhgRfPntpv0CSR2JbJhygbL76NCt1i+tF7RZ0ilmxDHI0d7dJqvikLgNoEorb1y1K5I367oEW8ZP3yUeBHvAkPr+enYkIsPUHKRFp7OLX+1sn226496DopQfXzZjj+ENpvNLsAVR93Lm4VmjtYBEpZdhbF8XiwRmKIlwZR8uqY2rUN9pMHRdxjKTeXGVRHYcbLQ9GqY/5cndaVZy3fCaoVMfn5wuMIkOBAABUpNvkyzzSsUTTRTTb66mUzhnXzQAwxE6//2cx2mgB8xopGS4pt+wTHwFPjm9kWq2QTUAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/lvfpxjMR4IflsEXExkEyyxznwyt2i8KFA2n1B4fcc=;
 b=A1BsGnHN0uV2KayZc90mMl30QNcj2LMC24MbWhPn/LMFqgQCp06EfGmKejqc4+2VnHXxnqWCQJN7475mvSpLdGS8r2/cZmz7CbHqMpN4bgeT4jAb2uTigmANqsJrkwBIk0sQon96itIuLAv8uCyDLDDLfim5dtut5XGJ6XvlO6ogZX0ohGxGEBrNO8jK1g0xsLry7rw3f+Ev1gZwHZBmS3RTIkQTK9ciecxFIUOkam+e0ny0SpluAMQ2RQOE99idlv9dlLRGD9pSr2D/yEhcoHAxM1vLoMnaxaqeKghISrZeZLvarlF5F6jInU1bAwvOG8siO99aFjBITIxVrlPStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/lvfpxjMR4IflsEXExkEyyxznwyt2i8KFA2n1B4fcc=;
 b=Wcjw09ctzdYtEeJjVFF+GJ19W7IlRIcx49rvyjPYOx3I/YAAVVlvPT+XZjBY0hD4eDD16x/PirLlKHg4xhTXuhAyXW0PMw2JQrTC6fldKNIeod4C1NYlDdux9LIkXo0f7v46XaemSy8OvCtoCClhEpgXrTaGioiPsg6dfVL9CFA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 20:20:08 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 20:20:08 +0000
Message-ID: <a490089e-b84a-4024-a1b4-c9a1a7b2bd9c@amd.com>
Date: Sun, 8 Nov 2026 01:49:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/25] soundwire: amd: delay *sdw_ctx publication until
 after startup succeeds
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-19-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-203039@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-203039@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0034.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::9) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7f1f9a-1bd1-4932-5d27-08df3d0c8480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|11063799006|261102130727099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261021123027099003|56012099006|261009223027099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	CMwr5uRjkBWTiWRVKWR7sua+kkhh393w5tA97Ic9iLTVTGhABUYpBy2BQf9040t7wqtRN+G7XSJiKYNyBDdjkE250h3IGR8KuibtMyImB7fuN3D/MADhWEn5rzsX6Cjw2eZa+OZTdzVFM4rOc+W2JLFnGSw3qGp/pybVZqG7gSyGXjOghRM2hD1h5tJOfVtDP+TQRxd62wpeap1EpE7Hr6zKJfWIF2O1lS/uYkkKnGPdclLk46p1mkJNz0HmOCVdiw9pDHhao1F1STxhkJpD5+QFrtjWmNPYo/vDOE5iG0AM7gOo5EwkjHvOZjYaIr2vMjWZuSJ70x8X0kxzg/K/8GSOKH6nGQKfXeQY7vJTkZKNcc9MWphir2KcUB5++el4m/Eoqa2ZZ4T7sE2q1YRpLMSsH0ruVKv4C2xzkSfFjiwx0w6tF2zYMtc87w9IpD8LLsFAsiaA7vhVyIfeGNYVx6AO8lNX+zN/xaBqZsEo8uhrkzU+NXVSOkrgIjy9ItOPYaNqzGX8KThvhvr9QXtTMq7mM6Xdzo54fhEHDxj01alzHPRBk+i5pTdhQlMbsZv+hgscNTOOfffREAmNLtUN6KO67yb765sqhxVE28nlOvj2uXh6UvXYjXQQYagWG9xQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261021123027099003)(56012099006)(261009223027099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWM2cElGTVlKS0J3VW9rSDVjRGxPeFNEcW9OdkxTVTVuS2pkQkhXdGl0ZGFC?=
 =?utf-8?B?L3JmcmxlaE1BUyttMGJOOW03OUgxNUsySDJncWN0QUlWRC8rcEI0U2s2N3Rt?=
 =?utf-8?B?ZGlVVnI3ajNKLzJ3WW1KWExJQnJxeVJqZU9zVDR3NVE1cC8zem1kU3BkbmxY?=
 =?utf-8?B?RVFyR01oWGx1L0lQaFVGSDdHbE12Ky94OWdxVEZxYlZGUkhrdHdUQ1k4MXc1?=
 =?utf-8?B?QVl0ajNBY1doSGZ3NDFlN1RMWnA2Z0VGSUVFZm5RUmxSNTVESTVNRjlFdXMr?=
 =?utf-8?B?SUZkSTlreWtpZ2pZYmhJejBWaFRsZ0NZTDJiNnlpWGQrNTZpQTBkYVZXR3Jn?=
 =?utf-8?B?MW8xQ1h1bHRiZEhzcDBjN1ZjeGNGMXdqalVHZzNJeUNXbjNzN2hoUWxBTXh4?=
 =?utf-8?B?L01xVG1oSkdsT1JrZDhTbmE4UlVsbTI3VGxzVmtsYzNOQkhpRzV4MzFZeXRv?=
 =?utf-8?B?M0JjREk3M1MzNEF0cU9pUkJOZWxzQlAzcmpEWlZnV0ZhZEtPc1dLWVQ3ZUJW?=
 =?utf-8?B?SXpmUGcrUEVLTXlFbzJQcGRBN3ZoNzZSSUh3a29OU3hBQkVKWkxCdnVKVUZX?=
 =?utf-8?B?VHhRZ0NpR2lBK3ZJYXJHTkhGY21xTVlBc3lJZno5dWVuYS9jVy9Sa01kTXF2?=
 =?utf-8?B?T0hGaFlEb0d2bGJGeFBKS0krR1crYWRyMUZBS2QrS3JnWXZuWk1ZV1BrK0hz?=
 =?utf-8?B?dkwwMy9nQVYvZkFsbEExWEJ1YTBuNVJsaDZyU1RPbFhCbk51MUQxU3M1aDFQ?=
 =?utf-8?B?bGluZDFtcEVsNm92czFSbngyY1VBV0xwdFVjV2RSdHZhSlBoSlBBYjBHeE50?=
 =?utf-8?B?RHIxQ2QzcjBpU010R3lZSXhiMGlwaVZUL040NWFkZ095OFpTRDE2UisweEtw?=
 =?utf-8?B?ZldmRGlmTzNrNjBsYitybjROdGZjVnpKL2dMeEVvTGtrdHlkZmo1Y1JFQ3No?=
 =?utf-8?B?blVwczFZaVNpUG4xUTdzUVFrVlJ4WU5FZ1B6Y0w4VXN4UEJDZU5BZTd6L1hE?=
 =?utf-8?B?SFQ1N2FwS1ZPejlWclBackpBbzNWbC92ZG1lMklaOG9ZWWwwdFl4bzd6MzVl?=
 =?utf-8?B?ZDZVTlQwcVQ0T1BleVhpWlJLYzBodllXMUM1dXc0K3Z1YnJjVVZHTHM1dkND?=
 =?utf-8?B?U3IyY3lMQTdjeGd6NC96aXBRdFRKd3k4NDlhNk45M25jWmFZYjAxcTJDTDVu?=
 =?utf-8?B?d2pGYU9iMk5ZM0pYNWpiMjNKTFoxRG5MVHRIWlJuYjVoQ3ZPeXN5anFhWHF0?=
 =?utf-8?B?VWVJTzRGb1RCcTRPMVkwaUhpS0RwY2RYWVZzNHpVeUFLY1lZd2NwODc4MWR6?=
 =?utf-8?B?OHVaaDhxOHNSYnVZS2tLb2pUS1k3WldLTkFMcEgveHJKWVR3ckVjYmpjdXpE?=
 =?utf-8?B?QUhXNU5EaEV1cjNWa0Ewd21hVlNSa3YrY3FZdFU1UmNwSGxXVHZ0QjZYTTdq?=
 =?utf-8?B?dy9pQjUyb0gyTnlxT0pkb2w1emhEODk4VUFIdU12WW9hRC9tVCtGK2NtcHBw?=
 =?utf-8?B?SXFCUlRTck9VVHo5ODZDUUw4aEliWnhpREwrc0JPcURaS0haN2grQnVuTU1n?=
 =?utf-8?B?ajRqcHIwRGw1czNWU3pnaklIZXh5dllNNE5mTERCeUdpbi9rejhvNjBYR3dx?=
 =?utf-8?B?ZU1taWppQ2ZPVjArR2hTRytWeVp1UFRoYmMrMmE0WW9QL1NGZVZFSGszbk9E?=
 =?utf-8?B?RjZwaDRGNWxBOUE4V1hDVlZhU2RuZTVXYUo5Y0dCb29yTm95My9HVVI3MUZS?=
 =?utf-8?B?ZXBYWHRwaUlyRmRjWGFoS2dpQ1c1c0lZa2RaOHN6RVVLd1NYK2cyN2lKVlQ2?=
 =?utf-8?B?SlBCWWRaVmZmMDFJbjJtVUM3dzlQTnMzZzFBNGhPdmdtUngraHJid2RLOERH?=
 =?utf-8?B?L1l6dkRJb0Q2QjlTU1BrMkc3b0JLalZUU2xXMVNWem1jVTlYVmxURHZELzdj?=
 =?utf-8?B?aU1hRUFBVUdPNFVWbC8xbENjY1hQT3BaZjNKZzNKVlJKYU4rK2Y1dnFjajRq?=
 =?utf-8?B?SytGZXpIK0ZJOUJ6dEtxc1E5emJJMlp6bjN1U1pYTU4zbGJBNkpaenV5VnJU?=
 =?utf-8?B?N3NDM3NZc0ZtM2JNUUYydklyUTRVMStYVnZwOVlHajcyYUxkbUR5TXVzWDdn?=
 =?utf-8?B?OTdmcStuZHgxZjNzanFLMFNkTmV0bFU4cHN0cWJoamxQSmNiTG0vR2NJTVRi?=
 =?utf-8?B?MlFsWlowMUo2UkpadUhGbVNwWjFid01IN0lUeTh4UnA3bWJMYXlKYlF5aEFk?=
 =?utf-8?B?Ym11TXJmYWFwK2lPVVdlTWRtTHI2Z2szTHJPYngvK0pLTDkzMGl3V0NleFZx?=
 =?utf-8?B?TmZlZmNRNytqcUwxdWNNOEVoUXQycUNqUy9XaHV0Y1BjMWV5ckNaQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7f1f9a-1bd1-4932-5d27-08df3d0c8480
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 20:20:08.5028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qg9a8zasQvycSkJvlR366LNIT4I/jbbF8FOR2xfp5Fdq1LUpBH6vlLHwTAg+3+9ZxhvkVqQsJPVdz/yVIMINUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506



On 11/7/26 21:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] soundwire: amd: NULL adata->sdw dereference in IRQ during
>    sdw_amd_startup()
> --
>
> commit a9bb217bfdd227aefc49880481f23f5b560ad717
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: delay *sdw_ctx publication until after startup succeeds
>
> This commit delays assigning *sdw_ctx in sdw_amd_probe() until
> sdw_amd_startup() succeeds, cleaning up the local context with
> sdw_amd_exit() on failure.
>
>> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
>> index 032697ea35906..ce40b1e5dbf31 100644
>> --- a/drivers/soundwire/amd_init.c
>> +++ b/drivers/soundwire/amd_init.c
>> @@ -176,11 +176,20 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
>>   
>>   int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
>>   {
>> -	*sdw_ctx = sdw_amd_probe_controller(res);
>> -	if (!*sdw_ctx)
>> +	struct sdw_amd_ctx *ctx;
>> +	int ret;
>> +
>> +	ctx = sdw_amd_probe_controller(res);
>> +	if (!ctx)
>>   		return -ENODEV;
>>   
>> -	return sdw_amd_startup(*sdw_ctx);
>> +	ret = sdw_amd_startup(ctx);
>> +	if (ret) {
>> +		sdw_amd_exit(ctx);
>> +		return ret;
>> +	}
>> +	*sdw_ctx = ctx;
>> +	return 0;
>>   }
>>   EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");
> [Severity: High]
> Can delaying the assignment of *sdw_ctx until after sdw_amd_startup()
> cause a NULL pointer dereference of adata->sdw in the ACP IRQ handler?
The race is real. It is addressed by the companion ASoC series posted
to alsa-devel.
Link:
lore.kernel.org/alsa-devel/20261107175339.3547918-2-Vijendar.Mukunda@amd.com

Patches 1/4 and 2/4 add adata->sdw NULL checks in
acp63_irq_handler() (pci-ps.c) and acp_irq_handler() (acp.c) before
dereferencing ->pdev[0] and ->pdev[1]. The interrupt-status register
write that acknowledges the IRQ is kept outside the NULL guard so the
hardware bit is always cleared regardless of whether adata->sdw is live.

> The callers (snd_acp63_probe(), amd_sof_acp_probe(), and
> amd_sof_acp7x_probe()) register their IRQ handlers and enable global ACP
> external interrupts before calling sdw_amd_probe(&sdw_res, &adata->sdw).
> Inside sdw_amd_startup(), amd_sdw_manager_start() unmasks SoundWire
> interrupts and enables the bus on each link before *sdw_ctx is populated:
>
> CPU0                              <hardirq>
> sdw_amd_probe()
>    sdw_amd_startup(ctx)
>      amd_sdw_manager_start()
>        amd_enable_sdw_interrupts()
>        amd_enable_sdw_manager()
>                                    acp63_irq_handler()
>                                      adata->sdw->pdev[0]  <-- NULL deref
>    *sdw_ctx = ctx;
>
> Once the link is enabled and attached peripherals signal attachment while
> amd_enable_sdw_manager() polls or while the second link starts up,
> acp63_irq_handler() and acp_irq_handler() dereference adata->sdw without a
> NULL check:
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
>      ...
> 	if (ext_intr_stat & ACP_SDW0_STAT) {
> 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>      ...
> }
>
> On ACP7x, acp7x_irq_handler() checks if (adata->sdw) and skips
> sof_acp7x_handle_sdw_manager_irq() when it is NULL, leaving the SoundWire
> interrupt status unacknowledged and returning IRQ_NONE.
>

