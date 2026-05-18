Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9213803C5
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127307; cv=fail; b=MMPq6vm9tpwUaCvnY/yAFnUbK951XEAQsb9YfRGhVZkm4KNVd0h9xc9AQPEYo6kNWjdQnPaXiKNIwM8Aq/hHQnCIuR0MYt+WAuQ/rrcvNvKn4ZlipHvFvZJKchtydp7rAw8ZUg9aTTlbtlKSt4dybhXkxg1F/5k4Zo6BlpqyEjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127307; c=relaxed/simple;
	bh=ASfvC0S9OXstP3ck2N5BIL6dOKrCSFt3MpT8J95Z4Y4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HI6GH7N70CAo7Mib1NIgPxD/tofUHtd/22jaui6fTurpnSAMy/OLJJ9UXiXap91c/75MZeW54C84IpKQ3Pt0EyNHYW2OC6xLNAP5VBC3NcAC6vJlmfM0oKPyspRysdoI/sGL/PxUQUJFCvBNsUbY6HVDWE3G37mZsVxdCgb8ouc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b/2BpWOj; arc=fail smtp.client-ip=52.101.53.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b/2BpWOj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbaVM5ImyQQtBk31mIhQUkEu9RC3KOl8CespSUyu8APBNjNGq2rdWkdYKKg9034cdT52XRGfnBIAMCoexipfqMtfwBe4jmJX3ulOh6T/ZGwAdPUBlsBmrBLVUIqZ/xvZJ58TLLj4rx3huRKqs0JrJlfu180CqEqomWscT3ZDwZfTD8aA9DxdoWH+ObTliZEAqoFeQ5QrMWiabLo1r5lDQQcM7CUn3RKuSn/Eo6HRUUvgbpEXUH0HppUxwn/f0z+mtgi0f2gYv/1Y0QqrowW8D7IjFsWAc8vf4IJZL2rICuBKsp4vfhl1x+5EOC6uyCqWz6RLMDpAyCcfX6+0D1rS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hdv3nFwdP6gTll9tgcIufhW+s8odSDcDb96hYnUwd0s=;
 b=J+TmVpTgE37sI6YUlEg7bT+OU0sKQAXxEZ3XDStKTO6n15vtzG9VV4X8g3GP8ifpaA0uWqOofigwXzEmKtwK9rDJZfRUvwiP4l3xfPTroStDaqjxsYG2BdhMJa2DepSJWWXiLbXcbPEDd1iwFAlnevZZiQ9yfmGmf2e0W12Ka70thsWTFOCJgikmoYIpGYauDfmw6eEJzizCBEHTYeIAFoXyl00mu0SFeuVx+J4sGIvFUVDFiNRug3A9Qp+uv2sVzY0IsbYgxD6P17XqW1NgD1mW9vK0FLvLC8N3eTP45BqDAXf0XpVpfsD7sSXrXqo8aBzKn9GBziOV2mpUl+1Bsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hdv3nFwdP6gTll9tgcIufhW+s8odSDcDb96hYnUwd0s=;
 b=b/2BpWOjVMnvVVLw9wbhjx+f7JuCFn/zaA6xN/3qPvR9J/g6ThbTiEACijem/aqIRMWw84QKgDCSMbUVBVUNESg8tXqs0j8LlRCjyym5TPfhaZ2Tjzk1UTuKXkKZEmxVdvxlLefToWlR7zEmcImPNzd4Nu8XmyOW172nVh/K5x/Za0xvOcMYk19qsRfWew0sXz9p1qYPOdQVacNXA3YY7f1MHkT+oZ8SDpoZOhhXMmdqHb6uCNDqcm30mGg7A4pjSJ+YICMJIlOKEPggKCh/lx+BT2sVKQx4wmKbxGZ6VGyKieKP44mcm2+IdUtj18wdpUnxoxBmuMDl16VnUXWbwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Mon, 18 May
 2026 18:01:39 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 18:01:38 +0000
