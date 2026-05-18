Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B54E3E866F
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101076; cv=fail; b=AdiUgwYNcZFgc72GhBueq4EWWBE+O6xgLGWzd4mEuck7VTr2IdIZIW/NmzbU/WLyZ2tjaHmhny3KlCjdKVTOFDLdG8WnuLHNpM5c/WLYhoz4aBlfcEgoQMpbJRRK48dpS0HZTxawJ8UA3l8cJ4R6Nrrhr4cJtZFdshLZfVAJ6uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101076; c=relaxed/simple;
	bh=PxZjFYpyGldtqzoctltlTH1IhzxJo2zxwSFT/jrT4Hg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n8W4d0s1iNvgbSWJVJIBcKou9vSWiK9fs8Zqc1Yaa0jnXfeLDPyo+9M9Wx6FB7NPZl0jn8Qm+sph7Ul5PIHL+PZf620ZSaNPsA5WTKIMSiX/mzNvd9nnKs/JRyv62pcs5G0wZbtm03eFLLULYWswOXIRFaqxDMeS8of7g2HE6io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T1ylINN1; arc=fail smtp.client-ip=52.101.48.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T1ylINN1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZwLRa1NFmwxxepIaxFAJ54K0fHU6NvC+XfZoMa7GL/6zl51gU2ZosvdnDvv8HufihY75MNazuFzYjUJd20ZD/IhLuLOJy3537vM4uDYOWI6yPsW6WCPU9Bt5fenabm056s1zszL3FqCpsTNz8e6uRt7AqlXL1iYlVVwvnhPsT6UptjEjd6PbxHGrYAnmdv/+hYAi+DsFzqbT6O2A4agUEm0IkZwn6LQxE/vkjKnvo+4lWFPfoZyweSc4z7KKo3RGTf6Bxyy5MCBufxZHlKtqD5Q6+VbgxOnI6eMigluf21dkhZ24alatR/R9FR+IDomQk/PfoaCZpBFlaZ9edVLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOj4F8aau+O8mSREoBU5CoWLLKtThKnZK2cSmFDhjpE=;
 b=j5OC75ZOxxgMYDUr2aBsFEimGFTzdbNkX2+PyTnxktFAI+fLDMy67/2NhX59bXjCERI3txjFILwO9lRyKUSEV0N8XHrZ7Cq0VXKXaZtyEAB09+vqldGv6dd9movlWg2sSJbryHc8nxi0zdWUcstcwcMJl8oKCgP9kMLIqi1GTeNED798wtxM2ZAaf1REkPS6Fu/pzDHCTB/qfIu5bHe1hlZRtk11rJWsOQiZek12zax+G4tgq1C6xx9BDeHdTvF3Lk21xTyUgq/sNOBJ0UurXBvloq9Y51aD47bKCHgmZh/1s16WnP3M/4nR9yJqGKtoaU7lZOCCXi5Ul53OuNHbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOj4F8aau+O8mSREoBU5CoWLLKtThKnZK2cSmFDhjpE=;
 b=T1ylINN1pUJTpletVoS9h4YOn/CZ7Ue1bqhAnX2dX1E7T+15f/oRP0SP3jdyXy5vnJhRtF5nlYwTXUCHKyyb4oXlJYNbVF6iLlMPnPG5q6BDMEOvFOrTVKFIWnob2/WOvc4Eo8TJIUlIPamFrBM/6riLDSEcYHa+NsjB/Qo28MBbuLQn1cekaM0j4jtHTuNiyp7NKmaPSxM0QM25aG/73y5ZXBcjKjt8ldrpndRAv2NIHcVmdBRIl17TIhz0O9sLRnvmRJRl4EwnmGV+SiwuWFXqoHi8J/ihRnDIBCmvHiNJmwLzFVQjSRuxd1d93iJt5n6QRRI58hON3KYuePbBBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 10:44:20 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 10:44:20 +0000
