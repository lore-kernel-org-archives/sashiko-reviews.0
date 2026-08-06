Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013033.outbound.protection.outlook.com [52.101.127.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17453EB810
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003613; cv=fail; b=kxv3/4zdkyAjAYUlu7BVGp0pA719SGgjA1DvsV95eQ42cDDVGl0FswMcKPUuxJVFu0ihXXF4Fin+PftD9qtyIw16lUMyOWCtMoUZWETITEqPQcJ1e427Yn85kZ7bJWK5XrIy9xoV7OC8C33qDMmwEdXGHFxak+MvAwnGzj8nTb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003613; c=relaxed/simple;
	bh=CzCzFJ4ejSu05qLsAVM7hEQgb348LuYRa5bEsvBwrds=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MV4/vCVCXEOblXFUmCKItzyGSbcE51oYCWiKR0a7h7gb3Q0Uij5HL6VZepTCibe9fcCWomt0ZqJWxowkzS3DoKtOLTaqR6XrMzIWz13yJzlp1sTN9pvNalMrnCi9u44C/1BXka+OClzvglfpj4ISXfSNbUn2u5c7TN9pmtAFg3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=BH1DsGdH; arc=fail smtp.client-ip=52.101.127.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="BH1DsGdH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAZ02dVfA7GhWMEWTNGthQ+xRVlbCEmhupvKLVuKnEtIZhGOpkXAlH+GbP91PJDq4rqhjWFxlv1F7Gw7jNHfgj3HJStUJHbPnLS0YPWurjfxezm0jPRG9oSMp4OBK1GR6X1/jRyTSx/bwP22+Hto+kq1CEA0MhQ3aQjudPIqWyqJQGrSPEKNK9TqysS8IBxEywccH+2HiwDXmzgwCgVy6o4ecBNkK86sTdOJavUD/Rux3jf7VdIN6fLt27+Wf1DHtdEf/M2eio1roc4KJYnY5Dgzf3QskJh6psaLDlwA257fxj6lzzuArmsXNeFrGLQEQbSA+ih/dLPxvuzpobtjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElUlVvXwy4Jsu93s6B8eSSLQyFUl8/aEp5XBzBMfauY=;
 b=NrLjwIZIbiL8ethdPgOzpfKoInuC9mhIaVyngniMLzo0xGqiaVDl/tTHfWTDyHgVr33tDJIbIZU3+5K7E8P3kV/7Ph1W49FnxVn0/8gHXwnGeJhTnSwMcq/fC+CBHYEkNgume5qn9duyRFO/R6Sf4uGQM+Iu9pGofsBkPYfOzmFZ9+B+qkA+H6TRxICgfNt8ld4bQwXqkHQg9K2Qs7vDtw0cqwjtNJZu4urN857QphY0AfJcpHHyatAbbYRFon4CISgSGL0OU/afUuKaOc1HxrOB6qUYUeYDTVn8RoL9BEldUSub9sX6mInI7a52GOd7I7BVEhZ8x9zRY/8nMWRZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElUlVvXwy4Jsu93s6B8eSSLQyFUl8/aEp5XBzBMfauY=;
 b=BH1DsGdHMIpdtTdFiMBjxFBV68BGbwiX1X5ZBhF/yj9r0UP+q2/bz/m8CJb3nwDR3vmI/SxixhyD/6KpnFjrOFOCbq1i2iep98FSWhZbGwexZad2drmqpOSn/Wv/qSlaQyFx9WxXmb3XRnsG95bXHmPwuvAVJgBA2dh2QATxeJrlmVbyKg2Q/ul337sVjuitl/z5CjOqzuYAfsEJEymfvUWetCcF0Zb+zVDOnHW3jFDa1EuOH7aEt7GHXEr5kiYu6d1tK5m2VaQVFt+VS1tjGcPi9nPM6VJXWoo/C3+jOXqDfTIhyby0Z2MOVRkiOm/G52em2OBwG+loOKmIHOWVvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB4742.apcprd06.prod.outlook.com (2603:1096:301:b5::13)
 by SEYPR06MB5157.apcprd06.prod.outlook.com (2603:1096:101:59::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 08:06:46 +0000
Received: from PUZPR06MB4742.apcprd06.prod.outlook.com
 ([fe80::206c:c661:9838:5571]) by PUZPR06MB4742.apcprd06.prod.outlook.com
 ([fe80::206c:c661:9838:5571%6]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 08:06:46 +0000
Message-ID: <a3e01f55-a954-4859-a20e-b56ec2a28536@vivo.com>
Date: Thu, 6 Aug 2026 16:06:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH bpf-next 1/2] libbpf: support selective kernel module
 BTF loading via .kmod_btfs section
To: sashiko-reviews@lists.linux.dev
References: <20260806042042.3239428-1-zhaofuyu@vivo.com>
 <20260806042042.3239428-2-zhaofuyu@vivo.com>
 <20260806043305.D488B1F000E9@smtp.kernel.org>
From: Fuyu Zhao <zhaofuyu@vivo.com>
In-Reply-To: <20260806043305.D488B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0190.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::11) To PUZPR06MB4742.apcprd06.prod.outlook.com
 (2603:1096:301:b5::13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB4742:EE_|SEYPR06MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e459a4-439e-463d-5267-08def391a857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|6133799003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Rt7V53O7JmALXwwXITPKkH6R+/Ku3ftiv/y6CiPL9jrhCEq6jvXo9oN/gF9bl1/RDtnkiKYcP2MCBBpiAS2SF2p7V8+69aGS7qfdGiMCrC9S9pNCPokJmB/EEtZIawCJywrMafS27+yLWrbySe/7SqJVRpJF85xh8wFm4z+E28zkeoxuKqHX+jQP5FrHNd/yNOatVd2BK3kEzu3kCz612Fhj5hN2Bda/s7CWJWN9GpjzisuCHKZ9Z03DAs0vtDQ4iNa+yvigFy3RIjUlOc17Xg4VBi75EFcQtOi5GFCiNq8L2uO4ZRZMpbeNdyhHi/48Y2bkPTQBZZKzf4PcgEitDcKowYcgiyJVctIL3zuc4JQXcRtyyZ6iC/R1zYJptvHmcW+r6wHZQCvhSAN7AeKgfhPfXrFsMShmK/uelP/80VvO/0GbsreLXxC+rvSh/aDARI+w/g9qrmrxopJzoeDjxyudBFQYLydcWGTVpRXaS/sTdcnIohK5gmHgfBP2TmB5m8v6TEww4uukJQ74TaDAkN+w9UuIELVtM9xOVg0Oywa1YG6Qfcf9uHfkc2U/FxHMjN6ZCMtJQWy9+MU5a5VwzePmCuvME3on3Ae4lUIjLigaMJ0uDTLfYCeOWXNRAya+gu8Q/3Sm1d/FCjtuLv1KY9dwLOK9VGr+UcKKw47wkcI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB4742.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmpEQzdmWUF3UEV6MWpsb0tycHdpdnU3SVdRelk1Yi9sbTdGem50RVR0NDFj?=
 =?utf-8?B?Ym1meXpyME1RTUpicVlsd1l4cVltYXhqdTRhZ215REIzQnJ0RWlNL05iTWZT?=
 =?utf-8?B?Q1BYMHdzN3RLRC9GbnFycEJkcVJZeUJldk1NbUhENmVLNW5LdGtndjlYVUZI?=
 =?utf-8?B?bVZHNUxGR1lZeUJObzlEYnpjVWRJcnpONlAzZjVxUFZzbWszTmhjK1Z2ZW45?=
 =?utf-8?B?RUNtR01CWFNncGd4WjN4K1ZGQkRneHBHVXVWU2s4anpYWDdQOEVjVWVxZzdS?=
 =?utf-8?B?SVhjeDgvZzIxeGZ0MlhYVXd6Tk1oSWFpaEQzdjd5ZWdUdXBaRSsrajEyUlN1?=
 =?utf-8?B?TDZxSnpJQSsxaFNKamlPMDZ2VmhPS2hrMnlhSUFHZkViZjloaFEyYktEOGVq?=
 =?utf-8?B?NXcxc3FhZkhlNWt6T2ZKRG5NblFOOGYxTko2TmxIaTVxM2VNdlRCWk5ZUVdm?=
 =?utf-8?B?RDRITlpCRFh3d1V3Q3RMLzdyN3B3YmZrMUxmdEk2b3NkQStSd2Fic3R6dkdi?=
 =?utf-8?B?MGR1Tk9idzQ0THJ0b2FnVHFUUUxzRUNjQnQvY3orN0ljTXppS0orTXNtdmxO?=
 =?utf-8?B?eFlKOUwrTnk0NE5mZmJHb2RRekNULzdyUXd4ektVZmpyd3JNZVh6MTllSnZU?=
 =?utf-8?B?RTVWd2FLNTZMSHZGTUlEb2N4a1dlVDdJbjJRZlFLZDlVQTFPZW91QjJYVjF1?=
 =?utf-8?B?Q1IvL2xRNFVPYkVzOEY2OVUvWjB4RG5EQWE5V1JNbDVvRHQrNllxMnhDWVZm?=
 =?utf-8?B?b1hqYStBbzcwTlhiNVByaDdISlVCbk9jNU9jNGpUdVNNbnhLRHBqUG1IdUpm?=
 =?utf-8?B?dlF3NnZiM1h3aG5neE1uaUlXdVI5S25yRXJyS0d6ekltZDhzWEttejZaRE9J?=
 =?utf-8?B?ai9jeERtMGZkRHJtdS9BbWNYbDNlT01ZVlQ2d3NBVm9wSGpUVkVQdzlhTFlh?=
 =?utf-8?B?ajF3UnJpWkt6YW8yS25aYXlRTjRWWHNGcVgxaEJaMHc5c2ovdThxeDBQaEN3?=
 =?utf-8?B?Ly9sZ0FJRFdieEp6Q2ZOcXN4cmw1aG1qMVlsREtJVWRWeU85MjF5ancxdnp6?=
 =?utf-8?B?Smg5UDJnc3owam4xNVZ1biswOUZtY09hMzROWXdCMXNFeC9rSFJNdjMrVWkr?=
 =?utf-8?B?SHVtVFhJNUdjRlpVa1dqbWlvL2RMQ0VtUGxqdTk2QUVQMmpSUDkyaVoyVklV?=
 =?utf-8?B?OGRBZjdYL1BXMEFGQ2J5M05NS283LzBBTHlmWkoraXBTd2Y4bXlvQSs4eFJl?=
 =?utf-8?B?T3d5NzNkbW1DTzhMajJSY1ZQSmIybFhPRlNVSTZjSms5QWNsNWk0TEoxaVly?=
 =?utf-8?B?YkFPT3B6TVQrdHc3b2VzQ05FR3pzUW5GV2x5MWx2cDJCeGVYODdnMjlLL3dN?=
 =?utf-8?B?eUhNdkFlMkJQVkxGWDBZSTM0aGIycmVvZjVMRTRtQjdyNGFsbFBINGtiUVJ0?=
 =?utf-8?B?d1I5SGR0a0xOcnZQUzM0UjJoVDFacGZBNlJlNjBDSzBKaks1K0J2U2ZoVzVG?=
 =?utf-8?B?ckpxVnlVQ1g5THN1TUh4dmUvS1d4MzR1SDJleTVLSy80Z01YWXErNVNWRVNC?=
 =?utf-8?B?R1ZUOXpsSU5tNVRsTzhlMHdaeTFUR0NGWGhJdmRtOEUzVk1IUFl0bXhkU1Ny?=
 =?utf-8?B?VDhwWFBObkJpdGZkY2IxYkk4UWJra2F6UVI1VDgxc0ZYRDViTFh6V0ZxSVg2?=
 =?utf-8?B?clgrNysrQUNrUENwWkgzb0ZPTWUvQ1ZheStjNlBxNmF1MVg1UE9FVHM4Nks2?=
 =?utf-8?B?L1oza1NxMnZmNTBxQjI4VkdiWFFKRkIxakcxeVVWVWtoWXpUZ2lnNG1XU2p4?=
 =?utf-8?B?K0N6ZzNjU0p2QklIamdMUmoxRE1PRzRVRGJCbTFPb1NUVk83WnFyTkg0b083?=
 =?utf-8?B?eFZIb1Y5bENTNWNXOVJ4RXVmWUpxbE5DbHFnOUw0T3pKdENCcXNFQWpvWU5Q?=
 =?utf-8?B?bXl1OThURWR4ZEw2YWpJYUUzMFhObnpoT2lyVEtMbnQrRWFTQzlxMWhqSjVB?=
 =?utf-8?B?TDU4Q2lBd0QybHo2UXJweWNtU3I0R1FDdGcraHBLeDE3QmZyK0xqdlJKdWZP?=
 =?utf-8?B?RVN5dElzQitxdXpucTl6K0VvQzVDN0xkaFp4d0psY1B1UVVBN0lndzdSODVW?=
 =?utf-8?B?MVlNWW1IeFNUSmZkSEFhTnZwd2NpZjZuNTh4bmt2NzlJQmtaZFdnU2Q0eUtk?=
 =?utf-8?B?Q1duTVovK1d0RUNOS2l2cnlhckg5Mmh1KzVUSHpiVm4wZWN0TUZzenZKT2dt?=
 =?utf-8?B?anFKTEdoTmVJWFNzeTV0MkplSzFxV29wNFFNeU02eDR2R3RyVmIvQWRsUjls?=
 =?utf-8?B?VGVrMlNoRmFiRXVxZktib3hqNlVURGM4ejIvK214N0FoM1FpUHNrdz09?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e459a4-439e-463d-5267-08def391a857
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB4742.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 08:06:45.8472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sC5xm+YBL8V3sbQjX+MlsmumpW7XN1RM9vXcG/AoySteh0Xkk7UAEh4VqosGVKZNAnaAjm5ztEe+yc1k/JvFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5157



On 8/6/2026 12:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Transient stack pointer overwrites persistent hashmap key in is_kmod_btf_needed(), breaking hashmap integrity on bucket collisions.
> - [Medium] Memory allocation failure for `obj->kmod_btfs->data` silently returns success (0), masking the error and corrupting intended behavior.
> - [Medium] Processing multiple `.kmod_btfs` sections overwrites previous allocations without freeing them.
> --
> 
> --- Patch [1]: [RFC PATCH bpf-next 1/2] libbpf: support selective kernel module BTF loading via .kmod_btfs section ---
> commit 5306ac18160e3a8c2a0f3dd2eda202169f998df6
> Author: Fuyu Zhao <zhaofuyu@vivo.com>
> 
> libbpf: support selective kernel module BTF loading via .kmod_btfs section
> 
> Add support for a new ELF section ".kmod_btfs" that allows BPF programs
> to declare which kernel modules need BTF loading. This avoids loading
> all module BTFs and speeds up program load when only a subset of modules
> is needed.
> 
>> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
>> index 514e4e9daa825..5cefe82e4a679 100644
>> --- a/tools/lib/bpf/libbpf.c
>> +++ b/tools/lib/bpf/libbpf.c
> 
> [ ... ]
> 
>> @@ -901,6 +916,68 @@ bpf_object__init_prog(struct bpf_object *obj, struct bpf_program *prog,
>>  	return -ENOMEM;
>>  }
>>  
>> +static size_t mod_name_hash_fn(long key, void *ctx)
>> +{
>> +	return str_hash((char *)key);
>> +}
>> +
>> +static bool mod_name_equal_fn(long key1, long key2, void *ctx)
>> +{
>> +	return strcmp((char *)key1, (char *)key2) == 0;
>> +}
>> +
>> +static int
>> +bpf_object__collect_kmod_btf_names(struct bpf_object *obj, Elf_Data *sec_data,
>> +				   const char *sec_name)
>> +{
>> +	int module_cnt, i, err = 0;
>> +
>> +	if (sec_data->d_size % KMOD_NAME_LEN != 0) {
>> +		pr_warn("sec '%s': size %zu should be multiple of %d\n",
>> +			sec_name, sec_data->d_size, KMOD_NAME_LEN);
>> +		return -EINVAL;
>> +	}
>> +
>> +	module_cnt = sec_data->d_size / KMOD_NAME_LEN;
>> +	obj->kmod_btfs = calloc(1, sizeof(*obj->kmod_btfs));
> 
> [Severity: Medium]
> If a crafted ELF file contains multiple .kmod_btfs sections, could this calloc
> overwrite a previously allocated obj->kmod_btfs and cause a memory leak of
> the hashmap and data arrays?
> 

Good catch, thanks! I missed the sanity check for duplicate sections.
I will add a check `if (obj->kmod_btfs) return -EEXIST;` to prevent duplicate
section parsing and fix this potential memory leak in v2.

>> +	if (!obj->kmod_btfs)
>> +		return -ENOMEM;
>> +
>> +	obj->kmod_btfs->data = calloc(module_cnt, KMOD_NAME_LEN);
>> +	if (!obj->kmod_btfs->data)
>> +		goto err_out;
> 
> [Severity: Medium]
> Does this error path silently return success?
> 
> Because err is initialized to 0, this goto err_out will return 0 instead of
> -ENOMEM. This causes obj->kmod_btfs to be freed in the cleanup path while
> the function signals success, making load_module_btfs() fall back to loading
> all module BTFs.
> 

My apologies for this careless oversight in error handling. Leaving `err` as 0
here indeed creates a dangerous silent error.

I will assign `err = -ENOMEM;` right before jumping to `err_out` and thoroughly
re-check every error path in the patch series for v2. Thanks again

>> +	memcpy(obj->kmod_btfs->data, sec_data->d_buf, sec_data->d_size);
> 
> [ ... ]
> 
>> @@ -5803,6 +5884,21 @@ int bpf_core_add_cands(struct bpf_core_cand *local_cand,
>>  	return 0;
>>  }
>>  
>> +static bool is_kmod_btf_needed(struct bpf_object *obj, const char *name)
>> +{
>> +	uintptr_t val;
>> +
>> +	if (!hashmap__find(obj->kmod_btfs->hashmap, name, &val))
>> +		return false;
>> +
>> +	if (val == KMODS_BTF_LOADED)
>> +		return false;
>> +
>> +	hashmap__set(obj->kmod_btfs->hashmap, name, KMODS_BTF_LOADED, NULL, NULL);
> 
> [Severity: Medium]
> Can this hashmap__set() corrupt the hashmap by storing a transient stack
> pointer as the key?
> 
> Looking at load_module_btfs(), name is a local stack array passed to
> is_kmod_btf_needed() on every iteration:
> 
> load_module_btfs() {
>     char name[64];
>     ...
>         if (obj->kmod_btfs && obj->kmod_btfs->hashmap &&
>             !is_kmod_btf_needed(obj, name)) {
>     ...
> }
> 
> Since hashmap__set() only stores the pointer address, all entries will
> share the same pointer to the local name array. If a bucket collision
> occurs, strcmp(key1, key2) will evaluate to 0 since both point to the
> same stack address, falsely matching existing entries and skipping the
> requested module.
> 

This is a valid point regarding pointer lifetime.

In v2, I will update `is_kmod_btf_needed()` to store persistent string
pointers from the pre-parsed ELF section instead of the stack buffer.

Thanks for pointing this out.

>> +	obj->kmod_btfs->nr_loaded++;
>> +	return true;
>> +}
>> +
> 