Message-ID: <06d2a419-a4eb-4226-93f6-8d9d7f527c07@nvidia.com>
Date: Mon, 18 May 2026 23:31:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] memory: tegra264: Add full set of MC clients
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 sumitg@nvidia.com
References: <20260518124306.2071481-4-sumitg@nvidia.com>
 <20260518133308.E8B11C2BCC6@smtp.kernel.org>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <20260518133308.E8B11C2BCC6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0302.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::19) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 420ed767-7780-4db6-aca5-08deb50781d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|11063799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	WgEF0WCPpdYbrrYnNqEyYvtUSfy3yGECh8d7BLyd08nXq4K+9wTZLlQvc5FoMa8nyzjY93r9HH+bwkm+aFco7+w9MDmcmxt5kSr8wTF5n/TFg3LSCweaTqz3hDBtNeZmJBCgLGiFRZSrr/xjRdOaLEFmtuHmhS6MkdJKkjxXvAkMG/HKSOXdXkq0fVI5x1ZC/BnYyrJ+FfPKaTHtGpWQf+GGGJZ+9b2ukUQGXe09X1b6kn+1sDYrlXmxV6IfbP9TcdAeBW9rCkdDEOoqwFaEaInMqleUesTw02DzoJboSZCFa/CCztr4v5jzK6TPtXWPUVU08AbUu1P2oDceXJaAmCFGCPA9L1ppEuDhnBDxC5Fb42qOymrDWANREy6XV5maP569lOZgPPwIjfaWNt9YUNyfo9itSknwDyd13J+0ZA07usto3k09Wp29Duy3NTLu6e6K76Qv+XgzSU9l89l6+kaM5DH7B1W9T3n5XvUx8W1ISKc0rKDCvnzu4vtR8h/HbgjdFnNOV4TmJE441QCJ2dNOV+6292bdY2N3BoAYgNvF3uq3FiUqhlMV2FBWeD4jQCVMrd8Yom3qEciNLO/8pvNehRBbnkIqoL+wJSsSMevg3IOd6gZucfRAlu9rP0wEgxK/cELsh2WpkTlXdSRRH8egD2BG8IciA7kqovX2vbnXjJrJUIGkvv8PCuQTTcmv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(11063799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0IwOFM0Y3RSVUFTLzJDM2U0SEkxemNCUUlwRkpaVkw3ZjZVdkR0dWZ0OWMw?=
 =?utf-8?B?SXBsVGJicUhmMk5TTUJzSHlhZmxuVGhxbGI2TTBhVjAxU2tpTDI3ZFZYb2Vz?=
 =?utf-8?B?M3Y4QStxTmVqN0w2eWs5TWdtQlhmMWQrbGUyOHIweVBvZ2VzK1hoWnNUSHNm?=
 =?utf-8?B?SEpQR3d0MElPemFjS3hybTJYaWhrNEttMDZvdlFJdXA1RnFBRkE2U24zcEsr?=
 =?utf-8?B?NVc5YXVIcDlFQ2d2b3prbW5CZjdteU1sSkt6VEZiMnA4Z2VjMkJqWm9uYjcw?=
 =?utf-8?B?cEhFdTFXMGlneU05eEdDSVlaR2VtdkprZ244cEI0YUJwTmpTNUtqWmNpSFht?=
 =?utf-8?B?cHVQQ3hOM1NoVmsvQkROaldSR0xDamVJUlVDWndidE1Udm1uRnhhSFpRRVlr?=
 =?utf-8?B?bHRFS2xReVpXUFhXZXFVRG5BQ095MEZVNzB6NXhSdTJlbzJkVFRPTzZsbTZW?=
 =?utf-8?B?bWNyTy81TEtKb09SUTZJTzB4cFVxRi9WOGhsMnBBaThCYUpHVVczOGZxb0U4?=
 =?utf-8?B?Y1VRYnZSUU1FTnlobmlRNmRCNnFHY09MYlVNL1JtNUJ3UlZZeW1FUjRTZHdz?=
 =?utf-8?B?bklUQXNIY0FwWXpKYTBUeGdOSGlqSU5NUHpDN2htdEFqd0hEbFo1NFU5ZVVK?=
 =?utf-8?B?a05DNXppamxyVkhZMGdNVnIzYmY5QTgwTk9kWDFtTVNGemZEa0pPdlpJYnRa?=
 =?utf-8?B?NnU1TlRCM0FRdjAxejV3M29ibjFOOGc0WjlFMVZjemlIbEZLcm02ME1wZ2F5?=
 =?utf-8?B?bWk5Qmk4QlU1NVNLbmJubDZENXdtRzFtOExHZEdNNVFDdC9iSk16UDdMZVNI?=
 =?utf-8?B?YmNzV0lqRDRSdGZHZFBPRzBCM2dHWW5jejFvanBjZ2xtQkJFT2VaOURKS3Iz?=
 =?utf-8?B?Qko4MUZ1Z0ErbzNiKzliUDFmZDQ4WXg4cGJNUFRVdGdwRkJMeEs4QStjcVFa?=
 =?utf-8?B?YWhxb2Y4YVAyVnFCRHNZZkljUlVPVlhkdThvNDBaMkJYd2JBZUVIWCtick5i?=
 =?utf-8?B?eVd2WW5zNC80T0tyOFZSVWVLeHBvOXJsWWJpNXJ4WDN1amNOUVh4MTFBUUc4?=
 =?utf-8?B?b25YckN2T1NTQ0tIYk43SFBQempiMzkxR0QvT2xONitlMk1SV0JyOVIxTFVD?=
 =?utf-8?B?cEptV2ZxRDhic2ZqM3AyMEZoM0I0N3FTc2JKSmdBWFJ0dytYTVdhQjRuZ0NT?=
 =?utf-8?B?Y1A2ZkpOLzNYSCs1STI4bjZtZm91MkxqSExlNVdFc0dQeFlKdGlzc1YwQk1G?=
 =?utf-8?B?ajhRM2FVeEZTQ1Q1M2k0K2I0UzBQc1laLzJLZk9lT2JkV21XbjN5d09kTktN?=
 =?utf-8?B?NW9paXBJdE9KQ3hrQS9Idmh1NkFHdzZsYVpQV0pzVWhtd3pWMmxuWCtGY0Rn?=
 =?utf-8?B?UXAwR21FbnFyc01PYzdBRVhOT1dISFBaVTZ4bnJoZ0x6RmtvSHNMOXdOT1dG?=
 =?utf-8?B?dWxKeEFGaUt5aTBsL2tObWpvUFNPVGg0ajFlRThhT3JlRk9WRlZRa3FlMGlp?=
 =?utf-8?B?WnhkV0hLYUYxNXRFc2RIUWVpQy9kUlpTbU5XUFRwYWdkdktWOUM0VWV2ZjRa?=
 =?utf-8?B?MzhBdnF5QjRCdUlkZ21EZXh5d0tGNjFvT3JJTDJocUxZckxYTkl1WGgrbUZB?=
 =?utf-8?B?TVdqWDZkQy8wRGVKRTlNZmVwL0hpdGs2c01TcThNanFTMnhIUy9heUd6MCtl?=
 =?utf-8?B?S24wZ2VsejBMdm5SazU1T3ZuZklrM1lOOUd6cTRGYnRpekcvUDBSVWNuVmVp?=
 =?utf-8?B?TWFMS2cyMGFuTWlMbHVWQTdzMjd6TXRMcTRtZzRxbnZoenppbjdDS3VKZVZs?=
 =?utf-8?B?WW9ZZlRwZm9CbHUyNE1xWFE3cmxnTDY1V1BhY0lheGZjOW5PRWU4U2M0TENy?=
 =?utf-8?B?SWNoTVppT0RxUGJobDVybkpoQmxvQ2xpMGZpNE9lb2NkYWZlbGJ6SVphOUVx?=
 =?utf-8?B?a1hSaXE1cXdIR29OTDdKUWs3ZWNSN3MrNHlIT1Q1YWJ2dXJZSENIQmJtTDhp?=
 =?utf-8?B?S0dvZzBtVWM4OEJHMXpTQWk3Njg1ZUN6MGNqR3lNWUoyVDd1TXpTSFVEWDBC?=
 =?utf-8?B?REc3TUxBeFZSSDFPZ0s3cGhhNFVpNmt5R0VnblhZckdTb0xUWE1LWGs2SnlM?=
 =?utf-8?B?bm9IeG9KTERnWkF0eW9zS0QrV3VidjdkaU82bHN6b1ozaWVPSlNVcVVrWnhI?=
 =?utf-8?B?NHpVd294WVlZbXpTTnJkZ294NXNyWGJrK0ZzWENZemkvUnFXY2ZMTDRSaHZh?=
 =?utf-8?B?N3M5VEZMNVp4cVlNLzYvbWlBWW5nU0IwdVpHT2EzcU0vYk9mTDErdWg3cmQ4?=
 =?utf-8?Q?NRPQT7wz3Yr+tcyyDe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420ed767-7780-4db6-aca5-08deb50781d5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 18:01:38.4231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZa4AWckd4IeWWm78oFwm11CIO2Z5zwo9XvHYUZ1iPKxIlhROqba4TkO3Ok9AhchhGuvtOpr2axs423hCWqNSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200


On 18/05/26 19:03, sashiko-bot@kernel.org wrote:
> External email: Use caution opening links or attachments
>
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Newly added BPMP-managed memory clients are missing their `.bpmp_id` and `.type` interconnect properties.
> --

In v2, added new 'patch 1/3' which adds a check to skip ICC requests
for clients without .bpmp_id/.type, so they are not sent to BPMP.

Thank you,
Sumit Gupta


>
> commit 1230942ec14ede13ea86a9f95a6ff94371903b6d
> Author: Sumit Gupta <sumitg@nvidia.com>
>
> memory: tegra264: Add full set of MC clients
>
> This commit extends the tegra264_mc_clients table to include the full set of
> memory clients exposed by the SoC. The commit message notes that clients
> managed by the BPMP bandwidth manager additionally carry their bpmp_id and
> type.
>
>> diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
>> index e628908417255..b8d6c4ce48369 100644
>> --- a/drivers/memory/tegra/tegra264.c
>> +++ b/drivers/memory/tegra/tegra264.c
> [ ... ]
>> @@ -21,45 +21,62 @@
>>    */
>>   static const struct tegra_mc_client tegra264_mc_clients[] = {
> [ ... ]
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_MGBE2R,
>> +             .name = "mgbe2r",
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_OFAR2MC,
>> +             .name = "ofar2mc",
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_OFAW2MC,
>> +             .name = "ofaw2mc",
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_MGBE2W,
>> +             .name = "mgbe2w",
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_MGBE3R,
>> +             .name = "mgbe3r",
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_MGBE3W,
>> +             .name = "mgbe3w",
> Are the new MGBE2 and MGBE3 clients missing their interconnect properties?
>
> Looking at the other EQOS clients like MGBE0R and MGBE1R, they correctly
> initialize .bpmp_id = TEGRA264_BWMGR_EQOS and .type = TEGRA_ICC_NISO. If
> these fields are omitted for MGBE2 and MGBE3, won't interconnect bandwidth
> scaling requests for these blocks be silently ignored, potentially causing
> hardware bandwidth starvation?
>
> [ ... ]
>> @@ -70,6 +87,15 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
>>                .name = "vicw",
>>                .bpmp_id = TEGRA264_BWMGR_VIC,
>>                .type = TEGRA_ICC_NISO,
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_VIW,
>> +             .name = "viw",
> Does this missing bpmp_id issue also apply to other BPMP-managed
> subsystems added in this patch, such as VIW?
>
> [ ... ]
>> @@ -110,6 +208,12 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
>>                .name = "rcew",
>>                .bpmp_id = TEGRA264_BWMGR_RCE,
>>                .type = TEGRA_ICC_NISO,
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_NVENC1SRD2MC,
>> +             .name = "nvenc1srd2mc",
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_NVENC1SWR2MC,
>> +             .name = "nvenc1swr2mc",
> Are these newly added NVENC clients also missing their TEGRA264_BWMGR_NVENC
> manager definitions?
>
> Since the memory controller interconnect implementation skips bandwidth
> scaling requests for clients without a bpmp_id, should these clients also
> include their respective bpmp_id and type to ensure bandwidth requests
> are processed?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518124306.2071481-1-sumitg@nvidia.com?part=3