Message-ID: <d8c18b5b-fa08-4601-bc81-68400c20a590@nvidia.com>
Date: Mon, 18 May 2026 16:14:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra264: Add full set of MC clients
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumitg@nvidia.com
References: <20260515171911.1929868-1-sumitg@nvidia.com>
 <20260515174637.1D344C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <20260515174637.1D344C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:5:1b3::20) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ccd620-0ab4-42a1-343d-08deb4ca6af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|4143699003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	n9Sqg/gdHHoB7KqXlCZHMeyOmEKx8kdUk48vlMKGdaWfu+LQKtrJ/piAcfe85QgvflVUOujtKRE4SY4Z86IuxxWXZ9AqSkMaoZHM2lexoTupHrRy/mAM/tSdIeQz6Z1rPd0PvaIm+MK7nyQDVIXfmCRNaiaXnJZ6HZefFG8V9m0JzL3iyLKZeGL5X4D1zOqvYBnQfMQsNKw+DPoMBOLS5YHPLiGXQLeVsz3wLi+srcmYgNYPySQKhrJ3TivC1UHk4LmIQLGMHrHu3wZeR6Y6xeO0G4gvfl3g17UwC4SfkLmyhtg2q+6MMhbCIRZhop+7UThO8rH9NSKsmYNCIuE2ycWOE39d5EoSaN8VqNEYO/j6q3igEZnBE5ZRQqMX6KQagOXK1fYkTI9HfI7lNjZjrucTzRUC/eyExvtw8e+2kQcMADYIqUKS5N6SHTFXs415dzD0Rx3DGl2Pq07vFSEJVgOP7VaVLdGGDpqhZZ7Uf3GsL14cY4K5HpswvocH/4yrt0wVrvGQG1+UP31NoGmwDv7NzcQSoPSGwm43Oo/F+5CNp+CPyzprCFqBrqs0Q/Buq2pyHNbeodkbdw6GjhY7LaFnzYVIIQ8HnycqtHeV5+rn3cLFOjR92Dr8cdtLPPD74wD6tm5PRhSBclzHw/Q1M+kdrZ+gITtqq+2PPfoEU1HcHNh3ZMNzuIpOnA68uUod
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(4143699003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2VsSkt1WERaYmI1Ujg4cEx1V3dtdnZFekRPM1p1K3RJUndPTUx3ME5VRjlM?=
 =?utf-8?B?UXBzTHI4UWdwS2VxTmc2YzV1Y2RZK0JWQmNNMmJqTWZwSDg3OExORXpNbzFR?=
 =?utf-8?B?TTdvREFURDRRSDJwNHdCK3dCSDhGV1BJS3BUTnBOTFBKZ1VvMDRFejBRYUFJ?=
 =?utf-8?B?VzRWSFU1bHEvcFVUOGFYTTNhT1F3cmYyN1lVNDR3YkNBeFFlTVppb0NYUFdL?=
 =?utf-8?B?R3FtR3g4dzd2TFJ4ZlNFL0Z3Y0Nra3BzV2xycERjTUVhbEJmcHd2OGJnWDJn?=
 =?utf-8?B?YzdvZTlIWGFtZFgwbURLQ2JXY0JiTU0xaUVvdTU5V0lNVUMrZjREOGg5ajJu?=
 =?utf-8?B?TGQrYk9vaGNSQmpKb3B4Y25EL2RnRTZQbktFZEdDcGI3Y1BYc2ovQ0lDQUIr?=
 =?utf-8?B?VjdwR3h4NURlTlJnTHF6MXZrWnJQTjFXUFZnZWhUYVp6MVhlUlNTTU4yNjdN?=
 =?utf-8?B?UHNqc1BBQ2xRcU1rNEFxUnVOdGphekV1QXpXSk84NDlyMWI3S3hTdHRpSnJH?=
 =?utf-8?B?VlFBNWdoUG9pQk4xTjRRdHFVRmRCT2xDbFgwYkxmNVhSdXFMZjdGZXlnSTlk?=
 =?utf-8?B?Z1JhbENRT0xvSmlYaFFQMFRKdlM2blR3QUxSM0V0SFd4STdCbmxGdlFCVThU?=
 =?utf-8?B?REZCR3RJNU91WHRyZ2VOcmIwY1EwaDFBZjNnSlNaM3pFOVhhcGh5REhOaVUv?=
 =?utf-8?B?alEvQWIwaVNIYjgwRVRrNWpUbm1WNVhxNFdNWWVTVEFJTzU4MFJhVUw0bFpK?=
 =?utf-8?B?TjJMZzZGY3VCcXduMEVVZDlycm9WcG5qZWpTbDhTd2E1Rzh2dWtiSUZaTjFa?=
 =?utf-8?B?aTJNa3RaRnZ2SFJESXBXQmJ4SjI0T283U0J2WUdsSUN2MGw5VS9TVURKRzc0?=
 =?utf-8?B?a1g2S0xHTWovR3dibzA5Nk5yRmQxb1RZSWFHWVVIYkhid3BGZ3pUbGZJUTZS?=
 =?utf-8?B?M24xUUVvWWNqcEFYL083RndqeEhCUWVxdXdkV29LTDJUVS9sdWQyUGtUdjkx?=
 =?utf-8?B?NEt3RWZGQXpBQ1ZsQjZQa1ZVT1NjczZ6VzhsK2NOZ1VzZFBxcUFJbGVUcWU0?=
 =?utf-8?B?bTMvRXJzSjNyYlNNYXFKUVRNWWtqQnhMeGdldHRFZS81bWlvSzNFZ1lEVElE?=
 =?utf-8?B?VTYyRUhIbnNaM050VWZ5L2hCYzBSUkQ5MU40c1FGZG9NNkY0amU2bWpqR2xC?=
 =?utf-8?B?U0dxRGp6REp4R3MxOEFDUzlQVHdpZXhsODV3ZmRZVkd2eWREenFrdDFLYW03?=
 =?utf-8?B?Vk9aUWY2QnpjaCt2Qm9Vckg4ejVTT1IrL25ra3JhK2NKV0VrT1VPUUFLV1dw?=
 =?utf-8?B?UmUrSEMvVVBtbHdhVGpXYWNhMlIzbitTam5GclJUUWdORHE1RFROOHdoVVYr?=
 =?utf-8?B?a0FqQzRveE56WGUxVDdUMjljU3VNai9zSkhlbFRjOHNrazJQZDdsV1RsVGZL?=
 =?utf-8?B?UzlqTDc2ckZWcmt0Q3V4K24xWjhiMGpqTEs1U1JBMG5aU1NhQVZJS0JweFBu?=
 =?utf-8?B?NWdiYUs3cURNSEh4RXB0QVZPY3FKaTlTc1UxUWt0c0NVbkk4L1V0WjE1VG81?=
 =?utf-8?B?dkNsc2dEcm5qV1gzVzk4QnJEWVJNVng1Q3cyOFhzYytFNnFIV1IzM2ZmUW9Y?=
 =?utf-8?B?OVRucGhHYjljeG1EL0NnZERwMlRaQllwMytnNS82c1o3bUZrUy9ISjNPVzFW?=
 =?utf-8?B?T0JGdlpuUGJCeWxWU2tyZkZabVN5WVI4ZGdGUC8zRTBEN0xIUTlEZ3AycXBE?=
 =?utf-8?B?M1F0N1ZrOGV0ODZXUEY3UHVoTmtlaFFoeHlyNzhjU1BwakROUlRXQWF1Ni8x?=
 =?utf-8?B?eUQzckk2eXh2Nnk4WWZONXA0K1Q2Z2FaWlJ4WmU3Snd6Rm9QbElZZENSdGZP?=
 =?utf-8?B?OGcrSCtGRVUrNVdKeXlIbXFjZkV5ektWZ3Q5Sis2TlMxQnAwNVl3Z2FlVGN4?=
 =?utf-8?B?TzJYU3ZmQmt4MDdFQjg5R0VEcEVWM0p6VG0xU0JmcnR3REd1ZW9veW50M2JL?=
 =?utf-8?B?MzJOQm5UaE5qM3d5d0QrU3RYUTU4ZkRxR1NJQlhjWGVYa3pSQ2FUdmVrQVBo?=
 =?utf-8?B?bXNRQ3YzUmdaL2sxYzNxUk01dFZUWFBQem5WbXI3bkQ5NFpMSXVPMnRWcjdX?=
 =?utf-8?B?dTRkSUl1S2xtc2lrQWluaUQzVDkwK01vOC9IZmNaQ2tmemo0SzNNRkQzV3Yr?=
 =?utf-8?B?M1ZHa1dqMkE3cXp4cVJnRnZ6Zysza1MrK2dMdTZzTllpMmtPNDNmakFPYWdD?=
 =?utf-8?B?ZDZqdWtSVVk0TnNTSGxrQUZUcUFlOVA0M2ttcis4MElZMlFobUdHbmVzM2lq?=
 =?utf-8?Q?EdrMDjKKthCvS+L0ad?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ccd620-0ab4-42a1-343d-08deb4ca6af7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 10:44:20.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPxChD/kg7Od0Pc5Mnox5ceApydvkZmv0V9M3+mOnPVgMzSRtkZN2Tu5/ZFJ2AHZbX5PH/EN76ZLhGU4MANCuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417


On 15/05/26 23:16, sashiko-bot@kernel.org wrote:
> External email: Use caution opening links or attachments
>
>
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Newly added BPMP-managed memory clients are missing their `.bpmp_id` and `.type` initializations.

Will add a separate patch in v2 with a check in tegra264_mc_icc_set()
to not forward ICC requests for clients without .bpmp_id/.type.
Some clients are added only for names in fault-log.

> - [Medium] The `tegra264_mc_clients` array is not strictly sorted by client ID, contradicting the commit message.

The array follows MC override/security register offsets and not
MC client_ID order. Will correct the commit message in v2.

Thank you,
Sumit Gupta


> -- commit fefb4bd46910389b4d7cd1d39ffbe180883f7665 Author: Sumit Gupta 
> <sumitg@nvidia.com> memory: tegra264: Add full set of MC clients This 
> commit extends the Tegra264 MC dt-bindings header and 
> tegra264_mc_clients table to cover the full set of memory clients 
> exposed by the SoC.
>> Extend the Tegra264 MC dt-bindings header and tegra264_mc_clients
>> table to cover the full set of memory clients exposed by the SoC.
>> Client name is used for MC fault reporting. Clients managed by the
>> bandwidth manager in BPMP additionally carry their bpmp_id and type.
> The commit message states that clients managed by the bandwidth manager in
> BPMP carry their bpmp_id and type. Should these fields be initialized for the
> newly added clients like NVENC, NVJPG, ISP, PVA, XUSB, and TSEC?
>
>> diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
>> --- a/drivers/memory/tegra/tegra264.c
>> +++ b/drivers/memory/tegra/tegra264.c
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
>>        }, {
>>                .id = TEGRA264_MEMORY_CLIENT_PCIE0W,
>>                .name = "pcie0w",
> If the bpmp_id and type fields are omitted here, they default to 0. Would
> this cause drivers for these components to inadvertently pass 0 as the client
> ID to the BPMP firmware when attempting to configure interconnect bandwidth?
>
>> Entries in tegra264_mc_clients[] are sorted in increasing order of
>> their client IDs, which matches the order of the override and
>> security register offsets used in previous SoCs.
> This isn't a functional bug, but are these entries strictly sorted by their
> client IDs as the commit message indicates?
>
> [ ... ]
>> @@ -185,6 +289,402 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
>>                .name = "nvdecswr2mc",
>>                .bpmp_id = TEGRA264_BWMGR_NVDEC,
>>                .type = TEGRA_ICC_NISO,
>> +     }, {
>> +             .id = TEGRA264_MEMORY_CLIENT_MIU5R,
>> +             .name = "miu5r",
>> +     }, {
> Looking at the tegra264_mc_clients array, GPUR02MC (0xb6), GPUW02MC (0xb7),
> NVDECSRD2MC (0x78), and NVDECSWR2MC (0x79) appear immediately after
> PCIE5W (0xe3), and the newly added MIU5R (0xfc) is appended after them.
>
> Could this mismatch between the array's actual order and the commit
> message's claim cause confusion during future maintenance?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515171911.1929868-1-sumitg@nvidia.com?part=1
